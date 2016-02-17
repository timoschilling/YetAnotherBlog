class User::Cell < ApplicationConcept
  register :show
  property :first_name
  property :last_name
  property :email

  def name
    "#{first_name} #{last_name}"
  end

  def link
    %{<a href="mailto:#{email}">#{name}</a>}
  end
end
