require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true
  validates :email, 
            :presence => true,
            :uniqueness => true,
            :format => { :with => email_regex }
  validates_length_of :name, :maximum => 64
  validates :password, 
            :presence => true,
            :confirmation => true,
            :length => { :within => 8..40 }

  before_save :encrypt_password

  has_many :posts, :dependent => :destroy

  def password_match?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    user && user.password_match?(password) ? user : nil
  end

  def self.authenticate_with_email(id, cookie_email)
    user = find(id) rescue nil
    user && user.email == cookie_email ? user : nil
  end

  private

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end
