class RefMetaController < ApplicationController
  before_action :set_ref_metum, only: [:show, :edit, :update, :destroy]


  # GET /ref_meta
  # GET /ref_meta.json
  def index
    @ref_meta = RefMetum.all
    @types = Reftype.all
  end

  # GET /ref_meta/1
  # GET /ref_meta/1.json
  def show

  end

  # GET /ref_meta/new
  def new
    @ref_type = Reftype.find_by_name(params[:reftype_name])
    @ref_metum = RefMetum.new
    @attrs = nil
    @refs = Ref.where(slug:(params[:slug]))
      if @ref_type and @refs[0]
        @attrs =RefAttribute.where(id: @refs[0].reftype.optionalFieldsIds - @refs[0].ref_metum.pluck(:ref_attribute_id))
      else
        respond_to do |format|
          format.html { redirect_to refs_path, notice: 'Viitetyyppin tai viitteen tunnus oli väärä.' }
        end
      end
  end

  # GET /ref_meta/1/edit
  def edit
    @refs = Ref.where("id = :id", {id: @ref_metum.ref_id})
    @attrs = Reftype.find(@refs[0].reftype_id).ref_attributes - @refs[0].ref_attributes

  end

  # POST /ref_meta
  # POST /ref_meta.json
  def create

    @ref_metum = RefMetum.new(ref_metum_params)

    respond_to do |format|
      if @ref_metum.save
        format.html { redirect_to '/refs/'+@ref_metum.ref.slug, notice: 'Viitteeseen lisätty tieto onnistuneesti.' }
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
        format.html { redirect_to '/refs/'+@ref_metum.ref.slug, notice: 'Tiedot päivitettiin onnistuneesti' }
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
    ref = @ref_metum.ref

    @ref_metum.destroy
    respond_to do |format|
      format.html { redirect_to '/refs/'+ref.slug, notice: 'Tieto poistettu onnistuneesti' }
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
