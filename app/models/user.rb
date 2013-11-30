class User < ActiveRecord::Base
    has_secure_password
    #initialize
    before_save { email.downcase! }
    #name
    validates :name, presence: true, length:{ maximum:50}
    #email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    #password
    validates :password, length: { minimum: 6 }
end
