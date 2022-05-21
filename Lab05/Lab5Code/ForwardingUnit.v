`timescale 1ns/1ps
module ForwardingUnit (
    input [5-1:0] IDEXE_RS1,
    input [5-1:0] IDEXE_RS2,
    input [5-1:0] EXEMEM_RD,
    input [5-1:0] MEMWB_RD,
    input [2-1:0] EXEMEM_RegWrite,
    input [2-1:0] MEMWB_RegWrite,
    output reg [2-1:0] ForwardA,
    output reg [2-1:0] ForwardB
);
/* Write your code HERE */


always @(posedge clk) begin
    if(EXEMEM_RegWrite == 2'b01 && (EXMEM_RD != 0))begin
        if(EXMEM_RD == IDEXE_RS1)
            ForwardA <= 2'b10;
        else if (EXMEM_RD == IDEXE_RS2)
            ForwardB <= 2'b10;
    end

    else if ( MEMWB_RegWrite == 2'b01 && (MEMWB_RD != 0))begin
        if(MEMWB_RD == IDEXE_RS1)begin
            ForwardA <= 2'b01;
        end
        else if(MEMWB_RD == IDEXE_RS2)begin
            ForwardB <= 2'b01;
        end
    end
    else begin
        ForwardA <= 2'b00;
        ForwardB <= 2'b00;
    end
        

end



endmodule

