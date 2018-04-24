class Bug < ApplicationRecord
  validates_presence_of :device_id, :tester_id
end
