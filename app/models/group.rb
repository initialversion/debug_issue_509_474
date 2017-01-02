class Group < ApplicationRecord
  # Direct associations

  has_many   :group_members,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
