require "rails_helper"

RSpec.describe Register::Financeiro::FoodTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/register/financeiro/food_types").to route_to("register/financeiro/food_types#index")
    end

    it "routes to #new" do
      expect(get: "/register/financeiro/food_types/new").to route_to("register/financeiro/food_types#new")
    end

    it "routes to #show" do
      expect(get: "/register/financeiro/food_types/1").to route_to("register/financeiro/food_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/register/financeiro/food_types/1/edit").to route_to("register/financeiro/food_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/register/financeiro/food_types").to route_to("register/financeiro/food_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/register/financeiro/food_types/1").to route_to("register/financeiro/food_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/register/financeiro/food_types/1").to route_to("register/financeiro/food_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/register/financeiro/food_types/1").to route_to("register/financeiro/food_types#destroy", id: "1")
    end
  end
end
