class User < ActiveRecord::Base
  include ApplicationHelper
  scope :featured, order('reviews_count DESC')

  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name
  
  has_attached_file :profile_image, styles: {
		medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def review_count
    self.reviews.count
  end

  def sum_game_length
    self.reviews.sum(:game_length)
  end

  def sum_review_length
    self.reviews.sum(:review_length)
  end

  def sum_number_of_plays
    self.reviews.sum(:number_of_plays)
  end

  def sum_correct_plays
    self.reviews.sum(:correct_plays)
  end

  def total_game_length_percentage
    self.sum_game_length / self.sum_review_length.to_f * 100
  end
  
  def total_plays_percentage
    self.sum_correct_plays / self.sum_number_of_plays.to_f * 100
  end

  def total_points
    max = (self.reviews.count / max_video_reviewed.to_f) * 40.to_f
    total_plays_percentage * 0.3 + total_game_length_percentage * 0.3 + max
  end

end

































