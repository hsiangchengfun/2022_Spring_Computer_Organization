`timescale 1ns/1ps
module Simple_Single_CPU(
	input clk_i,
	input rst_i
	);

//Internal Signals
wire [31:0] pc_i;
wire [31:0] pc_o;
wire [31:0] instr;
wire [31:0] ALUresult;
wire RegWrite;
wire [31:0] RSdata_o;
wire [31:0] RTdata_o;
wire ALUSrc;
wire [1:0] ALUOp;
wire [3:0]ALU_control;
wire zero,cout,overflow;
wire [31:0]imm_4 = 4;
wire branch;	





ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i(rst_i),     
	    .pc_i(pc_i),   
	    .pc_o(pc_o) 
	    );

Instr_Memory IM(
        .addr_i(pc_o),  
	    .instr_o(instr)    
	    );
		
Reg_File RF(
        .clk_i(clk_i),      
		.rst_i(rst_i),     
        .RSaddr_i(instr[20-1:16-1]),
		.RTaddr_i(instr[25-1:21-1]),  
 		.RDaddr_i(instr[12-1:8-1]),  
        .RDdata_i(ALUresult[32-1:0]), 
 		.RegWrite_i(RegWrite),
 		.RSdata_o(RSdata_o),  
        .RTdata_o(RTdata_o)   
	    );
		
Decoder Decoder(
		.instr_i(instr),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite),
		.Branch(Branch),
		.ALUOp(ALUOp)
	    );	

Adder PC_plus_4_Adder(
		.src1_i(pc_o[32-1:0]),
		.src2_i(imm_4[32-1:0]),
		.sum_o(pc_i[32-1:0])
	    );
			
ALU_Ctrl ALU_Ctrl(
		.instr({instr[30],instr[14:12]}),
		.ALUOp(ALUOp[2-1:0]),
		.ALU_Ctrl_o(ALU_control[4-1:0])
		);
		
alu alu(
		.rst_n(rst_n),
		.src1(RSdata_o[32-1:0]),
		.src2(RTdata_o[32-1:0]),
		.ALU_control(ALU_control[4-1:0]),
		.result(ALUresult[32-1:0]),
		.zero(zero),
		.cout(cout),
		.overflow(overflow)
		);
	
// $display("%d",result);
// $display("fahiehlliukwhfiahi\n");		
endmodule
		  


