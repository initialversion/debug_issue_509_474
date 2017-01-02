class Contact < ApplicationRecord
  # Direct associations

  has_many   :touchpoints,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
