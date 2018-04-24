class Bug < ApplicationRecord
  belongs_to :tester

  validates_presence_of :device_id, :tester_id
end
