module ProgCtr #(parameter A=10)(
  input                Start,       // begin program
                       Clk,         // PC can change on pos. edges only
                       Branch,
  input        [A-1:0] Target,      // target branch address
  output logic [A-1:0] ProgCtr      // program counter
);

always_ff @(posedge Clk) begin
  if(Start)
    ProgCtr <= 0;
  else if(Branch)
    ProgCtr <= Target;
  else
    ProgCtr <= ProgCtr + 'b1;
end

endmodule
