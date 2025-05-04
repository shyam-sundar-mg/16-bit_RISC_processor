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
        #100;
        reset = 0;
        #200;
        $finish;
    end

    // Optionally monitor key values
    initial begin
        $monitor("Time=%0d|PC=%d|R0=%d|R1=%d|R2=%d|R3=%d|",
//        Mem[0]=%b|Mem[1]=%b|Mem[2]=%b|Mem[3]=%b
//        |Read_en=%d|addr=%d|rd_data=%d|wr_data=%d|alu_ans=%d",
                 $time,
                 uut.pc,
                 uut.rf.registers[0],
                 uut.rf.registers[1],
                 uut.rf.registers[2],
                 uut.rf.registers[3]
                 );
    end

endmodule
