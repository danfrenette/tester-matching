require "spec_helper"

describe TesterDevice do
  describe "Validations" do
    it { should validate_presence_of :device_id }
    it { should validate_presence_of :tester_id }
  end
end
