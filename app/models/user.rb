class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :avatar, :remove_avatar
  
  mount_uploader :avatar, FileUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_to_admin

  def send_to_admin
  	AllMailer.user_new(self).deliver_now	
  end


   def full_name
   	first_name + " " + middle_name + " " + last_name
   end
   
   def except_current_user(users)
		users.reject {|user| user.id == self.id}		
	end

   def self.search_users(param)
		return User.none if param.blank?
		param.strip!
		param.downcase!
		(first_name_matches(param) + last_name_matches(param)).uniq
	end

	def self.first_name_matches(param)
		matches('first_name', param)
	end
	def self.last_name_matches(param)
		matches('last_name',param)
	end
	def self.matches(field_name, param)
		where("lower(#{field_name}) like ?", "#{param}")
	end
	validates :first_name,:last_name,:middle_name,:phone,
	:presence => true
end
