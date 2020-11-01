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

  # methods de update
  def box_1_update
    current_user.update_attributes(editor: params[:params] == 'false' ? false : true)
    if params[:params] == 'false'
      redirect_to box_1_1_registros_path
    else
      redirect_to box_1_2_registros_path
    end
  end

  def box_1_1_update
    current_user.update_attributes(name: params[:user][:name])
    if !current_user.editor
      redirect_to box_1_1_2_registros_path
    else
      redirect_to box_1_2_2_registros_path
    end
  end

  def box_1_1_2_update
    @string = ""
    params[:user][:category_id].select{|t| t.present? }.each do |t|
       @string += t + ";"
    end

    current_user.update_attributes(categoria: @string)
    
    if !current_user.editor
      redirect_to box_1_1_3_registros_path
    else
      redirect_to box_1_2_3_registros_path
    end
  end

  def box_1_1_3_update
  end

  def box_1_1_4_update
  end

  def box_1_2_update
  end

  def box_1_2_2_update
  end

  def box_1_2_3_update
  end

  def box_1_2_4_update
  end


  def update_dados_registros
    current_user.update_attributes(registrations: !current_user.registrations)
    redirect_to '/'
  end

end
