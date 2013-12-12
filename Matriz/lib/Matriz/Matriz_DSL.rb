class MatrizDSL
	include Enumerable
	attr_accessor(:op, :operando, :tipo, :salida)
	
	def initialize(op, &block)
		puts "INITIALIZEEEEEEEEEEEEEEEEEEEEEEEEEEE"
		@op = op
		@operando = []
		@tipo = "densa"
		@salida = ""

		instance_eval &block

		puts "ESTOY EN EL INITIALIZE"
		puts @op
		puts @operando[0]
		puts @tipo
		puts @salida
	end

	def to_s
		output = "\n #{@op} \n"
		output << "\n #{'=' * @op.size}\n"

		op.each_with_index do |oper, i|
			output << "#{i + 1}. #{oper}\n"
		end

		case @op
			when "Suma" then output << " =#{(@operando[0]+@operando[1]).to_s}\n"
			when "Resta" then output << " =#{(@operando[0]-@operando[1]).to_s}\n"
			when "Multiplicacion" then output << " =#{(@operando[0]*@operando[1]).to_s}\n"
			else output << "No se ha podido realizar la operacion"
		end

		output
	end

	def option(tp)
		puts "entra en option"
		case tp
			when "densa","dispersa" then @tipo = tp
			when "console","file" then @salida = tp
		end
	end

	def operand(opr)
		puts "Entra en operand"
		l = []
		opr.each {|i| i.each { |j| l << j}}
		puts "sigue despues del bucle"
		case tipo
			when "densa" then operando << Matriz_Densa.new(opr.size, opr[0].size, l)
			when "dispersa"
				then
					al = opr.size
					an = opr.size[0]
					alt = []
					anc = []
					e = []
					n_e = 0
					for i in 0...opr.size
						for j in 0...opr[0].size
							if opr[i][j] != 0
								alt << i
								anc << j
								e << opr[i][j]
								n_e + 1
							end
						end
					end
					operando << Matriz_Dispersa.new(al, an, alt, anc, e, n_e)
		end
	end
end


