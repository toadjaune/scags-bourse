class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
end
