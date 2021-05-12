
`timescale 1 ns /  100 ps

module RandomHardware_tb;

  parameter NUM_TESTS = 36;
  parameter I_WIDTH = 100;
  parameter O_WIDTH = 222;

  //--------------------------------------------------------------------
  // Define test vectors
  //--------------------------------------------------------------------
  wire [36-1:0] reset_bits; 
  assign reset_bits = 36'b000000000010000010000010000010000010;

  wire [I_WIDTH-1:0] src_bits [NUM_TESTS-1:0] ;
  assign src_bits[0] = 100'h0;
  assign src_bits[1] = 100'h0;
  assign src_bits[2] = 100'h0;
  assign src_bits[3] = 100'h0;
  assign src_bits[4] = 100'h0;
  assign src_bits[5] = 100'h0;
  assign src_bits[6] = 100'h0;
  assign src_bits[7] = 100'h0;
  assign src_bits[8] = 100'h40000000000000000000;
  assign src_bits[9] = 100'h0;
  assign src_bits[10] = 100'h0;
  assign src_bits[11] = 100'h0;
  assign src_bits[12] = 100'h0;
  assign src_bits[13] = 100'h0;
  assign src_bits[14] = 100'h40;
  assign src_bits[15] = 100'h0;
  assign src_bits[16] = 100'h0;
  assign src_bits[17] = 100'h0;
  assign src_bits[18] = 100'h0;
  assign src_bits[19] = 100'h0;
  assign src_bits[20] = 100'hfff600be00ff7ffff;
  assign src_bits[21] = 100'hfffff7fff0100000000000000;
  assign src_bits[22] = 100'h8000000000000000000000000;
  assign src_bits[23] = 100'h10000000e200001d010000;
  assign src_bits[24] = 100'h0;
  assign src_bits[25] = 100'h0;
  assign src_bits[26] = 100'h800000071000000160100000;
  assign src_bits[27] = 100'hfff40000a9a10000;
  assign src_bits[28] = 100'he0ffffff18ffe3000017f800f;
  assign src_bits[29] = 100'h8f8f8f8f917f8f8f8f8f8f8f8;
  assign src_bits[30] = 100'hf8000000207ff8f8f8f8faf80;
  assign src_bits[31] = 100'he0ffffff1900000000e6f8f8;
  assign src_bits[32] = 100'hf8f8f8f814f8f8f8f8f8f8f8f;
  assign src_bits[33] = 100'h8f8f8f8f8f8000000010000a9;
  assign src_bits[34] = 100'h830000e0ffffff1900000000e;
  assign src_bits[35] = 100'h60000fff8f8f8f8f8f8f917f8;

  //--------------------------------------------------------------------
  // Setup a clock
  //--------------------------------------------------------------------
  reg clock = 0;
  always #(`CLOCK_PERIOD/2) clock = ~clock;

  //--------------------------------------------------------------------
  // Instantiate DUT and wire/reg the inputs and outputs
  //--------------------------------------------------------------------
  reg [7:0] test_index;
  wire [I_WIDTH-1:0] io_in;
  wire [O_WIDTH-1:0] io_out;

  wire reset = reset_bits[test_index];
  assign io_in = src_bits[test_index];

  RandomHardware dut (
    .clock(clock),
    .reset(reset),
    .io_in(io_in),
    .io_out(io_out)
  );

  //--------------------------------------------------------------------
  // Define a sequential interface that steps through each test in
  // the src/sink array every time a valid ready/val handshake occurs
  //--------------------------------------------------------------------

  initial begin
    $vcdpluson;
    // Loop through test vectors..
    for (test_index = 0; test_index < NUM_TESTS; test_index = test_index + 1) begin
      @(negedge clock);
    end

    $vcdplusoff;
    $finish;
  end


  //--------------------------------------------------------------------
  // Timeout
  //--------------------------------------------------------------------
  // If something goes wrong, kill the simulation...
  reg [  63:0] cycle_count = 0;
  always @(posedge clock) begin
    cycle_count = cycle_count + 1;
    if (cycle_count >= 1000) begin
      $display("TIMEOUT");
	$vcdplusoff;
      $finish;
    end
  end


endmodule
    