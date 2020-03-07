class User < ApplicationRecord
    has_secure_password
    
    has_many :studios
    has_many :reviews
    has_many :reviewed_studios, through: :reviews, source: :studio

    # validates :username, presence: true
end
