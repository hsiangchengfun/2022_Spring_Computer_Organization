`timescale 1ns/1ps

module alu(
    input                   rst_n,         // negative reset            (input)
    input        [32-1:0]   src1,          // 32 bits source 1          (input)
    input        [32-1:0]   src2,          // 32 bits source 2          (input)
    input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
    output reg   [32-1:0]   result,        // 32 bits result            (output)
    output               zero           // 1 bit when the output is 0, zero must be set (output)
);

reg [32-1:0] a,b;
assign zero = ~(|result);

always@(*) begin

    a <= src1;
    b <= src2;

	if(~rst_n)begin 
		result <= 0;
	end
	else begin
		case(ALU_control)
			4'b0010: // add,addi
                result <= a + b;
            4'b0110: // sub
                result <= a - b;
            4'b0000: // and
                result <= a & b;
            4'b0001: // or
                result <= a | b;
            4'b0011: // xor
                result <= a ^ b;
            4'b0111: // slt or slti
                begin
                    result[0] <= (a < b);
                    result[31:1] <= 0;
                end
            
            4'b1001://sra
				result <= a >>> b; 
            4'b1000://srli
				result <= a >> b; 

            4'b1100:// sll,slli
				result <= a << b; 
                
		endcase
        
	end
end



endmodule
