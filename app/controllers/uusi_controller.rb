class UusiController < ApplicationController
  #before_action :set_ref_metum, only: [:article]

  def new
    @type = Reftype.where(name:(params[:type]))
    respond_to do |format|
      if @type[0]
        @Ref = Ref.new
        @requiredIds = @type[0].requiredFieldsIds
        @optional = @type[0].optionalFieldsIds
        @cat2 = @type[0].requiredFields2Ids
        @cat3 = @type[0].requiredFields3Ids
        @type[0].requiredFields.each do |field|
          @Ref.ref_metum.new(:ref_attribute_id => field.id)
        end
        @type[0].required2Fields.each do |field|
          @Ref.ref_metum.new(:ref_attribute_id => field.id)
        end
        @type[0].required3Fields.each do |field|
          @Ref.ref_metum.new(:ref_attribute_id => field.id)
        end
        @type[0].optionalFields.each do |field|
          @Ref.ref_metum.new(:ref_attribute_id => field.id)
        end
        format.html { render 'new' }
      else
        format.html { redirect_to refs_path, notice: 'Tuntamaton tyyppi' }
      end
    end

  end

  def create

      @Ref = Ref.new(params.require(:ref).permit(:slug,:reftype_id))

      metas = params.require(:ref).permit!
      metas = metas['ref_metum']
      test = []
      kaksi = []
      metas.each do |m|
        test.push(m['ref_attribute_id'].to_i) unless m['value'].length.zero?
        kaksi.push(m['ref_attribute_id'])
      end
      c = @Ref.reftype.requiredFieldsIds - test
      c2 = @Ref.reftype.requiredFields2Ids - test
      c3 = @Ref.reftype.requiredFields3Ids - test
      @type = Reftype.where(id:@Ref.reftype_id)
      @requiredIds = @type[0].requiredFieldsIds
      @optional = @type[0].optionalFieldsIds
      @cat2 = @type[0].requiredFields2Ids
      @cat3 = @type[0].requiredFields3Ids
      if not@Ref.valid?

        metas.each do |data |
          @Ref.ref_metum.new(ref_attribute_id:data['ref_attribute_id'],ref_id:@Ref.id,value:data['value'])
        end
        render 'new', notice: 'Viitteestä puuttuu pakollisia tietoja.'
      elsif c.length.zero? and c2.length <=1 and c3.length <=1
        @Ref.save!
        metas.each do |m|
          RefMetum.create!(ref_id:@Ref.id,ref_attribute_id:m['ref_attribute_id'],value:m['value']) unless m['value'].length.zero?
        end
        redirect_to refs_path, notice: 'Viite lisätty onnistuneesti.'
      else
        metas.each do |data |
          @Ref.ref_metum.new(ref_attribute_id:data['ref_attribute_id'],ref_id:@Ref.id,value:data['value'])
        end
        @Ref.errors.add(:ref_metum, 'Pakollisia kenttiä ei ole täytetty')
        render 'new' , notice: 'Pakollista tietoa puuttuu..'
      end
  end
  end

  def ref_params
    params.require(:ref).permit!
  end
  def yolo

end
