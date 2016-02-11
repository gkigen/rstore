class Category < ActiveRecord::Base
  
  has_many :sub_categories

  validates :name, :presence => true
end
