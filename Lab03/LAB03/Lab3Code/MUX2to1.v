module MUX2to1(
	input      src1,
	input      src2,
	input	   select,
	output reg result
	);
/* Write your code HERE */

always @(*) begin
	// $display("mux2 ",src1,src2,select);
	case(select)
		1'b0:
			result <=src1;
		1'b1:
			result <=src2;
	endcase
	// $display("res %d",result);
end


endmodule
