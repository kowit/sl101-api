class ApplicationController < ActionController::API

  def is_promoter_signed_in?
    if (session[:current_promoter_id])
      @promoter = Promoter.find_by(id: session[:current_promoter_id])
    end
  end

end
