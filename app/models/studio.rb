class Studio < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: true


  def self.reviewed
    where(:reviews => !nil)
  end

  def self.five_stars
    where(:rating => 5)
  end

end
