class MainController < ApplicationController

  print "cat"
  def index

    @tasaInteres = 0.0366
    @probabilidadMortalidad = 0.5
    @sum  ,dor = 0 
    @hombre= [0.005272,0.000265,0.000224,0.000195,0.000143,0.000114,0.000107,0.000101,0.000094,0.000086,0.000082,0.000088,0.000112,0.000159,0.000225,0.000323,0.0004,0.000472,0.000536,0.000592,0.000638,0.000693,0.000734,0.000758,0.000769,0.000766,0.000775,0.000786,0.000803,0.000824, 0.00084,0.000865,0.000898,0.000939,0.00099,0.001043,0.001105,0.001168,0.001228,0.00129,0.001343,0.001423,0.001519,0.001637,0.001772,0.001913,0.002077,0.002248,0.002423,0.002607,0.00283,0.003066,0.00322,0.003497,0.003865,0.004324,0.004802,0.00531,0.00586,0.006459,0.007257,0.007944,0.008648,0.009381,0.010193,0.011326,0.012512,0.013921,0.015529,0.017303,0.019262,0.021378,0.023734,0.026382,0.029347,0.033193,0.036801,0.040665,0.044793,0.049236,0.054738,0.06014,0.066149,0.07286,0.080362,0.089809,0.099203,0.109556,0.120878,0.133153,0.148122,0.162335,0.17733,0.193004,0.209241,0.228357,0.246708,0.265831,0.285677,0.306189,0.331257,0.353154,0.375498,0.398199,0.421163,0.444289,0.467475,0.490618,0.513616,0.536368,1]
    @mujer = [0.00523477,0.00034512,0.00025995,0.00017628,0.00016557,0.00013647,0.00012549,0.00011668,0.00010977,0.00010448,0.00010517,0.00010854,0.00012108,0.00014434,0.00017483,0.00021791,0.00025208,0.000277,0.00028826,0.0002895,0.0002863,0.00028873,0.00029155,0.00029596,0.00030215,0.00030358,0.00031098,0.00032282,0.00034039,0.00036272,0.00038059,0.00040783,0.00043479,0.00046033,0.00048616,0.00051675,0.00055158,0.00059219,0.00063967,0.00069405,0.00076311,0.00083184,0.00090659,0.00098724,0.00107526,0.0011909,0.00130217,0.00142457,0.00155885,0.00174592,0.00191112,0.00207476,0.00222752,0.00237838,0.00254093,0.00276324,0.00302323,0.00332899,0.00368061,0.00407777,0.00459886,0.005096,0.00564105,0.00623625,0.00688529,0.0075899,0.00836155,0.00920353,0.01012261,0.01112687,0.01216685,0.01337057,0.01470343,0.01619245,0.01787229,0.01993901,0.02214868,0.02469148,0.02761851,0.03097818,0.03539995,0.03981977,0.04478628,0.05031589,0.05641381,0.06410556,0.0714269,0.07927079,0.08759623,0.09635217,0.10719734,0.11678025,0.12659571,0.13656358,0.14660022,0.15965745,0.17222797,0.18763356,0.20690049,0.22456541,0.24742439,0.2679763,0.28988479,0.31317346,0.3378526,0.36391633,0.3913397,0.42007559,0.45005167,0.48116749,1]
   
    if params[:nombre] != nil
      @nombre = params[:nombre]
      @sueldo= params[:Edad3].to_f
      @edadJub = params[:edadJub].to_f  #edad que piensa jubilar
      @edad = params[:Edad].to_f   #edad que tiene
      @T = 110-@edadJub
      @fondoPension = params[:fondoP]
      @mesesCotiza = params[:Mcotiza].to_f #Meses que cotiza
      @ahorrosPrevios = params[:ahorrado].to_f 
      @perA = params[:InterA].to_f    #sueldo entre 18 y 35
      @perB = params[:InterB].to_f    #sueldo entre 35 y 55
      @perC = params[:InterC].to_f    #sueldo entre 55 y 65
      #@fondoAPes = params[:fondoPerA]
      #@fondoBPes = params[:fondoPerB]
      #@fondoCPes = params[:fondoPerC]
      #@fondoAOpti = params[:fondoPerA]
      #@fondoBOpti = params[:fondoPerB]
      #@fondoCOpti = params[:fondoPerC]
      #@fondoAEspe = params[:fondoPerA]
      #@fondoBEspe = params[:fondoPerB]
      #@fondoCEspe = params[:fondoPerC]
      if params[:genero] == "Masculino"
        @male = @hombre
      else
        @male = @mujer
      end
    
    
      #EDAD MAXIMA 40 AÑOS
      #OPTIMI
      #A=6,52%, B=6,58%, C=7,35%, D=4,14 E=4.11
      @devEstA = 0.0783    #5.22% -> 7.99%
      @devEstB = 0.0256
      @devEstC = 0.0073
      @devEstD = 0.0064
      @devEstE = 0.0019
      @RentaA = 1.0502
      @RentaB = 1.046
      @RentaC = 1.0404
      @RentaD = 1.0356
      @RentaE = 1.0313


      if params[:experto] == 'Si'
        @RentaA = 1+params[:RentA].to_f/100
        @RentaB = 1+params[:RentB].to_f/100     
        @RentaC = 1+params[:RentC].to_f/100
        @RentaD = 1+params[:RentD].to_f/100
        @RentaE = 1+params[:RentE].to_f/100
        print @RentaA
      end


      if params[:fondoPerA]== "A" #5.22 desv7.83%
        @fondo1Espe = @RentaA
        @fondo1Pes  = @fondo1Espe*(1-@devEstA)
        @fondo1Opti = @fondo1Espe*(1+@devEstA)
      
      elsif params[:fondoPerA]== 'B' #4.6 desv5.56%
        @fondo1Espe =@RentaB
        @fondo1Pes  = @fondo1Espe*(1-@devEstB)
        @fondo1Opti = @fondo1Espe*(1+@devEstB)
      
      elsif params[:fondoPerA]== 'C' #4.04 desv3.73%
        @fondo1Espe = @RentaC
        @fondo1Pes  = @fondo1Espe*(1-@devEstC)
        @fondo1Opti = @fondo1Espe*(1+@devEstC)
      
      elsif params[:fondoPerA]== 'D' #3.56 desv2.64%
        @fondo1Espe = @RentaD
        @fondo1Pes  = @fondo1Espe*(1-@devEstD)
        @fondo1Opti = @fondo1Espe*(1+@devEstD)
      
      elsif params[:fondoPerA]== 'E'  #3.13 desv2.19%
        @fondo1Espe = @RentaE
        @fondo1Pes  = @fondo1Espe*(1-@devEstE)
        @fondo1Opti = @fondo1Espe*(1+@devEstE)
      else
      end
      if params[:fondoPerB]== 'A' #9.81 VOLATILIDAD
        @fondo2Espe = @RentaA
        @fondo2Pes  = @fondo2Espe*(1-@devEstA)
        @fondo2Opti = @fondo2Espe*(1+@devEstA)
      elsif params[:fondoPerB]== 'B' #6.84 VOLATILIDAD
        @fondo2Espe = @RentaB
        @fondo2Pes  = @fondo2Espe*(1-@devEstB)
        @fondo2Opti = @fondo2Espe*(1+@devEstB)
      elsif params[:fondoPerB]== 'C' #4.63 VOLATILIDAD
        @fondo2Espe =  @RentaC
        @fondo2Pes  = @fondo2Espe*(1-@devEstC)
        @fondo2Opti = @fondo2Espe*(1+@devEstC)
      elsif params[:fondoPerB]== 'D' #9.81 VOLATILIDAD
        @fondo2Espe =  @RentaD
        @fondo2Pes  = @fondo2Espe*(1-@devEstD)
        @fondo2Opti = @fondo2Espe*(1+@devEstD)
      elsif params[:fondoPerB]== 'E' 
        @fondo2Espe =  @RentaE
        @fondo2Pes  = @fondo2Espe*(1-@devEstE)
        @fondo2Opti = @fondo2Espe*(1+@devEstE)
      else
      end
      if params[:fondoPerC]== 'A' #9.81 VOLATILIDAD
        @fondo3Espe =  @RentaA
        @fondo3Pes  = @fondo3Espe*(1-@devEstA)
        @fondo3Opti = @fondo3Espe*(1+@devEstA)
      elsif params[:fondoPerC]== 'B' #6.84 VOLATILIDAD
        @fondo3Espe = @RentaB
        @fondo3Pes  = @fondo3Espe*(1-@devEstB)
        @fondo3Opti = @fondo3Espe*(1+@devEstB)
      elsif params[:fondoPerC]== 'C' #4.63 VOLATILIDAD
        @fondo3Espe =  @RentaC
        @fondo3Pes  = @fondo3Espe*(1-@devEstC)
        @fondo3Opti = @fondo3Espe*(1+@devEstC)
      elsif params[:fondoPerC]== 'D' #9.81 VOLATILIDAD
        @fondo3Espe =  @RentaD
        @fondo3Pes  = @fondo3Espe*(1-@devEstD)
        @fondo3Opti = @fondo3Espe*(1+@devEstD)
      elsif params[:fondoPerC]== 'E' 
        @fondo3Espe =  @RentaE
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

      @ahorradoTotalIdeal= params[:pIdeal].to_i*(@cnu*12) #plata ahorrada total para ese sueldo
      @diferencia = @ahorradoTotalIdeal-@ahorradoEsperado  #plata necesaria de conseguir con APV

      @apvNecesaria = plataTotalInversa

      @sueldoEsperadoSinCnu = @ahorrado
      @sueldoEsperado = @ahorradoEsperado/(@cnu*12)
      @sueldoPesimista = @ahorradoPesimista/(@cnu*12)
      @sueldoOptimista = @ahorradoOptimista/(@cnu*12)

      
      
    end
      #entre 18 y 35 año
  end
         
      #entre x edad y 35 

  def meses(lim,edad)
    return (lim-edad)*@mesesCotiza
  end


  def plataTotalEsperado

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
  anos = 0
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*@mesesCotiza)*@fondo1Espe #crece 5.2% al año
        aux+=1
        anos+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*@mesesCotiza)*@fondo2Espe
        aux+=1
        anos+=1
      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*@mesesCotiza)*@fondo3Espe
        aux+=1
        anos+=1
      end
      aux=0
    print "anos:",anos
    return cuota1
  end

def plataTotalPesimista

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
  
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*@mesesCotiza)*@fondo1Pes #crece 5.2% al año
        aux+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*@mesesCotiza)*@fondo2Pes
        aux+=1

      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*@mesesCotiza)*@fondo3Pes
        aux+=1
      end
      aux=0

    return cuota1
  end

  def plataTotalOptimista

  cuota1 = @ahorrosPrevios
  aux = 0
  aux2 = 0
      print "cuota1:",cuota1,"\n"
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 + @perA*0.1*@mesesCotiza)*@fondo1Opti #crece 5.2% al año

        aux+=1
      end
      aux= 0
      print "cuota1:",cuota1,"\n"
        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @perB*0.1*@mesesCotiza)*@fondo2Opti
        aux+=1

      end
      aux=0
    print "cuota1:",cuota1,"\n"
        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @perC*0.1*@mesesCotiza)*@fondo3Opti
        aux+=1
        print "-",@fondo3Opti,"-"
      end
      aux=0
    print "cuota1:",cuota1,"\n"
    return cuota1
  end


  def pagina
    if request.post?
        redirect_to pablo_path
    end
  end
end

def plataTotalInversa

  cuota1 = 0
  @apvMensual = 0
  @rentaAPV = 1.07
  while cuota1<@diferencia
  @apvMensual += 5000
  cuota1 = 0
  aux = 0
  aux2 = 0
      while aux < 35-@edad     #20 a 35 recorrido = 15
        cuota1 = (cuota1 +@apvMensual*@mesesCotiza)*@fondo1Espe #crece 5.2% al año
        aux+=1
      end
      aux= 0

        if @edad >35 && @edad<55 
          aux2 = @edad
        else
          aux2 = 35
        end

      while aux < 55-aux2   # 20 A 0   del 35 al 55 || edad al 55
        cuota1 = (cuota1 + @apvMensual*@mesesCotiza)*@fondo2Espe
        aux+=1

      end
      aux=0

        if @edad >55 && @edad<@edadJub 
          aux2 = @edad
        else
          aux2 = 55
        end

      while aux <@edadJub-aux2
        cuota1 = (cuota1 + @apvMensual*@mesesCotiza)*@fondo3Espe
        aux+=1
      end
      aux=0
      print "--",@apvMensual,"--"
  end



    return @apvMensual
  end

