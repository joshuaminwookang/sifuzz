module ShiftRight(
  input  [16:0] io_in,
  output [16:0] io_out
);
  assign io_out = {{4'd0}, io_in[16:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mux2(
  input  [34:0] io_in,
  output [16:0] io_out
);
  wire  sel = io_in[34]; // @[Muxes.scala 16:18]
  wire [16:0] in1 = io_in[33:17]; // @[Muxes.scala 17:18]
  wire [16:0] in0 = io_in[16:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_0(
  input  [34:0] io_in,
  output [16:0] io_out
);
  wire [16:0] ShiftRight_000_io_in; // @[RandomHardware_1_0.scala 15:34]
  wire [16:0] ShiftRight_000_io_out; // @[RandomHardware_1_0.scala 15:34]
  wire [34:0] Mux2_001_io_in; // @[RandomHardware_1_0.scala 16:26]
  wire [16:0] Mux2_001_io_out; // @[RandomHardware_1_0.scala 16:26]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_0.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_1_0.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_0.scala 19:10]
  assign ShiftRight_000_io_in = Mux2_001_io_out; // @[RandomHardware_1_0.scala 13:24 RandomHardware_1_0.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_1_0.scala 18:25]
endmodule
module ReduceAndMux(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[18:12]; // @[Muxes.scala 98:27]
  wire [6:0] IN2 = io_in[11:5]; // @[Muxes.scala 99:27]
  wire [4:0] SEL = io_in[4:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_1(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [23:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [6:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_1_1.scala 14:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:33]
endmodule
module ShiftRight_1(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{5'd0}, io_in[7:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Accum(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] sum; // @[ArithmeticLogical.scala 82:18]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[ArithmeticLogical.scala 83:16]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sum = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_3(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_3.scala 14:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_3.scala 14:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_3.scala 14:34]
  Accum Accum_000 ( // @[RandomHardware_1_3.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module ShiftLeft(
  input  [8:0] io_in,
  output [9:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceXorMux(
  input  [27:0] io_in,
  output [12:0] io_out
);
  wire [12:0] IN1 = io_in[27:15]; // @[Muxes.scala 122:27]
  wire [12:0] IN2 = io_in[14:2]; // @[Muxes.scala 123:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module Mux2_1(
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  sel = io_in[22]; // @[Muxes.scala 16:18]
  wire [10:0] in1 = io_in[21:11]; // @[Muxes.scala 17:18]
  wire [10:0] in0 = io_in[10:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module Mux2_2(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire  sel = io_in[18]; // @[Muxes.scala 16:18]
  wire [8:0] in1 = io_in[17:9]; // @[Muxes.scala 17:18]
  wire [8:0] in0 = io_in[8:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_2_3(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire [18:0] Mux2_000_io_in; // @[RandomHardware_2_3.scala 14:26]
  wire [8:0] Mux2_000_io_out; // @[RandomHardware_2_3.scala 14:26]
  Mux2_2 Mux2_000 ( // @[RandomHardware_2_3.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_2_3.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_2_3.scala 16:25]
endmodule
module ShiftRight_2(
  input  [8:0] io_in,
  output [8:0] io_out
);
  assign io_out = {{5'd0}, io_in[8:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_4(
  input  [46:0] io_in,
  output [19:0] io_out
);
  wire [8:0] ShiftLeft_000_io_in; // @[RandomHardware_1_4.scala 18:34]
  wire [9:0] ShiftLeft_000_io_out; // @[RandomHardware_1_4.scala 18:34]
  wire [27:0] ReduceXorMux_001_io_in; // @[RandomHardware_1_4.scala 19:34]
  wire [12:0] ReduceXorMux_001_io_out; // @[RandomHardware_1_4.scala 19:34]
  wire [22:0] Mux2_002_io_in; // @[RandomHardware_1_4.scala 20:26]
  wire [10:0] Mux2_002_io_out; // @[RandomHardware_1_4.scala 20:26]
  wire [18:0] RandomHardware_003_io_in; // @[RandomHardware_1_4.scala 21:42]
  wire [8:0] RandomHardware_003_io_out; // @[RandomHardware_1_4.scala 21:42]
  wire [8:0] ShiftRight_004_io_in; // @[RandomHardware_1_4.scala 22:34]
  wire [8:0] ShiftRight_004_io_out; // @[RandomHardware_1_4.scala 22:34]
  wire [9:0] wire_001 = ShiftLeft_000_io_out; // @[RandomHardware_1_4.scala 14:24 RandomHardware_1_4.scala 29:18]
  wire [12:0] wire_002 = ReduceXorMux_001_io_out; // @[RandomHardware_1_4.scala 15:24 RandomHardware_1_4.scala 30:18]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_4.scala 18:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ReduceXorMux ReduceXorMux_001 ( // @[RandomHardware_1_4.scala 19:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  Mux2_1 Mux2_002 ( // @[RandomHardware_1_4.scala 20:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  RandomHardware_2_3 RandomHardware_003 ( // @[RandomHardware_1_4.scala 21:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  ShiftRight_2 ShiftRight_004 ( // @[RandomHardware_1_4.scala 22:34]
    .io_in(ShiftRight_004_io_in),
    .io_out(ShiftRight_004_io_out)
  );
  assign io_out = {Mux2_002_io_out,ShiftRight_004_io_out}; // @[Cat.scala 30:58]
  assign ShiftLeft_000_io_in = RandomHardware_003_io_out; // @[RandomHardware_1_4.scala 13:24 RandomHardware_1_4.scala 31:18]
  assign ReduceXorMux_001_io_in = io_in[27:0]; // @[RandomHardware_1_4.scala 24:41]
  assign Mux2_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_003_io_in = io_in[18:0]; // @[RandomHardware_1_4.scala 25:41]
  assign ShiftRight_004_io_in = RandomHardware_003_io_out; // @[RandomHardware_1_4.scala 16:24 RandomHardware_1_4.scala 32:18]
endmodule
module Mul(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [3:0] in1 = io_in[7:4]; // @[ArithmeticLogical.scala 47:20]
  wire [3:0] in2 = io_in[3:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module Reg(
  input        clock,
  input  [9:0] io_in,
  output [9:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] io_out_REG; // @[Memory.scala 12:22]
  assign io_out = io_out_REG; // @[Memory.scala 12:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Memory.scala 12:22]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_out_REG = _RAND_0[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRegister(
  input        clock,
  input  [6:0] io_in,
  output [6:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] r0; // @[Memory.scala 78:19]
  reg [6:0] r1; // @[Memory.scala 79:19]
  reg [6:0] r2; // @[Memory.scala 80:19]
  reg [6:0] r3; // @[Memory.scala 81:19]
  assign io_out = r3; // @[Memory.scala 82:10]
  always @(posedge clock) begin
    r0 <= io_in; // @[Memory.scala 78:19]
    r1 <= r0; // @[Memory.scala 79:19]
    r2 <= r1; // @[Memory.scala 80:19]
    r3 <= r2; // @[Memory.scala 81:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mul_1(
  input  [5:0] io_in,
  output [5:0] io_out
);
  wire [2:0] in1 = io_in[5:3]; // @[ArithmeticLogical.scala 47:20]
  wire [2:0] in2 = io_in[2:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module Mul_2(
  input  [3:0] io_in,
  output [3:0] io_out
);
  wire [1:0] in1 = io_in[3:2]; // @[ArithmeticLogical.scala 47:20]
  wire [1:0] in2 = io_in[1:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module Sub(
  input  [29:0] io_in,
  output [15:0] io_out
);
  wire [14:0] in1 = io_in[29:15]; // @[ArithmeticLogical.scala 24:30]
  wire [14:0] in2 = io_in[14:0]; // @[ArithmeticLogical.scala 25:28]
  wire [14:0] _io_out_T = $signed(in1) - $signed(in2); // @[ArithmeticLogical.scala 27:19]
  assign io_out = {{1'd0}, _io_out_T}; // @[ArithmeticLogical.scala 27:19]
endmodule
module ReduceOrMux(
  input  [15:0] io_in,
  output [3:0]  io_out
);
  wire [3:0] IN1 = io_in[15:12]; // @[Muxes.scala 110:27]
  wire [3:0] IN2 = io_in[11:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_9(
  input  [29:0] io_in,
  output [3:0]  io_out
);
  wire [3:0] Mul_000_io_in; // @[RandomHardware_1_9.scala 17:26]
  wire [3:0] Mul_000_io_out; // @[RandomHardware_1_9.scala 17:26]
  wire [29:0] Sub_001_io_in; // @[RandomHardware_1_9.scala 18:26]
  wire [15:0] Sub_001_io_out; // @[RandomHardware_1_9.scala 18:26]
  wire [3:0] Mul_002_io_in; // @[RandomHardware_1_9.scala 19:26]
  wire [3:0] Mul_002_io_out; // @[RandomHardware_1_9.scala 19:26]
  wire [15:0] ReduceOrMux_003_io_in; // @[RandomHardware_1_9.scala 20:34]
  wire [3:0] ReduceOrMux_003_io_out; // @[RandomHardware_1_9.scala 20:34]
  Mul_2 Mul_000 ( // @[RandomHardware_1_9.scala 17:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  Sub Sub_001 ( // @[RandomHardware_1_9.scala 18:26]
    .io_in(Sub_001_io_in),
    .io_out(Sub_001_io_out)
  );
  Mul_2 Mul_002 ( // @[RandomHardware_1_9.scala 19:26]
    .io_in(Mul_002_io_in),
    .io_out(Mul_002_io_out)
  );
  ReduceOrMux ReduceOrMux_003 ( // @[RandomHardware_1_9.scala 20:34]
    .io_in(ReduceOrMux_003_io_in),
    .io_out(ReduceOrMux_003_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_9.scala 23:10]
  assign Mul_000_io_in = Mul_002_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 26:18]
  assign Sub_001_io_in = io_in; // @[RandomHardware_1_9.scala 22:25]
  assign Mul_002_io_in = ReduceOrMux_003_io_out; // @[RandomHardware_1_9.scala 15:24 RandomHardware_1_9.scala 28:18]
  assign ReduceOrMux_003_io_in = Sub_001_io_out; // @[RandomHardware_1_9.scala 14:24 RandomHardware_1_9.scala 29:18]
endmodule
module RandomHardware_2_0(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_2_0.scala 14:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 14:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 14:42]
  RandomHardware_1_3 RandomHardware_000 ( // @[RandomHardware_2_0.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:33]
endmodule
module ReduceAndMux_1(
  input  [37:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[33:19]; // @[Muxes.scala 98:27]
  wire [14:0] IN2 = io_in[18:4]; // @[Muxes.scala 99:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module Accum_2(
  input         clock,
  input  [22:0] io_in,
  output [22:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [22:0] sum; // @[ArithmeticLogical.scala 82:18]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[ArithmeticLogical.scala 83:16]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sum = _RAND_0[22:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_10(
  input         clock,
  input  [34:0] io_in,
  output [14:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_10.scala 16:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_10.scala 16:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 16:42]
  wire [37:0] ReduceAndMux_001_io_in; // @[RandomHardware_1_10.scala 17:34]
  wire [14:0] ReduceAndMux_001_io_out; // @[RandomHardware_1_10.scala 17:34]
  wire  Accum_002_clock; // @[RandomHardware_1_10.scala 18:34]
  wire [22:0] Accum_002_io_in; // @[RandomHardware_1_10.scala 18:34]
  wire [22:0] Accum_002_io_out; // @[RandomHardware_1_10.scala 18:34]
  wire [14:0] wire_000 = {{3'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 24:18]
  wire [22:0] wire_001 = Accum_002_io_out; // @[RandomHardware_1_10.scala 14:24 RandomHardware_1_10.scala 25:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_10.scala 16:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ReduceAndMux_1 ReduceAndMux_001 ( // @[RandomHardware_1_10.scala 17:34]
    .io_in(ReduceAndMux_001_io_in),
    .io_out(ReduceAndMux_001_io_out)
  );
  Accum_2 Accum_002 ( // @[RandomHardware_1_10.scala 18:34]
    .clock(Accum_002_clock),
    .io_in(Accum_002_io_in),
    .io_out(Accum_002_io_out)
  );
  assign io_out = ReduceAndMux_001_io_out; // @[RandomHardware_1_10.scala 22:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[34:23]; // @[RandomHardware_1_10.scala 20:41]
  assign ReduceAndMux_001_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign Accum_002_clock = clock;
  assign Accum_002_io_in = io_in[34:12]; // @[RandomHardware_1_10.scala 21:33]
endmodule
module ReduceOrMux_1(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [3:0] IN1 = io_in[17:14]; // @[Muxes.scala 110:27]
  wire [3:0] IN2 = io_in[13:10]; // @[Muxes.scala 111:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_11(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [17:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_11.scala 14:34]
  wire [3:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_11.scala 14:34]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_1_11.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_11.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_11.scala 16:33]
endmodule
module Mux2_3(
  input  [36:0] io_in,
  output [17:0] io_out
);
  wire  sel = io_in[36]; // @[Muxes.scala 16:18]
  wire [17:0] in1 = io_in[35:18]; // @[Muxes.scala 17:18]
  wire [17:0] in0 = io_in[17:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module ShiftLeft_1(
  input  [33:0] io_in,
  output [36:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_12(
  input  [33:0] io_in,
  output [17:0] io_out
);
  wire [36:0] Mux2_000_io_in; // @[RandomHardware_1_12.scala 15:26]
  wire [17:0] Mux2_000_io_out; // @[RandomHardware_1_12.scala 15:26]
  wire [33:0] ShiftLeft_001_io_in; // @[RandomHardware_1_12.scala 16:34]
  wire [36:0] ShiftLeft_001_io_out; // @[RandomHardware_1_12.scala 16:34]
  Mux2_3 Mux2_000 ( // @[RandomHardware_1_12.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  ShiftLeft_1 ShiftLeft_001 ( // @[RandomHardware_1_12.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign Mux2_000_io_in = ShiftLeft_001_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
  assign ShiftLeft_001_io_in = io_in; // @[RandomHardware_1_12.scala 18:25]
endmodule
module ShiftRegister_1(
  input        clock,
  input  [9:0] io_in,
  output [9:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] r0; // @[Memory.scala 78:19]
  reg [9:0] r1; // @[Memory.scala 79:19]
  reg [9:0] r2; // @[Memory.scala 80:19]
  reg [9:0] r3; // @[Memory.scala 81:19]
  assign io_out = r3; // @[Memory.scala 82:10]
  always @(posedge clock) begin
    r0 <= io_in; // @[Memory.scala 78:19]
    r1 <= r0; // @[Memory.scala 79:19]
    r2 <= r1; // @[Memory.scala 80:19]
    r3 <= r2; // @[Memory.scala 81:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_13(
  input         clock,
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_13.scala 15:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 15:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 15:42]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_13.scala 16:42]
  wire [9:0] ShiftRegister_001_io_in; // @[RandomHardware_1_13.scala 16:42]
  wire [9:0] ShiftRegister_001_io_out; // @[RandomHardware_1_13.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRegister_1 ShiftRegister_001 ( // @[RandomHardware_1_13.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[11:0]; // @[RandomHardware_1_13.scala 18:33]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = RandomHardware_000_io_out[9:0]; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
endmodule
module Reg_1(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] io_out_REG; // @[Memory.scala 12:22]
  assign io_out = io_out_REG; // @[Memory.scala 12:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Memory.scala 12:22]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_out_REG = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_14(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_14.scala 14:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_1_14.scala 14:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_1_14.scala 14:26]
  Reg_1 Reg_000 ( // @[RandomHardware_1_14.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_14.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_14.scala 16:25]
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [22:0] io_in,
  output [22:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_15.scala 15:34]
  wire [22:0] Accum_000_io_in; // @[RandomHardware_1_15.scala 15:34]
  wire [22:0] Accum_000_io_out; // @[RandomHardware_1_15.scala 15:34]
  wire  Accum_001_clock; // @[RandomHardware_1_15.scala 16:34]
  wire [22:0] Accum_001_io_in; // @[RandomHardware_1_15.scala 16:34]
  wire [22:0] Accum_001_io_out; // @[RandomHardware_1_15.scala 16:34]
  Accum_2 Accum_000 ( // @[RandomHardware_1_15.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Accum_2 Accum_001 ( // @[RandomHardware_1_15.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_15.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = Accum_001_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 21:18]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = io_in; // @[RandomHardware_1_15.scala 18:25]
endmodule
module Accum_6(
  input        clock,
  input  [9:0] io_in,
  output [9:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] sum; // @[ArithmeticLogical.scala 82:18]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[ArithmeticLogical.scala 83:16]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sum = _RAND_0[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_17(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_17.scala 14:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_17.scala 14:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_17.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:33]
endmodule
module RandomHardware_1_18(
  input         clock,
  input  [21:0] io_in,
  output [7:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_18.scala 14:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_18.scala 14:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_18.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_18.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[7:0]; // @[RandomHardware_1_18.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[11:0]; // @[RandomHardware_1_18.scala 16:33]
endmodule
module Mul_4(
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [4:0] in1 = io_in[9:5]; // @[ArithmeticLogical.scala 47:20]
  wire [4:0] in2 = io_in[4:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_19(
  input         clock,
  input  [30:0] io_in,
  output [9:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_19.scala 15:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_19.scala 15:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_19.scala 15:42]
  wire [9:0] Mul_001_io_in; // @[RandomHardware_1_19.scala 16:26]
  wire [9:0] Mul_001_io_out; // @[RandomHardware_1_19.scala 16:26]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_19.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Mul_4 Mul_001 ( // @[RandomHardware_1_19.scala 16:26]
    .io_in(Mul_001_io_in),
    .io_out(Mul_001_io_out)
  );
  assign io_out = Mul_001_io_out; // @[RandomHardware_1_19.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[11:0]; // @[RandomHardware_1_19.scala 18:33]
  assign Mul_001_io_in = RandomHardware_000_io_out[9:0]; // @[RandomHardware_1_19.scala 13:24 RandomHardware_1_19.scala 21:18]
endmodule
module SignExtendDouble(
  input  [9:0]  io_in,
  output [19:0] io_out
);
  wire [9:0] io_out_hi = io_in[9] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftRight_3(
  input  [9:0] io_in,
  output [9:0] io_out
);
  assign io_out = {{5'd0}, io_in[9:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mux2_4(
  input  [26:0] io_in,
  output [12:0] io_out
);
  wire  sel = io_in[26]; // @[Muxes.scala 16:18]
  wire [12:0] in1 = io_in[25:13]; // @[Muxes.scala 17:18]
  wire [12:0] in0 = io_in[12:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_22(
  input  [26:0] io_in,
  output [12:0] io_out
);
  wire [26:0] Mux2_000_io_in; // @[RandomHardware_1_22.scala 14:26]
  wire [12:0] Mux2_000_io_out; // @[RandomHardware_1_22.scala 14:26]
  Mux2_4 Mux2_000 ( // @[RandomHardware_1_22.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_22.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_22.scala 16:25]
endmodule
module Mul_5(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_23(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] Mul_000_io_in; // @[RandomHardware_1_23.scala 14:26]
  wire [11:0] Mul_000_io_out; // @[RandomHardware_1_23.scala 14:26]
  Mul_5 Mul_000 ( // @[RandomHardware_1_23.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:25]
endmodule
module ReduceAndMux_2(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] IN1 = io_in[12:8]; // @[Muxes.scala 98:27]
  wire [4:0] IN2 = io_in[7:3]; // @[Muxes.scala 99:27]
  wire [2:0] SEL = io_in[2:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_24(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [15:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_24.scala 14:34]
  wire [4:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_24.scala 14:34]
  ReduceAndMux_2 ReduceAndMux_000 ( // @[RandomHardware_1_24.scala 14:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_24.scala 17:10]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_1_24.scala 16:33]
endmodule
module ShiftRight_4(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{2'd0}, io_in[11:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_25(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_1_25.scala 14:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_1_25.scala 14:34]
  ShiftRight_4 ShiftRight_000 ( // @[RandomHardware_1_25.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_25.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_25.scala 16:25]
endmodule
module Reg_2(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] io_out_REG; // @[Memory.scala 12:22]
  assign io_out = io_out_REG; // @[Memory.scala 12:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Memory.scala 12:22]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_out_REG = _RAND_0[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [18:0] r0; // @[Memory.scala 60:19]
  reg [18:0] r1; // @[Memory.scala 61:19]
  reg [18:0] r2; // @[Memory.scala 62:19]
  reg [18:0] r3; // @[Memory.scala 63:19]
  wire [19:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 19'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[18:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 19'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 19'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 19'h0; // @[Memory.scala 63:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r3 <= r2; // @[Memory.scala 68:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[18:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[18:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[18:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_27(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_27.scala 15:26]
  wire [19:0] Reg_000_io_in; // @[RandomHardware_1_27.scala 15:26]
  wire [19:0] Reg_000_io_out; // @[RandomHardware_1_27.scala 15:26]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_27.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_27.scala 16:42]
  wire [19:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_27.scala 16:42]
  wire [18:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_27.scala 16:42]
  Reg_2 Reg_000 ( // @[RandomHardware_1_27.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_1_27.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = ResetShiftRegister_001_io_out; // @[RandomHardware_1_27.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_27.scala 18:25]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = Reg_000_io_out; // @[RandomHardware_1_27.scala 13:24 RandomHardware_1_27.scala 21:18]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [43:0] io_out
);
  wire [34:0] RandomHardware_000_io_in; // @[RandomHardware.scala 58:42]
  wire [16:0] RandomHardware_000_io_out; // @[RandomHardware.scala 58:42]
  wire [23:0] RandomHardware_001_io_in; // @[RandomHardware.scala 59:42]
  wire [6:0] RandomHardware_001_io_out; // @[RandomHardware.scala 59:42]
  wire [7:0] ShiftRight_002_io_in; // @[RandomHardware.scala 60:34]
  wire [7:0] ShiftRight_002_io_out; // @[RandomHardware.scala 60:34]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 61:42]
  wire [11:0] RandomHardware_003_io_in; // @[RandomHardware.scala 61:42]
  wire [11:0] RandomHardware_003_io_out; // @[RandomHardware.scala 61:42]
  wire [46:0] RandomHardware_004_io_in; // @[RandomHardware.scala 62:42]
  wire [19:0] RandomHardware_004_io_out; // @[RandomHardware.scala 62:42]
  wire [7:0] Mul_005_io_in; // @[RandomHardware.scala 63:26]
  wire [7:0] Mul_005_io_out; // @[RandomHardware.scala 63:26]
  wire  Reg_006_clock; // @[RandomHardware.scala 64:26]
  wire [9:0] Reg_006_io_in; // @[RandomHardware.scala 64:26]
  wire [9:0] Reg_006_io_out; // @[RandomHardware.scala 64:26]
  wire  ShiftRegister_007_clock; // @[RandomHardware.scala 65:42]
  wire [6:0] ShiftRegister_007_io_in; // @[RandomHardware.scala 65:42]
  wire [6:0] ShiftRegister_007_io_out; // @[RandomHardware.scala 65:42]
  wire [5:0] Mul_008_io_in; // @[RandomHardware.scala 66:26]
  wire [5:0] Mul_008_io_out; // @[RandomHardware.scala 66:26]
  wire [29:0] RandomHardware_009_io_in; // @[RandomHardware.scala 67:42]
  wire [3:0] RandomHardware_009_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_010_clock; // @[RandomHardware.scala 68:42]
  wire [34:0] RandomHardware_010_io_in; // @[RandomHardware.scala 68:42]
  wire [14:0] RandomHardware_010_io_out; // @[RandomHardware.scala 68:42]
  wire [17:0] RandomHardware_011_io_in; // @[RandomHardware.scala 69:42]
  wire [3:0] RandomHardware_011_io_out; // @[RandomHardware.scala 69:42]
  wire [33:0] RandomHardware_012_io_in; // @[RandomHardware.scala 70:42]
  wire [17:0] RandomHardware_012_io_out; // @[RandomHardware.scala 70:42]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 71:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 71:42]
  wire [9:0] RandomHardware_013_io_out; // @[RandomHardware.scala 71:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 72:42]
  wire [11:0] RandomHardware_014_io_in; // @[RandomHardware.scala 72:42]
  wire [11:0] RandomHardware_014_io_out; // @[RandomHardware.scala 72:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 73:42]
  wire [22:0] RandomHardware_015_io_in; // @[RandomHardware.scala 73:42]
  wire [22:0] RandomHardware_015_io_out; // @[RandomHardware.scala 73:42]
  wire  Accum_016_clock; // @[RandomHardware.scala 74:34]
  wire [9:0] Accum_016_io_in; // @[RandomHardware.scala 74:34]
  wire [9:0] Accum_016_io_out; // @[RandomHardware.scala 74:34]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 75:42]
  wire [11:0] RandomHardware_017_io_in; // @[RandomHardware.scala 75:42]
  wire [11:0] RandomHardware_017_io_out; // @[RandomHardware.scala 75:42]
  wire  RandomHardware_018_clock; // @[RandomHardware.scala 76:42]
  wire [21:0] RandomHardware_018_io_in; // @[RandomHardware.scala 76:42]
  wire [7:0] RandomHardware_018_io_out; // @[RandomHardware.scala 76:42]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 77:42]
  wire [30:0] RandomHardware_019_io_in; // @[RandomHardware.scala 77:42]
  wire [9:0] RandomHardware_019_io_out; // @[RandomHardware.scala 77:42]
  wire [9:0] SignExtendDouble_020_io_in; // @[RandomHardware.scala 78:42]
  wire [19:0] SignExtendDouble_020_io_out; // @[RandomHardware.scala 78:42]
  wire [9:0] ShiftRight_021_io_in; // @[RandomHardware.scala 79:34]
  wire [9:0] ShiftRight_021_io_out; // @[RandomHardware.scala 79:34]
  wire [26:0] RandomHardware_022_io_in; // @[RandomHardware.scala 80:42]
  wire [12:0] RandomHardware_022_io_out; // @[RandomHardware.scala 80:42]
  wire [11:0] RandomHardware_023_io_in; // @[RandomHardware.scala 81:42]
  wire [11:0] RandomHardware_023_io_out; // @[RandomHardware.scala 81:42]
  wire [15:0] RandomHardware_024_io_in; // @[RandomHardware.scala 82:42]
  wire [4:0] RandomHardware_024_io_out; // @[RandomHardware.scala 82:42]
  wire [11:0] RandomHardware_025_io_in; // @[RandomHardware.scala 83:42]
  wire [11:0] RandomHardware_025_io_out; // @[RandomHardware.scala 83:42]
  wire  RandomHardware_026_clock; // @[RandomHardware.scala 84:42]
  wire [11:0] RandomHardware_026_io_in; // @[RandomHardware.scala 84:42]
  wire [11:0] RandomHardware_026_io_out; // @[RandomHardware.scala 84:42]
  wire  RandomHardware_027_clock; // @[RandomHardware.scala 85:42]
  wire  RandomHardware_027_reset; // @[RandomHardware.scala 85:42]
  wire [19:0] RandomHardware_027_io_in; // @[RandomHardware.scala 85:42]
  wire [18:0] RandomHardware_027_io_out; // @[RandomHardware.scala 85:42]
  wire [27:0] io_out_lo = {RandomHardware_015_io_out,RandomHardware_024_io_out}; // @[Cat.scala 30:58]
  wire [15:0] io_out_hi = {RandomHardware_003_io_out,RandomHardware_009_io_out}; // @[Cat.scala 30:58]
  wire [14:0] wire_000 = RandomHardware_010_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 109:18]
  wire [19:0] wire_001 = SignExtendDouble_020_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 127:18]
  wire [11:0] wire_002 = RandomHardware_023_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 134:18]
  wire [46:0] _RandomHardware_000_io_in_T = {wire_000,wire_001,wire_002}; // @[Cat.scala 30:58]
  wire [8:0] wire_006 = RandomHardware_012_io_out[17:9]; // @[RandomHardware.scala 116:47]
  wire [18:0] wire_007 = RandomHardware_027_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 156:18]
  wire [27:0] RandomHardware_004_io_in_lo = {wire_006,wire_007}; // @[Cat.scala 30:58]
  wire [3:0] wire_005 = RandomHardware_011_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 113:18]
  wire [18:0] RandomHardware_004_io_in_hi = {wire_000,wire_005}; // @[Cat.scala 30:58]
  wire [5:0] wire_016 = RandomHardware_014_io_out[5:0]; // @[RandomHardware.scala 152:47]
  wire [11:0] wire_017 = RandomHardware_017_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 154:18]
  wire [17:0] RandomHardware_010_io_in_lo = {wire_016,wire_017}; // @[Cat.scala 30:58]
  wire [6:0] wire_014 = RandomHardware_001_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 143:18]
  wire [9:0] wire_015 = RandomHardware_013_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 148:18]
  wire [16:0] RandomHardware_010_io_in_hi = {wire_014,wire_015}; // @[Cat.scala 30:58]
  wire [7:0] wire_018 = ShiftRight_002_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 146:18]
  wire [9:0] wire_019 = RandomHardware_019_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 124:18]
  wire [9:0] wire_022 = Reg_006_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 102:18]
  wire [12:0] wire_023 = RandomHardware_022_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 132:18]
  wire [7:0] wire_021 = Mul_005_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 100:18]
  wire [37:0] _RandomHardware_012_io_in_T = {wire_014,wire_021,wire_022,wire_023}; // @[Cat.scala 30:58]
  wire [11:0] wire_030 = RandomHardware_026_io_out; // @[RandomHardware.scala 43:24 RandomHardware.scala 139:18]
  wire [5:0] wire_027 = Mul_008_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 106:18]
  wire [33:0] _RandomHardware_018_io_in_T = {wire_027,wire_005,wire_002,wire_030}; // @[Cat.scala 30:58]
  wire [20:0] RandomHardware_019_io_in_hi = {wire_027,wire_000}; // @[Cat.scala 30:58]
  wire [14:0] RandomHardware_022_io_in_hi = {wire_014,wire_018}; // @[Cat.scala 30:58]
  wire [19:0] wire_012 = RandomHardware_004_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 98:18]
  wire [16:0] wire_024 = RandomHardware_000_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 96:18]
  wire [9:0] wire_025 = ShiftRight_021_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 130:18]
  wire [26:0] _RandomHardware_015_io_in_T = {wire_024,wire_025}; // @[Cat.scala 30:58]
  wire [6:0] wire_040 = ShiftRegister_007_io_out; // @[RandomHardware.scala 53:24 RandomHardware.scala 104:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 58:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 59:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ShiftRight_1 ShiftRight_002 ( // @[RandomHardware.scala 60:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 61:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  Mul Mul_005 ( // @[RandomHardware.scala 63:26]
    .io_in(Mul_005_io_in),
    .io_out(Mul_005_io_out)
  );
  Reg Reg_006 ( // @[RandomHardware.scala 64:26]
    .clock(Reg_006_clock),
    .io_in(Reg_006_io_in),
    .io_out(Reg_006_io_out)
  );
  ShiftRegister ShiftRegister_007 ( // @[RandomHardware.scala 65:42]
    .clock(ShiftRegister_007_clock),
    .io_in(ShiftRegister_007_io_in),
    .io_out(ShiftRegister_007_io_out)
  );
  Mul_1 Mul_008 ( // @[RandomHardware.scala 66:26]
    .io_in(Mul_008_io_in),
    .io_out(Mul_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 67:42]
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_010_clock),
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 69:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 70:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 71:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 72:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 73:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  Accum_6 Accum_016 ( // @[RandomHardware.scala 74:34]
    .clock(Accum_016_clock),
    .io_in(Accum_016_io_in),
    .io_out(Accum_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 75:42]
    .clock(RandomHardware_017_clock),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 76:42]
    .clock(RandomHardware_018_clock),
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 77:42]
    .clock(RandomHardware_019_clock),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  SignExtendDouble SignExtendDouble_020 ( // @[RandomHardware.scala 78:42]
    .io_in(SignExtendDouble_020_io_in),
    .io_out(SignExtendDouble_020_io_out)
  );
  ShiftRight_3 ShiftRight_021 ( // @[RandomHardware.scala 79:34]
    .io_in(ShiftRight_021_io_in),
    .io_out(ShiftRight_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 80:42]
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 81:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 82:42]
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  RandomHardware_1_25 RandomHardware_025 ( // @[RandomHardware.scala 83:42]
    .io_in(RandomHardware_025_io_in),
    .io_out(RandomHardware_025_io_out)
  );
  RandomHardware_1_17 RandomHardware_026 ( // @[RandomHardware.scala 84:42]
    .clock(RandomHardware_026_clock),
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  RandomHardware_1_27 RandomHardware_027 ( // @[RandomHardware.scala 85:42]
    .clock(RandomHardware_027_clock),
    .reset(RandomHardware_027_reset),
    .io_in(RandomHardware_027_io_in),
    .io_out(RandomHardware_027_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = _RandomHardware_000_io_in_T[34:0]; // @[RandomHardware.scala 95:33]
  assign RandomHardware_001_io_in = io_in[99:76]; // @[RandomHardware.scala 87:41]
  assign ShiftRight_002_io_in = io_in[7:0]; // @[RandomHardware.scala 88:33]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = RandomHardware_017_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 153:18]
  assign RandomHardware_004_io_in = {RandomHardware_004_io_in_hi,RandomHardware_004_io_in_lo}; // @[Cat.scala 30:58]
  assign Mul_005_io_in = RandomHardware_018_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 121:18]
  assign Reg_006_clock = clock;
  assign Reg_006_io_in = ShiftRight_021_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 129:18]
  assign ShiftRegister_007_clock = clock;
  assign ShiftRegister_007_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 142:18]
  assign Mul_008_io_in = RandomHardware_014_io_out[5:0]; // @[RandomHardware.scala 151:47]
  assign RandomHardware_009_io_in = {wire_012,wire_019}; // @[Cat.scala 30:58]
  assign RandomHardware_010_clock = clock;
  assign RandomHardware_010_io_in = {RandomHardware_010_io_in_hi,RandomHardware_010_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_011_io_in = {wire_018,wire_019}; // @[Cat.scala 30:58]
  assign RandomHardware_012_io_in = _RandomHardware_012_io_in_T[33:0]; // @[RandomHardware.scala 115:33]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = io_in[99:76]; // @[RandomHardware.scala 89:41]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = io_in[99:88]; // @[RandomHardware.scala 90:41]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = _RandomHardware_015_io_in_T[22:0]; // @[RandomHardware.scala 159:33]
  assign Accum_016_clock = clock;
  assign Accum_016_io_in = RandomHardware_019_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 125:18]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_io_in = io_in[11:0]; // @[RandomHardware.scala 91:41]
  assign RandomHardware_018_clock = clock;
  assign RandomHardware_018_io_in = _RandomHardware_018_io_in_T[21:0]; // @[RandomHardware.scala 120:33]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_io_in = {RandomHardware_019_io_in_hi,wire_015}; // @[Cat.scala 30:58]
  assign SignExtendDouble_020_io_in = RandomHardware_013_io_out; // @[RandomHardware.scala 47:24 RandomHardware.scala 150:18]
  assign ShiftRight_021_io_in = Accum_016_io_out; // @[RandomHardware.scala 48:24 RandomHardware.scala 119:18]
  assign RandomHardware_022_io_in = {RandomHardware_022_io_in_hi,wire_030}; // @[Cat.scala 30:58]
  assign RandomHardware_023_io_in = RandomHardware_026_io_out; // @[RandomHardware.scala 52:24 RandomHardware.scala 141:18]
  assign RandomHardware_024_io_in = {wire_040,wire_006}; // @[Cat.scala 30:58]
  assign RandomHardware_025_io_in = RandomHardware_017_io_out; // @[RandomHardware.scala 55:24 RandomHardware.scala 155:18]
  assign RandomHardware_026_clock = clock;
  assign RandomHardware_026_io_in = RandomHardware_025_io_out; // @[RandomHardware.scala 56:24 RandomHardware.scala 137:18]
  assign RandomHardware_027_clock = clock;
  assign RandomHardware_027_reset = reset;
  assign RandomHardware_027_io_in = io_in[19:0]; // @[RandomHardware.scala 92:41]
endmodule
