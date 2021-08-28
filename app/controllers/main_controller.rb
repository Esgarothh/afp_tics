class MainController < ApplicationController

  print "cat"
  def index

    @tasaInteres = 0.0366
    @probabilidadMortalidad = 0.5
    @sum  ,dor = 0 
    @male = [0.005272,0.000265,0.000224,0.000195,0.000143,0.000114,0.000107,0.000101,0.000094,0.000086,0.000082,0.000088,0.000112,0.000159,0.000225,0.000323,0.0004,0.000472,0.000536,0.000592,0.000638,0.000693,0.000734,0.000758,0.000769,0.000766,0.000775,0.000786,0.000803,0.000824, 0.00084,0.000865,0.000898,0.000939,0.00099,0.001043,0.001105,0.001168,0.001228,0.00129,0.001343,0.001423,0.001519,0.001637,0.001772,0.001913,0.002077,0.002248,0.002423,0.002607,0.00283,0.003066,0.00322,0.003497,0.003865,0.004324,0.004802,0.00531,0.00586,0.006459,0.007257,0.007944,0.008648,0.009381,0.010193,0.011326,0.012512,0.013921,0.015529,0.017303,0.019262,0.021378,0.023734,0.026382,0.029347,0.033193,0.036801,0.040665,0.044793,0.049236,0.054738,0.06014,0.066149,0.07286,0.080362,0.089809,0.099203,0.109556,0.120878,0.133153,0.148122,0.162335,0.17733,0.193004,0.209241,0.228357,0.246708,0.265831,0.285677,0.306189,0.331257,0.353154,0.375498,0.398199,0.421163,0.444289,0.467475,0.490618,0.513616,0.536368,1]
    @hombre = [0.0013,0.00152,0.0017,0.00208,0.00275,0.00406,0.00608,0.01006,0.01535,0.02403,0.03828,0.05755,0.09171,0.13573,0.17912,0.14649,0.11806]
    if params[:nombre] != nil
      @nombre = params[:nombre]
      @sueldo= params[:Edad3].to_i
      @edadJub = params[:edadJub].to_i   #edad que piensa jubilar
      @edad = params[:Edad].to_i   #edad que tiene
      @T = 110-@edad
      @fondoPension = params[:fondoP]
      @mesesCotiza = params[:Mcotiza].to_i  #Meses que cotiza
      @ahorrosPrevios = params[:ahorrado].to_i 
      @perA = params[:InterA].to_i    #sueldo entre 18 y 35
      @perB = params[:InterB].to_i    #sueldo entre 35 y 55
      @perC = params[:InterC].to_i    #sueldo entre 55 y 65
      #@fondoAPes = params[:fondoPerA]
      #@fondoBPes = params[:fondoPerB]
      #@fondoCPes = params[:fondoPerC]
      #@fondoAOpti = params[:fondoPerA]
      #@fondoBOpti = params[:fondoPerB]
      #@fondoCOpti = params[:fondoPerC]
      #@fondoAEspe = params[:fondoPerA]
      #@fondoBEspe = params[:fondoPerB]
      #@fondoCEspe = params[:fondoPerC]
    
      #EDAD MAXIMA 40 AÑOS
      #OPTIMI
      #A=6,52%, B=6,58%, C=7,35%, D=4,14 E=4.11%
      if params[:fondoPerA]== "A" #9.81 VOLATILIDAD
        @fondo1Espe = 0.722
        @fondo1Pes  = 5.868
        @fondo1Opti = 8
      elsif params[:fondoPerA]== 'B' #6.84 VOLATILIDAD
        @fondo1Espe = 6.58
        @fondo1Pes  = 6.13
        @fondo1Opti = 6.58
      elsif params[:fondoPerA]== 'C' #4.63 VOLATILIDAD
        @fondo1Espe = 7.35
        @fondo1Pes  = 7.0096
        @fondo1Opti = 7.7
      elsif params[:fondoPerA]== 'D' #9.81 VOLATILIDAD
        @fondo1Espe = 4.14
        @fondo1Pes  = 3.9
        @fondo1Opti = 4.5
      elsif params[:fondoPerA]== 'E' 
        @fondo1Espe = 4.11
        @fondo1Pes  = 3.9
        @fondo1Opti = 4.5
      else
      end
      if params[:fondoPerB]== 'A' #9.81 VOLATILIDAD
        @fondo2Espe = 6.52
        @fondo2Pes  = 5.868
        @fondo2Opti = 8
      elsif params[:fondoPerB]== 'B' #6.84 VOLATILIDAD
        @fondo2Espe = 0.56
        @fondo2Pes  = 6.13
        @fondo2Opti = 6.58
      elsif params[:fondoPerB]== 'C' #4.63 VOLATILIDAD
        @fondo2Espe = 7.35
        @fondo2Pes  = 7.0096
        @fondo2Opti = 7.7
      elsif params[:fondoPerB]== 'D' #9.81 VOLATILIDAD
        @fondo2Espe = 4.14
        @fondo2Pes  = 3.9
        @fondo2Opti = 4.5
      elsif params[:fondoPerB]== 'E' 
        @fondo2Espe = 4.11
        @fondo2Pes  = 3.9
        @fondo2Opti = 4.5
      else
      end

      if params[:fondoPerC]== 'A' #9.81 VOLATILIDAD
        @fondo3Espe = 6.52
        @fondo3Pes  = 5.868
        @fondo3Opti = 8
      elsif params[:fondoPerC]== 'B' #6.84 VOLATILIDAD
        @fondo3Espe = 6.58
        @fondo3Pes  = 6.13
        @fondo3Opti = 6.58
      elsif params[:fondoPerC]== 'C' #4.63 VOLATILIDAD
        @fondo3Espe = 0.604
        @fondo3Pes  = 7.0096
        @fondo3Opti = 7.7
      elsif params[:fondoPerC]== 'D' #9.81 VOLATILIDAD
        @fondo3Espe = 4.14
        @fondo3Pes  = 3.9
        @fondo3Opti = 4.5
      elsif params[:fondoPerC]== 'E' 
        @fondo3Espe = 4.11
        @fondo3Pes  = 3.9
        @fondo3Opti = 4.5
      else
      end
      #plata total ahorrada 
      
      @global = 0.00053
      @ahorrado = plataTotal #+ @ahorrosPrevios
      @cnu = 0
      count = 0
      @hombre = [0.00078,0.0013,0.00152,0.0017,0.00208,0.00275,0.00406,0.00628,0.00974,0.01513,0.023069,0.03648,0.05674,0.08578,0.13382,0.20804,0.32390,0.48200]
      while count <= @T
        @cnu = @cnu+ ((1-@male[count])/((1+0.0366)**count))
        print @male[count] , "\n" ,count,"\n"
        count+=1
          
        end
      

      @cnu=@cnu-(0.458)

      @sueldoEsperadoSinCnu = @ahorrado
      @sueldoEsperado = @ahorrado/(@cnu*12)

      

    end
      #entre 18 y 35 año
  end
         
      
      #entre x edad y 35 
      #
  



  def mesesPeriodo(lim,edad)
    return (lim-edad)*@mesesCotiza
  end


  def plataTotal

  total = 0
  cuota = 0
  cuota1= 0
  cuota2 = 0
  cuota3 =0
  aux = 0
  anual = 0
  #entre 18 y 35 PERIODO Ae

    if @edad < 35
       #se ahorra en un año
      while aux < 17
        cuota1 = (cuota1 + @perA*0.1*12)*1.0522 #crece 5.2% al año
        aux+=1
      
      end
      
      print "-",cuota1,"-"
      aux=0
       while aux < 19
        cuota2 = (cuota2 + @perB*0.1*12)*1.046
        aux+=1
      end
      aux=0
       while aux <15
        cuota3 = (cuota3 + @perC*0.1*12)*1.0404
        print "<",cuota3,">"
        aux+=1
      end
      aux=0
    elsif @edad >35 && @edad<55  
      cuota = @perA*0.01*mesesPeriodo(35,18)*@fondo1Espe
      cuota = cuota + @perB*0.01*mesesPeriodo(55,@edad)*@fondo2Espe
      cuota = cuota + @perC*0.01*mesesPeriodo(@edadJub,55)*@fondo3Espe
    elsif @edad >55 && @edad<65
      cuota = @perA*0.01*mesesPeriodo(35,18)*fondo1Espe
      cuota = cuota + @perB*0.01*mesesPeriodo(55,35)*@fondo2Espe
      cuota = cuota + @perC*0.01*mesesPeriodo(@edadJub,@edad)*@fondo3Espe
    else
      cuota=0
    end

    return cuota1+cuota2+cuota3
  end


  def pagina
    if request.post?
        redirect_to pablo_path
    end
  end

end

