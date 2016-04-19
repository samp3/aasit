class BibtexifiesController < ApplicationController
  def download
    @refs = Ref.all
    response.headers["Content-Type"] = 'application/x-bibtex'
    response.headers["Content-Disposition"] = ' attachment; filename=sig.bib'
    render 'bibtex',:layout => false
  end
end
