class Register::Financeiro::ProvidersController < ApplicationController
  before_action :set_register_financeiro_provider, only: [:show, :edit, :update, :destroy]
  before_action :params_search, only: [:index]
  before_action :authenticate_user!
  # GET /register/financeiro/providers
  # GET /register/financeiro/providers.json
  def index
    respond_to do |format|
      # format.any(:pdf, :xls, :xml, :csv) do
      if [:pdf, :XLSX, :xml, :csv, :json].include? params[:format].to_s.to_sym
        @register_financeiro_providers = Register::Financeiro::Provider.where(@condicao)
        gerar_impressao_format(format, @register_financeiro_providers,
          "Relatorio de #{Register::Financeiro::Provider.human_attribute_name(:nme_modulo)}")
      end
      format.any(:html) {
        @register_financeiro_providers = Register::Financeiro::Provider.where(@condicao)
      }
    end
  end

  # GET /register/financeiro/providers/1
  # GET /register/financeiro/providers/1.json
  def show
  end

  # GET /register/financeiro/providers/new
  def new
    @register_financeiro_provider = Register::Financeiro::Provider.new
  end

  # GET /register/financeiro/providers/1/edit
  def edit
  end

  # POST /register/financeiro/providers
  # POST /register/financeiro/providers.json
  def create
    @register_financeiro_provider = Register::Financeiro::Provider.new(register_financeiro_provider_params)

    respond_to do |format|
      if @register_financeiro_provider.save
        format.html { redirect_to @register_financeiro_provider, notice: 'Fornecedor Cadastrado com Sucesso!' }
        format.json { render :show, status: :created, location: @register_financeiro_provider }
      else
        format.html { render :new }
        format.json { render json: @register_financeiro_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register/financeiro/providers/1
  # PATCH/PUT /register/financeiro/providers/1.json
  def update
    respond_to do |format|
      if @register_financeiro_provider.update(register_financeiro_provider_params)
        format.html { redirect_to @register_financeiro_provider, warning: 'Fornecedor Atualizado com Sucesso!' }
        format.json { render :show, status: :ok, location: @register_financeiro_provider }
      else
        format.html { render :edit }
        format.json { render json: @register_financeiro_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register/financeiro/providers/1
  # DELETE /register/financeiro/providers/1.json
  def destroy
    @register_financeiro_provider.destroy
    respond_to do |format|
      format.html { redirect_to register_financeiro_providers_url, warning: 'Fornecedor deletado com Sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_financeiro_provider
      @register_financeiro_provider = Register::Financeiro::Provider.find(params[:id])
    end

    def params_search
      @condicao = '1=1'
      byebug
      if params[:register_financeiro_provider].present?
        @condicao += " AND UPPER(nme_provider) LIKE UPPER('%#{params[:register_financeiro_provider][:nme_provider]}%')" if params[:register_financeiro_provider][:nme_provider].present?
        @condicao += " AND UPPER(nme_empresa) LIKE UPPER('%#{params[:register_financeiro_provider][:nme_empresa]}%')" if params[:register_financeiro_provider][:nme_empresa].present?
        @register_financeiro_provider_search = Register::Financeiro::Provider.new(register_financeiro_provider_params)
      else
        @register_financeiro_provider_search = Register::Financeiro::Provider.new()
      end

    end

    # Only allow a list of trusted parameters through.
    def register_financeiro_provider_params
      params.require(:register_financeiro_provider).permit(:nme_provider, :email, :telephone, :nme_empresa, :description, :obs)
    end
end
