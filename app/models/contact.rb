class Contact < ApplicationRecord
  # Direct associations

  belongs_to :firm

  has_many   :touchpoints,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :touchpoints,
             :source => :user

  # Validations

end
