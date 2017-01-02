class GroupMember < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :group

  # Indirect associations

  # Validations

end
