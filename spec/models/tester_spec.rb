require 'spec_helper'

describe Tester do
  describe "Associations" do
    it { should have_many :bugs }
  end
end
