class Offer < ApplicationRecord
  validates_presence_of :title

  belongs_to :user
  has_many_attached :images


end
