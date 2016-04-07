class RefAttributesController < ApplicationController
  before_action :set_ref_attribute, only: [:show, :edit, :update, :destroy]

  # GET /ref_attributes
  # GET /ref_attributes.json
  def index
    @ref_attributes = RefAttribute.all
  end

  # GET /ref_attributes/1
  # GET /ref_attributes/1.json
  def show
  end

  # GET /ref_attributes/new
  def new
    @ref_attribute = RefAttribute.new
  end

  # GET /ref_attributes/1/edit
  def edit
  end

  # POST /ref_attributes
  # POST /ref_attributes.json
  def create
    @ref_attribute = RefAttribute.new(ref_attribute_params)

    respond_to do |format|
      if @ref_attribute.save
        format.html { redirect_to @ref_attribute, notice: 'Ref attribute was successfully created.' }
        format.json { render :show, status: :created, location: @ref_attribute }
      else
        format.html { render :new }
        format.json { render json: @ref_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ref_attributes/1
  # PATCH/PUT /ref_attributes/1.json
  def update
    respond_to do |format|
      if @ref_attribute.update(ref_attribute_params)
        format.html { redirect_to @ref_attribute, notice: 'Ref attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @ref_attribute }
      else
        format.html { render :edit }
        format.json { render json: @ref_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_attributes/1
  # DELETE /ref_attributes/1.json
  def destroy
    @ref_attribute.destroy
    respond_to do |format|
      format.html { redirect_to ref_attributes_url, notice: 'Ref attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ref_attribute
      @ref_attribute = RefAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ref_attribute_params
      params.require(:ref_attribute).permit(:name)
    end
end
