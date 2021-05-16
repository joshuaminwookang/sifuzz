module CompareMux(
  input  [15:0] io_in,
  output [6:0]  io_out
);
  wire [7:0] IN1 = io_in[15:8]; // @[Muxes.scala 134:27]
  wire [6:0] IN2 = io_in[8:2]; // @[Muxes.scala 135:27]
  wire  SEL1 = io_in[1]; // @[Muxes.scala 136:27]
  wire  SEL2 = io_in[0]; // @[Muxes.scala 137:27]
  wire [7:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{1'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[6:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_0(
  input  [15:0] io_in,
  output [6:0]  io_out
);
  wire [15:0] CompareMux_000_io_in; // @[RandomHardware_1_0.scala 14:34]
  wire [6:0] CompareMux_000_io_out; // @[RandomHardware_1_0.scala 14:34]
  CompareMux CompareMux_000 ( // @[RandomHardware_1_0.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:25]
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
module RandomHardware_1_1(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_1.scala 14:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  Accum Accum_000 ( // @[RandomHardware_1_1.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:25]
endmodule
module Reg(
  input         clock,
  input  [35:0] io_in,
  output [35:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [35:0] io_out_REG; // @[Memory.scala 12:22]
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
  _RAND_0 = {2{`RANDOM}};
  io_out_REG = _RAND_0[35:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRegister(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [12:0] r0; // @[Memory.scala 78:19]
  reg [12:0] r1; // @[Memory.scala 79:19]
  reg [12:0] r2; // @[Memory.scala 80:19]
  reg [12:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[12:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[12:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[12:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_3_2(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_3_2.scala 14:42]
  wire [12:0] ShiftRegister_000_io_in; // @[RandomHardware_3_2.scala 14:42]
  wire [12:0] ShiftRegister_000_io_out; // @[RandomHardware_3_2.scala 14:42]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware_3_2.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_3_2.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_3_2.scala 16:33]
endmodule
module RandomHardware_2_0(
  input         clock,
  input  [31:0] io_in,
  output [35:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_2_0.scala 16:26]
  wire [35:0] Reg_000_io_in; // @[RandomHardware_2_0.scala 16:26]
  wire [35:0] Reg_000_io_out; // @[RandomHardware_2_0.scala 16:26]
  wire  Accum_001_clock; // @[RandomHardware_2_0.scala 17:34]
  wire [11:0] Accum_001_io_in; // @[RandomHardware_2_0.scala 17:34]
  wire [11:0] Accum_001_io_out; // @[RandomHardware_2_0.scala 17:34]
  wire  RandomHardware_002_clock; // @[RandomHardware_2_0.scala 18:42]
  wire [12:0] RandomHardware_002_io_in; // @[RandomHardware_2_0.scala 18:42]
  wire [12:0] RandomHardware_002_io_out; // @[RandomHardware_2_0.scala 18:42]
  wire [11:0] wire_000 = Accum_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 24:18]
  wire [23:0] wire_001 = {{11'd0}, RandomHardware_002_io_out}; // @[RandomHardware_2_0.scala 14:24 RandomHardware_2_0.scala 25:18]
  Reg Reg_000 ( // @[RandomHardware_2_0.scala 16:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  Accum Accum_001 ( // @[RandomHardware_2_0.scala 17:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  RandomHardware_3_2 RandomHardware_002 ( // @[RandomHardware_2_0.scala 18:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_2_0.scala 22:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = io_in[31:20]; // @[RandomHardware_2_0.scala 20:33]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = io_in[24:12]; // @[RandomHardware_2_0.scala 21:33]
endmodule
module ShiftRight(
  input  [12:0] io_in,
  output [12:0] io_out
);
  assign io_out = {{1'd0}, io_in[12:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mul(
  input  [29:0] io_in,
  output [29:0] io_out
);
  wire [14:0] in1 = io_in[29:15]; // @[ArithmeticLogical.scala 47:20]
  wire [14:0] in2 = io_in[14:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_3_3(
  input  [29:0] io_in,
  output [29:0] io_out
);
  wire [29:0] Mul_000_io_in; // @[RandomHardware_3_3.scala 14:26]
  wire [29:0] Mul_000_io_out; // @[RandomHardware_3_3.scala 14:26]
  Mul Mul_000 ( // @[RandomHardware_3_3.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_3_3.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_3_3.scala 16:25]
endmodule
module Accum_2(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [12:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CompareMux_1(
  input  [29:0] io_in,
  output [12:0] io_out
);
  wire [14:0] IN1 = io_in[29:15]; // @[Muxes.scala 134:27]
  wire [12:0] IN2 = io_in[16:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [14:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[12:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_4_1(
  input  [29:0] io_in,
  output [12:0] io_out
);
  wire [29:0] CompareMux_000_io_in; // @[RandomHardware_4_1.scala 14:34]
  wire [12:0] CompareMux_000_io_out; // @[RandomHardware_4_1.scala 14:34]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_4_1.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_4_1.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_4_1.scala 16:25]
endmodule
module RandomHardware_3_4(
  input         clock,
  input  [29:0] io_in,
  output [12:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_3_4.scala 15:34]
  wire [12:0] Accum_000_io_in; // @[RandomHardware_3_4.scala 15:34]
  wire [12:0] Accum_000_io_out; // @[RandomHardware_3_4.scala 15:34]
  wire [29:0] RandomHardware_001_io_in; // @[RandomHardware_3_4.scala 16:42]
  wire [12:0] RandomHardware_001_io_out; // @[RandomHardware_3_4.scala 16:42]
  Accum_2 Accum_000 ( // @[RandomHardware_3_4.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  RandomHardware_4_1 RandomHardware_001 ( // @[RandomHardware_3_4.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_3_4.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_3_4.scala 13:24 RandomHardware_3_4.scala 21:18]
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_3_4.scala 18:33]
endmodule
module RandomHardware_2_1(
  input         clock,
  input  [29:0] io_in,
  output [25:0] io_out
);
  wire [12:0] ShiftRight_000_io_in; // @[RandomHardware_2_1.scala 18:34]
  wire [12:0] ShiftRight_000_io_out; // @[RandomHardware_2_1.scala 18:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_2_1.scala 19:42]
  wire [12:0] ShiftRegister_001_io_in; // @[RandomHardware_2_1.scala 19:42]
  wire [12:0] ShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 19:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_2_1.scala 20:42]
  wire [12:0] RandomHardware_002_io_in; // @[RandomHardware_2_1.scala 20:42]
  wire [12:0] RandomHardware_002_io_out; // @[RandomHardware_2_1.scala 20:42]
  wire [29:0] RandomHardware_003_io_in; // @[RandomHardware_2_1.scala 21:42]
  wire [29:0] RandomHardware_003_io_out; // @[RandomHardware_2_1.scala 21:42]
  wire  RandomHardware_004_clock; // @[RandomHardware_2_1.scala 22:42]
  wire [29:0] RandomHardware_004_io_in; // @[RandomHardware_2_1.scala 22:42]
  wire [12:0] RandomHardware_004_io_out; // @[RandomHardware_2_1.scala 22:42]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_2_1.scala 18:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_2_1.scala 19:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  RandomHardware_3_2 RandomHardware_002 ( // @[RandomHardware_2_1.scala 20:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_3_3 RandomHardware_003 ( // @[RandomHardware_2_1.scala 21:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_3_4 RandomHardware_004 ( // @[RandomHardware_2_1.scala 22:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  assign io_out = {ShiftRight_000_io_out,RandomHardware_002_io_out}; // @[Cat.scala 30:58]
  assign ShiftRight_000_io_in = ShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 28:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = RandomHardware_004_io_out; // @[RandomHardware_2_1.scala 14:24 RandomHardware_2_1.scala 31:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = ShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 15:24 RandomHardware_2_1.scala 29:18]
  assign RandomHardware_003_io_in = io_in; // @[RandomHardware_2_1.scala 24:33]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = RandomHardware_003_io_out; // @[RandomHardware_2_1.scala 16:24 RandomHardware_2_1.scala 32:18]
endmodule
module Mux4(
  input  [57:0] io_in,
  output [13:0] io_out
);
  wire [1:0] sel = io_in[57:56]; // @[Muxes.scala 28:18]
  wire [13:0] in3 = io_in[55:42]; // @[Muxes.scala 29:18]
  wire [13:0] in2 = io_in[41:28]; // @[Muxes.scala 30:18]
  wire [13:0] in1 = io_in[27:14]; // @[Muxes.scala 31:18]
  wire [13:0] in0 = io_in[13:0]; // @[Muxes.scala 32:18]
  wire [13:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [13:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module SignExtendDouble(
  input  [28:0] io_in,
  output [57:0] io_out
);
  wire [28:0] io_out_hi = io_in[28] ? 29'h1fffffff : 29'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_2(
  input         clock,
  input  [60:0] io_in,
  output [30:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_2.scala 18:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_2.scala 18:42]
  wire [35:0] RandomHardware_000_io_out; // @[RandomHardware_1_2.scala 18:42]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_2.scala 19:42]
  wire [29:0] RandomHardware_001_io_in; // @[RandomHardware_1_2.scala 19:42]
  wire [25:0] RandomHardware_001_io_out; // @[RandomHardware_1_2.scala 19:42]
  wire [57:0] Mux4_002_io_in; // @[RandomHardware_1_2.scala 20:26]
  wire [13:0] Mux4_002_io_out; // @[RandomHardware_1_2.scala 20:26]
  wire [28:0] SignExtendDouble_003_io_in; // @[RandomHardware_1_2.scala 21:42]
  wire [57:0] SignExtendDouble_003_io_out; // @[RandomHardware_1_2.scala 21:42]
  wire [28:0] wire_002 = SignExtendDouble_003_io_out[57:29]; // @[RandomHardware_1_2.scala 30:49]
  wire [33:0] wire_000 = RandomHardware_000_io_out[33:0]; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 29:18]
  wire [13:0] wire_001 = Mux4_002_io_out; // @[RandomHardware_1_2.scala 14:24 RandomHardware_1_2.scala 28:18]
  wire [76:0] _RandomHardware_001_io_in_T = {wire_000,wire_001,wire_002}; // @[Cat.scala 30:58]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_2.scala 18:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_2.scala 19:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  Mux4 Mux4_002 ( // @[RandomHardware_1_2.scala 20:26]
    .io_in(Mux4_002_io_in),
    .io_out(Mux4_002_io_out)
  );
  SignExtendDouble SignExtendDouble_003 ( // @[RandomHardware_1_2.scala 21:42]
    .io_in(SignExtendDouble_003_io_in),
    .io_out(SignExtendDouble_003_io_out)
  );
  assign io_out = {{5'd0}, RandomHardware_001_io_out}; // @[RandomHardware_1_2.scala 25:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[60:29]; // @[RandomHardware_1_2.scala 23:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = _RandomHardware_001_io_in_T[29:0]; // @[RandomHardware_1_2.scala 32:33]
  assign Mux4_002_io_in = SignExtendDouble_003_io_out; // @[RandomHardware_1_2.scala 16:24 RandomHardware_1_2.scala 31:18]
  assign SignExtendDouble_003_io_in = io_in[28:0]; // @[RandomHardware_1_2.scala 24:41]
endmodule
module CompareMux_2(
  input  [33:0] io_in,
  output [13:0] io_out
);
  wire [16:0] IN1 = io_in[33:17]; // @[Muxes.scala 134:27]
  wire [13:0] IN2 = io_in[19:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [16:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[13:0]; // @[Muxes.scala 139:12]
endmodule
module ShiftLeft(
  input  [13:0] io_in,
  output [16:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_3(
  input  [33:0] io_in,
  output [16:0] io_out
);
  wire [33:0] CompareMux_000_io_in; // @[RandomHardware_1_3.scala 15:34]
  wire [13:0] CompareMux_000_io_out; // @[RandomHardware_1_3.scala 15:34]
  wire [13:0] ShiftLeft_001_io_in; // @[RandomHardware_1_3.scala 16:34]
  wire [16:0] ShiftLeft_001_io_out; // @[RandomHardware_1_3.scala 16:34]
  CompareMux_2 CompareMux_000 ( // @[RandomHardware_1_3.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ShiftLeft ShiftLeft_001 ( // @[RandomHardware_1_3.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_3.scala 19:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_3.scala 18:25]
  assign ShiftLeft_001_io_in = CompareMux_000_io_out; // @[RandomHardware_1_3.scala 13:24 RandomHardware_1_3.scala 21:18]
endmodule
module SignExtendDouble_1(
  input  [14:0] io_in,
  output [29:0] io_out
);
  wire [14:0] io_out_hi = io_in[14] ? 15'h7fff : 15'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_4(
  input  [14:0] io_in,
  output [29:0] io_out
);
  wire [14:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_4.scala 14:42]
  wire [29:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_4.scala 14:42]
  SignExtendDouble_1 SignExtendDouble_000 ( // @[RandomHardware_1_4.scala 14:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_4.scala 17:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_1_4.scala 16:33]
endmodule
module ShiftLeft_1(
  input  [11:0] io_in,
  output [13:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_5(
  input  [11:0] io_in,
  output [13:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_5.scala 14:34]
  wire [13:0] ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 14:34]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_5.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module Reg_1(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [13:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_6(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_6.scala 14:26]
  wire [13:0] Reg_000_io_in; // @[RandomHardware_1_6.scala 14:26]
  wire [13:0] Reg_000_io_out; // @[RandomHardware_1_6.scala 14:26]
  Reg_1 Reg_000 ( // @[RandomHardware_1_6.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_6.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_6.scala 16:25]
endmodule
module SignExtendDouble_2(
  input  [3:0] io_in,
  output [7:0] io_out
);
  wire [3:0] io_out_hi = io_in[3] ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Reg_2(
  input        clock,
  input  [7:0] io_in,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_1(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{2'd0}, io_in[7:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Accum_3(
  input        clock,
  input  [7:0] io_in,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module And(
  input  [23:0] io_in,
  output [11:0] io_out
);
  wire [11:0] in1 = io_in[23:12]; // @[ArithmeticLogical.scala 36:20]
  wire [11:0] in2 = io_in[11:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module ShiftLeft_2(
  input  [11:0] io_in,
  output [15:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_11(
  input  [23:0] io_in,
  output [15:0] io_out
);
  wire [23:0] And_000_io_in; // @[RandomHardware_1_11.scala 15:26]
  wire [11:0] And_000_io_out; // @[RandomHardware_1_11.scala 15:26]
  wire [11:0] ShiftLeft_001_io_in; // @[RandomHardware_1_11.scala 16:34]
  wire [15:0] ShiftLeft_001_io_out; // @[RandomHardware_1_11.scala 16:34]
  And And_000 ( // @[RandomHardware_1_11.scala 15:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  ShiftLeft_2 ShiftLeft_001 ( // @[RandomHardware_1_11.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_11.scala 19:10]
  assign And_000_io_in = io_in; // @[RandomHardware_1_11.scala 18:25]
  assign ShiftLeft_001_io_in = And_000_io_out; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 21:18]
endmodule
module ShiftRight_2(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{4'd0}, io_in[7:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_13(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_13.scala 14:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 14:42]
  wire [35:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[12:0]; // @[RandomHardware_1_13.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{19'd0}, io_in}; // @[RandomHardware_1_13.scala 16:33]
endmodule
module ShiftRegister_4(
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
module ShiftRegister_6(
  input         clock,
  input  [35:0] io_in,
  output [35:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [35:0] r0; // @[Memory.scala 78:19]
  reg [35:0] r1; // @[Memory.scala 79:19]
  reg [35:0] r2; // @[Memory.scala 80:19]
  reg [35:0] r3; // @[Memory.scala 81:19]
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
  _RAND_0 = {2{`RANDOM}};
  r0 = _RAND_0[35:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[35:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[35:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[35:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [31:0] io_in,
  output [35:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_15.scala 15:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_15.scala 15:42]
  wire [35:0] RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 15:42]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_15.scala 16:42]
  wire [35:0] ShiftRegister_001_io_in; // @[RandomHardware_1_15.scala 16:42]
  wire [35:0] ShiftRegister_001_io_out; // @[RandomHardware_1_15.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_15.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRegister_6 ShiftRegister_001 ( // @[RandomHardware_1_15.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_15.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_15.scala 18:33]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 21:18]
endmodule
module ShiftLeft_3(
  input  [7:0]  io_in,
  output [11:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRegister_7(
  input        clock,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] r0; // @[Memory.scala 78:19]
  reg [3:0] r1; // @[Memory.scala 79:19]
  reg [3:0] r2; // @[Memory.scala 80:19]
  reg [3:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CompareMux_3(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [9:0] IN1 = io_in[19:10]; // @[Muxes.scala 134:27]
  wire [4:0] IN2 = io_in[14:10]; // @[Muxes.scala 135:27]
  wire [4:0] SEL1 = io_in[9:5]; // @[Muxes.scala 136:27]
  wire [4:0] SEL2 = io_in[4:0]; // @[Muxes.scala 137:27]
  wire [9:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{5'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[4:0]; // @[Muxes.scala 139:12]
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
module RandomHardware_1_19(
  input         clock,
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [19:0] CompareMux_000_io_in; // @[RandomHardware_1_19.scala 15:34]
  wire [4:0] CompareMux_000_io_out; // @[RandomHardware_1_19.scala 15:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_19.scala 16:42]
  wire [4:0] ShiftRegister_001_io_in; // @[RandomHardware_1_19.scala 16:42]
  wire [4:0] ShiftRegister_001_io_out; // @[RandomHardware_1_19.scala 16:42]
  CompareMux_3 CompareMux_000 ( // @[RandomHardware_1_19.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ShiftRegister_8 ShiftRegister_001 ( // @[RandomHardware_1_19.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_19.scala 19:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_19.scala 18:25]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = CompareMux_000_io_out; // @[RandomHardware_1_19.scala 13:24 RandomHardware_1_19.scala 21:18]
endmodule
module SignExtendDouble_3(
  input  [9:0]  io_in,
  output [19:0] io_out
);
  wire [9:0] io_out_hi = io_in[9] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceOrMux(
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] IN1 = io_in[23:14]; // @[Muxes.scala 110:27]
  wire [9:0] IN2 = io_in[13:4]; // @[Muxes.scala 111:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module Accum_7(
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
module RandomHardware_1_21(
  input         clock,
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire [23:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_21.scala 15:34]
  wire [9:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_21.scala 15:34]
  wire  Accum_001_clock; // @[RandomHardware_1_21.scala 16:34]
  wire [9:0] Accum_001_io_in; // @[RandomHardware_1_21.scala 16:34]
  wire [9:0] Accum_001_io_out; // @[RandomHardware_1_21.scala 16:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_21.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  Accum_7 Accum_001 ( // @[RandomHardware_1_21.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_21.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_21.scala 18:33]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 21:18]
endmodule
module ShiftRight_3(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{1'd0}, io_in[7:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ReduceOrMux_1(
  input  [21:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[21:15]; // @[Muxes.scala 110:27]
  wire [6:0] IN2 = io_in[14:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftLeft_4(
  input  [6:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_23(
  input  [21:0] io_in,
  output [10:0] io_out
);
  wire [21:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_23.scala 15:34]
  wire [6:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_23.scala 15:34]
  wire [6:0] ShiftLeft_001_io_in; // @[RandomHardware_1_23.scala 16:34]
  wire [10:0] ShiftLeft_001_io_out; // @[RandomHardware_1_23.scala 16:34]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_1_23.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  ShiftLeft_4 ShiftLeft_001 ( // @[RandomHardware_1_23.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_23.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_23.scala 18:33]
  assign ShiftLeft_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_23.scala 13:24 RandomHardware_1_23.scala 21:18]
endmodule
module Accum_8(
  input        clock,
  input  [4:0] io_in,
  output [4:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_5(
  input         clock,
  input  [10:0] io_in,
  output [10:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceAndMux(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] IN1 = io_in[12:8]; // @[Muxes.scala 98:27]
  wire [4:0] IN2 = io_in[7:3]; // @[Muxes.scala 99:27]
  wire [2:0] SEL = io_in[2:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module Mux4_1(
  input  [25:0] io_in,
  output [5:0]  io_out
);
  wire [1:0] sel = io_in[25:24]; // @[Muxes.scala 28:18]
  wire [5:0] in3 = io_in[23:18]; // @[Muxes.scala 29:18]
  wire [5:0] in2 = io_in[17:12]; // @[Muxes.scala 30:18]
  wire [5:0] in1 = io_in[11:6]; // @[Muxes.scala 31:18]
  wire [5:0] in0 = io_in[5:0]; // @[Muxes.scala 32:18]
  wire [5:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [5:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module RandomHardware_1_24(
  input         clock,
  input  [41:0] io_in,
  output [15:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_24.scala 17:34]
  wire [4:0] Accum_000_io_in; // @[RandomHardware_1_24.scala 17:34]
  wire [4:0] Accum_000_io_out; // @[RandomHardware_1_24.scala 17:34]
  wire  Reg_001_clock; // @[RandomHardware_1_24.scala 18:26]
  wire [10:0] Reg_001_io_in; // @[RandomHardware_1_24.scala 18:26]
  wire [10:0] Reg_001_io_out; // @[RandomHardware_1_24.scala 18:26]
  wire [15:0] ReduceAndMux_002_io_in; // @[RandomHardware_1_24.scala 19:34]
  wire [4:0] ReduceAndMux_002_io_out; // @[RandomHardware_1_24.scala 19:34]
  wire [25:0] Mux4_003_io_in; // @[RandomHardware_1_24.scala 20:26]
  wire [5:0] Mux4_003_io_out; // @[RandomHardware_1_24.scala 20:26]
  wire [4:0] wire_001 = ReduceAndMux_002_io_out; // @[RandomHardware_1_24.scala 14:24 RandomHardware_1_24.scala 27:18]
  wire [5:0] wire_002 = Mux4_003_io_out; // @[RandomHardware_1_24.scala 15:24 RandomHardware_1_24.scala 28:18]
  Accum_8 Accum_000 ( // @[RandomHardware_1_24.scala 17:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Reg_5 Reg_001 ( // @[RandomHardware_1_24.scala 18:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  ReduceAndMux ReduceAndMux_002 ( // @[RandomHardware_1_24.scala 19:34]
    .io_in(ReduceAndMux_002_io_in),
    .io_out(ReduceAndMux_002_io_out)
  );
  Mux4_1 Mux4_003 ( // @[RandomHardware_1_24.scala 20:26]
    .io_in(Mux4_003_io_in),
    .io_out(Mux4_003_io_out)
  );
  assign io_out = {Accum_000_io_out,Reg_001_io_out}; // @[Cat.scala 30:58]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = ReduceAndMux_002_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 26:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign ReduceAndMux_002_io_in = io_in[15:0]; // @[RandomHardware_1_24.scala 22:41]
  assign Mux4_003_io_in = io_in[25:0]; // @[RandomHardware_1_24.scala 23:33]
endmodule
module ShiftLeft_5(
  input  [7:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mod(
  input  [25:0] io_in,
  output [12:0] io_out
);
  wire [12:0] in1 = io_in[25:13]; // @[ArithmeticLogical.scala 71:20]
  wire [12:0] in2 = io_in[12:0]; // @[ArithmeticLogical.scala 72:20]
  wire [12:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[12:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_1_26(
  input         clock,
  input  [29:0] io_in,
  output [12:0] io_out
);
  wire [25:0] Mod_000_io_in; // @[RandomHardware_1_26.scala 15:26]
  wire [12:0] Mod_000_io_out; // @[RandomHardware_1_26.scala 15:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_26.scala 16:42]
  wire [29:0] RandomHardware_001_io_in; // @[RandomHardware_1_26.scala 16:42]
  wire [25:0] RandomHardware_001_io_out; // @[RandomHardware_1_26.scala 16:42]
  Mod Mod_000 ( // @[RandomHardware_1_26.scala 15:26]
    .io_in(Mod_000_io_in),
    .io_out(Mod_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_26.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Mod_000_io_out; // @[RandomHardware_1_26.scala 19:10]
  assign Mod_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_26.scala 13:24 RandomHardware_1_26.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_26.scala 18:33]
endmodule
module CompareMux_5(
  input  [21:0] io_in,
  output [7:0]  io_out
);
  wire [10:0] IN1 = io_in[21:11]; // @[Muxes.scala 134:27]
  wire [7:0] IN2 = io_in[13:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [10:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[7:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_27(
  input         clock,
  input  [21:0] io_in,
  output [7:0]  io_out
);
  wire [21:0] CompareMux_000_io_in; // @[RandomHardware_1_27.scala 15:34]
  wire [7:0] CompareMux_000_io_out; // @[RandomHardware_1_27.scala 15:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_27.scala 16:42]
  wire [7:0] ShiftRegister_001_io_in; // @[RandomHardware_1_27.scala 16:42]
  wire [7:0] ShiftRegister_001_io_out; // @[RandomHardware_1_27.scala 16:42]
  CompareMux_5 CompareMux_000 ( // @[RandomHardware_1_27.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ShiftRegister_4 ShiftRegister_001 ( // @[RandomHardware_1_27.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_27.scala 19:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_27.scala 18:25]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = CompareMux_000_io_out; // @[RandomHardware_1_27.scala 13:24 RandomHardware_1_27.scala 21:18]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [59:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware.scala 50:42]
  wire [6:0] RandomHardware_000_io_out; // @[RandomHardware.scala 50:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 51:42]
  wire [11:0] RandomHardware_001_io_in; // @[RandomHardware.scala 51:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 52:42]
  wire [60:0] RandomHardware_002_io_in; // @[RandomHardware.scala 52:42]
  wire [30:0] RandomHardware_002_io_out; // @[RandomHardware.scala 52:42]
  wire [33:0] RandomHardware_003_io_in; // @[RandomHardware.scala 53:42]
  wire [16:0] RandomHardware_003_io_out; // @[RandomHardware.scala 53:42]
  wire [14:0] RandomHardware_004_io_in; // @[RandomHardware.scala 54:42]
  wire [29:0] RandomHardware_004_io_out; // @[RandomHardware.scala 54:42]
  wire [11:0] RandomHardware_005_io_in; // @[RandomHardware.scala 55:42]
  wire [13:0] RandomHardware_005_io_out; // @[RandomHardware.scala 55:42]
  wire  RandomHardware_006_clock; // @[RandomHardware.scala 56:42]
  wire [13:0] RandomHardware_006_io_in; // @[RandomHardware.scala 56:42]
  wire [13:0] RandomHardware_006_io_out; // @[RandomHardware.scala 56:42]
  wire [3:0] SignExtendDouble_007_io_in; // @[RandomHardware.scala 57:42]
  wire [7:0] SignExtendDouble_007_io_out; // @[RandomHardware.scala 57:42]
  wire  Reg_008_clock; // @[RandomHardware.scala 58:26]
  wire [7:0] Reg_008_io_in; // @[RandomHardware.scala 58:26]
  wire [7:0] Reg_008_io_out; // @[RandomHardware.scala 58:26]
  wire [7:0] ShiftRight_009_io_in; // @[RandomHardware.scala 59:34]
  wire [7:0] ShiftRight_009_io_out; // @[RandomHardware.scala 59:34]
  wire  Accum_010_clock; // @[RandomHardware.scala 60:34]
  wire [7:0] Accum_010_io_in; // @[RandomHardware.scala 60:34]
  wire [7:0] Accum_010_io_out; // @[RandomHardware.scala 60:34]
  wire [23:0] RandomHardware_011_io_in; // @[RandomHardware.scala 61:42]
  wire [15:0] RandomHardware_011_io_out; // @[RandomHardware.scala 61:42]
  wire [7:0] ShiftRight_012_io_in; // @[RandomHardware.scala 62:34]
  wire [7:0] ShiftRight_012_io_out; // @[RandomHardware.scala 62:34]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 63:42]
  wire [12:0] RandomHardware_013_io_in; // @[RandomHardware.scala 63:42]
  wire [12:0] RandomHardware_013_io_out; // @[RandomHardware.scala 63:42]
  wire  ShiftRegister_014_clock; // @[RandomHardware.scala 64:42]
  wire [7:0] ShiftRegister_014_io_in; // @[RandomHardware.scala 64:42]
  wire [7:0] ShiftRegister_014_io_out; // @[RandomHardware.scala 64:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 65:42]
  wire [31:0] RandomHardware_015_io_in; // @[RandomHardware.scala 65:42]
  wire [35:0] RandomHardware_015_io_out; // @[RandomHardware.scala 65:42]
  wire [7:0] ShiftLeft_016_io_in; // @[RandomHardware.scala 66:34]
  wire [11:0] ShiftLeft_016_io_out; // @[RandomHardware.scala 66:34]
  wire  ShiftRegister_017_clock; // @[RandomHardware.scala 67:42]
  wire [3:0] ShiftRegister_017_io_in; // @[RandomHardware.scala 67:42]
  wire [3:0] ShiftRegister_017_io_out; // @[RandomHardware.scala 67:42]
  wire  Accum_018_clock; // @[RandomHardware.scala 68:34]
  wire [7:0] Accum_018_io_in; // @[RandomHardware.scala 68:34]
  wire [7:0] Accum_018_io_out; // @[RandomHardware.scala 68:34]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 69:42]
  wire [19:0] RandomHardware_019_io_in; // @[RandomHardware.scala 69:42]
  wire [4:0] RandomHardware_019_io_out; // @[RandomHardware.scala 69:42]
  wire [9:0] SignExtendDouble_020_io_in; // @[RandomHardware.scala 70:42]
  wire [19:0] SignExtendDouble_020_io_out; // @[RandomHardware.scala 70:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 71:42]
  wire [23:0] RandomHardware_021_io_in; // @[RandomHardware.scala 71:42]
  wire [9:0] RandomHardware_021_io_out; // @[RandomHardware.scala 71:42]
  wire [7:0] ShiftRight_022_io_in; // @[RandomHardware.scala 72:34]
  wire [7:0] ShiftRight_022_io_out; // @[RandomHardware.scala 72:34]
  wire [21:0] RandomHardware_023_io_in; // @[RandomHardware.scala 73:42]
  wire [10:0] RandomHardware_023_io_out; // @[RandomHardware.scala 73:42]
  wire  RandomHardware_024_clock; // @[RandomHardware.scala 74:42]
  wire [41:0] RandomHardware_024_io_in; // @[RandomHardware.scala 74:42]
  wire [15:0] RandomHardware_024_io_out; // @[RandomHardware.scala 74:42]
  wire [7:0] ShiftLeft_025_io_in; // @[RandomHardware.scala 75:34]
  wire [10:0] ShiftLeft_025_io_out; // @[RandomHardware.scala 75:34]
  wire  RandomHardware_026_clock; // @[RandomHardware.scala 76:42]
  wire [29:0] RandomHardware_026_io_in; // @[RandomHardware.scala 76:42]
  wire [12:0] RandomHardware_026_io_out; // @[RandomHardware.scala 76:42]
  wire  RandomHardware_027_clock; // @[RandomHardware.scala 77:42]
  wire [21:0] RandomHardware_027_io_in; // @[RandomHardware.scala 77:42]
  wire [7:0] RandomHardware_027_io_out; // @[RandomHardware.scala 77:42]
  wire [43:0] io_out_hi = {RandomHardware_015_io_out,Accum_018_io_out}; // @[Cat.scala 30:58]
  wire [19:0] wire_004 = SignExtendDouble_020_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 113:18]
  wire [12:0] wire_005 = RandomHardware_026_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 121:18]
  wire [32:0] RandomHardware_002_io_in_lo = {wire_004,wire_005}; // @[Cat.scala 30:58]
  wire [7:0] wire_001 = ShiftRight_009_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 104:18]
  wire [15:0] wire_002 = RandomHardware_011_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 106:18]
  wire [3:0] wire_003 = ShiftRegister_017_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 134:18]
  wire [27:0] RandomHardware_002_io_in_hi = {wire_001,wire_002,wire_003}; // @[Cat.scala 30:58]
  wire [30:0] wire_006 = RandomHardware_002_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 92:18]
  wire [29:0] wire_007 = RandomHardware_004_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 97:18]
  wire [60:0] _RandomHardware_003_io_in_T = {wire_006,wire_007}; // @[Cat.scala 30:58]
  wire [10:0] wire_009 = ShiftLeft_025_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 139:18]
  wire [6:0] wire_014 = RandomHardware_006_io_out[6:0]; // @[RandomHardware.scala 99:47]
  wire [11:0] wire_013 = RandomHardware_001_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 127:18]
  wire [18:0] RandomHardware_011_io_in_hi = {wire_013,wire_014}; // @[Cat.scala 30:58]
  wire [4:0] wire_015 = RandomHardware_019_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 137:18]
  wire [7:0] wire_016 = ShiftRight_012_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 132:18]
  wire [5:0] wire_023 = RandomHardware_013_io_out[5:0]; // @[RandomHardware.scala 108:47]
  wire [12:0] wire_025 = RandomHardware_013_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 109:18]
  wire [13:0] wire_029 = RandomHardware_006_io_out; // @[RandomHardware.scala 42:24 RandomHardware.scala 100:18]
  wire [7:0] wire_030 = RandomHardware_027_io_out; // @[RandomHardware.scala 43:24 RandomHardware.scala 124:18]
  wire [6:0] wire_033 = RandomHardware_000_io_out; // @[RandomHardware.scala 46:24 RandomHardware.scala 126:18]
  wire [11:0] wire_034 = ShiftLeft_016_io_out; // @[RandomHardware.scala 47:24 RandomHardware.scala 111:18]
  wire [18:0] RandomHardware_026_io_in_hi = {wire_033,wire_034}; // @[Cat.scala 30:58]
  wire [9:0] wire_026 = RandomHardware_021_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 115:18]
  wire [16:0] wire_019 = RandomHardware_003_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 95:18]
  wire [23:0] RandomHardware_015_io_in_hi = {wire_033,wire_019}; // @[Cat.scala 30:58]
  wire [7:0] wire_020 = ShiftRight_022_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 117:18]
  wire [10:0] wire_032 = RandomHardware_023_io_out; // @[RandomHardware.scala 45:24 RandomHardware.scala 119:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 50:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 51:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 54:42]
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 56:42]
    .clock(RandomHardware_006_clock),
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_007 ( // @[RandomHardware.scala 57:42]
    .io_in(SignExtendDouble_007_io_in),
    .io_out(SignExtendDouble_007_io_out)
  );
  Reg_2 Reg_008 ( // @[RandomHardware.scala 58:26]
    .clock(Reg_008_clock),
    .io_in(Reg_008_io_in),
    .io_out(Reg_008_io_out)
  );
  ShiftRight_1 ShiftRight_009 ( // @[RandomHardware.scala 59:34]
    .io_in(ShiftRight_009_io_in),
    .io_out(ShiftRight_009_io_out)
  );
  Accum_3 Accum_010 ( // @[RandomHardware.scala 60:34]
    .clock(Accum_010_clock),
    .io_in(Accum_010_io_in),
    .io_out(Accum_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 61:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  ShiftRight_2 ShiftRight_012 ( // @[RandomHardware.scala 62:34]
    .io_in(ShiftRight_012_io_in),
    .io_out(ShiftRight_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 63:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  ShiftRegister_4 ShiftRegister_014 ( // @[RandomHardware.scala 64:42]
    .clock(ShiftRegister_014_clock),
    .io_in(ShiftRegister_014_io_in),
    .io_out(ShiftRegister_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 65:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  ShiftLeft_3 ShiftLeft_016 ( // @[RandomHardware.scala 66:34]
    .io_in(ShiftLeft_016_io_in),
    .io_out(ShiftLeft_016_io_out)
  );
  ShiftRegister_7 ShiftRegister_017 ( // @[RandomHardware.scala 67:42]
    .clock(ShiftRegister_017_clock),
    .io_in(ShiftRegister_017_io_in),
    .io_out(ShiftRegister_017_io_out)
  );
  Accum_3 Accum_018 ( // @[RandomHardware.scala 68:34]
    .clock(Accum_018_clock),
    .io_in(Accum_018_io_in),
    .io_out(Accum_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_019_clock),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  SignExtendDouble_3 SignExtendDouble_020 ( // @[RandomHardware.scala 70:42]
    .io_in(SignExtendDouble_020_io_in),
    .io_out(SignExtendDouble_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 71:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  ShiftRight_3 ShiftRight_022 ( // @[RandomHardware.scala 72:34]
    .io_in(ShiftRight_022_io_in),
    .io_out(ShiftRight_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 73:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 74:42]
    .clock(RandomHardware_024_clock),
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  ShiftLeft_5 ShiftLeft_025 ( // @[RandomHardware.scala 75:34]
    .io_in(ShiftLeft_025_io_in),
    .io_out(ShiftLeft_025_io_out)
  );
  RandomHardware_1_26 RandomHardware_026 ( // @[RandomHardware.scala 76:42]
    .clock(RandomHardware_026_clock),
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  RandomHardware_1_27 RandomHardware_027 ( // @[RandomHardware.scala 77:42]
    .clock(RandomHardware_027_clock),
    .io_in(RandomHardware_027_io_in),
    .io_out(RandomHardware_027_io_out)
  );
  assign io_out = {io_out_hi,RandomHardware_024_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[99:84]; // @[RandomHardware.scala 79:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in[99:88]; // @[RandomHardware.scala 80:41]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {RandomHardware_002_io_in_hi,RandomHardware_002_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_003_io_in = _RandomHardware_003_io_in_T[33:0]; // @[RandomHardware.scala 94:33]
  assign RandomHardware_004_io_in = {wire_003,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_005_io_in = io_in[99:88]; // @[RandomHardware.scala 81:41]
  assign RandomHardware_006_clock = clock;
  assign RandomHardware_006_io_in = RandomHardware_005_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 129:18]
  assign SignExtendDouble_007_io_in = io_in[3:0]; // @[RandomHardware.scala 82:41]
  assign Reg_008_clock = clock;
  assign Reg_008_io_in = Accum_010_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 131:18]
  assign ShiftRight_009_io_in = ShiftRegister_014_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 133:18]
  assign Accum_010_clock = clock;
  assign Accum_010_io_in = io_in[99:92]; // @[RandomHardware.scala 83:33]
  assign RandomHardware_011_io_in = {RandomHardware_011_io_in_hi,wire_015}; // @[Cat.scala 30:58]
  assign ShiftRight_012_io_in = io_in[99:92]; // @[RandomHardware.scala 84:33]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = {wire_016,wire_015}; // @[Cat.scala 30:58]
  assign ShiftRegister_014_clock = clock;
  assign ShiftRegister_014_io_in = io_in[99:92]; // @[RandomHardware.scala 85:41]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = {RandomHardware_015_io_in_hi,wire_020}; // @[Cat.scala 30:58]
  assign ShiftLeft_016_io_in = Reg_008_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 102:18]
  assign ShiftRegister_017_clock = clock;
  assign ShiftRegister_017_io_in = io_in[99:96]; // @[RandomHardware.scala 86:41]
  assign Accum_018_clock = clock;
  assign Accum_018_io_in = RandomHardware_027_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 123:18]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_io_in = io_in[19:0]; // @[RandomHardware.scala 87:41]
  assign SignExtendDouble_020_io_in = {wire_023,wire_003}; // @[Cat.scala 30:58]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = {wire_025,wire_009}; // @[Cat.scala 30:58]
  assign ShiftRight_022_io_in = SignExtendDouble_007_io_out; // @[RandomHardware.scala 41:24 RandomHardware.scala 130:18]
  assign RandomHardware_023_io_in = {wire_029,wire_030}; // @[Cat.scala 30:58]
  assign RandomHardware_024_clock = clock;
  assign RandomHardware_024_io_in = {wire_006,wire_032}; // @[Cat.scala 30:58]
  assign ShiftLeft_025_io_in = io_in[99:92]; // @[RandomHardware.scala 88:33]
  assign RandomHardware_026_clock = clock;
  assign RandomHardware_026_io_in = {RandomHardware_026_io_in_hi,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_027_clock = clock;
  assign RandomHardware_027_io_in = {wire_013,wire_026}; // @[Cat.scala 30:58]
endmodule
