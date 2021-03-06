# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  name                   :string
#  phone                  :string
#  admin                  :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include devise modules. Others available are:
  # :lockable, :timeoutable, :registerable, and :omniauthable
  devise :database_authenticatable, :confirmable, :rememberable, :trackable, :validatable, :recoverable

  has_many :offers

  before_validation on: :create do
    if password.nil?
      # NB : This is not a cryptographically-secure random number, but it doesn't really matter here
      self.password = rand(100000000000000000000000000)
    end
  end

  def to_s
    if name
      return name
    else
      return email
    end
  end

end
