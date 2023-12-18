// Módulo Registrador - Sprint 03
module RegisterFile(input we3, clk, input[7:0] wd3, input[2:0] wa3, input[2:0] ra1, input[2:0] ra2, output reg[7:0] rd1, output reg[7:0] rd2 );	
reg[7:0] registrador[7:0]; // criar 8 registradores de 8 bits
always @(posedge clk) // Escrita
begin
	if(we3==1) // Se o we3 for(1), Habilita a gravação
		registrador[wa3] <= wd3;
		registrador[0] <= 8'b00000000;
end
always @(*) // Leitura
begin
	rd1 <= registrador[ra1];
	rd2 <= registrador[ra2];
end	
endmodule
