class RefsController < ApplicationController
  before_action :set_ref, only: [:edit, :update, :destroy]

  # GET /refs
  # GET /refs.json
  def index
    @refs = Ref.all
  end

  # GET /refs/1
  # GET /refs/1.json
  def show
    @ref = Ref.find_by_slug(params[:id])
    respond_to do |format|
      if @ref
        @meta = @ref.ref_metum
        format.html { render :show }
        format.json { render :show, location: @ref, status: :ok }
      else
        format.html { redirect_to refs_path, notice: 'Tuntamaton lyhytnimi' }
        format.json { render json: {}, status: :unprocessable_entity}
      end
    end
  end

  # GET /refs/new
  def new
    @ref = Ref.new
    @ref.reftype_id = Reftype.first.id
    @types = Reftype.all.select {|type| type.hasFields}
  end

  # GET /refs/1/edit
  def edit
    @types = Reftype.all
  end

  # POST /refs
  # POST /refs.json
  def create
    @ref = Ref.new(ref_params)
    @types = Reftype.all
    respond_to do |format|
      if @ref.save
        format.html { redirect_to @ref, notice: 'Ref was successfully created.' }
        format.json { render :show, status: :created, location: @ref }
      else
        @types = Reftype.all
        format.html { render :new }
        format.json { render json: @ref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refs/1
  # PATCH/PUT /refs/1.json
  def update
    respond_to do |format|
      if @ref.update(ref_params)
        format.html { redirect_to @ref, notice: 'Ref was successfully updated.' }
        format.json { render :show, status: :ok, location: @ref }
      else
        format.html { render :edit }
        format.json { render json: @ref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refs/1
  # DELETE /refs/1.json
  def destroy
    @ref.destroy
    respond_to do |format|
      format.html { redirect_to refs_url, notice: 'Ref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ref
      @ref = Ref.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ref_params
      params.require(:ref).permit(:slug, :reftype_id )
    end
end
