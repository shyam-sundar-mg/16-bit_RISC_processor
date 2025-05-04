# 16-bit RISC Processor
> A 16-bit RISC processor implemented in Xilinx Vivado using Verilog. 

#### Data Memory
* 256 memory locations with 16-bit data

#### Instruction Memory
* 256 memory locations with 16-bit data
* Handled by 8-bit program counter (PC)
#### Register File
* Sixteen 16-bit integer registers (R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16) 
* Flags (zero, carry) 

#### Instruction Opcodes
Instructions for Arithmetic Ops:
| opcode         | dest_reg      | src1_reg       | src2_reg      |
| :-------------:|:-------------:| :-------------:|:-------------:| 
|`bits 15 -> 12` | `bits 11 -> 8`| `bits 7 -> 4`  | `bits 3 -> 0` |

Instructions for Memory Access:
| opcode         | src/dest_reg  | access_address                 |
| :-------------:|:-------------:| :-----------------------------:| 
| `bits 15 -> 12`| `bits 11 -> 8`|        `bits 7 -> 0`           |

| Name          | Opcode    | 
| ------------- |:---------:| 
| add           | 0000      | 
| sub           | 0001      | 
| cmp           | 0010      | 
| nand          | 0011      |
| lw            | 0100      | 
| sw            | 0101      | 


