class User < ApplicationRecord
	include ActiveModel::Validations

	has_secure_password

	has_many :leagues
	has_many :teams
	has_many :comments
  # this is still not working correctly
	validates :name, uniqueness: {message: "Username has already been taken!"}
	validates :email, uniqueness: {message: "Email has already been used!"}
	def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
