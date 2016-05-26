class IdreambooksApiClient

  def self.get_reviews
    Book.all.each do |book|
      url = "https://idreambooks.com/api/books/reviews.json?q=#{book.primary_isbn13}&key=947ddde9849228bca1d1cf6bdb434d9ab7a73990"
      response = RestClient.get(url)
      response = JSON.parse(response)
      critic_reviews = response["book"]["critic_reviews"]
      
      unless critic_reviews == nil
        critic_reviews.each do |critic_review|
          current_review = CriticReview.where(source: critic_review["source"]).first
          if current_review && book.critic_reviews.include?(current_review) == false
            Rails.logger.info "Found existing critic review from source #{critic_review["source"]}"
            book.critic_reviews << current_review
            book.save
          elsif current_review == nil
            Rails.logger.info "No review found, adding review from source #{critic_review["source"]}."  
            book.critic_reviews.create source: critic_review["source"],
                                       snippet: critic_review["snippet"],
                                       review_link: critic_review["review_link"],
                                       pos_or_neg: critic_review["pos_or_neg"],
                                       star_rating: critic_review["star_rating"],
                                       review_date: critic_review["review_date"],
                                       smiley_or_sad: critic_review["smiley_or_sad"],
                                       source_logo: critic_review["source_logo"]
          end
        end
      end
    end
  end
  def self.get_review_score
    Book.all.each do |book|
      url = "https://idreambooks.com/api/books/reviews.json?q=#{book.primary_isbn13}&key=947ddde9849228bca1d1cf6bdb434d9ab7a73990"
      Rails.logger.info "URL: #{url}"
      response = RestClient.get(url)
      response = JSON.parse(response)
      book.update review_score: response["book"]["rating"] 
      Rails.logger.info "Review score for #{book.name} with id##{book.id} is #{book.review_score}. Saved." 
    end
  end
end

# book_url = response["book"]["detail_link"]
# #array with "snippet", "smiley or sad", "pos or neg", etc.
# critics_reviews = response["book"]["critic_reviews"] 
# # rating
# rating = response["book"]["rating"]