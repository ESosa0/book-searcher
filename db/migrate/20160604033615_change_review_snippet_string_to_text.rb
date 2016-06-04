class ChangeReviewSnippetStringToText < ActiveRecord::Migration[5.0]
  def change
    change_column :critic_reviews, :snippet, :text
  end
end
