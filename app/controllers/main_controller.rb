class MainController < ApplicationController

def index

    @tasaInteres = 0.0366
    @probabilidadMortalidad = 0.5
    @sumador = 0 

    if params[:nombre] != nil
      @nombre = params[:nombre]
      @sueldo= params[:Edad3].to_i
      @edadJub = params[:edadJub]  #edad que piensa jubilar
      @edad = params[:edad].to_i   #edad que tiene
      @fondoPension = params[:fondoP]
      @mesesCotiza = params[:Mcotiza] #Meses que cotiza
      @perA = params[:interA]   #sueldo entre 18 y 35
      @perB = params[:interB]   #sueldo entre 35 y 55
      @perC = params[:interC]   #sueldo entre 55 y 65
      @fondoAPes = params[:fondoPerA]
      @fondoBPes = params[:fondoPerB]
      @fondoCPes = params[:fondoPerC]
      @fondoAOpti = params[:fondoPerA]
      @fondoBOpti = params[:fondoPerB]
      @fondoCOpti = params[:fondoPerC]
      @fondoAEspe = params[:fondoPerA]
      @fondoBEspe = params[:fondoPerB]
      @fondoCEspe = params[:fondoPerC]


      #EDAD MAXIMA 40 AÑOS
      #OPTIMI
      #A=6,52%, B=6,58%, C=7,35%, D=4,14 E=4.11%
      if params[:fondoPerA]== 'A' #9.81 VOLATILIDAD
        @fondoAEspe = 6.52
        @fondoAPes  = 5.868
        @fondoAOpti = 6.52 
      if params[:fondoPerB]== 'B' #6.84 VOLATILIDAD
        @fondoBEspe = 6.58
        @fondoBPes  = 6.13
        @fondoBOpti = 6.58
      if params[:fondoPerC]== 'C' #4.63 VOLATILIDAD
        @fondoCEspe = 7.35
        @fondoCPes  = 7.0096
        @fondoCOpti = 7.35
      if params[:fondoPerD]== 'D' #9.81 VOLATILIDAD
        @fondoDEspe = 4.14
        @fondoDPes  = 
        @fondoDOpti = 4.14
      if params[:fondoPerE]== 'E' 
        @fondoEEspe = 4.11
        @fondoEPes  = 
        @fondoEOpti = 4.11

        (cuota*renta)*12 == (cuota*12)*renta 

      if params[:ahorroprevio] == nil || params[:ahorroprevio] == 0
        @ahorroPrevio = 0
      else
        @ahorroPrevio = params[:ahorroprevio]




      #entre 18 y 35 años

        
         
      
      #entre x edad y 35 
      #


     
    else
      @auxiliar = params[:num]
  end
    
end

def mesesPeriodo(lim,edad)
    return (lim-edad)*@mesesCotiza
end


def plataTotal 

  total = 0
  cuota= 0
  aux = 0
  #entre 18 y 35 PERIODO A
  if @edad < 35
    cuota = @perA*mesesPeriodo(35,@edad)
  else @edad >35 && @edad<55     45
    aux = 204*0.01*@interA*fondoPerA
    cuota = @perA*mesesPeriodo(35,@edad)
  else @edad >35 && @edad<55
    cuota = @perA*mesesPeriodo(35,@edad)
  


  return total



def pagina2
  if request.post?
      redirect_to pablo_path
  end
    
end
  




end
