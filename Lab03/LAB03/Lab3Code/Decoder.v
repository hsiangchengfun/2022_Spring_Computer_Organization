`timescale 1ns/1ps

module Decoder(
	input	[32-1:0] 	instr_i,
	output wire			ALUSrc,
	output wire			RegWrite,
	output wire			Branch,
	output wire [2-1:0]	ALUOp
	);
	
//Internal Signals
wire	[7-1:0]		opcode;
wire 	[3-1:0]		funct3;
wire	[3-1:0]		Instr_field;
wire	[9-1:0]		Ctrl_o;

/* Write your code HERE */

assign opcode = instr_i[6:0];
assign funct3 = instr_i[14:12];
assign RegWrite = (opcode[6:4] == 3'b010)? 0 : 1;

assign ALUOp = (opcode[6:4] != 3'b011) ? 2'b00 : (funct3 != 3'b000 && funct3 != 3'b010 && funct3 != 3'b111 & funct3!= 3'b110)?2'b11 :2'b10;

assign Branch = (opcode[6:4]==3'b110)? 1 : 0;



endmodule





                    
                    
