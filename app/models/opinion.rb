class Opinion < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :item
  validates_presence_of :category
  validates_presence_of :field
end
