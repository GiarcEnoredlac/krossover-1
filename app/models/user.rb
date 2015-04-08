class User < ActiveRecord::Base
  include ApplicationHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_merit

  scope :top_25_in_review, -> { joins(:reviews).select("users.*").
    group('reviews.user_id, users.id').order("count(reviews.user_id) DESC").limit(25) }

  scope :top_25_in_points, -> { order("leaderboard_points desc").limit(25) }

  # scope :max_video_reviewed, -> { order("reviews_count desc").first }

  has_many :conversations, :foreign_key => :sender_id
  has_many :reviews
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name
  
  has_attached_file :profile_image, :default_url => "a0.jpg", styles: {
		medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :profile_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.search_by_username(search_term)
    return [] if search_term.blank?
    where("username LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

end

































