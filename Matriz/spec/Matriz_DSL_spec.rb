require 'Matriz.rb'

describe MatrizDSL do

	before :all do
		@m1 = MatrizDSL.new("Suma"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m2 = MatrizDSL.new("Suma"){
			option "ddispersa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m3 = MatrizDSL.new("Resta"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m4 = MatrizDSL.new("Resta"){
			option "dispersa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m5 = MatrizDSL.new("Multiplicacion"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
		@m6 = MatrizDSL.new("Multiplicacion"){
			option "dispersa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
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
	end
end
