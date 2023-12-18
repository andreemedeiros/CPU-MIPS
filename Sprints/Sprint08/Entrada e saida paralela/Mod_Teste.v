`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui ------- 
// Aluno: André K. Escarião de Medeiros, Matrícula: 119210793.
// Sprint 05
// Declaração de fios
wire [31:0] w_inst;
wire [7:0] w_rd1SrcA;
wire [7:0] w_rd2;
wire [7:0] w_SrcB;
wire [7:0] w_ULAResultWd3;
wire [7:0] w_inst_imm;
wire [7:0] w_pc;
wire [7:0] w_pcp;
wire [7:0] w_wd3;
wire [7:0] w_RData;
wire [7:0] w_m1;
wire [7:0] w_nPC;
wire [7:0] w_PCBrach;
wire [7:0] w_DataOut;
wire [7:0] w_We;
wire [7:0] w_Dataln;
wire [7:0] w_RegData;
wire [5:0] w_inst_funct;
wire [2:0] w_ulacontrol;
wire [2:0] w_wa3;
wire w_ulasrc;
wire w_regdst;
wire w_regwrite;
wire w_MemWrite;
wire w_MemtoReg;
wire w_divisorclock;
wire w_PCSrc;
wire w_Jump;
wire w_Branch;
wire w_Z;
// Assigns
//assign LEDG[8] = ~KEY[1];
assign w_pcp = w_pc+1'b1;
assign w_d0x4 = w_pc;
assign w_PCBrach = w_pcp+w_inst[7:0];
assign w_PCSrc = w_Branch&w_Z;
assign LEDR[9]= w_regwrite;
assign LEDR[8]= w_regdst;
assign LEDR[7]= w_ulasrc;
assign LEDR[6:4]= w_ulacontrol;
assign LEDG[8] = w_divisorclock;
assign w_Dataln = SW[7:0];

// Módulo registrador
RegisterFile regist(.clk(w_divisorclock), .we3(w_regwrite), .wd3(w_wd3), .wa3(w_wa3[2:0]), .ra1(w_inst[25:21]), .ra2(w_inst[20:16]), .rd1(w_rd1SrcA[7:0]), .rd2(w_rd2[7:0]), .S0(w_d0x0),.S1(w_d0x1),.S2(w_d0x2),.S3(w_d0x3),.S4(w_d1x0),.S5(w_d1x1),.S6(w_d1x2),.S7(w_d1x3));
// Módulo MUX
MUX mux_1 (.sel(w_ulasrc), .entrada1(w_rd2[7:0]), .entrada2(w_inst[7:0]), .saida(w_SrcB[7:0]));
// Módulo ULA
ULA ula_1 (.ULAControl(w_ulacontrol[2:0]), .SrcA(w_rd1SrcA[7:0]), .SrcB(w_SrcB[7:0]),.Z(w_Z), .ULAResult(w_ULAResultWd3[7:0]));
// Módulo UC
Unidade_Controle UC (.OP(w_inst[31:26]), .Funct(w_inst[5:0]), .ULA_Control(w_ulacontrol[2:0]), .RegWrite(w_regwrite), .RegDst(w_regdst), .Ulasrc(w_ulasrc), .MemWrite(w_MemWrite), .MemtoReg(w_MemtoReg), .Jump(w_Jump), .Branch(w_Branch));
// Módulo R_PC
Registrador_PC PC(.clk(w_divisorclock), .PC_in(w_nPC[7:0]), .PC(w_pc[7:0]));
// Módulo MUX_wr
MUX mux_wr(.sel(w_regdst), .entrada1(w_inst[20:16]), .entrada2(w_inst[15:11]), .saida(w_wa3[2:0]));
// Módulo ROM
RomInstMem Rom_1(.address(w_pc), .clock(CLOCK_50), .q(w_inst));
// Módulo RAM
RamDataMem Ram_1(.address(w_ULAResultWd3), .clock(CLOCK_50), .data(w_rd2), .wren(w_MemWrite), .q(w_RData));
// Módulo MUX 03
MUX mux_DDest (.sel(w_MemtoReg), .entrada1(w_ULAResultWd3[7:0]), .entrada2(w_RegData[7:0]), .saida(w_wd3));
// Divisor Clock
clock clock_1 (.clk(CLOCK_50), .saida(w_divisorclock));
// Módulo MUX PCSrc
MUX mux_PCSrc (.sel(w_PCSrc), .entrada1(w_pcp[7:0]), .entrada2(w_PCBrach[7:0]), .saida(w_m1));
// Módulo MUX Jump
MUX mux_Jump (.sel(w_Jump), .entrada1(w_m1[7:0]), .entrada2(w_inst[7:0]), .saida(w_nPC));
// SW
SW sw(.clk(w_divisorclock), .Address(w_ULAResultWd3), .we(w_MemWrite), .RegData(w_rd2), .DataOut(w_DataOut), .wren(w_We));
// LW
LW lw(.Address(w_ULAResultWd3), .MemData(w_RData), .Dataln(w_Dataln), .RegData(w_RegData));
// Módulo Decodificador
Decodificador dec(.seletor(SW[3:0]), .res(HEX0[0:6]));

endmodule


