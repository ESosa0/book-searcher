class CreateBooksListsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :books_lists, id: false do |t|
      t.integer :book_id
      t.integer :list_id
    end
    add_index :books_lists, :book_id
    add_index :books_lists, :list_id
  end
end
