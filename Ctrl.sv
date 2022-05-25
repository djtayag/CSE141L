module Ctrl (
  input  [8:0] Instruction,    // machine code
                               // some designs use ALU inputs here
  output logic       WriteR0,  // write accumulator reg
                     GenRegWrite,
                     WriteMem, // WriteMemory
                     LUTsignal, // Look up table signal
                     Branch,   // unconditional branch signal
                     Ack,      // "done with program"
);

assign Ack = &Instruction;

always_comb begin
    // R-Type instructions
    if (Instruction[8]) begin
        case(Instruction[6:3])
            // ADD
            0: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // LOAD
            1: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // MVFR
            2: begin
                WriteR0 = 0;
                GenRegWrite = 1;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // MVTO
            3: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // OR
            4: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // XOR
            5: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // XORR
            6: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // AND
            7: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // STR
            8: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 1;
                LUTsignal = 0;
                Branch = 0;
            end
            // SLT
            9: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // SEQ
            10: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // BTRU
            11: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 1;
            end
            // SUB
            12: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // NOT
            13: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // default
            default: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
    end else begin
        case(Instruction[6:4])
            // LUT
            0: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 1;
                Branch = 0;
            end
            // ADDI
            1: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // SUBI
            2: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // B (unconditional branch)
            3: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 1;
            end
            // LSLI
            4: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // LSRI
            5: begin
                WriteR0 = 1;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
            // default
            default: begin
                WriteR0 = 0;
                GenRegWrite = 0;
                WriteMem = 0;
                LUTsignal = 0;
                Branch = 0;
            end
    end
end


endmodule
