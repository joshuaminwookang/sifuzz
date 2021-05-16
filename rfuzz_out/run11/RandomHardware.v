module CompareMux(
  input  [23:0] io_in,
  output [10:0] io_out
);
  wire [11:0] IN1 = io_in[23:12]; // @[Muxes.scala 134:27]
  wire [10:0] IN2 = io_in[12:2]; // @[Muxes.scala 135:27]
  wire  SEL1 = io_in[1]; // @[Muxes.scala 136:27]
  wire  SEL2 = io_in[0]; // @[Muxes.scala 137:27]
  wire [11:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{1'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[10:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_0(
  input  [23:0] io_in,
  output [10:0] io_out
);
  wire [23:0] CompareMux_000_io_in; // @[RandomHardware_1_0.scala 14:34]
  wire [10:0] CompareMux_000_io_out; // @[RandomHardware_1_0.scala 14:34]
  CompareMux CompareMux_000 ( // @[RandomHardware_1_0.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:25]
endmodule
module Mux2(
  input  [38:0] io_in,
  output [18:0] io_out
);
  wire  sel = io_in[38]; // @[Muxes.scala 16:18]
  wire [18:0] in1 = io_in[37:19]; // @[Muxes.scala 17:18]
  wire [18:0] in0 = io_in[18:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module ShiftRegister(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [18:0] r0; // @[Memory.scala 78:19]
  reg [18:0] r1; // @[Memory.scala 79:19]
  reg [18:0] r2; // @[Memory.scala 80:19]
  reg [18:0] r3; // @[Memory.scala 81:19]
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
module RandomHardware_2_1(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_2_1.scala 14:42]
  wire [18:0] ShiftRegister_000_io_in; // @[RandomHardware_2_1.scala 14:42]
  wire [18:0] ShiftRegister_000_io_out; // @[RandomHardware_2_1.scala 14:42]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware_2_1.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_2_1.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_2_1.scala 16:33]
endmodule
module RandomHardware_1_1(
  input         clock,
  input  [38:0] io_in,
  output [18:0] io_out
);
  wire [38:0] Mux2_000_io_in; // @[RandomHardware_1_1.scala 15:26]
  wire [18:0] Mux2_000_io_out; // @[RandomHardware_1_1.scala 15:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_1.scala 16:42]
  wire [18:0] RandomHardware_001_io_in; // @[RandomHardware_1_1.scala 16:42]
  wire [18:0] RandomHardware_001_io_out; // @[RandomHardware_1_1.scala 16:42]
  Mux2 Mux2_000 ( // @[RandomHardware_1_1.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_1.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = RandomHardware_001_io_out; // @[RandomHardware_1_1.scala 19:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_1.scala 18:25]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = Mux2_000_io_out; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 21:18]
endmodule
module ShiftRight(
  input  [4:0] io_in,
  output [4:0] io_out
);
  assign io_out = {{4'd0}, io_in[4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftLeft(
  input  [12:0] io_in,
  output [15:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_3(
  input  [12:0] io_in,
  output [15:0] io_out
);
  wire [12:0] ShiftLeft_000_io_in; // @[RandomHardware_1_3.scala 14:34]
  wire [15:0] ShiftLeft_000_io_out; // @[RandomHardware_1_3.scala 14:34]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_3.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module Sub(
  input  [27:0] io_in,
  output [14:0] io_out
);
  wire [13:0] in1 = io_in[27:14]; // @[ArithmeticLogical.scala 24:30]
  wire [13:0] in2 = io_in[13:0]; // @[ArithmeticLogical.scala 25:28]
  wire [13:0] _io_out_T = $signed(in1) - $signed(in2); // @[ArithmeticLogical.scala 27:19]
  assign io_out = {{1'd0}, _io_out_T}; // @[ArithmeticLogical.scala 27:19]
endmodule
module SignExtendDouble(
  input  [12:0] io_in,
  output [25:0] io_out
);
  wire [12:0] io_out_hi = io_in[12] ? 13'h1fff : 13'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft_1(
  input  [23:0] io_in,
  output [27:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Accum(
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
module ReduceAndMux(
  input  [19:0] io_in,
  output [5:0]  io_out
);
  wire [5:0] IN1 = io_in[15:10]; // @[Muxes.scala 98:27]
  wire [5:0] IN2 = io_in[9:4]; // @[Muxes.scala 99:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ShiftRegister_1(
  input        clock,
  input  [7:0] io_in,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] r0; // @[Memory.scala 78:19]
  reg [7:0] r1; // @[Memory.scala 79:19]
  reg [7:0] r2; // @[Memory.scala 80:19]
  reg [7:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceOrMux(
  input  [25:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] IN1 = io_in[25:16]; // @[Muxes.scala 110:27]
  wire [9:0] IN2 = io_in[15:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module Mul(
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [4:0] in1 = io_in[9:5]; // @[ArithmeticLogical.scala 47:20]
  wire [4:0] in2 = io_in[4:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_2_6(
  input  [25:0] io_in,
  output [9:0]  io_out
);
  wire [25:0] ReduceOrMux_000_io_in; // @[RandomHardware_2_6.scala 15:34]
  wire [9:0] ReduceOrMux_000_io_out; // @[RandomHardware_2_6.scala 15:34]
  wire [9:0] Mul_001_io_in; // @[RandomHardware_2_6.scala 16:26]
  wire [9:0] Mul_001_io_out; // @[RandomHardware_2_6.scala 16:26]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_2_6.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  Mul Mul_001 ( // @[RandomHardware_2_6.scala 16:26]
    .io_in(Mul_001_io_in),
    .io_out(Mul_001_io_out)
  );
  assign io_out = Mul_001_io_out; // @[RandomHardware_2_6.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_2_6.scala 18:33]
  assign Mul_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_2_6.scala 13:24 RandomHardware_2_6.scala 21:18]
endmodule
module RandomHardware_1_4(
  input         clock,
  input  [51:0] io_in,
  output [32:0] io_out
);
  wire [27:0] Sub_000_io_in; // @[RandomHardware_1_4.scala 20:26]
  wire [14:0] Sub_000_io_out; // @[RandomHardware_1_4.scala 20:26]
  wire [12:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_4.scala 21:42]
  wire [25:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_4.scala 21:42]
  wire [23:0] ShiftLeft_002_io_in; // @[RandomHardware_1_4.scala 22:34]
  wire [27:0] ShiftLeft_002_io_out; // @[RandomHardware_1_4.scala 22:34]
  wire  Accum_003_clock; // @[RandomHardware_1_4.scala 23:34]
  wire [22:0] Accum_003_io_in; // @[RandomHardware_1_4.scala 23:34]
  wire [22:0] Accum_003_io_out; // @[RandomHardware_1_4.scala 23:34]
  wire [19:0] ReduceAndMux_004_io_in; // @[RandomHardware_1_4.scala 24:34]
  wire [5:0] ReduceAndMux_004_io_out; // @[RandomHardware_1_4.scala 24:34]
  wire  ShiftRegister_005_clock; // @[RandomHardware_1_4.scala 25:42]
  wire [7:0] ShiftRegister_005_io_in; // @[RandomHardware_1_4.scala 25:42]
  wire [7:0] ShiftRegister_005_io_out; // @[RandomHardware_1_4.scala 25:42]
  wire [25:0] RandomHardware_006_io_in; // @[RandomHardware_1_4.scala 26:42]
  wire [9:0] RandomHardware_006_io_out; // @[RandomHardware_1_4.scala 26:42]
  wire [6:0] wire_001 = Sub_000_io_out[6:0]; // @[RandomHardware_1_4.scala 34:36]
  wire [5:0] wire_003 = ReduceAndMux_004_io_out; // @[RandomHardware_1_4.scala 16:24 RandomHardware_1_4.scala 39:18]
  wire [14:0] wire_004 = Sub_000_io_out; // @[RandomHardware_1_4.scala 17:24 RandomHardware_1_4.scala 35:18]
  wire [7:0] wire_005 = ShiftRegister_005_io_out; // @[RandomHardware_1_4.scala 18:24 RandomHardware_1_4.scala 40:18]
  Sub Sub_000 ( // @[RandomHardware_1_4.scala 20:26]
    .io_in(Sub_000_io_in),
    .io_out(Sub_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_1_4.scala 21:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  ShiftLeft_1 ShiftLeft_002 ( // @[RandomHardware_1_4.scala 22:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  Accum Accum_003 ( // @[RandomHardware_1_4.scala 23:34]
    .clock(Accum_003_clock),
    .io_in(Accum_003_io_in),
    .io_out(Accum_003_io_out)
  );
  ReduceAndMux ReduceAndMux_004 ( // @[RandomHardware_1_4.scala 24:34]
    .io_in(ReduceAndMux_004_io_in),
    .io_out(ReduceAndMux_004_io_out)
  );
  ShiftRegister_1 ShiftRegister_005 ( // @[RandomHardware_1_4.scala 25:42]
    .clock(ShiftRegister_005_clock),
    .io_in(ShiftRegister_005_io_in),
    .io_out(ShiftRegister_005_io_out)
  );
  RandomHardware_2_6 RandomHardware_006 ( // @[RandomHardware_1_4.scala 26:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  assign io_out = {Accum_003_io_out,RandomHardware_006_io_out}; // @[Cat.scala 30:58]
  assign Sub_000_io_in = ShiftLeft_002_io_out; // @[RandomHardware_1_4.scala 13:24 RandomHardware_1_4.scala 38:18]
  assign SignExtendDouble_001_io_in = {wire_001,wire_003}; // @[Cat.scala 30:58]
  assign ShiftLeft_002_io_in = io_in[23:0]; // @[RandomHardware_1_4.scala 28:33]
  assign Accum_003_clock = clock;
  assign Accum_003_io_in = {wire_004,wire_005}; // @[Cat.scala 30:58]
  assign ReduceAndMux_004_io_in = io_in[19:0]; // @[RandomHardware_1_4.scala 29:41]
  assign ShiftRegister_005_clock = clock;
  assign ShiftRegister_005_io_in = io_in[7:0]; // @[RandomHardware_1_4.scala 30:41]
  assign RandomHardware_006_io_in = SignExtendDouble_001_io_out; // @[RandomHardware_1_4.scala 15:24 RandomHardware_1_4.scala 37:18]
endmodule
module ShiftRight_1(
  input  [28:0] io_in,
  output [28:0] io_out
);
  assign io_out = {{2'd0}, io_in[28:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_2_0(
  input  [28:0] io_in,
  output [28:0] io_out
);
  wire [28:0] ShiftRight_000_io_in; // @[RandomHardware_2_0.scala 14:34]
  wire [28:0] ShiftRight_000_io_out; // @[RandomHardware_2_0.scala 14:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_2_0.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:25]
endmodule
module RandomHardware_1_5(
  input  [31:0] io_in,
  output [14:0] io_out
);
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_5.scala 14:42]
  wire [28:0] RandomHardware_000_io_out; // @[RandomHardware_1_5.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_5.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[14:0]; // @[RandomHardware_1_5.scala 17:10]
  assign RandomHardware_000_io_in = io_in[28:0]; // @[RandomHardware_1_5.scala 16:33]
endmodule
module ShiftLeft_2(
  input  [8:0]  io_in,
  output [12:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_7(
  input  [18:0] io_in,
  output [37:0] io_out
);
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_7.scala 14:42]
  wire [28:0] RandomHardware_000_io_out; // @[RandomHardware_1_7.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_7.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{9'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_7.scala 17:10]
  assign RandomHardware_000_io_in = {{10'd0}, io_in}; // @[RandomHardware_1_7.scala 16:33]
endmodule
module ReduceOrMux_1(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[19:12]; // @[Muxes.scala 110:27]
  wire [7:0] IN2 = io_in[11:4]; // @[Muxes.scala 111:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftRegister_3(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] r0; // @[Memory.scala 78:19]
  reg [19:0] r1; // @[Memory.scala 79:19]
  reg [19:0] r2; // @[Memory.scala 80:19]
  reg [19:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[19:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_8(
  input         clock,
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_8.scala 16:42]
  wire [7:0] ShiftRegister_000_io_in; // @[RandomHardware_1_8.scala 16:42]
  wire [7:0] ShiftRegister_000_io_out; // @[RandomHardware_1_8.scala 16:42]
  wire [19:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_8.scala 17:34]
  wire [7:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_8.scala 17:34]
  wire  ShiftRegister_002_clock; // @[RandomHardware_1_8.scala 18:42]
  wire [19:0] ShiftRegister_002_io_in; // @[RandomHardware_1_8.scala 18:42]
  wire [19:0] ShiftRegister_002_io_out; // @[RandomHardware_1_8.scala 18:42]
  ShiftRegister_1 ShiftRegister_000 ( // @[RandomHardware_1_8.scala 16:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  ReduceOrMux_1 ReduceOrMux_001 ( // @[RandomHardware_1_8.scala 17:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  ShiftRegister_3 ShiftRegister_002 ( // @[RandomHardware_1_8.scala 18:42]
    .clock(ShiftRegister_002_clock),
    .io_in(ShiftRegister_002_io_in),
    .io_out(ShiftRegister_002_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_8.scala 21:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_8.scala 13:24 RandomHardware_1_8.scala 24:18]
  assign ReduceOrMux_001_io_in = ShiftRegister_002_io_out; // @[RandomHardware_1_8.scala 14:24 RandomHardware_1_8.scala 25:18]
  assign ShiftRegister_002_clock = clock;
  assign ShiftRegister_002_io_in = io_in; // @[RandomHardware_1_8.scala 20:33]
endmodule
module ReduceOrMux_2(
  input  [29:0] io_in,
  output [11:0] io_out
);
  wire [11:0] IN1 = io_in[29:18]; // @[Muxes.scala 110:27]
  wire [11:0] IN2 = io_in[17:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module Reg(
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
module ShiftRegister_4(
  input        clock,
  input  [5:0] io_in,
  output [5:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] r0; // @[Memory.scala 78:19]
  reg [5:0] r1; // @[Memory.scala 79:19]
  reg [5:0] r2; // @[Memory.scala 80:19]
  reg [5:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_9(
  input         clock,
  input  [29:0] io_in,
  output [17:0] io_out
);
  wire [29:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_9.scala 16:34]
  wire [11:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_9.scala 16:34]
  wire  Reg_001_clock; // @[RandomHardware_1_9.scala 17:26]
  wire [11:0] Reg_001_io_in; // @[RandomHardware_1_9.scala 17:26]
  wire [11:0] Reg_001_io_out; // @[RandomHardware_1_9.scala 17:26]
  wire  ShiftRegister_002_clock; // @[RandomHardware_1_9.scala 18:42]
  wire [5:0] ShiftRegister_002_io_in; // @[RandomHardware_1_9.scala 18:42]
  wire [5:0] ShiftRegister_002_io_out; // @[RandomHardware_1_9.scala 18:42]
  ReduceOrMux_2 ReduceOrMux_000 ( // @[RandomHardware_1_9.scala 16:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_1_9.scala 17:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  ShiftRegister_4 ShiftRegister_002 ( // @[RandomHardware_1_9.scala 18:42]
    .clock(ShiftRegister_002_clock),
    .io_in(ShiftRegister_002_io_in),
    .io_out(ShiftRegister_002_io_out)
  );
  assign io_out = {Reg_001_io_out,ShiftRegister_002_io_out}; // @[Cat.scala 30:58]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_9.scala 20:33]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 23:18]
  assign ShiftRegister_002_clock = clock;
  assign ShiftRegister_002_io_in = ReduceOrMux_000_io_out[11:6]; // @[RandomHardware_1_9.scala 24:44]
endmodule
module SignExtendDouble_1(
  input  [4:0] io_in,
  output [9:0] io_out
);
  wire [4:0] io_out_hi = io_in[4] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module SignExtendDouble_2(
  input  [9:0]  io_in,
  output [19:0] io_out
);
  wire [9:0] io_out_hi = io_in[9] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceXorMux(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] IN1 = io_in[19:15]; // @[Muxes.scala 122:27]
  wire [4:0] IN2 = io_in[14:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_12(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [19:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_12.scala 15:34]
  wire [4:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 15:34]
  wire [4:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_12.scala 16:42]
  wire [9:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_12.scala 16:42]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_12.scala 15:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_001 ( // @[RandomHardware_1_12.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_12.scala 18:33]
  assign SignExtendDouble_001_io_in = ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
endmodule
module RegE(
  input         clock,
  input  [23:0] io_in,
  output [22:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [22:0] data = io_in[23:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [21:0] reg_; // @[Memory.scala 22:18]
  wire [22:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[21:0];
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
  reg_ = _RAND_0[21:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRegister_5(
  input         clock,
  input  [22:0] io_in,
  output [22:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [22:0] r0; // @[Memory.scala 78:19]
  reg [22:0] r1; // @[Memory.scala 79:19]
  reg [22:0] r2; // @[Memory.scala 80:19]
  reg [22:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[22:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[22:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[22:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[22:0];
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
  output [22:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_13.scala 15:26]
  wire [23:0] RegE_000_io_in; // @[RandomHardware_1_13.scala 15:26]
  wire [22:0] RegE_000_io_out; // @[RandomHardware_1_13.scala 15:26]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_13.scala 16:42]
  wire [22:0] ShiftRegister_001_io_in; // @[RandomHardware_1_13.scala 16:42]
  wire [22:0] ShiftRegister_001_io_out; // @[RandomHardware_1_13.scala 16:42]
  RegE RegE_000 ( // @[RandomHardware_1_13.scala 15:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  ShiftRegister_5 ShiftRegister_001 ( // @[RandomHardware_1_13.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = io_in; // @[RandomHardware_1_13.scala 18:25]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = RegE_000_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
endmodule
module ShiftLeft_3(
  input  [4:0] io_in,
  output [8:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRight_3(
  input  [9:0] io_in,
  output [9:0] io_out
);
  assign io_out = {{2'd0}, io_in[9:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mux2_1(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  sel = io_in[20]; // @[Muxes.scala 16:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 17:18]
  wire [9:0] in0 = io_in[9:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module ShiftRegister_6(
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
module RandomHardware_1_16(
  input         clock,
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire [20:0] Mux2_000_io_in; // @[RandomHardware_1_16.scala 15:26]
  wire [9:0] Mux2_000_io_out; // @[RandomHardware_1_16.scala 15:26]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_16.scala 16:42]
  wire [9:0] ShiftRegister_001_io_in; // @[RandomHardware_1_16.scala 16:42]
  wire [9:0] ShiftRegister_001_io_out; // @[RandomHardware_1_16.scala 16:42]
  Mux2_1 Mux2_000 ( // @[RandomHardware_1_16.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  ShiftRegister_6 ShiftRegister_001 ( // @[RandomHardware_1_16.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_16.scala 19:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_16.scala 18:25]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = Mux2_000_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 21:18]
endmodule
module ReduceAndMux_1(
  input  [43:0] io_in,
  output [20:0] io_out
);
  wire [20:0] IN1 = io_in[42:22]; // @[Muxes.scala 98:27]
  wire [20:0] IN2 = io_in[21:1]; // @[Muxes.scala 99:27]
  wire  SEL = io_in[0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ShiftRight_4(
  input  [20:0] io_in,
  output [20:0] io_out
);
  assign io_out = {{2'd0}, io_in[20:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_17(
  input  [43:0] io_in,
  output [20:0] io_out
);
  wire [43:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_17.scala 15:34]
  wire [20:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_17.scala 15:34]
  wire [20:0] ShiftRight_001_io_in; // @[RandomHardware_1_17.scala 16:34]
  wire [20:0] ShiftRight_001_io_out; // @[RandomHardware_1_17.scala 16:34]
  ReduceAndMux_1 ReduceAndMux_000 ( // @[RandomHardware_1_17.scala 15:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  ShiftRight_4 ShiftRight_001 ( // @[RandomHardware_1_17.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = ShiftRight_001_io_out; // @[RandomHardware_1_17.scala 19:10]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_1_17.scala 18:33]
  assign ShiftRight_001_io_in = ReduceAndMux_000_io_out; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 21:18]
endmodule
module RandomHardware_1_18(
  input  [28:0] io_in,
  output [28:0] io_out
);
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_18.scala 14:42]
  wire [28:0] RandomHardware_000_io_out; // @[RandomHardware_1_18.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_18.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:33]
endmodule
module Reg_1(
  input        clock,
  input  [8:0] io_in,
  output [8:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_6(
  input  [8:0] io_in,
  output [8:0] io_out
);
  assign io_out = {{1'd0}, io_in[8:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mux8(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [2:0] sel = io_in[18:16]; // @[Muxes.scala 44:18]
  wire [9:0] in7 = io_in[15:6]; // @[Muxes.scala 45:18]
  wire [9:0] in6 = io_in[13:4]; // @[Muxes.scala 46:18]
  wire [1:0] in5 = io_in[11:10]; // @[Muxes.scala 47:18]
  wire [1:0] in4 = io_in[9:8]; // @[Muxes.scala 48:18]
  wire [1:0] in3 = io_in[7:6]; // @[Muxes.scala 49:18]
  wire [1:0] in2 = io_in[5:4]; // @[Muxes.scala 50:18]
  wire [1:0] in1 = io_in[3:2]; // @[Muxes.scala 51:18]
  wire [1:0] in0 = io_in[1:0]; // @[Muxes.scala 52:18]
  wire [1:0] _GEN_0 = sel == 3'h1 ? in1 : in0; // @[Muxes.scala 59:32 Muxes.scala 59:41 Muxes.scala 60:36]
  wire [1:0] _GEN_1 = sel == 3'h2 ? in2 : _GEN_0; // @[Muxes.scala 58:32 Muxes.scala 58:41]
  wire [1:0] _GEN_2 = sel == 3'h3 ? in3 : _GEN_1; // @[Muxes.scala 57:32 Muxes.scala 57:41]
  wire [1:0] _GEN_3 = sel == 3'h4 ? in4 : _GEN_2; // @[Muxes.scala 56:32 Muxes.scala 56:41]
  wire [1:0] _GEN_4 = sel == 3'h5 ? in5 : _GEN_3; // @[Muxes.scala 55:32 Muxes.scala 55:41]
  wire [9:0] _GEN_5 = sel == 3'h6 ? in6 : {{8'd0}, _GEN_4}; // @[Muxes.scala 54:32 Muxes.scala 54:41]
  wire [9:0] _GEN_6 = sel == 3'h7 ? in7 : _GEN_5; // @[Muxes.scala 53:32 Muxes.scala 53:41]
  assign io_out = _GEN_6[1:0];
endmodule
module Accum_1(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [18:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftLeft_4(
  input  [1:0] io_in,
  output [2:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceAndMux_2(
  input  [43:0] io_in,
  output [18:0] io_out
);
  wire [18:0] IN1 = io_in[40:22]; // @[Muxes.scala 98:27]
  wire [18:0] IN2 = io_in[21:3]; // @[Muxes.scala 99:27]
  wire [2:0] SEL = io_in[2:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_21(
  input         clock,
  input  [43:0] io_in,
  output [21:0] io_out
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_1_21.scala 17:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_1_21.scala 17:26]
  wire  Accum_001_clock; // @[RandomHardware_1_21.scala 18:34]
  wire [18:0] Accum_001_io_in; // @[RandomHardware_1_21.scala 18:34]
  wire [18:0] Accum_001_io_out; // @[RandomHardware_1_21.scala 18:34]
  wire [1:0] ShiftLeft_002_io_in; // @[RandomHardware_1_21.scala 19:34]
  wire [2:0] ShiftLeft_002_io_out; // @[RandomHardware_1_21.scala 19:34]
  wire [43:0] ReduceAndMux_003_io_in; // @[RandomHardware_1_21.scala 20:34]
  wire [18:0] ReduceAndMux_003_io_out; // @[RandomHardware_1_21.scala 20:34]
  Mux8 Mux8_000 ( // @[RandomHardware_1_21.scala 17:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  Accum_1 Accum_001 ( // @[RandomHardware_1_21.scala 18:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  ShiftLeft_4 ShiftLeft_002 ( // @[RandomHardware_1_21.scala 19:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  ReduceAndMux_2 ReduceAndMux_003 ( // @[RandomHardware_1_21.scala 20:34]
    .io_in(ReduceAndMux_003_io_in),
    .io_out(ReduceAndMux_003_io_out)
  );
  assign io_out = {Accum_001_io_out,ShiftLeft_002_io_out}; // @[Cat.scala 30:58]
  assign Mux8_000_io_in = ReduceAndMux_003_io_out; // @[RandomHardware_1_21.scala 14:24 RandomHardware_1_21.scala 27:18]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = ReduceAndMux_003_io_out; // @[RandomHardware_1_21.scala 15:24 RandomHardware_1_21.scala 28:18]
  assign ShiftLeft_002_io_in = Mux8_000_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 26:18]
  assign ReduceAndMux_003_io_in = io_in; // @[RandomHardware_1_21.scala 22:33]
endmodule
module Mux4(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [1:0] sel = io_in[17:16]; // @[Muxes.scala 28:18]
  wire [3:0] in3 = io_in[15:12]; // @[Muxes.scala 29:18]
  wire [3:0] in2 = io_in[11:8]; // @[Muxes.scala 30:18]
  wire [3:0] in1 = io_in[7:4]; // @[Muxes.scala 31:18]
  wire [3:0] in0 = io_in[3:0]; // @[Muxes.scala 32:18]
  wire [3:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [3:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module RandomHardware_1_23(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [17:0] Mux4_000_io_in; // @[RandomHardware_1_23.scala 14:26]
  wire [3:0] Mux4_000_io_out; // @[RandomHardware_1_23.scala 14:26]
  Mux4 Mux4_000 ( // @[RandomHardware_1_23.scala 14:26]
    .io_in(Mux4_000_io_in),
    .io_out(Mux4_000_io_out)
  );
  assign io_out = Mux4_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign Mux4_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:25]
endmodule
module ReduceXorMux_1(
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] IN1 = io_in[23:14]; // @[Muxes.scala 122:27]
  wire [9:0] IN2 = io_in[13:4]; // @[Muxes.scala 123:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_24(
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire [23:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_24.scala 14:34]
  wire [9:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_24.scala 14:34]
  ReduceXorMux_1 ReduceXorMux_000 ( // @[RandomHardware_1_24.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_24.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_24.scala 16:33]
endmodule
module ShiftRegister_8(
  input        clock,
  input  [4:0] io_in,
  output [4:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] r0; // @[Memory.scala 78:19]
  reg [4:0] r1; // @[Memory.scala 79:19]
  reg [4:0] r2; // @[Memory.scala 80:19]
  reg [4:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftLeft_5(
  input  [32:0] io_in,
  output [37:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Accum_2(
  input         clock,
  input  [32:0] io_in,
  output [32:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [32:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  _RAND_0 = {2{`RANDOM}};
  sum = _RAND_0[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_26(
  input         clock,
  input  [32:0] io_in,
  output [37:0] io_out
);
  wire [32:0] ShiftLeft_000_io_in; // @[RandomHardware_1_26.scala 15:34]
  wire [37:0] ShiftLeft_000_io_out; // @[RandomHardware_1_26.scala 15:34]
  wire  Accum_001_clock; // @[RandomHardware_1_26.scala 16:34]
  wire [32:0] Accum_001_io_in; // @[RandomHardware_1_26.scala 16:34]
  wire [32:0] Accum_001_io_out; // @[RandomHardware_1_26.scala 16:34]
  ShiftLeft_5 ShiftLeft_000 ( // @[RandomHardware_1_26.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Accum_2 Accum_001 ( // @[RandomHardware_1_26.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_26.scala 19:10]
  assign ShiftLeft_000_io_in = Accum_001_io_out; // @[RandomHardware_1_26.scala 13:24 RandomHardware_1_26.scala 21:18]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = io_in; // @[RandomHardware_1_26.scala 18:25]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [80:0] io_out
);
  wire [23:0] RandomHardware_000_io_in; // @[RandomHardware.scala 53:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware.scala 53:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 54:42]
  wire [38:0] RandomHardware_001_io_in; // @[RandomHardware.scala 54:42]
  wire [18:0] RandomHardware_001_io_out; // @[RandomHardware.scala 54:42]
  wire [4:0] ShiftRight_002_io_in; // @[RandomHardware.scala 55:34]
  wire [4:0] ShiftRight_002_io_out; // @[RandomHardware.scala 55:34]
  wire [12:0] RandomHardware_003_io_in; // @[RandomHardware.scala 56:42]
  wire [15:0] RandomHardware_003_io_out; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 57:42]
  wire [51:0] RandomHardware_004_io_in; // @[RandomHardware.scala 57:42]
  wire [32:0] RandomHardware_004_io_out; // @[RandomHardware.scala 57:42]
  wire [31:0] RandomHardware_005_io_in; // @[RandomHardware.scala 58:42]
  wire [14:0] RandomHardware_005_io_out; // @[RandomHardware.scala 58:42]
  wire [8:0] ShiftLeft_006_io_in; // @[RandomHardware.scala 59:34]
  wire [12:0] ShiftLeft_006_io_out; // @[RandomHardware.scala 59:34]
  wire [18:0] RandomHardware_007_io_in; // @[RandomHardware.scala 60:42]
  wire [37:0] RandomHardware_007_io_out; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_008_clock; // @[RandomHardware.scala 61:42]
  wire [19:0] RandomHardware_008_io_in; // @[RandomHardware.scala 61:42]
  wire [7:0] RandomHardware_008_io_out; // @[RandomHardware.scala 61:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 62:42]
  wire [29:0] RandomHardware_009_io_in; // @[RandomHardware.scala 62:42]
  wire [17:0] RandomHardware_009_io_out; // @[RandomHardware.scala 62:42]
  wire [4:0] SignExtendDouble_010_io_in; // @[RandomHardware.scala 63:42]
  wire [9:0] SignExtendDouble_010_io_out; // @[RandomHardware.scala 63:42]
  wire [9:0] SignExtendDouble_011_io_in; // @[RandomHardware.scala 64:42]
  wire [19:0] SignExtendDouble_011_io_out; // @[RandomHardware.scala 64:42]
  wire [19:0] RandomHardware_012_io_in; // @[RandomHardware.scala 65:42]
  wire [9:0] RandomHardware_012_io_out; // @[RandomHardware.scala 65:42]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 66:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 66:42]
  wire [22:0] RandomHardware_013_io_out; // @[RandomHardware.scala 66:42]
  wire [4:0] ShiftLeft_014_io_in; // @[RandomHardware.scala 67:34]
  wire [8:0] ShiftLeft_014_io_out; // @[RandomHardware.scala 67:34]
  wire [9:0] ShiftRight_015_io_in; // @[RandomHardware.scala 68:34]
  wire [9:0] ShiftRight_015_io_out; // @[RandomHardware.scala 68:34]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 69:42]
  wire [20:0] RandomHardware_016_io_in; // @[RandomHardware.scala 69:42]
  wire [9:0] RandomHardware_016_io_out; // @[RandomHardware.scala 69:42]
  wire [43:0] RandomHardware_017_io_in; // @[RandomHardware.scala 70:42]
  wire [20:0] RandomHardware_017_io_out; // @[RandomHardware.scala 70:42]
  wire [28:0] RandomHardware_018_io_in; // @[RandomHardware.scala 71:42]
  wire [28:0] RandomHardware_018_io_out; // @[RandomHardware.scala 71:42]
  wire  Reg_019_clock; // @[RandomHardware.scala 72:26]
  wire [8:0] Reg_019_io_in; // @[RandomHardware.scala 72:26]
  wire [8:0] Reg_019_io_out; // @[RandomHardware.scala 72:26]
  wire [8:0] ShiftRight_020_io_in; // @[RandomHardware.scala 73:34]
  wire [8:0] ShiftRight_020_io_out; // @[RandomHardware.scala 73:34]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 74:42]
  wire [43:0] RandomHardware_021_io_in; // @[RandomHardware.scala 74:42]
  wire [21:0] RandomHardware_021_io_out; // @[RandomHardware.scala 74:42]
  wire  ShiftRegister_022_clock; // @[RandomHardware.scala 75:42]
  wire [9:0] ShiftRegister_022_io_in; // @[RandomHardware.scala 75:42]
  wire [9:0] ShiftRegister_022_io_out; // @[RandomHardware.scala 75:42]
  wire [17:0] RandomHardware_023_io_in; // @[RandomHardware.scala 76:42]
  wire [3:0] RandomHardware_023_io_out; // @[RandomHardware.scala 76:42]
  wire [23:0] RandomHardware_024_io_in; // @[RandomHardware.scala 77:42]
  wire [9:0] RandomHardware_024_io_out; // @[RandomHardware.scala 77:42]
  wire  ShiftRegister_025_clock; // @[RandomHardware.scala 78:42]
  wire [4:0] ShiftRegister_025_io_in; // @[RandomHardware.scala 78:42]
  wire [4:0] ShiftRegister_025_io_out; // @[RandomHardware.scala 78:42]
  wire  RandomHardware_026_clock; // @[RandomHardware.scala 79:42]
  wire [32:0] RandomHardware_026_io_in; // @[RandomHardware.scala 79:42]
  wire [37:0] RandomHardware_026_io_out; // @[RandomHardware.scala 79:42]
  wire [30:0] io_out_lo = {ShiftRight_020_io_out,RandomHardware_021_io_out}; // @[Cat.scala 30:58]
  wire [49:0] io_out_hi = {RandomHardware_004_io_out,RandomHardware_008_io_out,ShiftLeft_014_io_out}; // @[Cat.scala 30:58]
  wire [14:0] wire_000 = RandomHardware_005_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 133:18]
  wire [3:0] wire_001 = RandomHardware_023_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 125:18]
  wire [18:0] RandomHardware_000_io_in_hi = {wire_000,wire_001}; // @[Cat.scala 30:58]
  wire [4:0] wire_002 = ShiftRegister_025_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 127:18]
  wire [28:0] wire_003 = RandomHardware_018_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 118:18]
  wire [9:0] wire_004 = ShiftRegister_022_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 123:18]
  wire [33:0] _RandomHardware_003_io_in_T = {wire_003,wire_002}; // @[Cat.scala 30:58]
  wire [37:0] wire_010 = RandomHardware_007_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 99:18]
  wire [4:0] wire_011 = RandomHardware_024_io_out[9:5]; // @[RandomHardware.scala 143:47]
  wire [42:0] _ShiftLeft_006_io_in_T = {wire_010,wire_011}; // @[Cat.scala 30:58]
  wire [9:0] wire_016 = SignExtendDouble_010_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 105:18]
  wire [9:0] wire_017 = RandomHardware_012_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 136:18]
  wire [19:0] RandomHardware_009_io_in_hi = {wire_016,wire_017}; // @[Cat.scala 30:58]
  wire [9:0] wire_018 = ShiftRight_015_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 111:18]
  wire [9:0] wire_020 = SignExtendDouble_011_io_out[19:10]; // @[RandomHardware.scala 109:49]
  wire [15:0] wire_026 = RandomHardware_003_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 95:18]
  wire [22:0] wire_027 = RandomHardware_013_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 140:18]
  wire [38:0] RandomHardware_017_io_in_hi = {wire_026,wire_027}; // @[Cat.scala 30:58]
  wire [10:0] wire_029 = RandomHardware_000_io_out; // @[RandomHardware.scala 42:24 RandomHardware.scala 88:18]
  wire [17:0] wire_030 = RandomHardware_009_io_out; // @[RandomHardware.scala 43:24 RandomHardware.scala 102:18]
  wire [62:0] _RandomHardware_026_io_in_T = {wire_010,wire_020,wire_017,wire_002}; // @[Cat.scala 30:58]
  wire [6:0] wire_015 = RandomHardware_013_io_out[17:11]; // @[RandomHardware.scala 139:47]
  wire [19:0] wire_008 = SignExtendDouble_011_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 108:18]
  wire [37:0] wire_009 = RandomHardware_026_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 132:18]
  wire [57:0] _RandomHardware_004_io_in_T = {wire_008,wire_009}; // @[Cat.scala 30:58]
  wire [12:0] wire_014 = ShiftLeft_006_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 97:18]
  wire [20:0] wire_034 = RandomHardware_017_io_out; // @[RandomHardware.scala 47:24 RandomHardware.scala 116:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ShiftRight ShiftRight_002 ( // @[RandomHardware.scala 55:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 56:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 57:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 58:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  ShiftLeft_2 ShiftLeft_006 ( // @[RandomHardware.scala 59:34]
    .io_in(ShiftLeft_006_io_in),
    .io_out(ShiftLeft_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 60:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 61:42]
    .clock(RandomHardware_008_clock),
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 62:42]
    .clock(RandomHardware_009_clock),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_010 ( // @[RandomHardware.scala 63:42]
    .io_in(SignExtendDouble_010_io_in),
    .io_out(SignExtendDouble_010_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_011 ( // @[RandomHardware.scala 64:42]
    .io_in(SignExtendDouble_011_io_in),
    .io_out(SignExtendDouble_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 66:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  ShiftLeft_3 ShiftLeft_014 ( // @[RandomHardware.scala 67:34]
    .io_in(ShiftLeft_014_io_in),
    .io_out(ShiftLeft_014_io_out)
  );
  ShiftRight_3 ShiftRight_015 ( // @[RandomHardware.scala 68:34]
    .io_in(ShiftRight_015_io_in),
    .io_out(ShiftRight_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_016_clock),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 70:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 71:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  Reg_1 Reg_019 ( // @[RandomHardware.scala 72:26]
    .clock(Reg_019_clock),
    .io_in(Reg_019_io_in),
    .io_out(Reg_019_io_out)
  );
  ShiftRight_6 ShiftRight_020 ( // @[RandomHardware.scala 73:34]
    .io_in(ShiftRight_020_io_in),
    .io_out(ShiftRight_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 74:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  ShiftRegister_6 ShiftRegister_022 ( // @[RandomHardware.scala 75:42]
    .clock(ShiftRegister_022_clock),
    .io_in(ShiftRegister_022_io_in),
    .io_out(ShiftRegister_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 76:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 77:42]
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  ShiftRegister_8 ShiftRegister_025 ( // @[RandomHardware.scala 78:42]
    .clock(ShiftRegister_025_clock),
    .io_in(ShiftRegister_025_io_in),
    .io_out(ShiftRegister_025_io_out)
  );
  RandomHardware_1_26 RandomHardware_026 ( // @[RandomHardware.scala 79:42]
    .clock(RandomHardware_026_clock),
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = {RandomHardware_000_io_in_hi,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
  assign ShiftRight_002_io_in = RandomHardware_024_io_out[4:0]; // @[RandomHardware.scala 142:47]
  assign RandomHardware_003_io_in = _RandomHardware_003_io_in_T[12:0]; // @[RandomHardware.scala 94:33]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = _RandomHardware_004_io_in_T[51:0]; // @[RandomHardware.scala 144:33]
  assign RandomHardware_005_io_in = io_in[31:0]; // @[RandomHardware.scala 81:41]
  assign ShiftLeft_006_io_in = _ShiftLeft_006_io_in_T[8:0]; // @[RandomHardware.scala 96:25]
  assign RandomHardware_007_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 90:18]
  assign RandomHardware_008_clock = clock;
  assign RandomHardware_008_io_in = {wire_014,wire_015}; // @[Cat.scala 30:58]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_io_in = {RandomHardware_009_io_in_hi,wire_018}; // @[Cat.scala 30:58]
  assign SignExtendDouble_010_io_in = RandomHardware_005_io_out[11:7]; // @[RandomHardware.scala 134:47]
  assign SignExtendDouble_011_io_in = RandomHardware_016_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 113:18]
  assign RandomHardware_012_io_in = io_in[99:80]; // @[RandomHardware.scala 82:41]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = io_in[23:0]; // @[RandomHardware.scala 83:41]
  assign ShiftLeft_014_io_in = RandomHardware_005_io_out[11:7]; // @[RandomHardware.scala 135:47]
  assign ShiftRight_015_io_in = SignExtendDouble_010_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 106:18]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_io_in = RandomHardware_017_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 115:18]
  assign RandomHardware_017_io_in = {RandomHardware_017_io_in_hi,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_018_io_in = {wire_029,wire_030}; // @[Cat.scala 30:58]
  assign Reg_019_clock = clock;
  assign Reg_019_io_in = RandomHardware_001_io_out[8:0]; // @[RandomHardware.scala 91:47]
  assign ShiftRight_020_io_in = Reg_019_io_out; // @[RandomHardware.scala 45:24 RandomHardware.scala 121:18]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = {wire_027,wire_034}; // @[Cat.scala 30:58]
  assign ShiftRegister_022_clock = clock;
  assign ShiftRegister_022_io_in = RandomHardware_012_io_out; // @[RandomHardware.scala 48:24 RandomHardware.scala 137:18]
  assign RandomHardware_023_io_in = RandomHardware_009_io_out; // @[RandomHardware.scala 49:24 RandomHardware.scala 103:18]
  assign RandomHardware_024_io_in = io_in[99:76]; // @[RandomHardware.scala 84:41]
  assign ShiftRegister_025_clock = clock;
  assign ShiftRegister_025_io_in = ShiftRight_002_io_out; // @[RandomHardware.scala 50:24 RandomHardware.scala 93:18]
  assign RandomHardware_026_clock = clock;
  assign RandomHardware_026_io_in = _RandomHardware_026_io_in_T[32:0]; // @[RandomHardware.scala 131:33]
endmodule
