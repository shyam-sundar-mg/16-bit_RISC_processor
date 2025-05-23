`timescale 1ns / 1ps

module alu(
    input [15:0] a,
    input [15:0] b,
    input [1:0] op,
    output reg [15:0] alu_ans,
    output reg zero, //flag 1
    output reg carry //flag 2
    );

always @(*)
begin
    zero = 0; carry = 0;
    case (op)
        // ADD
        2'b00: 
            {carry, alu_ans} = a + b;
        // SUB
        2'b01:
        begin
            alu_ans = a - b;
            if (a < b) carry = 1;
        end
        // CMP
        2'b10: alu_ans = (a < b) ? 16'b1 : 16'b0;
        // NAND (Universal Gate)
        2'b11: alu_ans = ~(a & b);
        default: alu_ans = 16'd0;
    endcase
    if (alu_ans == 16'd0) zero = 1;
    else zero = 0;
end
endmodule
