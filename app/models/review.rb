class Review < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :content, presence: true

  def self.five_stars
    where(:rating => 5)
  end


end
