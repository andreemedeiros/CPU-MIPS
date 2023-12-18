//SW 
module SW (input[7:0] RegData, Address, input clk, we, output wren, output reg[7:0] DataOut);
wire a;
wire b;

assign a = (Address== 8'hFF )?1:0;
assign b = a & we;
assign wren = ~a & we;

	always@(posedge clk)
		begin
			if(b == 1)
				DataOut = RegData;
		end
endmodule

