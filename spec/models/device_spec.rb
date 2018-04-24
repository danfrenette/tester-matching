require "spec_helper"

describe Device do
  describe "Validations" do
    it { should validate_presence_of :description }
  end
end
