require "rails_helper"

RSpec.describe Register::Financeiro::ProvidersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/register/financeiro/providers").to route_to("register/financeiro/providers#index")
    end

    it "routes to #new" do
      expect(get: "/register/financeiro/providers/new").to route_to("register/financeiro/providers#new")
    end

    it "routes to #show" do
      expect(get: "/register/financeiro/providers/1").to route_to("register/financeiro/providers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/register/financeiro/providers/1/edit").to route_to("register/financeiro/providers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/register/financeiro/providers").to route_to("register/financeiro/providers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/register/financeiro/providers/1").to route_to("register/financeiro/providers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/register/financeiro/providers/1").to route_to("register/financeiro/providers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/register/financeiro/providers/1").to route_to("register/financeiro/providers#destroy", id: "1")
    end
  end
end
