`timescale 1ns/1ps
module MEMWB_register (
    input clk_i,
    input rst_i,
    input [2:0] WB_i,
    input [31:0] DM_i,
    input [31:0] alu_ans_i,
    input [4:0] WBreg_i,
    input [31:0] pc_add4_i,

    output reg [2:0] WB_o,
    output reg [31:0] DM_o,
    output reg [31:0] alu_ans_o,
    output reg [4:0] WBreg_o,
    output reg [31:0] pc_add4_o
);
/* Write your code HERE */
endmodule
