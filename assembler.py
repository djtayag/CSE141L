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
op_ADD = '00000'
op_LOAD = '00001'
op_MVFR = '00010'
op_MVTO = '00011'
op_OR = '00100'
op_XOR = '00101'
op_XORR = '00110'
op_AND = '00111'
op_STR = '01000'
op_SLT = '01001'
op_SEQ = '01010'
op_BTRU = '01011'
op_CLR = '01100'
op_NOT = '01101'
op_LUT = '1000'
op_ADDI = '1001'
op_SUBI = '1010'
op_B = '1011'
op_LSLI = '1100'
op_LSRI = '1101'
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

        writeline += regs[inst[1]]

        writeline += '\n'
        output.write(writeline)
        line = input.readline()


