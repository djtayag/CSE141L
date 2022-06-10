# Generates expected outputs for ALL possible inputs in Program 1

with (
    open("prog1_input.hex", "r") as input,
    open("prog1_output.hex", "w") as output
):
    while True: 
        lsw_in = input.readline()
        msw_in = input.readline()
        hex_lsw_string = "0x" + lsw_in
        hex_msw_string = "0x" + msw_in
        if not msw_in: break # EOF

        input_lsw = bin(int(hex_lsw_string, 16))[2:].zfill(8)
        input_msw = bin(int(hex_msw_string, 16))[2:].zfill(8)
        
        # calculate the parities

        # parity 8
        temp = int(input_lsw[0]) ^ int(input_lsw[1]) ^ int(input_lsw[2]) ^ int(input_lsw[3]) ^ int(input_msw[5]) ^ int(input_msw[6]) ^ int(input_msw[7])
        if(temp % 2 == 1):
            p8 = 1
        else:
            p8 = 0
        
        # parity 4
        temp = int(input_msw[5]) ^ int(input_msw[6]) ^ int(input_msw[7]) ^ int(input_lsw[0]) ^ int(input_lsw[4]) ^ int(input_lsw[5]) ^ int(input_lsw[6])
        if (temp % 2 == 1):
            p4 = 1
        else:
            p4 = 0
        
        # parity 2
        temp = int(input_msw[5]) ^ int(input_msw[6]) ^ int(input_lsw[1]) ^ int(input_lsw[2]) ^ int(input_lsw[4]) ^ int(input_lsw[5]) ^ int(input_lsw[7])
        if (temp % 2 == 1):
            p2 = 1
        else:
            p2 = 0
        
        # parity 1
        temp = int(input_msw[5]) ^ int(input_msw[7]) ^ int(input_lsw[1]) ^ int(input_lsw[3]) ^ int(input_lsw[4]) ^ int(input_lsw[6]) ^ int(input_lsw[7])
        if (temp % 2 == 1):
            p1 = 1
        else:
            p1 = 0

        # parity 0
        temp = int(input_msw[5]) ^ int(input_msw[6]) ^ int(input_msw[7]) ^ int(input_lsw[0]) ^ int(input_lsw[1]) ^ int(input_lsw[2]) ^ int(input_lsw[3]) ^ int(input_lsw[4]) ^ int(input_lsw[5]) ^ int(input_lsw[6]) ^ int(input_lsw[7]) ^ p8 ^ p4 ^ p2 ^ p1
        if (temp % 2 == 1):
            p0 = 1
        else:
            p0 = 0

        # format the output
        output_msw = input_msw[5:8] + input_lsw[0:4] + str(p8)
        output_lsw = input_lsw[4:7] + str(p4) + input_lsw[7] + str(p2) + str(p1) + str(p0)

        if (int(msw_in, 16) == 7 and int(lsw_in, 16) == 255):
            output.write(hex(int(output_lsw,2))[2:].zfill(2))
            output.write("\n")
            output.write(hex(int(output_msw,2))[2:].zfill(2))
            break
        output.write(hex(int(output_lsw,2))[2:].zfill(2))
        output.write("\n")
        output.write(hex(int(output_msw,2))[2:].zfill(2))
        output.write("\n")