class UsuarioAvaliaProdutosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_usuario_avalia_produto, only: [:show, :edit, :update, :destroy]

  # GET /usuario_avalia_produtos
  # GET /usuario_avalia_produtos.json
  def index
    authorize! :menage, :all
    @usuario_avalia_produtos = UsuarioAvaliaProduto.all
  end

  # GET /usuario_avalia_produtos/1
  # GET /usuario_avalia_produtos/1.json
  def show
    authorize! :menage, :all
  end

  # GET /usuario_avalia_produtos/new
  def new
    authorize! :menage, :all
    @usuario_avalia_produto = UsuarioAvaliaProduto.new
  end

  # GET /usuario_avalia_produtos/1/edit
  def edit
    authorize! :menage, :all
  end

  # POST /usuario_avalia_produtos
  # POST /usuario_avalia_produtos.json
  def create
    authorize! :menage, :all
    @usuario_avalia_produto = UsuarioAvaliaProduto.new(usuario_avalia_produto_params)

    respond_to do |format|
      if @usuario_avalia_produto.save
        format.html { redirect_to @usuario_avalia_produto, notice: 'Usuario avalia produto was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_avalia_produto }
      else
        format.html { render :new }
        format.json { render json: @usuario_avalia_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_avalia_produtos/1
  # PATCH/PUT /usuario_avalia_produtos/1.json
  def update
    authorize! :menage, :all
    respond_to do |format|
      if @usuario_avalia_produto.update(usuario_avalia_produto_params)
        format.html { redirect_to @usuario_avalia_produto, notice: 'Usuario avalia produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_avalia_produto }
      else
        format.html { render :edit }
        format.json { render json: @usuario_avalia_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_avalia_produtos/1
  # DELETE /usuario_avalia_produtos/1.json
  def destroy
    authorize! :menage, :all
    @usuario_avalia_produto.destroy
    respond_to do |format|
      format.html { redirect_to usuario_avalia_produtos_url, notice: 'Usuario avalia produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_avalia_produto
      @usuario_avalia_produto = UsuarioAvaliaProduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_avalia_produto_params
      params.require(:usuario_avalia_produto).permit(:usuario_id, :produto_id, :estrelas, :comentario, :dt_avaliacao)
    end
end
