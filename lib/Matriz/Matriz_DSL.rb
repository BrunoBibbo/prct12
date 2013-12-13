class MatrizDSL
	

	attr_accessor(:op, :operando, :tipo, :salida)
	
	def initialize(op, &block)
		@op = op
		@operando = []
		@tipo = "dispersa"
		@salida = ""

		instance_eval &block
	end

	def to_s
		
		s = "\n #{@op} \n"

		case @op
			when "Suma" then s << " =#{(@operando[0]+@operando[1]).to_s}\n"
			when "Resta" then s << " =#{(@operando[0]-@operando[1]).to_s}\n"
			when "Multiplicacion" then s << " =#{(@operando[0]*@operando[1]).to_s}\n"
			else output << "No se ha podido realizar la operacion"
		end
		
		case @salida
			when "console" then return s
			when "file"
				then
					File.open('Matriz.txt', 'w') do |i|
						i.puts s
					end
		end
	end

	def option(tp)
		
		case tp
			when "densa","dispersa" then @tipo = tp
			when "console","file" then @salida = tp
		end
	end

	def operand(opr)
		
		l = []
		opr.each {|i| i.each { |j| l << j}}
		
		case tipo
			when "densa" then operando << Matriz_Densa.new(opr.size, opr[0].size, l)
			when "dispersa"
				then
					al = opr.size
					an = opr[0].size
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
								n_e = n_e + 1
							end
						end
					end
					
					operando << Matriz_Dispersa.new(al, an, alt, anc, e, n_e)
		end
	end
end


