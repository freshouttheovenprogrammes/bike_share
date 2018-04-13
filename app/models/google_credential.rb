class GoogleCredential < ApplicationRecord
  belongs_to :user

  def update_or_create(attributes)
    if user.nil?
      create_user(attributes)
    else
      user.update_attributes(attributes)
    end
    user
  end
end
