module OffersHelper


  def current_user_can_modify?(offer)
    user_signed_in? and (
      current_user.admin? or
      offer.user == current_user
    )
  end
end
