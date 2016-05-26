class AddReviewScoreToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :review_score, :integer
  end
end
