class Category < ActiveRecord::Base
    belongs_to :user
    has_many :supplies
end