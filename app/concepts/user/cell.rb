class User::Cell < ApplicationConcept
  property :first_name
  property :last_name
  property :email

  def show
    render view: :show
  end

  def name
    "#{first_name} #{last_name}"
  end

  def link
    link_to email, name
  end
end
