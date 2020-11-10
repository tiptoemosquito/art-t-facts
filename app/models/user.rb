class User < ActiveRecord::Base
    has_secure_password
    has_many :categories
    has_many :supplies, through: :categories
    validates :username, uniqueness: true
    validates :name, :email, presence: true
end