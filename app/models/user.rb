class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :avatar
	has_attached_file :avatar, dependent: :destroy,  :default_url => "/assets/images/default_user.png"
	validates_attachment_content_type :avatar, 
	:content_type => /^image\/(png|gif|jpeg)/
	has_secure_password

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :name, presence: true, length: { maximum: 50 },
	uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	has_many :phones, foreign_key: 'userid'
	has_many :comments, dependent: :destroy

	private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

end
