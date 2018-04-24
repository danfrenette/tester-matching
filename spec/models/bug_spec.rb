require "spec_helper"

describe Bug do
  describe "Validations" do
    it { should validate_presence_of :device_id }
    it { should validate_presence_of :tester_id }
  end

  describe "Validations" do
    it { should belong_to :tester }
  end
end
