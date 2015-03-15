class User < ActiveRecord::Base
  has_merit
  has_secure_password

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
  
end
