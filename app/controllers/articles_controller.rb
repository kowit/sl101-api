class ArticlesController < ActionController::Base
  def index
    render json: { id: 1, name: "Test Article" }
  end
end
