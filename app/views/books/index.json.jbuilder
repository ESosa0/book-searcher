json.array!(@books) do |book|
  json.extract! book, :id, :name, :author, :image, :description, :amazon_product_url, :age_group, :rank, :weeks_on_list, :primary_isbn10, :primary_isbn13
  json.url book_url(book, format: :json)
end
