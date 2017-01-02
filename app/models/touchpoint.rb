class Touchpoint < ApplicationRecord
  # Direct associations

  belongs_to :firm

  belongs_to :contact

  belongs_to :user

  # Indirect associations

  # Validations

end
