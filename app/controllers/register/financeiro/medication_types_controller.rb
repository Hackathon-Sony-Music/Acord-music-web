class Register::Financeiro::MedicationTypesController < ApplicationController
  before_action :set_register_financeiro_medication_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /register/financeiro/medication_types
  # GET /register/financeiro/medication_types.json
  def index
    condicao = "1=1"
    condicao += " AND UPPER(nme_medication) LIKE UPPER('%#{params[:register_financeiro_medication_type][:nme_medication]}%')" if params[:register_financeiro_medication_type].present? && params[:register_financeiro_medication_type][:nme_medication].present?

    @register_financeiro_medication_type_search = params[:register_financeiro_medication_type].present? ?
                                  Register::Financeiro::MedicationType.new(register_financeiro_medication_type_params) : Register::Financeiro::MedicationType.new()

    respond_to do |format|
      # format.any(:pdf, :xls, :xml, :csv) do
      if [:pdf, :XLSX, :xml, :csv, :json].include? params[:format].to_s.to_sym
        @register_financeiro_medication_types = Register::Financeiro::MedicationType.where(condicao)
        gerar_impressao_format(format, @register_financeiro_medication_types, "Relatorio de #{Register::Financeiro::MedicationType.human_attribute_name(:nme_modulo)}")
      end
      format.any(:html) {
        @register_financeiro_medication_types = Register::Financeiro::MedicationType.where(condicao)
      }
    end
  end

  # GET /register/financeiro/medication_types/1
  # GET /register/financeiro/medication_types/1.json
  def show
  end

  # GET /register/financeiro/medication_types/new
  def new
    @register_financeiro_medication_type = Register::Financeiro::MedicationType.new
  end

  # GET /register/financeiro/medication_types/1/edit
  def edit
  end

  # POST /register/financeiro/medication_types
  # POST /register/financeiro/medication_types.json
  def create
    @register_financeiro_medication_type = Register::Financeiro::MedicationType.new(register_financeiro_medication_type_params)

    respond_to do |format|
      if @register_financeiro_medication_type.save
        format.html { redirect_to register_financeiro_medication_types_url, notice: 'Medicamento Creado com sucesso!' }
        format.json { render :show, status: :created, location: @register_financeiro_medication_type }
      else
        format.html { render :new }
        format.json { render json: @register_financeiro_medication_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register/financeiro/medication_types/1
  # PATCH/PUT /register/financeiro/medication_types/1.json
  def update
    respond_to do |format|
      if @register_financeiro_medication_type.update(register_financeiro_medication_type_params)
        format.html { redirect_to register_financeiro_medication_types_url, notice: 'Medicamento Atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @register_financeiro_medication_type }
      else
        format.html { render :edit }
        format.json { render json: @register_financeiro_medication_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register/financeiro/medication_types/1
  # DELETE /register/financeiro/medication_types/1.json
  def destroy
    @register_financeiro_medication_type.destroy
    respond_to do |format|
      format.html { redirect_to register_financeiro_medication_types_url, notice: 'Medicamento Deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_financeiro_medication_type
      @register_financeiro_medication_type = Register::Financeiro::MedicationType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def register_financeiro_medication_type_params
      params.require(:register_financeiro_medication_type).permit(:nme_medication, :description, :obs)
    end
end
