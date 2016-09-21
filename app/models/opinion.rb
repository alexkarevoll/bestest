class Opinion < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :item
  validates_presence_of :category
  validates_presence_of :field

  has_many :votes

# method that returns overall sentiment for one particular opinion
  def score
    self.votes.where({sentiment: true}).count - self.votes.where({sentiment: false}).count
  end

# lets searching!
  def self.search(search)
    Opinion.where('item ilike :search OR category ilike :search OR field ilike :search', search: "%#{search}%")
  end

end
