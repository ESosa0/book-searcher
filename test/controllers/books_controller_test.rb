require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { age_group: @book.age_group, amazon_product_url: @book.amazon_product_url, author: @book.author, description: @book.description, image: @book.image, name: @book.name, primary_isbn10: @book.primary_isbn10, primary_isbn13: @book.primary_isbn13, rank: @book.rank, weeks_on_list: @book.weeks_on_list } }
    end

    assert_redirected_to book_path(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { age_group: @book.age_group, amazon_product_url: @book.amazon_product_url, author: @book.author, description: @book.description, image: @book.image, name: @book.name, primary_isbn10: @book.primary_isbn10, primary_isbn13: @book.primary_isbn13, rank: @book.rank, weeks_on_list: @book.weeks_on_list } }
    assert_redirected_to book_path(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_path
  end
end
