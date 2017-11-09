class ProductPolicy < ApplicationPolicy
  def update?
    # If current user is not the owner of the Profile
    user == record.seller
  end
end