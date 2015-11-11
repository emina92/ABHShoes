class User < ActiveRecord::Base
  rolify
	has_secure_password
	validates :password, presence:true
	validates :full_name, presence:true
	validates :email, presence: true, uniqueness: true,
										format: {
											with:/\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
										}
end
