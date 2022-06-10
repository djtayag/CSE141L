module ProgCtr (
    input              Start,
                       Reset,
                       Clk,
                       Branch,
                       ConditionalBranch,
    input        [7:0] Target,      // Target branch address from branch register (R1)

    output logic [7:0] ProgCtr
);

logic start_ready;

always_ff @( posedge Clk ) begin
    if (Reset) begin
        start_ready <= 0;
        ProgCtr <= 0;
    end else if (Start) begin
        start_ready <= 1;
        ProgCtr <= 0;
    end else if (Branch && ConditionalBranch)
        ProgCtr <= Target;
    else if (start_ready)
        ProgCtr <= ProgCtr + 'b1;
    else
        ProgCtr <= 0;
end

endmodule