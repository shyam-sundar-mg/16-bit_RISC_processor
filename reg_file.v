`timescale 1ns / 1ps

module reg_file(
    input clk,
    input reg_wr_en,
    input [3:0] rd_addr1,
    input [3:0] rd_addr2,
    input [3:0] wr_addr,
    input [15:0] wr_data,
    output reg [15:0] rd_data1,
    output reg [15:0] rd_data2
);

reg [15:0] registers [15:0];
// 16 registers, 16 bit each

integer i;
initial begin
    for (i = 0; i < 16; i = i + 1)
        registers[i] = 16'd0;
end

always @(posedge clk) begin
    if (reg_wr_en)
        registers[wr_addr] <= wr_data;
end

always @(*) begin
    rd_data1 = registers[rd_addr1];
    rd_data2 = registers[rd_addr2];    
end
endmodule

