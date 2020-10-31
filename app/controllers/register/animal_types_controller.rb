class Register::AnimalTypesController < ApplicationController
  before_action :set_register_animal_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /register/animal_types
  # GET /register/animal_types.json

  def index
    condicao = "1=1"
    condicao += " AND UPPER(nme_animal) LIKE UPPER('%#{params[:register_animal_type][:nme_animal]}%')" if params[:register_animal_type].present? && params[:register_animal_type][:nme_animal].present?
    @register_animal_type_search = params[:register_animal_type].present? ?
                                  Register::AnimalType.new(register_animal_type_params) : Register::AnimalType.new()
    @register_animal_types = Register::AnimalType.where(condicao)

    respond_to do |format|
      # format.any(:pdf, :xls, :xml, :csv) do
      if [:pdf, :XLSX, :xml, :csv, :json].include? params[:format].to_s.to_sym
        gerar_impressao_format(format, @register_animal_types, "Relatorio de #{Register::AnimalType.human_attribute_name(:nme_modulo)}")
      end
      format.any(:html) {
        @register_animal_types = Register::AnimalType.where(condicao)
      }
    end

  end

  # GET /register/animal_types/1
  # GET /register/animal_types/1.json
  def show
  end

  # GET /register/animal_types/new
  def new
    @register_animal_type = Register::AnimalType.new
  end

  # GET /register/animal_types/1/edit
  def edit
  end

  # POST /register/animal_types
  # POST /register/animal_types.json
  def create
    @register_animal_type = Register::AnimalType.new(register_animal_type_params)

    respond_to do |format|
      if @register_animal_type.save
        format.html { redirect_to register_animal_types_path, success: 'O tipo de animal foi criado com sucesso.' }
        format.json { render :index, status: :created, location: @register_animal_type }
      else
        format.html { render :new }
        format.json { render json: @register_animal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register/animal_types/1
  # PATCH/PUT /register/animal_types/1.json
  def update
    respond_to do |format|
      if @register_animal_type.update(register_animal_type_params)
        format.html { redirect_to register_animal_types_path, notice: 'O tipo de animal foi atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @register_animal_type }
      else
        format.html { render :edit }
        format.json { render json: @register_animal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register/animal_types/1
  # DELETE /register/animal_types/1.json
  def destroy
    @register_animal_type.destroy
    respond_to do |format|
      format.html { redirect_to register_animal_types_url, notice: 'O tipo animal foi destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_animal_type
      @register_animal_type = Register::AnimalType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def register_animal_type_params
      params.require(:register_animal_type).permit(:nme_animal, :obs, :image)
    end
end
