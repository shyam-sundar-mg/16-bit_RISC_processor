`timescale 1ns / 1ps

module data_memory(
    input clk,
    input mem_rd_en,
    input mem_wr_en,
    input [7:0] addr,
    input [15:0] write_data,
    output reg [15:0] read_data
);

reg [15:0] mem [0:255];
initial
    begin
        $readmemh("C:/Users/shyam/simple_processor/simple_processor.srcs/sources_1/new/data_mem.txt", mem);
//        mem[0] = 16'd2; // #00h
//        mem[1] = 16'd3; // #01h
//        mem[2] = 16'd10; // #02h
//        mem[3] = 16'd15; // #03h       
    end
always @(posedge clk)
begin
    if (mem_wr_en)
        mem[addr] <= write_data;
end

always @(*)
begin
    if (mem_rd_en)
        read_data = mem[addr];
    else
        read_data = 16'd0;
end

endmodule
