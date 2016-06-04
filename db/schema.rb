# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160604034045) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "author"
    t.string   "image"
    t.text     "description",        limit: 65535
    t.string   "amazon_product_url"
    t.string   "age_group"
    t.integer  "rank"
    t.integer  "weeks_on_list"
    t.string   "primary_isbn10"
    t.string   "primary_isbn13"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "review_score"
  end

  create_table "books_lists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "book_id"
    t.integer "list_id"
  end

  add_index "books_lists", ["book_id"], name: "index_books_lists_on_book_id", using: :btree
  add_index "books_lists", ["list_id"], name: "index_books_lists_on_list_id", using: :btree

  create_table "critic_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "book_id"
    t.string  "source"
    t.text    "snippet",       limit: 65535
    t.string  "review_link"
    t.string  "pos_or_neg"
    t.string  "star_rating"
    t.string  "review_date"
    t.string  "smiley_or_sad"
    t.string  "source_logo"
  end

  add_index "critic_reviews", ["book_id"], name: "index_critic_reviews_on_book_id", using: :btree

  create_table "lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "name_encoded"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
