`timescale 1ns/1ps

// module Decoder(
//     input [32-1:0]  instr_i,
//     output reg         Branch,
//     output reg         ALUSrc,
//     output reg         RegWrite,
//     output reg [2-1:0] ALUOp,
//     output reg         MemRead,
//     output reg         MemWrite,
//     output reg         MemtoReg,
//     output reg         Jump
// );


// module Decoder(
//     input [32-1:0]  instr_i,
//     output          Branch,
//     output          ALUSrc,
//     output          RegWrite,
//     output  [2-1:0] ALUOp,
//     output          MemRead,
//     output          MemWrite,
//     output          MemtoReg,
//     output          Jump
// );

module Decoder(
    input   [7-1:0]     instr_i,
    output              RegWrite,
    output              Branch,
    output              Jump,
    output              MemtoReg,
    output              MemRead,
    output              MemWrite,
    output              ALUSrc,
    output  [2-1:0]     ALUOp
);



//Internal Signals
wire    [7-1:0]     opcode;
wire    [3-1:0]     funct3;
wire    [3-1:0]     Instr_field;
wire    [9:0]       Ctrl_o;

/* Write your code HERE */

assign opcode = instr_i[7-1:0];
assign funct3 = opcode[14:12];


assign RegWrite = (opcode[5:3] == 3'b100)? 0 : 1 ;
// except for sw beq
assign Branch = (opcode[6:2] == 5'b11000)? 1 : 0 ;
// branch
assign Jump = instr_i[2];
// jal or jalr
// assign WriteBack0 = (opcode[6:4] == 3'b011 || opcode[6:4] == 3'b001)? 0 : 1;
// Rtype or addi use result  directly
// assign WriteBack1 = instr_i[2];
// only jal or jalr need 
assign MemtoReg = (opcode[6:4] == 3'b000 ||  opcode[3:2] == 2'b01 )? 1 : 0 ;
//only lw and jalr
assign MemRead = (opcode[6:4] == 3'b000)? 1 : 0 ;
// only lw
assign MemWrite = (opcode[6:4] == 3'b010)? 1 : 0 ;
// only sw
// assign ALUSrcA = ( opcode[3:2] == 2'b01 )? 1 : 0 ;
// only jalr need choose 1 (use src1 + imme)
assign ALUSrc = (opcode[6:4] == 3'b000 || opcode[6:4] == 3'b001 || opcode[6:4] == 3'b010 )? 1 : 0 ;
// only addi or lw or sw take imme
assign ALUOp[1:0] = (opcode[6:4] == 3'b110)? 2'b01 : (opcode[6:4] == 3'b011)? 2'b10 : (opcode[6:4] == 3'b001)? 2'b11 : 2'b00 ;
// r-type => 10 ; branch => 01 ; lw/sw => 00 ; addi => 11













endmodule







