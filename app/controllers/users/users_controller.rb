class Users::UsersController < ApplicationController
  before_action :set_register_user
  before_action :convert_data_params, only:[:update]
  before_action :authenticate_user!

  def edit
    @user.build_files if !@user.files.present?
  end

  def update
    respond_to do |format|
      if @user.update(register_user_params)
        format.html { redirect_to edit_users_user_path(@user), notice: 'Dados do usuario atualizado' }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
  end

  private

  def set_register_user
    @user = User.find(params[:id])
  end

  def register_user_params
    if params[:user][:files_attributes][:data].present?
      params.require(:user).permit(:user_name, files_attributes:[:data, :filename, :mime_type, :id])
    else
      params.require(:user).permit(:user_name)
    end
  end

  def convert_data_params
    if params[:user][:files_attributes][:data]
      params[:user][:files_attributes][:filename] = params[:user][:files_attributes][:data].original_filename
      params[:user][:files_attributes][:mime_type] = params[:user][:files_attributes][:data].content_type
      params[:user][:files_attributes][:data] = params[:user][:files_attributes][:data].read
    end
  end

end
