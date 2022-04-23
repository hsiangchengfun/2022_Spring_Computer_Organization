`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */

wire set;
wire [32-1:0] mux_end;
wire cin,non;
wire [32-1:0] tmp_cout_reg;
reg set_reg;
wire Ainvert,Binvert;
wire [2-1:0] operation;
assign operation = ALU_control[1:0];
assign cin = ALU_control[2];
assign Ainvert = ALU_control[3];
assign Binvert = ALU_control[2];

genvar  i,j;

assign	{non , set}  = (src1[31] + ~src2[31] + tmp_cout_reg[32-2]) ; 


// alu_1bit set_init(.src1(src1[32-1]) ,.src2(src2[32-1]), .less(1'b0) ,.Ainvert(Ainvert) , .Binvert(Binvert),.cin(tmp_cout_reg[32-2]) ,.operation(2'b10) , .result(set) ,.cout(non));	

generate
	for(i=0;i<32;i=i+1)begin
		if( i == 0)begin
			alu_1bit a1(.src1(src1[i]) ,.src2(src2[i]), .less(set) ,.Ainvert(Ainvert) , .Binvert(Binvert), .cin(cin) ,.operation(operation) , .result(mux_end[i]) ,.cout(tmp_cout_reg[i]));	
		end
		else begin
			alu_1bit a1(.src1(src1[i]) ,.src2(src2[i]), .less(1'b0) ,.Ainvert(Ainvert) , .Binvert(Binvert), .cin(tmp_cout_reg[i-1]) ,.operation(operation) , .result(mux_end[i]) ,.cout(tmp_cout_reg[i]));
		end
	end
	
endgenerate


always @(*) begin
	if(~rst_n)begin
		result<=0;
		zero<=0;
		cout<=0;
	end
	else begin
		
		result <= mux_end;
		zero <= ~(|result);
		cout <= tmp_cout_reg[32-1] && operation == 2'b10;
		overflow <= ^tmp_cout_reg[32-1:32-2] && operation == 2'b10;
	end
end












endmodule
