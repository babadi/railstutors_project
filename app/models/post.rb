class Post < ActiveRecord::Base
  attr_accessible :title, :url
  has_many :comments
  has_many :votes
  validates :title, presence: true
  validates :url, presence: true

  def score
    votes.where(vote_type: Vote::UPVOTE_VALUE).count -
      votes.where(vote_type: Vote::DOWNVOTE_VALUE).count
  end

  def <=>(rhs) #sort in reverse order by score
  	rhs.score <=> score
  end
end
