class ProfilePolicy < ApplicationPolicy
  def update?
    # If current user is not the owner of the Profile
    user == record.user
  end
end