`timescale 1ns/1ps

module ALU_Ctrl(
    input       [4-1:0] instr,
    input       [2-1:0] ALUOp,
    output reg  [4-1:0] ALU_Ctrl_o
);
/* Write your code HERE */

wire [2:0] func3;
assign func3 = instr[2:0];



always @(*) begin
    case(ALUOp)
        2'b00://lw sw => add
            ALU_Ctrl_o <= 4'b0010;
        2'b01://branch => sub
            ALU_Ctrl_o <= 4'b0110;
        2'b10://R-type
            begin
               
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
                        ALU_Ctrl_o <= 4'b0111;
                    4'b0100://xor
                        ALU_Ctrl_o <= 4'b0011;
                    4'b0001: //sll
                        ALU_Ctrl_o <= 4'b1100; 
				    4'b1101: //sra
                        ALU_Ctrl_o <= 4'b1001; 
                    default:
                        ALU_Ctrl_o <= 4'b0000;
                    
                endcase
            
            end
        2'b11: 
            begin
                case(func3)
                    3'b001: //slli
                        ALU_Ctrl_o <= 4'b1100; 
                    3'b010: //slti
                        ALU_Ctrl_o <= 4'b0111; 
                    3'b101: //srli
                        ALU_Ctrl_o <= 4'b1000; 
                    3'b000: //addi => add
                        ALU_Ctrl_o <= 4'b0010; 
                
                endcase
            end
        default:
            ALU_Ctrl_o <= 4'b1111;

    endcase



end





endmodule

