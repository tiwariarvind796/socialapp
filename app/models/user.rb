class User < ActiveRecord::Base
	has_many :items
	validates :name, presence: true
	accepts_nested_attributes_for :items
end
