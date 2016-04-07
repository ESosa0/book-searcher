class BookApiClient

  def self.add_list_names
    url = "http://api.nytimes.com/svc/books/v3/lists/overview.json?&api-key=66173255f070c8345fb890d3b2b63ba5:12:74940926"
    response = RestClient.get(url)
    response = JSON.parse(response)
    lists = response["results"]["lists"]
    lists.each do |list|
      List.create name: list["list_name"], name_encoded: list["list_name_encoded"]
    end
  end

  def self.add_books_by_list

    List.all.each do |list|
      url = "http://api.nytimes.com/svc/books/v3/lists/#{list.name_encoded}.json?&&api-key=66173255f070c8345fb890d3b2b63ba5:12:74940926"
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

# list_names = BookApiClient.get_list_name
# BookApiClient.get_book_by_lists(lists_names)

# response["results"]["lists"][0]["books"][0]["title"]
# response["results"]["lists"][0]["books"][0]["author"]