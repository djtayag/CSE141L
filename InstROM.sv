//  A: Number of address bits in instruction memory
//  W: Width of instruction memory entry

// instsructions are 9 bits wide, we have <= 2^8 instructions
module InstROM (
  input        [7:0] InstAddress,
  output logic [8:0] InstOut
);

// Sample instruction format:
//   {3bit opcode; 3bit rs or rt; 3bit rt, immediate, or branch target}
//   then use LUT to map 3 bits to 10 for branch target, 8 for immediate


// Approach 1: Write machine code directly as combinational cases.
//
// This may be easier when first starting, before you have an assembler
// written or any way of automatically generating machine code.
//
// This is usually the fastest / easiest way to test individual instructions.
/*
always_comb begin
  InstOut = 'b000_000_000;       // default
  case (InstAddress)
    // Note: The `Effect`s listed here assume that some entries in
    // the data memory have been initialzed, specifically:
    // MEM[0] = 16
    // MEM[16] = 254

    // opcode = 3 load, rs = 1, rt = 0, reg[rs] = mem[reg[rt]]
    0 : InstOut = 'b011_001_000; // load from address at reg 0 to reg 1
                                 // Effect: R1 = #16 (b/c MEM[#0] was #16)

    // opcode = 3 load, rs = 3, rt = 1, reg[rs] = mem[reg[rt]]
    1 : InstOut = 'b011_011_001; // load from address at reg 1 to reg 3
                                 // Effect: R3 = #254 (b/c MEM[#16] was #254)

    // opcode = 0 add, rs = 1, rt = 3, reg[rs] = reg[rs]+reg[rt]
    2 : InstOut = 'b000_001_011; // add reg 1 and reg 3
                                 // Effect: R1 = #14 (b/c 270 % 256 = 14)

    // opcode = 6 store, rs = 1, rt = 0, mem[reg[rt]] = reg[rs]
    3 : InstOut = 'b110_001_000; // write reg 1 to address at reg 0
                                 // Effect: MEM[#0] = #14

    // opcode = 15 halt
    4 : InstOut = '1;  // equiv to 10'b1111111111 or 'b1111111111    halt

    // (default case already covered by opening statement)
  endcase
end
*/


// Approach 2: Create an actual instruction memory, and populate it
// from an external file.
//
// This is usually what you will switch to fairly quickly, once you
// start testing your actual program implementations on your core,
// rather than individual instructions.


// Declare 2-dimensional array, W bits wide, 2**A words deep
logic [8:0] inst_rom[256];

// This is where memory is read
always_comb InstOut = inst_rom[InstAddress];

// And this runs once during initalization to load instruction memory from
// external file using $readmemh or $readmemb.
initial begin
  // NOTE: This may not work depending on your simulator
  //       e.g. Questa needs the file in path of the application .exe,
  //       it doesn't care where you project code is
  $readmemb("../inst_mem.hex",inst_rom);

  // So you are probably better off with an absolute path,
  // but you will have to change this example path when you
  // try this on your machine most likely:
  //$readmemb("//vmware-host/Shared Folders/Downloads/basic_proc2/machine_code.txt", inst_rom);
end


endmodule
