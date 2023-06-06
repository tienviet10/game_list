class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
end
