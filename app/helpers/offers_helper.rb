module OffersHelper

  def current_user_can_modify?(offer)
    current_user.admin? or (offer.user == current_user)
  end
end
