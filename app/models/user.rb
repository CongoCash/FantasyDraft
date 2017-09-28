class User < ApplicationRecord
	has_secure_password

	has_many :leagues
	has_many :teams

	def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
