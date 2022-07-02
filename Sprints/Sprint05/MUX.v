// Módulo MUX 
module MUX (input sel, input[7:0] entrada1, entrada2, output reg[7:0] saida);
	always@(*)
		begin
			if(sel == 0)
				saida = entrada1;
			else
				saida = entrada2;
		end
endmodule
