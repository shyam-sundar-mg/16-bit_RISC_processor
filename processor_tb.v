`timescale 1ns / 1ps

module processor_tb;
    reg clk;
    reg reset;
    processor uut (
        .clk(clk),
        .reset(reset)
    );
    
    always #5 clk = ~clk;

    initial begin
        $display("PROCESSOR TESTBENCH");
        clk = 0;
        reset = 1;
        #20;
        reset = 0;
        #200;
        $finish;
    end

    // Optionally monitor key values
    initial begin
        $monitor("Time=%0d|PC=%d|R0=%d|R1=%d|R2=%d|R3=%d|Wr_addr=%d|Mem[0]=%d|Mem[1]=%d|Mem[2]=%d|Mem[3]=%d",
//        |Read_en=%d|addr=%d|rd_data=%d|wr_data=%d|alu_ans=%d",
                 $time,
                 uut.pc,
                 uut.rf.registers[0],
                 uut.rf.registers[1],
                 uut.rf.registers[2],
                 uut.rf.registers[3],
                 uut.rf.wr_addr,
                 uut.dmem.mem[0],
                 uut.dmem.mem[1],
                 uut.dmem.mem[2],
                 uut.dmem.mem[3]
//                 ,
//                 uut.dmem.mem_rd_en,
//                 uut.dmem.addr,
//                 uut.dmem.read_data,
//                 uut.write_data,
//                 uut.alu_inst.alu_ans
                 );
    end

endmodule
