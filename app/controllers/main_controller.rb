class MainController < ApplicationController

def index
    if params[:num] != nil
      @auxiliar = params[:num].to_i*2
    else
      @auxiliar = params[:num]
  end
    
end

def create
    @usuario = Usuario.new(params:[nombre])
    
      redirect_to pablo_index_path
  
end
  




end
