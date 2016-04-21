class BibtexifiesController < ApplicationController
  def download
     #@refs = []
     #Ref.all.each do |ref|
     #  if ref.requiredFields?
     #    @refs.append(ref)
     #  end
     #end
    #Otetaan vain ne viitteet joiden pakolliset kentät on asetettu
    

    response.headers["Content-Type"] = 'application/x-bibtex'
    response.headers["Content-Disposition"] = ' attachment; filename=sigproc.bib'
    render 'bibtex',:layout => false
  end
end
