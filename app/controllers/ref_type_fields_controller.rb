class RefTypeFieldsController < ApplicationController
  before_action :set_ref_type_field, only: [:show, :edit, :update, :destroy]

  # GET /ref_type_fields
  # GET /ref_type_fields.json
  def index
    @ref_type_fields = RefTypeField.all.order(reftype_id: :asc, obligatory: :desc)
  end

  # GET /ref_type_fields/1
  # GET /ref_type_fields/1.json
  def show
  end

  # GET /ref_type_fields/new
  def new
    @ref_attributes = RefAttribute.all
    @reftypes = Reftype.all
    @ref_type_field = RefTypeField.new
  end

  # GET /ref_type_fields/1/edit
  def edit
    @obs = [{:id => 0, :name => "Valinnainen"}]
    @ref_attributes = RefAttribute.all
    @reftypes = Reftype.all
  end

  # POST /ref_type_fields
  # POST /ref_type_fields.json
  def create
    @ref_type_field = RefTypeField.new(ref_type_field_params)

    respond_to do |format|
      if @ref_type_field.save
        format.html { redirect_to @ref_type_field, notice: 'Ref type field was successfully created.' }
        format.json { render :show, status: :created, location: @ref_type_field }
      else
        @ref_attributes = RefAttribute.all
        @reftypes = Reftype.all
        format.html { render :new }
        format.json { render json: @ref_type_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ref_type_fields/1
  # PATCH/PUT /ref_type_fields/1.json
  def update
    respond_to do |format|
      if @ref_type_field.update(ref_type_field_params)
        format.html { redirect_to @ref_type_field, notice: 'Ref type field was successfully updated.' }
        format.json { render :show, status: :ok, location: @ref_type_field }
      else
        format.html { render :edit }
        format.json { render json: @ref_type_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_type_fields/1
  # DELETE /ref_type_fields/1.json
  def destroy
    @ref_type_field.destroy
    respond_to do |format|
      format.html { redirect_to ref_type_fields_url, notice: 'Ref type field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ref_type_field
      @ref_type_field = RefTypeField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ref_type_field_params
      params.require(:ref_type_field).permit(:reftype_id, :ref_attribute_id, :obligatory)
    end
end
