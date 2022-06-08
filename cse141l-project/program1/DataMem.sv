module DataMem (
    input              Clk,
                       Reset,
                       WriteEn,
                       MemToReg,
    input        [7:0] ALUdata,     // Data from the ALU
                       DataAddress, // Memory address
                       DataIn,      // Data to write into memory

    output logic [7:0] DataOut      // Output of DataMemory
);

logic [7:0] Core[256];

always_comb begin
    // Output the ALU data or the DataMem data?
    if (MemToReg)
        DataOut = Core[DataAddress];
    else
        DataOut = ALUdata;
end


always_ff @( posedge Clk ) begin
    // Write to memory when the WriteEn signal is high
    if (WriteEn)
        Core[DataAddress] <= DataIn;
end

endmodule