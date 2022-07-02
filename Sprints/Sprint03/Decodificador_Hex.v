// Módulo Decodificador hexadecimal
module Decodificador(input[0:3] seletor, output reg[0:6] res);
	always @(*) begin
		case(seletor)
			4'b0000: res = 7'b0000001;
			4'b0001: res = 7'b1111001;
			4'b0010: res = 7'b0100100;
			4'b0011: res = 7'b0110000;
		   4'b0100: res = 7'b0011001;
			4'b0101: res = 7'b0010010;
			4'b0110: res = 7'b0110010;
			4'b0111: res = 7'b1111000;
			4'b1000: res = 7'b0000000;
			4'b1001: res = 7'b0010000;
			4'b1010: res = 7'b0001000;
			4'b1011: res = 7'b1100000;
			4'b1100: res = 7'b0110001;
			4'b1101: res = 7'b1000010;
			4'b1110: res = 7'b0110000;
			default res = 7'b0111000;
		endcase
	end
endmodule
