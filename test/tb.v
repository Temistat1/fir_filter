`timescale 1ns / 1ps

module tb_fir_core();

  reg clk;
  reg rst;
  reg [31:0] x_rsc_dat;
  wire [31:0] y_rsc_dat;
  wire y_triosy_lz;
  wire x_triosy_lz;

  // Instantiate the design under test (DUT)
  fir_core DUT (
    .clk(clk),
    .rst(rst),
    .y_rsc_dat(y_rsc_dat),
    .y_triosy_lz(y_triosy_lz),
    .x_rsc_dat(x_rsc_dat),
    .x_triosy_lz(x_triosy_lz)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Testbench logic
  initial begin
    // Initialize signals
    rst = 1;
    x_rsc_dat = 32'd0;

    // Apply reset
    #10 rst = 0;

    // Apply input values and observe output
    #10 x_rsc_dat = 32'd10; // First input
    #10 x_rsc_dat = 32'd20; // Second input
    #10 x_rsc_dat = 32'd30; // Third input
    #10 x_rsc_dat = 32'd40; // Fourth input

    // Wait for more cycles to observe behavior
    #100;

    // End simulation
    $stop;
  end

  // Monitor output
  initial begin
    $monitor("At time %0t: x_rsc_dat = %d, y_rsc_dat = %d", $time, x_rsc_dat, y_rsc_dat);
  end

endmodule
