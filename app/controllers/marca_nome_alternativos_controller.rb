class MarcaNomeAlternativosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_marca_nome_alternativo, only: [:show, :edit, :update, :destroy]

  # GET /marca_nome_alternativos
  # GET /marca_nome_alternativos.json
  def index
    authorize! :menage, :all
    @marca_nome_alternativos = MarcaNomeAlternativo.all
  end

  # GET /marca_nome_alternativos/1
  # GET /marca_nome_alternativos/1.json
  def show
    authorize! :menage, :all
  end

  # GET /marca_nome_alternativos/new
  def new
    authorize! :menage, :all
    @marca_nome_alternativo = MarcaNomeAlternativo.new
  end

  # GET /marca_nome_alternativos/1/edit
  def edit
    authorize! :menage, :all
  end

  # POST /marca_nome_alternativos
  # POST /marca_nome_alternativos.json
  def create
    authorize! :menage, :all
    @marca_nome_alternativo = MarcaNomeAlternativo.new(marca_nome_alternativo_params)

    respond_to do |format|
      if @marca_nome_alternativo.save
        format.html { redirect_to @marca_nome_alternativo, notice: 'Marca nome alternativo was successfully created.' }
        format.json { render :show, status: :created, location: @marca_nome_alternativo }
      else
        format.html { render :new }
        format.json { render json: @marca_nome_alternativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marca_nome_alternativos/1
  # PATCH/PUT /marca_nome_alternativos/1.json
  def update
    authorize! :menage, :all
    respond_to do |format|
      if @marca_nome_alternativo.update(marca_nome_alternativo_params)
        format.html { redirect_to @marca_nome_alternativo, notice: 'Marca nome alternativo was successfully updated.' }
        format.json { render :show, status: :ok, location: @marca_nome_alternativo }
      else
        format.html { render :edit }
        format.json { render json: @marca_nome_alternativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marca_nome_alternativos/1
  # DELETE /marca_nome_alternativos/1.json
  def destroy
    authorize! :menage, :all
    @marca_nome_alternativo.destroy
    respond_to do |format|
      format.html { redirect_to marca_nome_alternativos_url, notice: 'Marca nome alternativo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca_nome_alternativo
      @marca_nome_alternativo = MarcaNomeAlternativo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_nome_alternativo_params
      params.require(:marca_nome_alternativo).permit(:marca_id, :nome)
    end
end
