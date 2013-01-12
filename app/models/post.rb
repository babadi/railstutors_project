class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments
  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, format: URI::regexp(%w(http https))
  before_validation :urlify

  def self.human_attribute_name(attr, options={})
    attr.to_sym == :url ? "URL" : super
  end

  def urlify
    self.url = "http://#{url}" unless url.empty? || url =~ /^https?:\/\//
  end

  def score
    votes.where(vote_type: Vote::UPVOTE_VALUE).count -
      votes.where(vote_type: Vote::DOWNVOTE_VALUE).count
  end

  def <=>(rhs) #display in reverse order by score
    rhs.score <=> self.score
  end
end
