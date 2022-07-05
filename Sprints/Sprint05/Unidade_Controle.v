//Módulo Unidade de Controle - Decodificador

module Unidade_Controle(input[5:0] OP, Funct, output reg [2:0] ULA_Control, output reg RegWrite, RegDst, Branch, MemWrite, MemtoReg, Jump, Ulasrc);
	always @(*) begin
	case (OP)
		6'b000000:begin
		case(Funct)
			6'b100000: begin RegWrite = 1; RegDst = 1; Ulasrc = 0; ULA_Control = 010; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
			6'b100010: begin RegWrite = 1; RegDst = 1; Ulasrc = 0; ULA_Control = 110; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
			6'b100100: begin RegWrite = 1; RegDst = 1; Ulasrc = 0; ULA_Control = 000; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
			6'b100101: begin RegWrite = 1; RegDst = 1; Ulasrc = 0; ULA_Control = 001; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
		   6'b101010: begin RegWrite = 1; RegDst = 1; Ulasrc = 0; ULA_Control = 111; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
			endcase
			end
		6'b100011: begin RegWrite = 1; RegDst = 0; Ulasrc = 1; ULA_Control = 010; Branch = 0; MemWrite = 0; MemtoReg = 1; Jump = 0; end
		6'b101011: begin RegWrite = 0; RegDst = 0; Ulasrc = 1; ULA_Control = 010; Branch = 0; MemWrite = 1; MemtoReg = 0; Jump = 0; end
		6'b000100: begin RegWrite = 0; RegDst = 0; Ulasrc = 0; ULA_Control = 110; Branch = 1; MemWrite = 0; MemtoReg = 0; Jump = 0; end
		6'b001000: begin RegWrite = 1; RegDst = 0; Ulasrc = 1; ULA_Control = 010; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0; end
		6'b000010: begin RegWrite = 0; RegDst = 0; Ulasrc = 0; ULA_Control = 000; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 1; end
		endcase
		end
endmodule
