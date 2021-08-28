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
      @T = 110-@edadJub
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
      #A=6,52%, B=6,58%, C=7,35%, D=4,14 E=4.11
      @devEstA = 0.0283
      @devEstB = 0.0156
      @devEstC = 0.0073
      @devEstD = 0.0064
      @devEstE = 0.0019
      if params[:fondoPerA]== "A" #5.22 desv7.83%
        @fondo1Espe = 1.0502
        @fondo1Pes  = @fondo1Espe*(1-@devEstA)
        @fondo1Opti = @fondo1Espe*(1+@devEstA)
      
      elsif params[:fondoPerA]== 'B' #4.6 desv5.56%
        @fondo1Espe = 1.046
        @fondo1Pes  = @fondo1Espe*(1-@devEstB)
        @fondo1Opti = @fondo1Espe*(1+@devEstB)
      
      elsif params[:fondoPerA]== 'C' #4.04 desv3.73%
        @fondo1Espe = 1.0404
        @fondo1Pes  = @fondo1Espe*(1-@devEstC)
        @fondo1Opti = @fondo1Espe*(1+@devEstC)
      
      elsif params[:fondoPerA]== 'D' #3.56 desv2.64%
        @fondo1Espe = 1.0356
        @fondo1Pes  = @fondo1Espe*(1-@devEstD)
        @fondo1Opti = @fondo1Espe*(1+@devEstD)
      
      elsif params[:fondoPerA]== 'E'  #3.13 desv2.19%
        @fondo1Espe = 1.0313
        @fondo1Pes  = @fondo1Espe*(1-@devEstE)
        @fondo1Opti = @fondo1Espe*(1+@devEstE)
      else
      end
      if params[:fondoPerB]== 'A' #9.81 VOLATILIDAD
        @fondo2Espe = 1.0522
        @fondo2Pes  = @fondo2Espe*(1-@devEstA)
        @fondo2Opti = @fondo2Espe*(1+@devEstA)
      elsif params[:fondoPerB]== 'B' #6.84 VOLATILIDAD
        @fondo2Espe = 1.046
        @fondo2Pes  = @fondo2Espe*(1-@devEstB)
        @fondo2Opti = @fondo2Espe*(1+@devEstB)
      elsif params[:fondoPerB]== 'C' #4.63 VOLATILIDAD
        @fondo2Espe = 1.0404
        @fondo2Pes  = @fondo2Espe*(1-@devEstC)
        @fondo2Opti = @fondo2Espe*(1+@devEstC)
      elsif params[:fondoPerB]== 'D' #9.81 VOLATILIDAD
        @fondo2Espe = 1.0356
        @fondo2Pes  = @fondo2Espe*(1-@devEstD)
        @fondo2Opti = @fondo2Espe*(1+@devEstD)
      elsif params[:fondoPerB]== 'E' 
        @fondo2Espe = 1.0313
        @fondo2Pes  = @fondo2Espe*(1-@devEstE)
        @fondo2Opti = @fondo2Espe*(1+@devEstE)
      else
      end
      if params[:fondoPerC]== 'A' #9.81 VOLATILIDAD
        @fondo3Espe = 1.0522
        @fondo3Pes  = @fondo3Espe*(1-@devEstA)
        @fondo3Opti = @fondo3Espe*(1+@devEstA)
      elsif params[:fondoPerC]== 'B' #6.84 VOLATILIDAD
        @fondo3Espe = 1.046
        @fondo3Pes  = @fondo3Espe*(1-@devEstB)
        @fondo3Opti = @fondo3Espe*(1+@devEstB)
      elsif params[:fondoPerC]== 'C' #4.63 VOLATILIDAD
        @fondo3Espe = 1.0404
        @fondo3Pes  = @fondo3Espe*(1-@devEstC)
        @fondo3Opti = @fondo3Espe*(1+@devEstC)
      elsif params[:fondoPerC]== 'D' #9.81 VOLATILIDAD
        @fondo3Espe = 1.0356
        @fondo3Pes  = @fondo3Espe*(1-@devEstD)
        @fondo3Opti = @fondo3Espe*(1+@devEstD)
      elsif params[:fondoPerC]== 'E' 
        @fondo3Espe = 1.0313
        @fondo3Pes  = @fondo3Espe*(1-@devEstE)
        @fondo3Opti = @fondo3Espe*(1+@devEstE)
      else
      end
      #plata total ahorrada 
      
      @global = 0.00053
      @cnu = 0
      count = 0
      @hombre = [0.00078,0.0013,0.00152,0.0017,0.00208,0.00275,0.00406,0.00628,0.00974,0.01513,0.023069,0.03648,0.05674,0.08578,0.13382,0.20804,0.32390,0.48200]
      while count <= @T
        @cnu = @cnu+ ((1-@male[@edadJub+count])/((1+0.0366)**count))
        print @male[count] , "\n" ,count,"\n"
        count+=1
          
        end
      

      @cnu=@cnu-(0.458)


      @ahorradoEsperado = plataTotalEsperado #+ @ahorrosPrevios
      @ahorradoOptimista = plataTotalOptimista
      @ahorradoPesimista = plataTotalPesimista

      @sueldoEsperadoSinCnu = @ahorrado
      @sueldoEsperado = @ahorradoEsperado/(@cnu*12)
      @sueldoPesimista = @ahorradoPesimista/(@cnu*12)
      @sueldoOptimista = @ahorradoOptimista/(@cnu*12)

      

    end
      #entre 18 y 35 año
  end
         
      
      #entre x edad y 35 
      #
  



  def mesesPeriodo(lim,edad)
    return (lim-edad)*@mesesCotiza
  end


  def plataTotalEsperado

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
  
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*12)*@fondo1Espe #crece 5.2% al año
        aux+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*12)*@fondo2Espe
        aux+=1

      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*12)*@fondo3Espe
        aux+=1
      end
      aux=0

    return cuota1
  end

def plataTotalPesimista

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
  
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*12)*@fondo1Pes #crece 5.2% al año
        aux+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*12)*@fondo2Pes
        aux+=1

      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*12)*@fondo3Pes
        aux+=1
      end
      aux=0

    return cuota1
  end

  def plataTotalOptimista

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
  
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*12)*@fondo1Opti #crece 5.2% al año

        aux+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*12)*@fondo2Opti
        aux+=1

      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*12)*@fondo3Opti
        aux+=1
        print "-",@fondo3Opti,"-"
      end
      aux=0

    return cuota1
  end


  def pagina
    if request.post?
        redirect_to pablo_path
    end
  end

end

