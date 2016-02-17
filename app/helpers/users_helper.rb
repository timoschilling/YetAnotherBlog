module UsersHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def user_link(user)
    link_to user.email, user_name(user)
  end
end
