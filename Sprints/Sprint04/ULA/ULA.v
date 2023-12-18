// Módulo ULA
module ULA( input[2:0] ULAControl, input[7:0] SrcA, SrcB, output reg Z, output reg[7:0] ULAResult);
	always@(*)
	begin
		case(ULAControl)
			3'b000: ULAResult = SrcA & SrcB;
			3'b001: ULAResult = SrcA | SrcB; 
			3'b010: ULAResult = SrcA + SrcB; 
			3'b110: ULAResult = SrcA + (~SrcB +1); 
			3'b111: ULAResult = (SrcA < SrcB)?1:0;
		endcase
		Z = (ULAResult ==0)?1:0;
	end
endmodule
