`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,//30,14-12
	input		[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */

always @(*) begin



	if(ALUOp == 2'b00)begin//ld sd 
		ALU_Ctrl_o <= 4'b0010;
	end
	
	else if(ALUOp == 2'b01)begin// beq
		ALU_Ctrl_o <= 4'b0110;
	end
	
	else if(ALUOp == 2'b10)begin//R-type
		
		case(instr)
			4'b0000://add
				ALU_Ctrl_o <= 4'b0010;
			4'b1000://sub
				ALU_Ctrl_o <= 4'b0110;
			4'b0111://and
				ALU_Ctrl_o <= 4'b0000;
			4'b0110://or
				ALU_Ctrl_o <= 4'b0001;
			4'b0010://slt
				ALU_Ctrl_o <= 4'b1000;
		endcase

	end
	else if(ALUOp == 2'b11)begin//self-define
		
		case(instr)
			4'b1101://sra
				ALU_Ctrl_o <= 4'b1111;	
			4'b0001://sll
				ALU_Ctrl_o <= 4'b0111;
			4'b0100://xor
				ALU_Ctrl_o <= 4'b0011;
		endcase
		
	

	end

	
end




endmodule
