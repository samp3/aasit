class ReftypesController < ApplicationController
  before_action :set_reftype, only: [:show, :edit, :update, :destroy]

  # GET /reftypes
  # GET /reftypes.json
  def index
    @reftypes = Reftype.all
  end

  # GET /reftypes/1
  # GET /reftypes/1.json
  def show
    @required = @reftype.requiredFields
    @optional = @reftype.optionalFields
    @cat2 = @reftype.required2Fields
    @cat3 = @reftype.required3Fields
  end

  # GET /reftypes/new
  def new
    @reftype = Reftype.new
  end

  # GET /reftypes/1/edit
  def edit
  end

  # POST /reftypes
  # POST /reftypes.json
  def create
    @reftype = Reftype.new(reftype_params)

    respond_to do |format|
      if @reftype.save
        format.html { redirect_to @reftype, notice: 'Uusi viitetyyppi luotu onnistuneesti.' }
        format.json { render :show, status: :created, location: @reftype }
      else
        format.html { render :new }
        format.json { render json: @reftype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reftypes/1
  # PATCH/PUT /reftypes/1.json
  def update
    respond_to do |format|
      if @reftype.update(reftype_params)
        format.html { redirect_to @reftype, notice: 'Reftype was successfully updated.' }
        format.json { render :show, status: :ok, location: @reftype }
      else
        format.html { render :edit }
        format.json { render json: @reftype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reftypes/1
  # DELETE /reftypes/1.json
  def destroy
    @reftype.destroy
    respond_to do |format|
      format.html { redirect_to reftypes_url, notice: 'Reftype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reftype
      @reftype = Reftype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reftype_params
      params.require(:reftype).permit(:name)
    end
end
