class CreateCriticReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :critic_reviews do |t|
      t.belongs_to :book, index: true
      t.string :title
      t.string :author
      t.string :source
      t.string :snippet
      t.string :review_link
      t.string :pos_or_neg
      t.string :star_rating
      t.string :review_date
      t.string :smiley_or_sad
      t.string :source_logo
    end
  end
end
