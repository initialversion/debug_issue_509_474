class User < ApplicationRecord
  # Direct associations

  has_many   :verifies,
             :dependent => :destroy

  has_many   :target_firms,
             :dependent => :destroy

  has_many   :touchpoints,
             :dependent => :destroy

  has_many   :follow_ups,
             :dependent => :destroy

  has_many   :group_members,
             :dependent => :destroy

  # Indirect associations

  has_many   :contacts,
             :through => :touchpoints,
             :source => :contact

  has_many   :groups,
             :through => :group_members,
             :source => :group

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
