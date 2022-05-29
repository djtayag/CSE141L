# Program 1

okay here is the testcase for part 1, just copied from the writeup, no need to be fancy:

Before we raise and lower the start flag:
```
mem[29] = 0000_0101
mem[28] = 0101_0101
mem[27] = 0000_0101
mem[26] = 0101_0101
mem[25] = 0000_0101
mem[24] = 0101_0101
mem[23] = 0000_0101
mem[22] = 0101_0101
mem[21] = 0000_0101
mem[20] = 0101_0101
mem[19] = 0000_0101
mem[18] = 0101_0101
mem[17] = 0000_0101
mem[16] = 0101_0101
mem[15] = 0000_0101
mem[14] = 0101_0101
mem[13] = 0000_0101
mem[12] = 0101_0101
mem[11] = 0000_0101
mem[10] = 0101_0101
mem[9] = 0000_0101
mem[8] = 0101_0101
mem[7] = 0000_0101
mem[6] = 0101_0101
mem[5] = 0000_0101
mem[4] = 0101_0101
mem[3] = 0000_0101
mem[2] = 0101_0101
mem[1] = 0000_0101
mem[0] = 0101_0101
```

After program 1 is complete, we need to check for these values in memory
```
mem[59] = 1010_1010
mem[58] = 0101_1010
mem[57] = 1010_1010
mem[56] = 0101_1010
mem[55] = 1010_1010
mem[54] = 0101_1010
mem[53] = 1010_1010
mem[52] = 0101_1010
mem[51] = 1010_1010
mem[50] = 0101_1010
mem[49] = 1010_1010
mem[48] = 0101_1010
mem[47] = 1010_1010
mem[46] = 0101_1010
mem[45] = 1010_1010
mem[44] = 0101_1010
mem[43] = 1010_1010
mem[42] = 0101_1010
mem[41] = 1010_1010
mem[40] = 0101_1010
mem[39] = 1010_1010
mem[38] = 0101_1010
mem[37] = 1010_1010
mem[36] = 0101_1010
mem[35] = 1010_1010
mem[34] = 0101_1010
mem[33] = 1010_1010
mem[32] = 0101_1010
mem[31] = 1010_1010
mem[30] = 0101_1010
```

# Program 2
We should test 4 cases:
1. no error
2. parity error
3. message error
4. double error

```
mem[59] = 1010_1010 // case 1, no error
mem[58] = 0101_1010
mem[57] = 1010_1011 // case 2, parity error (one bit error)
mem[56] = 0101_1010
mem[55] = 1010_1010 // case 3, message error (one bit error)
mem[54] = 0101_0010
mem[53] = 1010_1110 // case 4, double error
mem[52] = 0111_1010
mem[51] = 1010_1010 // just do a bunch of case 1 from now on
mem[50] = 0101_1010
mem[49] = 1010_1010
mem[48] = 0101_1010
mem[47] = 1010_1010
mem[46] = 0101_1010
mem[45] = 1010_1010
mem[44] = 0101_1010
mem[43] = 1010_1010
mem[42] = 0101_1010
mem[41] = 1010_1010
mem[40] = 0101_1010
mem[39] = 1010_1010
mem[38] = 0101_1010
mem[37] = 1010_1010
mem[36] = 0101_1010
mem[35] = 1010_1010
mem[34] = 0101_1010
mem[33] = 1010_1010
mem[32] = 0101_1010
mem[31] = 1010_1010
mem[30] = 0101_1010
```

after program 2 is done, check:
```
mem[29] = 0000_0101 // case 1, no error (first two bits is 00)
mem[28] = 0101_0101
mem[27] = 0100_0101 // case 2, parity error (first two bits is 01)
mem[26] = 0101_0101
mem[25] = 0100_0101 // case 3, message error (first two bits is 01)
mem[24] = 0101_0101
mem[23] = 10xx_xxxx // case 4, double error (first two bits is 10)
mem[22] = xxxx_xxxx
mem[21] = 0000_0101 // case 1, no error (first two bits is 00)
mem[20] = 0101_0101
mem[19] = 0000_0101
mem[18] = 0101_0101
mem[17] = 0000_0101
mem[16] = 0101_0101
mem[15] = 0000_0101
mem[14] = 0101_0101
mem[13] = 0000_0101
mem[12] = 0101_0101
mem[11] = 0000_0101
mem[10] = 0101_0101
mem[9] = 0000_0101
mem[8] = 0101_0101
mem[7] = 0000_0101
mem[6] = 0101_0101
mem[5] = 0000_0101
mem[4] = 0101_0101
mem[3] = 0000_0101
mem[2] = 0101_0101
mem[1] = 0000_0101
mem[0] = 0101_0101
```

# Program 3
No need to be fancy, just set everything to 0.

We set:
```
mem[32] = 0000_0000 // the pattern is the most significant 5 bits (00000)
mem[31] = 0000_0000
mem[30] = 0000_0000
mem[29] = 0000_0000
mem[28] = 0000_0000
mem[27] = 0000_0000
mem[26] = 0000_0000
mem[25] = 0000_0000
mem[24] = 0000_0000
mem[23] = 0000_0000
mem[22] = 0000_0000
mem[21] = 0000_0000
mem[20] = 0000_0000
mem[19] = 0000_0000
mem[18] = 0000_0000
mem[17] = 0000_0000
mem[16] = 0000_0000
mem[15] = 0000_0000
mem[14] = 0000_0000
mem[13] = 0000_0000
mem[12] = 0000_0000
mem[11] = 0000_0000
mem[10] = 0000_0000
mem[9] = 0000_0000
mem[8] = 0000_0000
mem[7] = 0000_0000
mem[6] = 0000_0000
mem[5] = 0000_0000
mem[4] = 0000_0000
mem[3] = 0000_0000
mem[2] = 0000_0000
mem[1] = 0000_0000
mem[0] = 0000_0000
```

After program 3 is complete, we need to check for these values in memory
```
mem[35] = 1111_1100 // 252
mem[34] = 0010_0000 // 32
mem[33] = 1000_0000 // 128
```
