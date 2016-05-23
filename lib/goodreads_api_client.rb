class GoodreadsApiClient

  def self.get_reviews
      book = Book.first 
      #url = "https://www.goodreads.com/book/isbn/#{book.primary_isbn13}?format=JSON&user_id=56120307"
      #url = "https://www.goodreads.com/book/isbn/#{book.primary_isbn13}?format=json&user_id=56120307"
      #url = "https://www.goodreads.com/book/isbn/#{book.primary_isbn13}?key=HMBTuD4Ipx5UKC3muC2HA"
      url = "https://idreambooks.com/api/books/reviews.json?q=#{book.primary_isbn13}&key=947ddde9849228bca1d1cf6bdb434d9ab7a73990"
      response = RestClient.get(url)
      response = JSON.parse(response)
  end
end

# book_url = response["book"]["detail_link"]
# #array with "snippet", "smiley or sad", "pos or neg", etc.
# critics_reviews = response["book"]["critic_reviews"] 
# # rating
# rating = response["book"]["rating"]