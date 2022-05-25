module LUT_tb ();
    logic [3:0] key;
    wire [9:0] value;

    logic clk;

    LUT DUT (.Addr(key), .Target(value));

    initial begin
        clk = 0;
    end

    always begin
        #1ns
        clk = ~clk;

        #10ns key = 0;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 1;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 2;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 3;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 4;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 5;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 6;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 7;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns key = 8;
        #1ns
        $display("key: %f, value: %d", key, value);

        #10ns
        $stop;
    end
endmodule
