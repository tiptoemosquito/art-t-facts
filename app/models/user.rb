class User < ActiveRecord::Base
    has_many :categories
    has_many :art_supplies, through: :categories
end