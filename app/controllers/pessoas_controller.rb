class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]

  # GET /pessoas or /pessoas.json
  def index
    @pessoas = Pessoa.all

    @pessoas = @pessoas.where('name LIKE ?', "%#{params['name']}%") if params['name'].present?
    return @pessoas unless params['birth_date'].present?

    formated_date = params['birth_date'].to_date.strftime('%d/%m/%Y')
    @pessoas = @pessoas.where(birth_date: formated_date)
  end

  # GET /pessoas/1 or /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas or /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to pessoa_url(@pessoa), notice: 'Pessoa cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1 or /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to pessoa_url(@pessoa), notice: 'Pessoa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1 or /pessoas/1.json
  def destroy
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Pessoa excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pessoa_params
    params.require(:pessoa).permit(:name, :birth_date, :status)
  end

  def pessoa_search_params
    params.require(:pessoa).permit(:name, :birth_date)
  end
end
