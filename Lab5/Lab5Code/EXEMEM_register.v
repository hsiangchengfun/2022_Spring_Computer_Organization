`timescale 1ns/1ps
module EXEMEM_register (
    input clk_i,
    input rst_i,
    input [31:0] instr_i,
    input [2:0] WB_i,
    input [2:0] Mem_i,
    input zero_i,
    input [31:0] alu_ans_i,
    input [31:0] rtdata_i,
    input [4:0] WBreg_i,
    input [31:0] pc_add4_i,

    output reg [31:0] instr_o,
    output reg [2:0] WB_o,
    output reg [2:0] Mem_o,
    output reg zero_o,
    output reg [31:0] alu_ans_o,
    output reg [31:0] rtdata_o,
    output reg [4:0] WBreg_o,
    output reg [31:0] pc_add4_o
);
/* Write your code HERE */
endmodule
