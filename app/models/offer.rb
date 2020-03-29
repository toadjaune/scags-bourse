# == Schema Information
#
# Table name: offers
#
#  id         :bigint           not null, primary key
#  title      :string
#  text       :text
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  public     :boolean          default(FALSE), not null
#

class Offer < ApplicationRecord
  validates_presence_of :title

  belongs_to :user
  has_many_attached :images


end
