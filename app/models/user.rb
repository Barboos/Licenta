class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: {maximum: 255}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 255}, uniqueness:{ case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
     
end