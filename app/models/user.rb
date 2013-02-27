class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user| 
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.email
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def password_required?
    super && provider.blank?
  end

  def not_facebook
    provider.blank? 
  end

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, :on => :create, :if => :not_facebook
  validates :password, presence: true, length: { minimum: 6 }, :on => :create, :if => :not_facebook
  validates_confirmation_of :password, :on => :create, :if => :not_facebook
  validates :password_confirmation, presence: true, :on => :create, :if => :not_facebook


end
