// Módulo MUX
module MUX (input sel, input[7:0] entrada1, entrada2_const, output reg[7:0] saida);
	always@(*)
		begin
			if(sel == 0)
				saida = entrada1;
			else
				saida = entrada2_const;
		end
endmodule
