class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments
  has_many :votes
  validates :title, presence: true
  validates :url, presence: true, format: URI::regexp(%w(http https))
  before_validation :urlify

  HUMANIZED_ATTRIBUTES = { :url => "URL" }
  
  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def urlify
    self.url = "http://#{url}" unless url =~ /^https?:\/\//
  end

  def score
    votes.where(vote_type: Vote::UPVOTE_VALUE).count -
      votes.where(vote_type: Vote::DOWNVOTE_VALUE).count
  end
end
