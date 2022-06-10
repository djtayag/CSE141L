# Generates ALL possible inputs for Program 1

f = open("prog1_input.hex", "w")

for x in range(0,8):
    for y in range(0,256):
        if (x == 7 and y == 255):
            f.write("{:02x}\n".format(y))
            f.write("{:02x}".format(x))
            break
        f.write("{:02x}\n".format(y))
        f.write("{:02x}\n".format(x))

