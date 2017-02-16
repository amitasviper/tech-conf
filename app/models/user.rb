class User < ActiveRecord::Base
  has_many :conferences

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50 }
  validates :email, presence: true,
            length: { maximum: 256 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6}, :presence => true

  before_save :some_method

  private

  def some_method
    self.email = email.downcase
  end
end
