// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_tb;

// This defines what `#1` means, so later, when the clock is
// up wait `#5` then down wait `#5` we make a 100 MHz clock.
timeunit 1ns;
// This defines the precision of delays in the simulation.
// Convention is for this to be three orders of magnitude
// more precise unless you have a reason for it to be
// something else.
timeprecision 1ps;

// To DUT Inputs
bit Reset;
bit Req;
bit Clk;
logic [7:0] CoreIn[99];
logic [7:0] CoreOut[9];

// From DUT Outputs
wire Ack;              // done flag

// Instantiate the Device Under Test (DUT)
TopLevel DUT (
  .Reset  (Reset),
  .Start  (Req ),
  .Clk    (Clk ),
  .Ack    (Ack )
);

// This is the important part of the testbench, where logic might be added
initial begin
  int fd;
  int track = 0;

  fd = $fopen("transcript.txt", "w");

  // Read in test cases
  $readmemh("prog3_input.hex", CoreIn);

  // message = 10101010... pattern = 10101
    CoreOut[0] = 64;
    CoreOut[1] = 32;
    CoreOut[2] = 126;

    // message = 11111111... pattern = 11111
    CoreOut[3] = 128;
    CoreOut[4] = 32;
    CoreOut[5] = 252;

    // message = 11001100... pattern = 10011
    CoreOut[6] = 32;
    CoreOut[7] = 32;
    CoreOut[8] = 63;

  for (int count = 0; count < 99; count += 33) begin
    #10 Reset = 1;
    #10 Reset = 0;
    #10 Req = 1;

    // Preload memory
    for (int i = 0; i < 33; i++) begin
      DUT.DM1.Core[i] = CoreIn[count+i];
    end

    #10 Req = 0;
    // Program running

    wait(Ack);

    // Analyze outputs
    
    if (DUT.DM1.Core[33] == CoreOut[track]) begin
      $fdisplay(fd, "GOOD! DUT.DM1.Core[33] = %d CoreOut[%d] = %d", DUT.DM1.Core[33], track, CoreOut[track]);
    end else begin
      $fdisplay(fd, "FAILURE DUT.DM1.Core[33] = %d CoreOut[%d] = %d", DUT.DM1.Core[33], track, CoreOut[track]);
    end

    if (DUT.DM1.Core[34] == CoreOut[track + 1]) begin
      $fdisplay(fd, "GOOD! DUT.DM1.Core[34] = %d CoreOut[%d] = %d", DUT.DM1.Core[34], track + 1, CoreOut[track + 1]);
    end else begin
      $fdisplay(fd, "FAILURE DUT.DM1.Core[34] = %d CoreOut[%d] = %d", DUT.DM1.Core[34], track+1, CoreOut[track+1]);
    end

    if (DUT.DM1.Core[35] == CoreOut[track + 2]) begin
      $fdisplay(fd, "GOOD! DUT.DM1.Core[35] = %d CoreOut[%d] = %d", DUT.DM1.Core[35], track + 2, CoreOut[track + 2]);
    end else begin
      $fdisplay(fd, "FAILURE DUT.DM1.Core[35] = %d CoreOut[%d] = %d", DUT.DM1.Core[35], track+2, CoreOut[track+2]);
    end

    $fdisplay(fd, "----------------------------------------------------------");
    

    track += 3;
  end
  
  $fclose(fd);
  $stop;

end

// This generates the system clock
always begin   // clock period = 10 Verilog time units
  #5 Clk = 1'b1;
  #5 Clk = 1'b0;
end

`ifdef __ICARUS__
// This directive is used by some toolchains (icarus, vcs, others)
// to generate waveforms. Questa/ModelSim creates these as arguments
// passed the simulator, so don't want to overwrite when running in
// those environments (hence the `ifdef guard).
integer i;
initial begin
  // Create a "Value Change Dump" file, which records every value
  // that changed during simulation [notice: this is why you have
  // to re-run simulation when you make changes before anything
  // shows up in the waveform!]
  $dumpfile("basic_proc.vcd");

  // Specify which signals to dump. With no arguments, it will
  // dump everything. Our design is small enough that (on modern
  // hardware), we can get away with this.
  $dumpvars();

  // Annoyingly (or sensibly, arguably, as memory is large) this
  // doesn't penetrate array types by default, so we have to be
  // explicit for the things that a 'worth' dumping all the time
  // (registers, registers are worth it, promise).
  //
  // With icarus, there's also a cosmetic bit to mind, this will
  // dump out a whole bunch of warnings, namely:
  //   VCD warning: array word TopLevel_tb.DUT.RF1.Registers[0]
  //   will conflict with an escaped identifier.
  // The VCD file format is limited, so the zeroth output register
  // will be renamed to \Registers[0], which _technically_ could
  // conflict with the name of another existing variable. In
  // practice, this falls into the bin of warnings that can be
  // safely ignored.
  for (i=0; i<8; i=i+1)
    $dumpvars(1, DUT.RF1.Registers[i]);

  // But we should install a quick safety net. If your design
  // runs forever, you can create huge dump files on accident,
  // so install a limit:
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end
`endif

endmodule

