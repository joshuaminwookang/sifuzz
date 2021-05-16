import os.path
import json

src_path="/scratch/nayiri/randomaccels/power/RandomHardware/src/RandomHardware.v"
dest_path="/scratch/nayiri/randomaccels/power/RandomHardware/src/RandomHardware_tb.v"
json_path='/scratch/nayiri/randomaccels/scripts/testbench.json'
data = {}

with open(json_path, 'r') as f:
    data = json.load(f)

num_tests = data["num_tests"]
i_width = data["i_width"]
o_width = data["o_width"]
reset_bits = data["reset_bits"]
reset_width = len(reset_bits)
src_bits = data["src_bits"]

with open(dest_path,'w') as f:
    f.write('''
`timescale 1 ns /  100 ps

module RandomHardware_tb;

  parameter NUM_TESTS = {num_tests};
  parameter I_WIDTH = {i_width};
  parameter O_WIDTH = {o_width};

  //--------------------------------------------------------------------
  // Define test vectors
  //--------------------------------------------------------------------
  wire [{reset_width}-1:0] reset_bits; 
  assign reset_bits = {reset_width}'b{reset_bits};

  wire [I_WIDTH-1:0] src_bits [NUM_TESTS-1:0] ;''' \
  .format(reset_width=reset_width,
          reset_bits=reset_bits,
          num_tests=num_tests,
          i_width=i_width,
          o_width=o_width))

    for i in range(num_tests):
        input = src_bits[i]
        input = input.replace('0x','')
        # print(input)
        f.write('''
  assign src_bits[{i}] = {i_width}'h{input};''' \
        .format(i=i,i_width=i_width,input=input))

    f.write('''

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
    ''')