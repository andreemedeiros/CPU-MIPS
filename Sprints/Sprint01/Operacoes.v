//Módulo com operações de soma, subtração, And e Or.
module somador(input[3:0] a, b, input [1:0]seletor, output reg[3:0]res);
	always @(*) begin
		case(seletor)
			2'b00: res = a + b;
			2'b01: res = a - b;
			2'b10: res = a & b;
			2'b11: res = a | b;
		   default res = 0;
			endcase
		end
endmodule
