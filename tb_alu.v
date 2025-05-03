`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 07:47:03 PM
// Design Name: 
// Module Name: tb_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_alu;
reg [15:0] a, b;
reg [1:0] opcode;
wire [15:0] result;
wire zero, carry;

alu uut (
    .a (a),
    .b (b),
    .op (opcode),
    .ans (result),
    .zero (zero),
    .carry (carry)
    );

initial begin
    // ADD
    a = 16'd4; b = 16'd3; opcode = 2'b00;
    #10;
    
    a = 16'hfff4; b = 16'hffab; opcode = 2'b00; // with carry
    #10;    
    
    // SUB
    a = 16'd4; b = 16'd3; opcode = 2'b01;
    #10;
    
    a = 16'd4; b = 16'd5; opcode = 2'b01; // with carry
    #10;
    
    // LSL    
    a = 16'd4; b = 16'bxxxx_xxxx_xxx0_0010; opcode = 2'b10;
    #10;
    
    // LSR    
    a = 16'd4; b = 16'bxxxx_xxxx_xxx0_0011; opcode = 2'b10;
    #10;
    
    // NAND    
    a = 16'd4; b = 16'd3; opcode = 2'b11;
    #10;
    
    
    $finish;
end
endmodule
