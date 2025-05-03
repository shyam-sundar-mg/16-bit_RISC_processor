`timescale 1ns / 1ps

module processor(
    input clk,
    input reset
    );

reg [7:0] pc;

always @(posedge clk or posedge reset)
begin
    if (reset) pc <= 8'd0;
    else pc <= pc + 8'd1; // Normal PC increment
end

wire [15:0] instr;

inst_mem imem (
    .addr(pc),
    .instr(instr)
);

wire [3:0] opcode = instr[15:12];

// for ALU
wire [3:0] dest = instr[11:8];
wire [3:0] src1 = instr[7:4];
wire [3:0] src2 = instr[3:0];

// for LW and SW
wire [7:0] access_addr = instr[7:0]; // 8-bit address for memory access
wire [3:0] rock = instr[11:8]; // --> this will be rd_addr when LW and wr_addr when SW


wire reg_read, reg_write, mem_read, mem_write, alu_switch;

control_unit cu (
    .opcode(opcode),
    .reg_write(reg_write),
    .reg_read(reg_read),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_switch(alu_switch)
);

wire [1:0] alu_ctrl;
wire [3:0] alu_op = opcode;

alu_control alu_control_inst (
    .alu_op(alu_op),
    .alu_ctrl(alu_ctrl)
);

wire [15:0] alu_result;
wire zero, carry;

alu alu_inst (
    .a(read_data1),
    .b(read_data2),
    .op(alu_ctrl),
    .alu_ans(alu_result),
    .zero(zero),
    .carry(carry)
);

wire [15:0] mem_read_data;

data_memory dmem (
    .clk(clk),
    .addr(access_addr),
    .write_data(read_data1),
    .mem_wr_en(mem_write),
    .mem_rd_en(mem_read),
    .read_data(mem_read_data)
);


wire [15:0] read_data1, read_data2;
// write to reg_file
// write enable when either LW or ALU ops
wire [15:0] write_data = (mem_read) ? mem_read_data : alu_result;
wire [3:0] reg_src1 = (mem_read) ? rock : src1;
wire [3:0] reg_dest = (mem_write) ? rock : dest;

reg_file rf (
    .clk(clk),
    .reg_wr_en(reg_write),
    .rd_addr1(reg_src1),
    .rd_addr2(src2),
    .wr_addr(reg_dest),
    .wr_data(write_data),
    .rd_data1(read_data1),
    .rd_data2(read_data2)
);

endmodule
