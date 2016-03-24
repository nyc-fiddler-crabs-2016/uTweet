class Tweet < ActiveRecord::Base
  validates :poster, presence: true
  validates :content, presence: true, length: {in: 5..140}

  belongs_to :poster, class_name: "User"

  def tweet_owner
    poster.username
  end

  def time_posted
    "Posted on: " + created_at.strftime("%m-%d-%Y") + ", at " + created_at.strftime("%I:%M%p")
  end
end
