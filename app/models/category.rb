class Category < ActiveRecord::Base
    has_many :art:supplies
end