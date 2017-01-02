class RecruitingEvent < ApplicationRecord
  # Direct associations

  has_many   :verifies,
             :dependent => :destroy

  belongs_to :firm

  # Indirect associations

  # Validations

end
