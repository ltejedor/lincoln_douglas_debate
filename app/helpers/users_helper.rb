module UsersHelper

  def current?(user)
    current_user && current_user == user
  end
end
