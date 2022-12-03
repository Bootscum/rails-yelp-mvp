class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :catagory, acceptance: { accept: ["chinese", "italian", "japanese", "french", "belgian"] }
end
