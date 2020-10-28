class User < ActiveRecord::Base
    has_secure_password
    has_many :categories
    has_many :supplies, through: :categories
    validates :name, :login, :email, presence: true
end