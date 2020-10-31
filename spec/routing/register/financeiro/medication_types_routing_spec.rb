require "rails_helper"

RSpec.describe Register::Financeiro::MedicationTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/register/financeiro/medication_types").to route_to("register/financeiro/medication_types#index")
    end

    it "routes to #new" do
      expect(get: "/register/financeiro/medication_types/new").to route_to("register/financeiro/medication_types#new")
    end

    it "routes to #show" do
      expect(get: "/register/financeiro/medication_types/1").to route_to("register/financeiro/medication_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/register/financeiro/medication_types/1/edit").to route_to("register/financeiro/medication_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/register/financeiro/medication_types").to route_to("register/financeiro/medication_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/register/financeiro/medication_types/1").to route_to("register/financeiro/medication_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/register/financeiro/medication_types/1").to route_to("register/financeiro/medication_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/register/financeiro/medication_types/1").to route_to("register/financeiro/medication_types#destroy", id: "1")
    end
  end
end
