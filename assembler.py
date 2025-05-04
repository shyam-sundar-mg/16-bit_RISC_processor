file = open("code.txt", "r")

opcodes = { 'ADD': '0000',
            'SUB': '0001',
            'CMP': '0010',
            'NAND': '0011',
            'LW': '0100',
            'SW': '0101'}

alus = { 'ADD', 'SUB', 'NAND'}
stores = { 'LW', 'SW'}

instructions = []

for line in file.readlines():
    print(line)
    instr = ''
    els = line.split()
    opword = els[0]
    if opword not in opcodes: print("Instruction Error")
    if opword in alus:
        if not (els[1][0] == 'R' or els[2][0] == 'R' or els[3][0] == 'R'): print("Invalid ALU operation") 
        op1, op2, op3 = int(els[1][1:]), int(els[2][1:]), int(els[3][1:])
        instr += opcodes[opword] + '0' * (4-len(bin(op1)[2:])) + bin(op1)[2:] + '0' * (4-len(bin(op2)[2:])) + bin(op2)[2:] + '0' * (4-len(bin(op3)[2:])) + bin(op3)[2:]
    if opword in stores:
        op1 = '0' * (4-len(bin(int(els[1][1:]))[2:])) + bin(int(els[1][1:]))[2:]
        op2 = '0' * (8 - len(bin(int(els[2][1:3],16))[2:])) + bin(int(els[2][1:3],16))[2:]
        
        instr +=opcodes[opword] + op1 + op2
    print(instr)
    instructions.append(instr)

with open("inst_mem.txt", "w") as f:
    for i in instructions:
        f.writelines(i + '\n')
        
        
        

        
    
