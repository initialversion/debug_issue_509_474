class Firm < ApplicationRecord
  # Direct associations

  has_many   :recruiting_events,
             :dependent => :destroy

  has_many   :target_firms,
             :dependent => :destroy

  has_many   :follow_ups,
             :dependent => :destroy

  has_many   :touchpoints

  has_many   :contacts

  # Indirect associations

  # Validations

end
