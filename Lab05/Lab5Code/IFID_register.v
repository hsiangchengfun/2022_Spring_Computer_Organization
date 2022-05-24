`timescale 1ns/1ps
module IFID_register (
    input clk_i,
    input rst_i,
    input flush,
    input IFID_write,
    input [31:0] address_i,
    input [31:0] instr_i,
    input [31:0] pc_add4_i,

    output reg [31:0] address_o,
    output reg [31:0] instr_o,
    output reg [31:0] pc_add4_o
);

always@(posedge clk_i)begin
    
    if(~rst_i || flush)begin
        address_o <= 0;
        instr_o <= 32'b00000000000000000000000000010011; // addi x0,x0,0
        pc_add4_o <= 0;
    end
    else if(IFID_write) begin
        address_o <= address_i;
        instr_o <= instr_i;
        pc_add4_o <= pc_add4_i;
    end
    else begin
        address_o <= 32'b0;
        pc_add4_o <= 32'b0;
    end

end
endmodule
