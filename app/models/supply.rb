class Supply < ActiveRecord::Base
    belongs_to :category
    validates :medium, :tools, presence: true
end