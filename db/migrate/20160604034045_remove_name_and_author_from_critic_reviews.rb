class RemoveNameAndAuthorFromCriticReviews < ActiveRecord::Migration[5.0]
  def change
    change_table(:critic_reviews) do |t|
      t.remove :title
      t.remove :author
    end
  end
end
