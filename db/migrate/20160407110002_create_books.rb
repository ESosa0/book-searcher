class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :image
      t.text :description
      t.string :amazon_product_url
      t.string :age_group
      t.integer :rank
      t.integer :weeks_on_list
      t.string :primary_isbn10
      t.string :primary_isbn13

      t.timestamps
    end
  end
end
