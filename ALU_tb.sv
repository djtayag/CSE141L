// ALU test bench
module ALU_tb ();
    bit [7:0]     accumulatorin;
    bit [7:0]     operandin;
    bit [7:0]     immediatein;
    bit           typee;
    bit [3:0]     rtypeop;
    bit [2:0]     itypeop;
    wire  [7:0]     out;
    wire            branch;

    ALU uut (.AccumulatorIn(accumulatorin), .OperandIn(operandin), .ImmediateIn(immediatein),
        .Type(typee), .RTypeOP(rtypeop), .ITypeOP(itypeop), .Out(out), .Branch(branch));

    initial begin
        #100ns

        accumulatorin = 8; //8'b0000_1000
        operandin = 16;    //8'b0001_0000

        // checking r types
        typee = 1;

        // checking add
        #20ns rtypeop = 20;
    end

endmodule
