module ALU (
    input        [7:0] AccumulatorIn,
                       OperandIn,
    input        [4:0] ImmediateIn,
    input              Type,
    input        [3:0] RTypeOP,
    input        [2:0] ITypeOP,

    output logic [7:0] Out,
    output logic       ConditionalBranch
);

always_comb begin
    // Handling R-Type Instructions (Type = 0)
    if (!Type) begin
        case(RTypeOP)
            // ADD
            0:
                Out = AccumulatorIn + OperandIn;
            // LOAD
            1:
                Out = OperandIn;
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
                    ConditionalBranch = 1;
                else
                    ConditionalBranch = 0;
            end
            // SUB
            12:
                Out = AccumulatorIn - OperandIn;
            // NOT
            13: begin
                Out = AccumulatorIn;
                Out[OperandIn] = 1 - Out[OperandIn];
            end
            default:
                Out = 0;
            endcase
    end

    // Handle I/Special-Type Instructions (Type = 1)
    if (Type) begin
        case(ITypeOP)
            // ADDI
            1:
                Out = AccumulatorIn + {3'b000,ImmediateIn};
            // SUBI
            2:
                Out = AccumulatorIn - {3'b000,ImmediateIn};
            // B (unconditional branch)
            3:
                ConditionalBranch = 1;
            // LSLI
            4:
                Out = AccumulatorIn << ImmediateIn;
            // LSRI
            5:
                Out = AccumulatorIn >> ImmediateIn;
            default:
                Out = 0;
            endcase
    end
end

endmodule