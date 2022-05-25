module TopLevel (
    input        Reset,
                 Start,
                 Clk,

    output logic Ack
);

// InstROM outputs
wire [8:0] IR1_InstOut_out;     // 9-bit instruction

// ProgCtr outputs
wire [7:0] PC1_ProgCtr_out;

// LUT outputs
wire [7:0] LUT1_Target_out;

// Ctrl outputs
logic Ctrl1_WriteR0_out;
logic Ctrl1_GenRegWrite_out;
logic Ctrl1_WriteMem_out;
logic Ctrl1_LUTsignal_out;
logic Ctrl1_Branch_out;
logic Ctrl1_MemToReg_out;
logic Ctrl1_Ack_out;

// RegFile outputs
logic [7:0] RF1_DataOutOperand_out;
logic [7:0] RF1_DataOutAccumulator_out;
logic [7:0] RF1_DataOutBranchReg_out;

// ALU outputs
logic [7:0] ALU_Out_out;
logic       ALU_ConditionalBranch_out;


// DataMem outputs
logic [7:0] DM1_DataOut_out;

// Instantiate all modules

// InstROM -- holds machine code pointed to by the ProgCtr
InstROM IR1 (
    .InstAddress(PC1_ProgCtr_out);
    .InstOut(IR1_InstOut_out);
);

// ProgCtr -- manages which instruction to execute next
ProgCtr PC1 (
    .Start(Start);
    .Reset(Reset);
    .Clk(Clk);
    .Branch(Ctrl1_Branch_out);
    .ConditionalBranch(ALU_ConditionalBranch_out);
    .Target(RF1_DataOutBranchReg_out);
    .ProgCtr(PC1_ProgCtr_out);
);

// LUT -- holds target branch addresses
LUT LUT1 (
    .Addr(IR1_InstOut_out[3:0]);
    .Target(LUT1_Target_out);
);

// Ctrl -- directs operations and raises signals based on instructions
Ctrl Ctrl1 (
    .Instruction(IR1_InstOut_out);
    .WriteR0(Ctrl1_WriteR0_out);
    .GenRegWrite(Ctrl1_GenRegWrite_out);
    .WriteMem(Ctrl1_WriteMem_out);
    .LUTsignal(Ctrl1_LUTsignal_out);
    .Branch(Ctrl1_Branch_out);
    .MemToReg(Ctrl1_MemToReg_out);
    .Ack(Ctrl1_Ack_out);
);

// RegFile -- holds the registers
RegFile RF1 (
    .Clk(Clk);
    .WriteR0(Ctrl1_WriteR0_out);
    .GenRegWrite(Ctrl1_GenRegWrite_out);
    .LUTsignal(Ctrl1_LUTsignal_out);
    .Reset(Reset);
    .Raddr(IR1_InstOut_out[3:0]);
    .DataIn(DM1_DataOut_out);
    .Target(LUT1_Target_out);
    .DataOutOperand(RF1_DataOutOperand_out);
    .DataOutAccumulator(RF1_DataOutAccumulator_out);
    .DataOutBranchReg(RF1_DataOutBranchReg_out);
);

// ALU -- responsible for handling arithemtic operations
ALU ALU1 (
    .AccumulatorIn(RF1_DataOutAccumulator_out);
    .OperandIn(RF1_DataOutOperand_out);
    .ImmediateIn(IR1_InstOut_out[4:0]);
    .Type(IR1_InstOut_out[8]);
    .RTypeOP(IR1_InstOut_out[7:4]);
    .ITypeOP(IR1_InstOut_out[7:5]);
    .Out(ALU1_Out_out);
    .ConditionalBranch(ALU_ConditionalBranch_out);
);

// DataMem -- storage
DataMem DM1 (
    .Clk(Clk);
    .Reset(Reset);
    .WriteEn(Ctrl1_WriteMem_out);
    .MemToReg(Ctrl1_MemToReg_out);
    .ALUdata(ALU1_Out_out);
    .DataAddress(ALU1_Out_out);
    .DataIn(RF1_DataOutAccumulator_out);
    .DataOut(DM1_DataOut_out);
);

endmodule