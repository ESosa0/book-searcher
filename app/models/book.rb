class Book < ApplicationRecord
  has_and_belongs_to_many :lists
  has_many :critic_reviews, dependent: :destroy
end
