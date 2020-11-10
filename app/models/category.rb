class Category < ActiveRecord::Base
    belongs_to :user
    has_many :supplies
    validates :art_form, presence: true
end