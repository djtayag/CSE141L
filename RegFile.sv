//   W = data path width          <-- [WI22 Requirement: max(W)=8]
//   A = address pointer width    <-- [WI22 Requirement: max(A)=4]
module RegFile #(parameter W=8, A=4)(
  input                Clk,
  input                WriteR0,
  input                GenRegWrite,
  input        [A-1:0] Raddr,     // read operand register index
  input        [W-1:0] DataIn,    // data to write
  input        [A-1:0] Target,     // target addr from LUT
  output       [W-1:0] DataOutOperand,
  output       [W-1:0] DataOutAccumulator,
  output       [W-1:0] DataOutBranchReg
);


// W bits wide [W-1:0] and 2**A registers deep
//   When W=8 bit wide registers and A=4 to address 16 registers
//   then this could be written `logic [7:0] registers[16]`
logic [W-1:0] Registers[2**A];

// combinational reads
assign DataOutOperand = Registers[Raddr];
assign DataOutAccumulator = Registers[0];    // R0 is the accumulator register
assign DataOutBranchReg = Registers[1];      // R1 is the branch register

// sequential writes
always_ff @ (posedge Clk) begin
    Registers[1] <= Target;
    if (WriteR0)
        Registers[0] <= DataIn;             // only writing to accumulator
    else if (GenRegWrite)
        Registers[Raddr] <= DataIn;         // writing to a general purpose reg

end

endmodule
