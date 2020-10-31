require "rails_helper"

RSpec.describe Files::FilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/files/files").to route_to("files/files#index")
    end

    it "routes to #new" do
      expect(get: "/files/files/new").to route_to("files/files#new")
    end

    it "routes to #show" do
      expect(get: "/files/files/1").to route_to("files/files#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/files/files/1/edit").to route_to("files/files#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/files/files").to route_to("files/files#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/files/files/1").to route_to("files/files#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/files/files/1").to route_to("files/files#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/files/files/1").to route_to("files/files#destroy", id: "1")
    end
  end
end
