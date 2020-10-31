class Register::Financeiro::FoodTypesController < ApplicationController
  before_action :set_register_financeiro_food_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /register/financeiro/food_types
  # GET /register/financeiro/food_types.json
  def index
    condicao = "1=1"
    condicao += " AND UPPER(nme_food) LIKE UPPER('%#{params[:register_financeiro_food_type][:nme_food]}%')" if params[:register_financeiro_food_type].present? && params[:register_financeiro_food_type][:nme_food].present?

    @register_financeiro_food_type_search = params[:register_financeiro_food_type].present? ?
                                  Register::Financeiro::FoodType.new(register_financeiro_food_type_params) : Register::Financeiro::FoodType.new()

    respond_to do |format|
      # format.any(:pdf, :xls, :xml, :csv) do
      if [:pdf, :XLSX, :xml, :csv, :json].include? params[:format].to_s.to_sym
        @register_financeiro_food_types = Register::Financeiro::FoodType.where(condicao)
        gerar_impressao_format(format, @register_financeiro_food_types, "Relatorio de #{Register::Financeiro::FoodType.human_attribute_name(:nme_modulo)}")
      end
      format.any(:html) {
        @register_financeiro_food_types = Register::Financeiro::FoodType.where(condicao)
      }
    end

  end

  # GET /register/financeiro/food_types/1
  # GET /register/financeiro/food_types/1.json
  def show
  end

  # GET /register/financeiro/food_types/new
  def new
    @register_financeiro_food_type = Register::Financeiro::FoodType.new
  end

  # GET /register/financeiro/food_types/1/edit
  def edit
  end

  # POST /register/financeiro/food_types
  # POST /register/financeiro/food_types.json
  def create
    @register_financeiro_food_type = Register::Financeiro::FoodType.new(register_financeiro_food_type_params)

    respond_to do |format|
      if @register_financeiro_food_type.save
        format.html { redirect_to register_financeiro_food_types_url, notice: 'Tipo de comida Criado com Sucesso!' }
        format.json { render :show, status: :created, location: @register_financeiro_food_type }
      else
        format.html { render :new }
        format.json { render json: @register_financeiro_food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register/financeiro/food_types/1
  # PATCH/PUT /register/financeiro/food_types/1.json
  def update
    respond_to do |format|
      if @register_financeiro_food_type.update(register_financeiro_food_type_params)
        format.html { redirect_to register_financeiro_food_types_url, warning: 'Tipo de comida atualizado com Sucesso!' }
        format.json { render :show, status: :ok, location: @register_financeiro_food_type }
      else
        format.html { render :edit }
        format.json { render json: @register_financeiro_food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register/financeiro/food_types/1
  # DELETE /register/financeiro/food_types/1.json
  def destroy
    @register_financeiro_food_type.destroy
    respond_to do |format|
      format.html { redirect_to register_financeiro_food_types_url, warning: 'Tipo de comida Deletado com Sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_financeiro_food_type
      @register_financeiro_food_type = Register::Financeiro::FoodType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def register_financeiro_food_type_params
      params.require(:register_financeiro_food_type).permit(:nme_food, :description, :obs)
    end
end
