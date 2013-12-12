require 'Matriz.rb'


#Pruebas con DSL
describe MatrizDSL do

	before :all do
		@m1 = MatrizDSL.new("Suma"){
			option "densa"
			operand [[1,1],[1,1]]
			operand [[1,1],[1,1]]
			}
		@m2 = MatrizDSL.new("Suma"){
			option "dispersa"
			operand [[1,0],[0,0]]
			operand [[5,0],[0,0]]
			}
		@m3 = MatrizDSL.new("Resta"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m4 = MatrizDSL.new("Resta"){
			option "dispersa"
			operand [[2,0],[0,0]]
			operand [[1,0],[0,0]]
			}
		@m5 = MatrizDSL.new("Multiplicacion"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m6 = MatrizDSL.new("Multiplicacion"){
			option "dispersa"
			operand [[2,0],[0,0]]
			operand [[1,0],[0,0]]
			}
	end


	describe "# Representacion correcta del tipo matriz: " do
		it "Matriz densa" do
			@m1.operando[0].class.should eq(Matriz_Densa)
			@m1.operando[1].class.should eq(Matriz_Densa)
		end
		it "Matriz dispersa" do
			@m2.operando[0].class.should eq(Matriz_Dispersa)
			@m2.operando[1].class.should eq(Matriz_Dispersa)
		end
		it "Matriz densa" do
			@m3.operando[0].class.should eq(Matriz_Densa)
			@m3.operando[1].class.should eq(Matriz_Densa)
		end
		it "Matriz dispersa" do
			@m4.operando[0].class.should eq(Matriz_Dispersa)
			@m4.operando[1].class.should eq(Matriz_Dispersa)
		end
		it "Matriz densa" do
			@m5.operando[0].class.should eq(Matriz_Densa)
			@m5.operando[1].class.should eq(Matriz_Densa)
		end
		it "Matriz dispersa" do
			@m6.operando[0].class.should eq(Matriz_Dispersa)
			@m6.operando[1].class.should eq(Matriz_Dispersa)
		end
	end

	describe "# Correcto funcionamiento del to_s: " do
		it "Suma densa" do
			@m1.to_s.should eq( "\n Suma \n =[[2,2][2,2]]\n")		
		end
		it "Matriz Suma" do
			@m2.to_s.should eq( "\n Suma \n =[[6,0][0,0]]\n")
		end
		it "Matriz Resta" do
			@m3.to_s.should eq("\n Resta \n =[[-4,-4][-4,-4]]\n")
		end
		it "Matriz Resta" do
			@m4.to_s.should eq( "\n Resta \n =[[1,0][0,0]]\n")
		end
		it "Matriz Multiplicacion" do
			@m5.to_s.should eq( "\n Multiplicacion \n =[[19,22][43,50]]\n")
		end
		it "Matriz Multiplicacion" do
			@m6.to_s.should eq("\n Multiplicacion \n =[[2,0][0,0]]\n")
		end
	end
end

#Matrices con enteros

#Crea un grupo de pruebas
   describe "Operaciones con enteros" do
    before :all do
      # Crear matrices
      @m1 = Matriz_Densa.new(2, 2,[1,2,7,3])
      @m2 = Matriz_Densa.new(2, 2,[3,4,1,2])

    end

    # @m3 es la matriz resultado 
    it "Deben poder sumarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[4,6,8,5])

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[-2,-2,6,1])

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[5,8,24,34])

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[1,2,7,3])

      @m1.should eq(@m3)
    end
  end





# Matrices con Fracciones




  describe "Operaciones con matrices densas con fracciones" do
    before :all do
      # Crear matrices
      @m1 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
      @m2 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])

    end

    # @m3 es la matriz resultado

    it "Deben poder sumarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(1,1),Fraccion.new(4,3),Fraccion.new(3,2),Fraccion.new(8,5)])

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(0,1),Fraccion.new(0,1),Fraccion.new(0,1),Fraccion.new(0,1)])

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(3,4),Fraccion.new(13,15),Fraccion.new(39,40),Fraccion.new(57,50)])

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])

      @m1.should eq(@m3)
    end
  end



#Operaciones entre Densas y dispersas



  describe"Operaciones entre dispersa y densa" do
	before :all do
	#Crear matrices
        @m1 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
        @m2 = Matriz_Densa.new(2, 2,[1,2,3,4]) 
	@md1 = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
	@md2 = Matriz_Dispersa.new(2,2,[0],[0],[5],1)
        @md3 = Matriz_Dispersa.new(2,2,[1],[1],[Fraccion.new(1,2)],1)
	@md4 = Matriz_Dispersa.new(2,2,[0],[0],[Fraccion.new(2,5)],1)
	end
	
	#@m3 es la matriz resultado


	it "Deben poder sumarse 2 matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[1,2,3,11])

	(@md1+@m2).should eq(@m3)
	end

	it "Deben poder sumarse 2 matrices dispersas fraccion y densas enteras" do
	@m3 = Matriz_Densa.new(2,2,[1,2,3,9/2])

	(@md3+@m2).should eq(@m3)
	end

	it "Deben poder restarse matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[1,2,3,-3])

	(@md1-@m2).should eq(@m3)
	end

	it "Deben poder multiplicarse matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[0,14,0,28])

	(@md1+@m2).should eq(@m3)
	end
end
	



	#Maximos y Minimos



  describe " Maximos y Minimos" do
	before :all do
	#Crear matrices
        @m1 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
        @m2 = Matriz_Densa.new(2, 2,[1,2,3,4]) 
	@md1 = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
        @md3 = Matriz_Dispersa.new(2,2,[1],[1],[Fraccion.new(1,2)],1)

	end

#Maximos

	it "Maximo densas entera"do
	@m2.max.should eq(4)
	
	end	
	it "Maximo densas fraccion"do
	@m1.max.should eq(1/2)
	
	end
	it "Maximo dispersa entera"do
	@md1.max.should eq(7)
	
	end
	it "Maximo dispersa fraccion"do
	@md3.max.should eq(2/5)
	end
#Minimos
	
	it "Minimo densas entera"do
	@m2.min.should eq(1)
	
	end	


	it "Minimo dispersa entera"do
	@md1.min.should eq(7)
	
	end


  end
  
  describe "Probando metodo encontrar" do
    before :all do
      #Encontrando un número en la matriz.
      @m = Matriz_Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
    end
    
    it "Encontrar el primero en devolver un resultado mayor o igual a 16" do
    @m.encontrar{|value| value*value >= 16}
    end
  end
  

