module OffersHelper

  def current_user_can_see?(offer)
    user_signed_in? or
    offer.public
  end

  def current_user_can_modify?(offer)
    user_signed_in? and (
      current_user.admin? or
      offer.user == current_user
    )
  end
end
