module ALU #(parameter W=8)(
  input        [W-1:0]   AccumulatorIn,       // data inputs
                         OperandIn,
                         ImmediateIn,
  input                  Type,          // type = 1 means R Type; 0 means I/special type
  input        [3:0]     RTypeOP,
  input        [2:0]     ITypeOP,
  output logic [W-1:0]   Out,          // data output
  output logic           Branch        // branch signal
);

always_comb begin
    // Handle R-Type instructions
    if(Type) begin
        case(RTypeOP)
            // ADD
            0:
                Out = AccumulatorIn + OperandIn;
            // LOAD
            1:
                Out = OperandIn;
            // MVFR
            2:
                Out = AccumulatorIn;
            // MVTO
            3:
                Out = OperandIn;
            // OR
            4:
                Out = AccumulatorIn | OperandIn;
            // XOR
            5:
                Out = AccumulatorIn ^ OperandIn;
            // XORR (Reduction XOR)
            6:
                Out = ^OperandIn;
            // AND
            7:
                Out = AccumulatorIn & OperandIn;
            // STR
            8:
                Out = OperandIn;
            // SLT
            9:
                Out = AccumulatorIn < OperandIn;
            // SEQ
            10:
                Out = AccumulatorIn == OperandIn;
            // BTRU
            11: begin
                if (AccumulatorIn == 1)
                    Branch = 1;
                else
                    Branch = 0;
            end
            // CLR
            12:
                Out = 0; // TODO
            // NOT
            13:
                Out = 0; // TODO
            endcase
    end

    // Handle I-Type instrsuctions
    if(!Type) begin
        case(ITypeOP)
            // LUT
            0:
                Out = 0; // TODO
            // ADDI
            1:
                Out = AccumulatorIn + ImmediateIn;
            // SUBI
            2:
                Out = AccumulatorIn - ImmediateIn;
            // B (unconditional branch)
            3:
                Branch = 1;
            // LSLI
            4:
                Out = AccumulatorIn << ImmediateIn;
            // LSRI
            5:
                Out = AccumulatorIn >> ImmediateIn;
            endcase
    end
end

endmodule
