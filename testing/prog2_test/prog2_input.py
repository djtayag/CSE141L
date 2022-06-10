# Generates ALL possible inputs for Program 2

f = open("prog2_input.hex",  "w")

for x in range(0,256):
    for y in range(0,256):
        if (x == 255 and y == 255):
            f.write("{:02x}\n".format(y))
            f.write("{:02x}".format(x))
            break
        f.write("{:02x}\n".format(y))
        f.write("{:02x}\n".format(x))