# Generates expected output for ALL possible inputs for Program 2

with(
    open("prog2_input.hex", "r") as input,
    open("prog2_output.hex", "w") as output
):
    while True:
        lsw_in = input.readline()
        msw_in = input.readline()
        hex_lsw_string = "0x" + lsw_in
        hex_msw_string = "0x" + msw_in
        if not msw_in: break # EOF

        if (int(msw_in, 16) == 255 and int(lsw_in, 16) == 255):
            output.write("ff\n")
            output.write("07")
            break

        input_lsw = bin(int(hex_lsw_string, 16))[2:].zfill(8)
        input_msw = bin(int(hex_msw_string, 16))[2:].zfill(8)

        p0wrong = 0
        err_location = 0
        num_wrong = 0

        b11 = int(input_msw[0])
        b10 = int(input_msw[1])
        b09 = int(input_msw[2])
        b08 = int(input_msw[3])
        b07 = int(input_msw[4])
        b06 = int(input_msw[5])
        b05 = int(input_msw[6])
        b04 = int(input_lsw[0])
        b03 = int(input_lsw[1])
        b02 = int(input_lsw[2])
        b01 = int(input_lsw[4])

        p8 = int(input_msw[7])
        p4 = int(input_lsw[3])
        p2 = int(input_lsw[5])
        p1 = int(input_lsw[6])
        p0 = int(input_lsw[7])

        # verify correctness of p0
        temp = b11^b10^b09^b08^b07^b06^b05^b04^b03^b02^b01^p8^p4^p2^p1^p0
        if (temp == 1):
            p0wrong = 1
        else:
            p0wrong = 0

        #verify correctness of p1
        temp = b11^b09^b07^b05^b04^b02^b01^p1
        if (temp == 1):
            num_wrong += 1
            err_location = 1

        #verify correctness of p2
        temp = b11^b10^b07^b06^b04^b03^b01^p2
        if (temp == 1):
            num_wrong += 1
            err_location += 2

        #verify correctness of p4
        temp = b11^b10^b09^b08^b04^b03^b02^p4
        if (temp == 1):
            num_wrong += 1
            err_location += 4

        #verify correctness of p8
        temp = b11^b10^b09^b08^b07^b06^b05^p8
        if (temp == 1):
            num_wrong += 1
            err_location += 8

        # now its time to check some conditions!!!
        
        # if all 5 Ps are correct
        if (num_wrong == 0 and p0wrong == 0):
            output_msw = hex(int("00000" + str(b11) + str(b10) + str(b09),2))[2:].zfill(2)
            output_lsw = hex(int(str(b08) + str(b07)  + str(b06) + str(b05) + str(b04) + str(b03) + str(b02) + str(b01),2))[2:].zfill(2)
            output.write(output_lsw + "\n")
            output.write(output_msw + "\n")

        # if p0 and ONE other p are wrong
        elif ((num_wrong == 1 and p0wrong == 1) or (num_wrong == 0 and p0wrong == 1)):
            output_msw = hex(int("01000" + str(b11) + str(b10) + str(b09),2))[2:].zfill(2)
            output_lsw = hex(int(str(b08) + str(b07)  + str(b06) + str(b05) + str(b04) + str(b03) + str(b02) + str(b01),2))[2:].zfill(2)
            output.write(output_lsw + "\n")
            output.write(output_msw + "\n")

        # if p0 and TWO or MORE other P look wrong
        elif (p0wrong == 1 and num_wrong >= 2):
            # err in lsw if err_location < 8
            if (err_location < 8):
                lsw_as_list = list(input_lsw)
                if (lsw_as_list[7-err_location] == "1"):
                    lsw_as_list[7-err_location] = "0"
                else:
                    lsw_as_list[7-err_location] = "1"
                output_msw = hex(int("01000" + str(b11) + str(b10) + str(b09),2))[2:].zfill(2)
                output_lsw = hex(int(str(b08) + str(b07) + str(b06) + str(b05) + lsw_as_list[0] + lsw_as_list[1] + lsw_as_list[2] + lsw_as_list[4],2))[2:].zfill(2)
                output.write(output_lsw + "\n")
                output.write(output_msw + "\n")
            else:
                # err in msw if err_location > 8
                idx = err_location - 8
                msw_as_list = list(input_msw)
                if (msw_as_list[7-idx] == "1"):
                    msw_as_list[7-idx] = "0"
                else:
                    msw_as_list[7-idx] = "1"
                    
                output_msw = hex(int("01000" + msw_as_list[0] + msw_as_list[1] + msw_as_list[2],2))[2:].zfill(2)
                output_lsw = hex(int(msw_as_list[3] + msw_as_list[4] + msw_as_list[5] + msw_as_list[6] + str(b04) + str(b03) + str(b02) + str(b01),2))[2:].zfill(2)
                output.write(output_lsw + "\n")
                output.write(output_msw + "\n")
        
        # if p0 looks right and one or more other p look wrong
        elif (p0wrong == 0 and num_wrong >= 1):
            output_msw = hex(int("10000000",2))[2:].zfill(2)
            output.write("xx\n")
            output.write(output_msw + "\n")