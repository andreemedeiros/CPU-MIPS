//  Módulo divisor de Clock
module clock (input clk, output reg saida);
	reg[27:0] contador;
	initial contador = 0;
	
	always @(posedge clk)
		begin contador <= contador + 29'd1;
		if (contador >= 5000000/2)
			begin contador <= 29'd0;
			saida = ~saida;
		end
	end
endmodule
