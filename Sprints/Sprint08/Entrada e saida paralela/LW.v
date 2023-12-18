//LW
module LW (input[7:0] Address, MemData, Dataln, output reg[7:0] RegData);
	always@(*)
		begin
			if(Address == 8'hFF )
				RegData[7:0] = Dataln[7:0];
			else
				RegData[7:0] = MemData[7:0];
		end
endmodule

/*

module LW (input [7:0]Address, MemData, Dataln, output reg[7:0] RegData);
	wire selecao;
	assign sel= (Address== 8'hFF )?1:0;
	always@(*)
		begin
			if(selecao == 1)
				RegData[7:0] = Dataln{7:0};
			else
				RegData{7:0} = MemData[7:0]};
		end
endmodule
*/