module ProgCtr_tb ();
    logic         start;
    logic         clk;
    logic         branch;
    logic [8:0]    target;

    wire [8:0]    progctr;


    ProgCtr DUT (.Start(start), .Clk(clk), .Branch(branch), .Target(target), .ProgCtr(progctr));

    initial begin
        clk = 0;

        #10ns
        start = 1;

        #10ns
        start = 0;

        #10ns
        target = 100;
        branch = 1;

        #10ns
        branch = 0;
        target = 40;

        #10ns
        branch = 1;

        #10ns
        branch = 0;

        #1000ns
        $stop;
    end

    always begin
        #1ns
        clk = ~clk;
    end

endmodule
