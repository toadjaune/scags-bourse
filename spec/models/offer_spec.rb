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

require 'rails_helper'

RSpec.describe Offer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
