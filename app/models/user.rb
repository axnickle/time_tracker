class User < ApplicationRecord #validation

  has_many :tasks

  has_secure_password #validations: false
      #validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  #validates :password, presence: true, on: :create, length: {minimum: 5} # on: :create means that a password has to be present when creating a new user, but not when updating user details
end

#when we create user, needs a pw
#when updating user email, pw doesn't need to change
