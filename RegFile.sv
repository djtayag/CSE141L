//   W = data path width          <-- [WI22 Requirement: max(W)=8]
//   A = address pointer width    <-- [WI22 Requirement: max(A)=4]
module RegFile(
  input                Clk,
  input                WriteR0,
  input                GenRegWrite,
  input                LUTsignal,
  input                Reset,
  input        [3:0] Raddr,     // read operand register index
  input        [7:0] DataIn,    // data to write
  input        [7:0] Target,     // target addr from LUT
  output       [7:0] DataOutOperand,
  output       [7:0] DataOutAccumulator,
  output       [7:0] DataOutBranchReg
);


// W bits wide [W-1:0] and 2**A registers deep
//   When W=8 bit wide registers and A=4 to address 16 registers
//   then this could be written `logic [7:0] registers[16]`
logic [7:0] Registers[16];

// combinational reads
assign DataOutOperand = Registers[Raddr];
assign DataOutAccumulator = Registers[0];    // R0 is the accumulator register
assign DataOutBranchReg = Registers[1];      // R1 is the branch register

// sequential writes
always_ff @ (posedge Clk) begin
    if (Reset) begin
        for (int i = 0; i < 16; i++)
            Registers[i] <= 0;
    end
    if (LUTsignal)
        Registers[0] <= Target;
    else if (WriteR0) 
        Registers[0] <= DataIn;             // only writing to accumulator
    else if (GenRegWrite) // MVFR
        Registers[Raddr] <= Registers[0];         // writing to a general purpose reg

end

endmodule
