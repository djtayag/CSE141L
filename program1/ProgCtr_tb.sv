module ProgCtr_tb ();
    logic         start;
    logic         clk;
    logic         branch;
    logic         conditionalbranch;
    logic          reset;
    logic [7:0]    target;

    wire [7:0]    progctr;


    ProgCtr DUT (.Reset(reset), .ConditionalBranch(conditionalbranch), .Start(start), .Clk(clk), .Branch(branch), .Target(target), .ProgCtr(progctr));

    initial begin
        clk = 0;

        #10ns reset = 1;
        #1ns

        #10ns
        reset = 0;
        #1ns

        #10ns
        start = 1;

        #10ns
        start = 0;

        #10ns
        target = 100;
        branch = 1;
        conditionalbranch = 1;
        #2ns
        branch = 0;
        conditionalbranch = 0;
        #30ns

        #10ns
        target = 40;

        #10ns
        branch = 1;
        conditionalbranch = 1;
        #2ns
        branch = 0;
        conditionalbranch = 0;
        #10ns


        reset = 1;
        #10ns

        reset = 0;
        #10ns
        start = 1;

        #10ns

        start = 0;

        #1000ns
        $stop;
    end

    always begin
        #1ns
        clk = ~clk;
    end

endmodule
