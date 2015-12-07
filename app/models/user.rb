class User < ActiveRecord::Base
  rolify
	has_secure_password
	validates :password, presence:true, :on => :create, length: { in: 6..20 }
	validates :full_name, presence: true, length: { in: 6..50 }
	validates :email, presence: true, uniqueness: true,
										format: {
											with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
										}
end
