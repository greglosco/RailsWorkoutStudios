class Studio < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: true


  def self.reviewed
    where(:reviews => !nil)
  end

end
