class Group < ApplicationRecord
  # Direct associations

  has_many   :group_members,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :group_members,
             :source => :user

  # Validations

end
