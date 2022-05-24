// Design Name:    CSE141L
// Module Name:    LUT

// Lookup table, stores branching addresses

module LUT(
  input        [3:0] Addr,
  output logic [9:0] Target
);

always_comb begin

  case(Addr)
    4'b0000: Target = 
    4'b0001: Target =
    4'b0010: Target =
    4'b0011: Target =
    4'b0100: Target =
    4'b0101: Target =
    4'b0110: Target =
    4'b0111: Target =
    4'b1000: Target =
  endcase

end

endmodule
