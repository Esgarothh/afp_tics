class MainController < ApplicationController

  def index
    @Usuario = Usuario.all
    if params[:num] != nil
      @auxiliar = params[:num].to_i*2
    else
      @auxiliar = params[:num]
  end
end

  def create
    @auxiliar = params[:nombre]
  end 




end
