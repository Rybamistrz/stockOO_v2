class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :products

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :validatable, 
    :confirmable, :token_authenticatable

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
