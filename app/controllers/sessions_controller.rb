class SessionsController < ApplicationController
  def create
    puts params["email"]
    puts params["password"]
  end
end
