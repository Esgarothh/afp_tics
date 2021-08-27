class MainController < ApplicationController

def index

    @tasaInteres = 0.0366
    @probabilidadMortalidad = 0.5
    @sumador = 0 

    if params[:nombre] != nil
      @nombre = params[:nombre]
      @sueldo= params[:Edad3].to_i
      @edadJub = params[:edadJub]

    else
      @auxiliar = params[:num]
  end
    
end

def pagina2
  if request.post?
      redirect_to pablo_path
  end
    
end
  




end
