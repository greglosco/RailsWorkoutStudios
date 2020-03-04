class User < ApplicationRecord
    has_many :reviews
    has_many :studios, through: :reviews
end
