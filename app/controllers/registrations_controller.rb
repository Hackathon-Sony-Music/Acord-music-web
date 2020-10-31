class RegistrationsController < ApplicationController
  before_action :authenticate_user!, only: [:principal]

  def box_1
  end

end
