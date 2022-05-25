// ALU test bench
module ALU_tb ();

    logic        [7:0]   AccumulatorIn;       // data inputs
    logic        [7:0]           OperandIn;
    logic        [4:0]           ImmediateIn;
    logic                  Type;          // type = 1 means R Type; 0 means I/special type
    logic        [3:0]     RTypeOP;
    logic        [2:0]     ITypeOP;
    wire  [7:0]   Out;          // data output
    wire           ConditionalBranch;       // branch signal

    ALU DUT (.AccumulatorIn(AccumulatorIn), .OperandIn(OperandIn), .ImmediateIn(ImmediateIn), .Type(Type), .RTypeOP(RTypeOP),
        .ITypeOP(ITypeOP), .Out(Out), .ConditionalBranch(ConditionalBranch));

    initial begin

        AccumulatorIn = 255; // 8'b1111_1111
        OperandIn = 55; //      8'b0011_0111

        // testing R TYPE OPERATIONS
        Type = 1;
        // add instruction
        RTypeOP = 0;
        #10ns
        $display("Out = 54? %d", Out);
        #10ns

        // Load
        RTypeOP = 1;
        #10ns
        $display("Out = 55? %d", Out);

        #10ns

        // MVTO
        RTypeOP = 3;
        #10ns
        $display("Out = 55? %d", Out);

        #10ns

        // OR
        RTypeOP = 4;
        #10ns
        $display("Out = 255? %d", Out);

        #10ns

        // XOR
        RTypeOP = 5;
        #10ns
        $display("Out = 200? %d", Out);
        #10ns;


        // accumulator = 255 8'b1111_1111
        // operand = 55      8'b0011_0111

        // reduction XORR
        RTypeOP = 6;
        #10ns
        $display("xorr Out = 1? %d", Out);
        #10ns

        // AND
        RTypeOP = 7;
        #10ns
        $display("and Out = 55? %d", Out);
        #10ns

        // STR
        RTypeOP = 8;
        #10ns
        $display("str Out = 55? %d", Out);
        #10ns

        AccumulatorIn = 10;
        OperandIn = 20;
        // SLT
        RTypeOP = 9;
        #10ns
        $display("slt Out = 1? %d", Out);
        #10ns

        AccumulatorIn = 30;
        OperandIn = 30;
        // SEQ
        RTypeOP = 10;
        #10ns
        $display(" seq Out = 1? %d", Out);
        #10ns

        AccumulatorIn = 1;

        // BTRU
        RTypeOP = 11;
        #10ns
        $display("btru Out = 1? %d", Out);
        #10ns

        AccumulatorIn = 70;
        OperandIn = 70;

        // SUB
        RTypeOP = 12;
        #10ns
        $display("sub Out = 0? %d", Out);
        #10ns

        // Testing I type instsructions

        Type = 0;

        AccumulatorIn = 100;
        ImmediateIn = 20;
        #10ns
        // ADDI
        ITypeOP = 1;
        #10ns
        $display(" ADDI Out = 120? %d", Out);

        // SUBI
        ITypeOP = 2;
        #10ns
        $display("SUBI Out = 80? %d", Out);

        // B
        ITypeOP = 3;
        #10ns
        $display("B (unconditional) Conditional = 1? %d", ConditionalBranch);


        AccumulatorIn = 16; //0001_0000
        ImmediateIn = 3;
        // lsli
        ITypeOP = 4;
        #10ns
        $display("LSLI sub Out = 128? %d", Out);

        // LSRI
        ITypeOP = 5;
        #10ns
        $display("LSRI sub Out = 2? %d", Out);

    end

endmodule
