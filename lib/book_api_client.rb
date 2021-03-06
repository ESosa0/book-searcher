class BookApiClient

  def self.add_list_names

    List.destroy_all
    
    url = "http://api.nytimes.com/svc/books/v3/lists/overview.json?&api-key=b8c2a744ea174b41829f830c55c2ba68"
    response = RestClient.get(url)
    response = JSON.parse(response)
    lists = response["results"]["lists"]
    
    lists.each do |list|
      List.create name: list["list_name"], name_encoded: list["list_name_encoded"]
    end
  end

  # To run in console, must require 'book_api_client'
  def self.add_books_by_list

    Book.destroy_all

    List.all.each do |list|

      url = "http://api.nytimes.com/svc/books/v3/lists/#{list.name_encoded}.json?&&api-key=b8c2a744ea174b41829f830c55c2ba68"
      Rails.logger.info "trying to load books for #{url}"
      response = RestClient.get(url)
      response = JSON.parse(response)
      books = response["results"]["books"]

      books.each do |book|
        current_book = Book.where(primary_isbn13: book["primary_isbn13"]).first
        if current_book && list.books.include?(current_book) == false
          Rails.logger.info "Found existing book with isbn #{book["primary_isbn13"]}"
          list.books << current_book
          list.save
        elsif current_book == nil
          Rails.logger.info "No book found, adding book with isbn #{book["primary_isbn13"]} and title #{book["title"]}"
          list.books.create name: book["title"], 
                      author: book["author"],
                      image: book["book_image"],
                      description: book["description"],
                      amazon_product_url: book["amazon_product_url"],
                      age_group: book["age_group"],
                      rank: book["rank"],
                      weeks_on_list: book["weeks_on_list"],
                      primary_isbn10: book["primary_isbn10"],
                      primary_isbn13: book["primary_isbn13"]
        end
      end
    end
  end
end

