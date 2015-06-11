class Item < ActiveRecord::Base
	belongs_to :user
    has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates :name, presence: true
    validates :price, presence: true
    validates_numericality_of :price, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 3,
    :less_than_or_equal_to => 500,
    :message => "can only be whole number between 3 and 500."
end
