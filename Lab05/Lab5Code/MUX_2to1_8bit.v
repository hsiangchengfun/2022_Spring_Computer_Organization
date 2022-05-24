`timescale 1ns/1ps


module MUX_2to1_8bit(
    input       [8-1:0] data0_i,
    input       [8-1:0] data1_i,
    input                select_i,
    output      [8-1:0] data_o
);
/* Write your code HERE */

assign data_o = (select_i == 1'b0)? data0_i : data1_i ;


endmodule

