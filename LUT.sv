// Design Name:    CSE141L
// Module Name:    LUT

// Lookup table, stores branching addresses

module LUT(
  input        [3:0] Addr,
  output logic [7:0] Target
);

always_comb begin

  case(Addr)
    4'b0000: Target = 0; // Program 1 &[Loop]
    4'b0001: Target = 0; // Program 2 &[Loop]
    4'b0010: Target = 228; // Program 2 &[handle_loop]
    4'b0011: Target = 208; // Program 2 &[p0_correct]
    4'b0100: Target = 220; // Program 2 &[all_correct]
    4'b0101: Target = 195; // Program 2 &[one_or_none_wrong]
    4'b0110: Target = 165; // Program 2 &[err_MSW]
    4'b0111: Target = 4; // Program 3 &[Loop]
    4'b1000: Target = 128; // Program 3 &[last_entry]
    default: Target = 0;
  endcase

end

endmodule
