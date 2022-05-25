module RegFile_tb ();
    logic                Clk;
    logic                WriteR0;
    logic                GenRegWrite;
    logic                LUTsignal;
    logic                Reset;
    logic        [3:0] Raddr;     // read operand register index
    logic        [7:0] DataIn;    // data to write
    logic        [9:0] Target;     // target addr from LUT
    wire       [7:0] DataOutOperand;
    wire       [7:0] DataOutAccumulator;
    wire       [7:0] DataOutBranchReg;

    RegFile DUT (.Clk(Clk), .WriteR0(WriteR0), .GenRegWrite(GenRegWrite), .LUTsignal(LUTsignal), .Reset(Reset), .Raddr(Raddr),
        .DataIn(DataIn), .Target(Target), .DataOutOperand(DataOutOperand), .DataOutAccumulator(DataOutAccumulator), .DataOutBranchReg(DataOutBranchReg));

        initial begin
            Clk = 0;

            #10ns
            Reset = 1;
            #1ns

            #100ns
            Reset = 0;
            #1ns

            #10ns
            Target = 255;
            #1ns

            #10ns
            LUTsignal = 1;
            #5ns
            LUTsignal = 0;

            DataIn = 13;

            #10ns
            WriteR0 = 1;
            #5ns
            WriteR0 = 0;

            Raddr = 5;

            #10ns
            GenRegWrite = 1;
            #5ns
            GenRegWrite = 0;

            #10ns
            Reset = 1;
            #10ns
            Reset = 0;

            #10000ns
            $stop;
        end

        always begin
            #1ns
            Clk = ~Clk;
        end
endmodule
