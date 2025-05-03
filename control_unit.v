`timescale 1ns / 1ps

module control_unit(
    input [3:0] opcode,
    output reg reg_write,
    output reg reg_read,
    output reg mem_read,
    output reg mem_write,
    output reg alu_switch
    );

always @(*)
begin
    reg_write = 0;
    reg_read = 0;
    mem_read = 0;
    mem_write = 0;
    alu_switch = 0;
    
    case (opcode)
        4'b0000, 4'b0001, 4'b0010, 4'b0011: // all ALU ops
        begin
            alu_switch = 1;
            reg_write = 1;
        end      
        4'b0100: // load from mem
        begin
            mem_read = 1;
            reg_write = 1;
        end        
        4'b0101: // store to mem
        begin
            mem_write = 1;
            reg_read = 1;
            
        end
        default:
            begin
                reg_write = 0;
                reg_read = 0;
                mem_read = 0;
                mem_write = 0;
                alu_switch = 0;
            end
    endcase
end
endmodule
