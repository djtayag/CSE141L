module RegFile (
    input        Clk,
                 WriteR0,
                 GenRegWrite,
                 LUTsignal,
                 Reset,
    input  [3:0] Raddr,         // Register index to read
    input  [7:0] DataIn,        // Data to write to register
    input  [7:0] Target,        // Target address from LUT

    output [7:0] DataOutOperand,
    output [7:0] DataOutAccumulator,
    output [7:0] DataOutBranchReg
);

logic [7:0] Registers[16];

assign DataOutOperand = Registers[Raddr];
assign DataOutAccumulator = Registers[0];   // R0 is accumulator
assign DataOutBranchReg = Registers[1];     // R1 is branch register

always_ff @( posedge Clk ) begin
    // Initialize registers to 0 when Reset is high
    if (Reset) begin
        for (int i = 0; i < 16; i++)
            Registers[i] <= 0; 
    end
    // Populate accumulator with Target adderess if LUT is high
    else if (LUTsignal)
        Registers[0] <= Target;
    else if (WriteR0)       // MVTO and other ALU ops write to accumulator
        Registers[0] <= DataIn;
    else if (GenRegWrite)   // MVFR - writing to other registers
        Registers[Raddr] <= Registers[0];
end

endmodule