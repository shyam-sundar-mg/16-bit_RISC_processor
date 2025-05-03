`timescale 1ns / 1ps

module alu_control(
    input [3:0] alu_op, // opcode
    output reg [1:0] alu_ctrl // used inside alu
    );

//assign alu_ctrl = alu_op[1:0];

always @(*) begin
    case (alu_op)
        4'b0000: alu_ctrl = 2'b00;
        4'b0001: alu_ctrl = 2'b01;
        4'b0010: alu_ctrl = 2'b10;
        4'b0011: alu_ctrl = 2'b11;
        default: alu_ctrl = 2'b00;
    endcase
end
endmodule
