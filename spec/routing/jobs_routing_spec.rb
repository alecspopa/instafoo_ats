require "rails_helper"

RSpec.describe JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jobs").to route_to("jobs#index")
    end
  end
end
