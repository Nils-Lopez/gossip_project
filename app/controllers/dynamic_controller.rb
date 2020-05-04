class DynamicController < ApplicationController
  def gossip
  	@id = params[:id]
  end

  def user
  	@id = params[:id]
  end

  def welcome
  end
end
