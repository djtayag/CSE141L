#register dictionary 
regs = {
    'r0' : '0000'
    'r1' : '0000'
    'r2' : '0010'
    'r3' : '0011'
    'r4' : '0100'
    'r5' : '0101'
    'r6' : '0110'
    'r7' : '0111'
    'r8' : '1000'
    'r9' : '1001'
    'r10' : '1010'
    'r11' : '1011'
    'r12' : '1100'
    'r13' : '1101'
    'r14' : '1110'
    'r15' : '1111'
}

#define opcodes
r_type = '0'
i_type = '1'

#open file
with(
    open('assembly.txt', 'r') as input
    open('machine_code.txt', 'w') as output
):
