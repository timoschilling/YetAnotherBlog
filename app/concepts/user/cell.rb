class User::Cell < ApplicationConcept
  register :show
  property :first_name
  property :last_name
  property :email

  def name
    "#{first_name} #{last_name}"
  end

  def link
    link_to email, name
  end
end
