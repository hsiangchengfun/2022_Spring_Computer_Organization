`timescale 1ns/1ps
// `include "MUX2to1.v"
// `include "MUX4to1.v"
module alu_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);

/* Write your code HERE */

wire a_res,b_res,and_res,or_res,mux_end;
wire not_a,not_b,carry,add_res;

assign not_a = ~src1;
assign not_b = ~src2;

MUX2to1 m1(.src1(src1),.src2(not_a),.select(Ainvert),.result(a_res));
MUX2to1 m2(.src1(src2),.src2(not_b),.select(Binvert),.result(b_res));
assign and_res = (a_res & b_res);
assign or_res = (a_res | b_res);
assign {carry,add_res} = a_res + b_res+cin;
reg [2-1:0] t=2'b00;

MUX4to1 m3(.src1(and_res),.src2(or_res),.src3(add_res),.src4(less),.select({operation}),.result(mux_end));

always @(*) begin
	case(operation[2-1:0])
		2'b00:
			cout<=0;
		2'b01:
			cout<=0;
		2'b10:
			cout<=carry;
		2'b11:
			cout<=carry;
	endcase
	result <= mux_end;

end


endmodule
