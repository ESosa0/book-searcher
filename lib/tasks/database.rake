namespace :database do
  desc "Updates book lists from API"
  task update_lists: :environment do
    Rails.logger.info "Updating lists"
    BookApiClient.add_list_names
  end

  desc "Updates the database from APIs"
  task update_books: :environment do
    Rails.logger.info "Adding books by list"
    BookApiClient.add_books_by_list
    Rails.logger.info "Adding reviews to books"
    IdreambooksApiClient.get_reviews
    Rails.logger.info "Adding scores to books"
    IdreambooksApiClient.get_review_score
  end

end
