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
    // Populate the initial contents of memory when Reset signal is high
    if (Reset) begin
        Core[29] <= 8'b0000_0101;
        Core[28] <= 8'b0101_0101;
        Core[27] <= 8'b0000_0101;
        Core[26] <= 8'b0101_0101;
        Core[25] <= 8'b0000_0101;
        Core[24] <= 8'b0101_0101;
        Core[23] <= 8'b0000_0101;
        Core[22] <= 8'b0101_0101;
        Core[21] <= 8'b0000_0101;
        Core[20] <= 8'b0101_0101;
        Core[19] <= 8'b0000_0101;
        Core[18] <= 8'b0101_0101;
        Core[17] <= 8'b0000_0101;
        Core[16] <= 8'b0101_0101;
        Core[15] <= 8'b0000_0101;
        Core[14] <= 8'b0101_0101;
        Core[13] <= 8'b0000_0101;
        Core[12] <= 8'b0101_0101;
        Core[11] <= 8'b0000_0101;
        Core[10] <= 8'b0101_0101;
        Core[9] <= 8'b0000_0101;
        Core[8] <= 8'b0101_0101;
        Core[7] <= 8'b0000_0101;
        Core[6] <= 8'b0101_0101;
        Core[5] <= 8'b0000_0101;
        Core[4] <= 8'b0101_0101;
        Core[3] <= 8'b0000_0101;
        Core[2] <= 8'b0101_0101;
        Core[1] <= 8'b0000_0101;
        Core[0] <= 8'b0101_0101;
    end
    // Write to memory when the WriteEn signal is high
    else if (WriteEn)
        Core[DataAddress] <= DataIn;
end

endmodule