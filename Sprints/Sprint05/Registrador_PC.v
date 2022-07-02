// Módulo Registrador PC
module Registrador_PC(input clk, input[7:0] PC_in, output reg[7:0] PC);
always @(posedge clk)
begin
	PC <= PC_in;
end	
endmodule
