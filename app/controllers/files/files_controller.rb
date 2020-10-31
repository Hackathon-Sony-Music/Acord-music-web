class Files::FilesController < ApplicationController
  before_action :set_files_file, only: [:show, :edit, :update, :destroy]
  before_action :convert_data_params, only: [:create, :update]
  before_action :authenticate_user!
  # GET /files/files
  # GET /files/files.json
  def index
    @files_files = Files::File.all
  end

  # GET /files/files/1
  # GET /files/files/1.json
  def show
  end

  # GET /files/files/new
  def new
    @files_file = Files::File.new
  end

  # GET /files/files/1/edit
  def edit
  end

  def serve
    @photo = Files::Photo.find(params[:id])
    send_data(@photo.data, :type => @photo.mime_type, :filename => "#{@photo.name}.jpg", :disposition => "inline")
  end

  # POST /files/files
  # POST /files/files.json
  def create
    @files_file = Files::File.new(files_file_params)

    respond_to do |format|
      if @files_file.save
        format.html { redirect_to @files_file, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @files_file }
      else
        format.html { render :new }
        format.json { render json: @files_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /files/files/1
  # PATCH/PUT /files/files/1.json
  def update
    respond_to do |format|
      if @files_file.update(files_file_params)
        format.html { redirect_to @files_file, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @files_file }
      else
        format.html { render :edit }
        format.json { render json: @files_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /files/files/1
  # DELETE /files/files/1.json
  def destroy
    @files_file.destroy
    respond_to do |format|
      format.html { redirect_to files_files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_files_file
      @files_file = Files::File.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def files_file_params
      params.require(:files_file).permit(:data, :filename, :mime_type)
    end

    def convert_data_params
      if params[:files_file][:data]
        params[:files_file][:filename] = params[:files_file][:data].original_filename
        params[:files_file][:mime_type] = params[:files_file][:data].content_type
        params[:files_file][:data] = params[:files_file][:data].read
      end
    end
end
