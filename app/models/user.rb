class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  

  has_many :video_reviews
  has_many :statuses
  has_many :reviews
  
  validates :username, uniqueness: true
  
  has_attached_file :profile_image, styles: {
		medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }

  def full_name
    first_name + ' ' + last_name
  end

  def add_badge_5
    current_user.add_badge(5)
  end
end
