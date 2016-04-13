class RefMetaController < ApplicationController
  before_action :set_ref_metum, only: [:show, :edit, :update, :destroy]

  # GET /ref_meta
  # GET /ref_meta.json
  def index
    @ref_meta = RefMetum.all
  end

  # GET /ref_meta/1
  # GET /ref_meta/1.json
  def show

  end

  # GET /ref_meta/new
  def new
    @ref_metum = RefMetum.new
    @refs = Ref.all
    @attrs = RefAttribute.all
  end

  # GET /ref_meta/1/edit
  def edit
    @refs = Ref.where("id = :id", {id: @ref_metum.ref_id})
    @attrs = RefAttribute.all
  end

  # POST /ref_meta
  # POST /ref_meta.json
  def create
    @ref_metum = RefMetum.new(ref_metum_params)

    respond_to do |format|
      if @ref_metum.save
        format.html { redirect_to @ref_metum.ref, notice: 'Ref metum was successfully created.' }
        format.json { render :show, status: :created, location: @ref_metum }
      else
        @refs = Ref.all
        @attrs = RefAttribute.all
        format.html { render :new }
        format.json { render json: @ref_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ref_meta/1
  # PATCH/PUT /ref_meta/1.json
  def update
    respond_to do |format|
      if @ref_metum.update(ref_metum_params)
        format.html { redirect_to @ref_metum, notice: 'Ref metum was successfully updated.' }
        format.json { render :show, status: :ok, location: @ref_metum }
      else
        format.html { render :edit }
        format.json { render json: @ref_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_meta/1
  # DELETE /ref_meta/1.json
  def destroy
    @ref_metum.destroy
    respond_to do |format|
      format.html { redirect_to ref_meta_url, notice: 'Ref metum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ref_metum
      @ref_metum = RefMetum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ref_metum_params
      params.require(:ref_metum).permit(:ref_id, :ref_attribute_id, :value)
    end
end
