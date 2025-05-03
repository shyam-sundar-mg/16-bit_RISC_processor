`timescale 1ns / 1ps

module inst_mem(
    input [7:0] addr,
    output reg [15:0] instr
    );

reg [15:0] mem [0:255];
// this memory should contain all instructions, see how this can be done
initial
    begin
        mem[0] = 16'b0100_0001_0000_0000; // LW R1, #00h
        mem[1] = 16'b0100_0010_0000_0010; // LW R2, #02h
        mem[2] = 16'b0000_0011_0010_0001; // ADD R3, R2, R1
        mem[3] = 16'b0000_0000_0010_0010; // ADD R0, R2, R2
        mem[4] = 16'b0001_0001_0011_0010; // SUB R1, R3, R2
        mem[5] = 16'b0100_0011_0000_0011; // LW R2, #02h
        mem[6] = 16'b0101_0010_0000_0000; // SW R2, #00h
    end
always @(*)
    instr = mem[addr];
endmodule
