module MUX4to1(
	input			src1,
	input			src2,
	input			src3,
	input			src4,
	input   [2-1:0] select,
	output reg		result
	);
/* Write your code HERE */


always @(*) begin
	// $display("mux4 ",src1,src2,src3,src4,select);

	case(select)
		2'b00:
			result<=src1;
		2'b01:
			result<=src2;
		2'b10:
			result<=src3;
		2'b11:
			result<=src4;
	endcase
end




	
endmodule
