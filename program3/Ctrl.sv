module Ctrl (
    input [8:0]  Instruction,   // 9-bit instruction

    output logic WriteR0,       // Write to the accumulator register
                 GenRegWrite,   // Write to any other register
                 WriteMem,      // Write to Data Memory
                 LUTsignal,     // Retrieve Target from LUT
                 Branch,        // Program counter takes the branch address
                 MemToReg,      // Output from DataMem is input for RegFile
                 Ack            // "Done with progam"
);    

wire      MSB;
wire[3:0] R_op;
wire[2:0] I_op;

assign Ack  = &Instruction;     // 9'b1_1111_1111
assign MSB  = Instruction[8];     
assign R_op = Instruction[7:4];
assign I_op = Instruction[7:5];

always_comb begin
    // Handle R-Type Instructions (MSB = 0)
    if (!MSB) begin
        case (R_op)
            // ADD
            0: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // LOAD
            1: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 1;
            end

            // MVFR
            2: begin
                WriteR0 = 0;
                GenRegWrite = 1;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // MVTO
            3: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // OR
            4: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // XOR - bitwise
            5: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // XORR - reduction
            6: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // AND
            7: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // STR
            8: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 1;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // SLT
            9: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // SEQ
            10: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // BTRU
            11: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 1;
                MemToReg = 0;
            end

            // SUB
            12: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // NOT
            13: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end
            
            default: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end
        endcase
    end else begin
        // Handle I/Special-Type Instructions (MSB = 0)
        case (I_op)
            // LUT
            0: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 1;
                Branch = 0;
                MemToReg = 0;
            end

            // ADDI
            1: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // SUBI
            2: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // B (unconditional branch)
            3: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 1;
                MemToReg = 0;
            end

            // LSLI
            4: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            // LSRI
            5: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end

            default: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
                MemToReg = 0;
            end
        endcase
    end
end

endmodule