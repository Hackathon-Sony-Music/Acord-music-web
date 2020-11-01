class RegistrosController < ApplicationController
  before_action :authenticate_user!, only: [:principal]

  def box_1
  end

  def box_1_1
  end

  def box_1_1_2
  end

  def box_1_1_3
  end

  def box_1_1_4
  end

  def box_1_2
  end

  def box_1_2_2
  end

  def box_1_2_3
  end

  def box_1_2_4
  end

  def update_dados_registros
    current_user.update_attributes(registrations: !current_user.registrations)
    redirect_to '/'
  end

end
