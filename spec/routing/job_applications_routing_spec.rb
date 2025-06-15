require "rails_helper"

RSpec.describe JobApplicationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/job_applications").to route_to("job_applications#index")
    end
  end
end
