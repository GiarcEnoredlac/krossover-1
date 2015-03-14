class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates :username, presence: true, uniqueness: true
  
  has_attached_file :profile_image, styles: {
		medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }

  def full_name
    first_name + ' ' + last_name
  end
  
end
