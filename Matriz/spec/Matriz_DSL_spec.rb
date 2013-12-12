require 'Matriz.rb'

describe MatrizDSL do

	before :all do
		@m1 = MatrizDSL.new("Suma"){
			option "densa"
			operand [[1,2],[3,4]]
			operand [[5,6],[7,8]]
			}
	end
end

describe "# Representacion correcta del tipo matriz: " do
	it "Matriz densa" do
		puts @m1
#		@m1.operando[0].class.should eq(Matriz_Densa)
#		@m1.operando[1].class.should eq(Matriz_Densa)
	end
end
