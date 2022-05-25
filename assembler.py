#register dictionary 
from re import I

regs = {
    'R0' : '0000',
    'R1' : '0001',
    'R2' : '0010',
    'R3' : '0011',
    'R4' : '0100',
    'R5' : '0101',
    'R6' : '0110',
    'R7' : '0111',
    'R8' : '1000',
    'R9' : '1001',
    'R10' : '1010',
    'R11' : '1011',
    'R12' : '1100',
    'R13' : '1101',
    'R14' : '1110',
    'R15' : '1111'
}

#define opcodes and 
op_ADD = '10000'
op_LOAD = '10001'
op_MVFR = '10010'
op_MVTO = '10011'
op_OR = '10100'
op_XOR = '10101'
op_XORR = '10110'
op_AND = '10111'
op_STR = '11000'
op_SLT = '11001'
op_SEQ = '11010'
op_BTRU = '11011'
op_SUB = '11100'
op_NOT = '11101'
op_LUT = '0000'
op_ADDI = '0001'
op_SUBI = '0010'
op_B = '0011'
op_LSLI = '0100'
op_LSRI = '0101'
op_HALT = '111111111'


#open read and write files
with(
    open('assembly.txt', 'r') as input,
    open('./machine_code.txt', 'w') as output
):
    #readline
    line = input.readline()
    #while there is a line, loop through and translate assembly to machine code
    while(line):
        inst = line.split()
        #print(inst)
        writeline = ''

        if inst[0] == 'ADD':
            writeline += op_ADD

        elif inst[0] == 'LOAD':
            writeline += op_LOAD

        elif inst[0] == 'MVFR':
            writeline += op_MVFR

        elif inst[0] == 'MVTO':
            writeline += op_MVTO
        
        elif inst[0] == 'OR':
            writeline += op_OR
        
        elif inst[0] == 'XOR':
            writeline += op_XOR
        
        elif inst[0] == 'XORR':
            writeline += op_XORR
        
        elif inst[0] == 'AND':
            writeline += op_AND
        
        elif inst[0] == 'STR':
            writeline += op_STR
        
        elif inst[0] == 'SLT':
            writeline += op_SLT
        
        elif inst[0] == 'SEQ':
            writeline += op_SEQ
        
        elif inst[0] == 'BTRU':
            writeline += op_BTRU
        
        elif inst[0] == 'SUB':
            writeline += op_SUB
        
        elif inst[0] == 'NOT':
            writeline += op_NOT
        
        elif inst[0] == 'LUT':
            writeline += op_LUT
        
        elif inst[0] == 'ADDI':
            writeline += op_ADDI
        
        elif inst[0] == 'SUBI':
            writeline += op_SUBI
        
        elif inst[0] == 'B':
            writeline += op_B
        
        elif inst[0] == 'LSLI':
            writeline += op_LSLI

        elif inst[0] == 'LSRI':
            writeline += op_LSRI
        
        elif inst[0] == 'HALT':
            writeline += op_HALT
        
        if(inst[0] != 'B' and inst[0] != 'BTRU'):
            if(inst[1][0] == '#' ):
                num_binary = bin(int(inst[1][1:]))[2:]
                writeline += num_binary.zfill(5)
            else:
         	    writeline += regs[inst[1]]
        else:
            if(inst[0] == 'B'):
                writeline += "00000"
            else:
                writeline += "0000"

        writeline += '\n'
        output.write(writeline)
        line = input.readline()