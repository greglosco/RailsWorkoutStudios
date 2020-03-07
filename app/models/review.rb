class Review < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :content, presence: true
end
