module Accum(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [13:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_0(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_0.scala 15:34]
  wire [13:0] Accum_000_io_in; // @[RandomHardware_1_0.scala 15:34]
  wire [13:0] Accum_000_io_out; // @[RandomHardware_1_0.scala 15:34]
  wire  Accum_001_clock; // @[RandomHardware_1_0.scala 16:34]
  wire [13:0] Accum_001_io_in; // @[RandomHardware_1_0.scala 16:34]
  wire [13:0] Accum_001_io_out; // @[RandomHardware_1_0.scala 16:34]
  Accum Accum_000 ( // @[RandomHardware_1_0.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Accum Accum_001 ( // @[RandomHardware_1_0.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_0.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_0.scala 18:25]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = Accum_000_io_out; // @[RandomHardware_1_0.scala 13:24 RandomHardware_1_0.scala 21:18]
endmodule
module ReduceXorMux(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[23:17]; // @[Muxes.scala 122:27]
  wire [6:0] IN2 = io_in[16:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_1(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [23:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [6:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_1.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:33]
endmodule
module ShiftRight(
  input  [8:0] io_in,
  output [8:0] io_out
);
  assign io_out = {{3'd0}, io_in[8:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ReduceAndMux(
  input  [27:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[22:14]; // @[Muxes.scala 98:27]
  wire [8:0] IN2 = io_in[13:5]; // @[Muxes.scala 99:27]
  wire [4:0] SEL = io_in[4:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_2(
  input  [27:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] ShiftRight_000_io_in; // @[RandomHardware_1_2.scala 15:34]
  wire [8:0] ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 15:34]
  wire [27:0] ReduceAndMux_001_io_in; // @[RandomHardware_1_2.scala 16:34]
  wire [8:0] ReduceAndMux_001_io_out; // @[RandomHardware_1_2.scala 16:34]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_2.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ReduceAndMux ReduceAndMux_001 ( // @[RandomHardware_1_2.scala 16:34]
    .io_in(ReduceAndMux_001_io_in),
    .io_out(ReduceAndMux_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign ShiftRight_000_io_in = ReduceAndMux_001_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
  assign ReduceAndMux_001_io_in = io_in; // @[RandomHardware_1_2.scala 18:33]
endmodule
module SignExtendDouble(
  input  [8:0]  io_in,
  output [17:0] io_out
);
  wire [8:0] io_out_hi = io_in[8] ? 9'h1ff : 9'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module And(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 36:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module Div(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 59:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module ReduceAndMux_1(
  input  [31:0] io_in,
  output [11:0] io_out
);
  wire [11:0] IN1 = io_in[27:16]; // @[Muxes.scala 98:27]
  wire [11:0] IN2 = io_in[15:4]; // @[Muxes.scala 99:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module CompareMux(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [7:0] IN1 = io_in[15:8]; // @[Muxes.scala 134:27]
  wire [5:0] IN2 = io_in[9:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [7:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[5:0]; // @[Muxes.scala 139:12]
endmodule
module Reg(
  input        clock,
  input  [5:0] io_in,
  output [5:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_4(
  input         clock,
  input  [61:0] io_in,
  output [11:0] io_out
);
  wire [19:0] And_000_io_in; // @[RandomHardware_1_4.scala 18:26]
  wire [9:0] And_000_io_out; // @[RandomHardware_1_4.scala 18:26]
  wire [19:0] Div_001_io_in; // @[RandomHardware_1_4.scala 19:26]
  wire [9:0] Div_001_io_out; // @[RandomHardware_1_4.scala 19:26]
  wire [31:0] ReduceAndMux_002_io_in; // @[RandomHardware_1_4.scala 20:34]
  wire [11:0] ReduceAndMux_002_io_out; // @[RandomHardware_1_4.scala 20:34]
  wire [15:0] CompareMux_003_io_in; // @[RandomHardware_1_4.scala 21:34]
  wire [5:0] CompareMux_003_io_out; // @[RandomHardware_1_4.scala 21:34]
  wire  Reg_004_clock; // @[RandomHardware_1_4.scala 22:26]
  wire [5:0] Reg_004_io_in; // @[RandomHardware_1_4.scala 22:26]
  wire [5:0] Reg_004_io_out; // @[RandomHardware_1_4.scala 22:26]
  wire [5:0] wire_002 = CompareMux_003_io_out; // @[RandomHardware_1_4.scala 15:24 RandomHardware_1_4.scala 32:18]
  wire [5:0] wire_003 = Reg_004_io_out; // @[RandomHardware_1_4.scala 16:24 RandomHardware_1_4.scala 33:18]
  wire [11:0] ReduceAndMux_002_io_in_lo = {wire_002,wire_003}; // @[Cat.scala 30:58]
  wire [9:0] wire_000 = And_000_io_out; // @[RandomHardware_1_4.scala 13:24 RandomHardware_1_4.scala 30:18]
  wire [9:0] wire_001 = Div_001_io_out; // @[RandomHardware_1_4.scala 14:24 RandomHardware_1_4.scala 31:18]
  wire [19:0] ReduceAndMux_002_io_in_hi = {wire_000,wire_001}; // @[Cat.scala 30:58]
  And And_000 ( // @[RandomHardware_1_4.scala 18:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  Div Div_001 ( // @[RandomHardware_1_4.scala 19:26]
    .io_in(Div_001_io_in),
    .io_out(Div_001_io_out)
  );
  ReduceAndMux_1 ReduceAndMux_002 ( // @[RandomHardware_1_4.scala 20:34]
    .io_in(ReduceAndMux_002_io_in),
    .io_out(ReduceAndMux_002_io_out)
  );
  CompareMux CompareMux_003 ( // @[RandomHardware_1_4.scala 21:34]
    .io_in(CompareMux_003_io_in),
    .io_out(CompareMux_003_io_out)
  );
  Reg Reg_004 ( // @[RandomHardware_1_4.scala 22:26]
    .clock(Reg_004_clock),
    .io_in(Reg_004_io_in),
    .io_out(Reg_004_io_out)
  );
  assign io_out = ReduceAndMux_002_io_out; // @[RandomHardware_1_4.scala 28:10]
  assign And_000_io_in = io_in[61:42]; // @[RandomHardware_1_4.scala 24:33]
  assign Div_001_io_in = io_in[61:42]; // @[RandomHardware_1_4.scala 25:33]
  assign ReduceAndMux_002_io_in = {ReduceAndMux_002_io_in_hi,ReduceAndMux_002_io_in_lo}; // @[Cat.scala 30:58]
  assign CompareMux_003_io_in = io_in[15:0]; // @[RandomHardware_1_4.scala 26:33]
  assign Reg_004_clock = clock;
  assign Reg_004_io_in = io_in[5:0]; // @[RandomHardware_1_4.scala 27:33]
endmodule
module ShiftLeft(
  input  [9:0]  io_in,
  output [13:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRegister(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] r0; // @[Memory.scala 78:19]
  reg [11:0] r1; // @[Memory.scala 79:19]
  reg [11:0] r2; // @[Memory.scala 80:19]
  reg [11:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[11:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[11:0];
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
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_6.scala 14:42]
  wire [11:0] ShiftRegister_000_io_in; // @[RandomHardware_1_6.scala 14:42]
  wire [11:0] ShiftRegister_000_io_out; // @[RandomHardware_1_6.scala 14:42]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware_1_6.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_6.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_6.scala 16:33]
endmodule
module ShiftLeft_1(
  input  [11:0] io_in,
  output [14:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_7(
  input  [11:0] io_in,
  output [14:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_7.scala 14:34]
  wire [14:0] ShiftLeft_000_io_out; // @[RandomHardware_1_7.scala 14:34]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_7.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_7.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_7.scala 16:25]
endmodule
module ShiftRegister_1(
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
module Reg_1(
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
module ReduceOrMux(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[23:16]; // @[Muxes.scala 110:27]
  wire [7:0] IN2 = io_in[15:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_9(
  input         clock,
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_9.scala 15:26]
  wire [7:0] Reg_000_io_in; // @[RandomHardware_1_9.scala 15:26]
  wire [7:0] Reg_000_io_out; // @[RandomHardware_1_9.scala 15:26]
  wire [23:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_9.scala 16:34]
  wire [7:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_9.scala 16:34]
  Reg_1 Reg_000 ( // @[RandomHardware_1_9.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ReduceOrMux ReduceOrMux_001 ( // @[RandomHardware_1_9.scala 16:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_9.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 21:18]
  assign ReduceOrMux_001_io_in = io_in; // @[RandomHardware_1_9.scala 18:33]
endmodule
module ShiftLeft_2(
  input  [6:0]  io_in,
  output [11:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mux2(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire  sel = io_in[18]; // @[Muxes.scala 16:18]
  wire [8:0] in1 = io_in[17:9]; // @[Muxes.scala 17:18]
  wire [8:0] in0 = io_in[8:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_11(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire [18:0] Mux2_000_io_in; // @[RandomHardware_1_11.scala 14:26]
  wire [8:0] Mux2_000_io_out; // @[RandomHardware_1_11.scala 14:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_11.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_11.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_11.scala 16:25]
endmodule
module Reg_2(
  input        clock,
  input  [4:0] io_in,
  output [4:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CompareMux_1(
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
module RandomHardware_1_12(
  input         clock,
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_12.scala 15:26]
  wire [4:0] Reg_000_io_in; // @[RandomHardware_1_12.scala 15:26]
  wire [4:0] Reg_000_io_out; // @[RandomHardware_1_12.scala 15:26]
  wire [19:0] CompareMux_001_io_in; // @[RandomHardware_1_12.scala 16:34]
  wire [4:0] CompareMux_001_io_out; // @[RandomHardware_1_12.scala 16:34]
  Reg_2 Reg_000 ( // @[RandomHardware_1_12.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  CompareMux_1 CompareMux_001 ( // @[RandomHardware_1_12.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = CompareMux_001_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_12.scala 18:25]
endmodule
module ReduceOrMux_1(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[23:15]; // @[Muxes.scala 110:27]
  wire [8:0] IN2 = io_in[14:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_13(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [23:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_13.scala 14:34]
  wire [8:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_13.scala 14:34]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_1_13.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:33]
endmodule
module SignExtendDouble_1(
  input  [23:0] io_in,
  output [47:0] io_out
);
  wire [23:0] io_out_hi = io_in[23] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Mul(
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire [11:0] in1 = io_in[23:12]; // @[ArithmeticLogical.scala 47:20]
  wire [11:0] in2 = io_in[11:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_2_0(
  input  [23:0] io_in,
  output [47:0] io_out
);
  wire [23:0] SignExtendDouble_000_io_in; // @[RandomHardware_2_0.scala 15:42]
  wire [47:0] SignExtendDouble_000_io_out; // @[RandomHardware_2_0.scala 15:42]
  wire [23:0] Mul_001_io_in; // @[RandomHardware_2_0.scala 16:26]
  wire [23:0] Mul_001_io_out; // @[RandomHardware_2_0.scala 16:26]
  SignExtendDouble_1 SignExtendDouble_000 ( // @[RandomHardware_2_0.scala 15:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  Mul Mul_001 ( // @[RandomHardware_2_0.scala 16:26]
    .io_in(Mul_001_io_in),
    .io_out(Mul_001_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign SignExtendDouble_000_io_in = Mul_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
  assign Mul_001_io_in = io_in; // @[RandomHardware_2_0.scala 18:25]
endmodule
module ShiftRegister_2(
  input         clock,
  input  [23:0] io_in,
  output [23:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] r0; // @[Memory.scala 78:19]
  reg [23:0] r1; // @[Memory.scala 79:19]
  reg [23:0] r2; // @[Memory.scala 80:19]
  reg [23:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[23:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[23:0];
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
  input  [23:0] io_in,
  output [47:0] io_out
);
  wire [23:0] RandomHardware_000_io_in; // @[RandomHardware_1_14.scala 15:42]
  wire [47:0] RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 15:42]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_14.scala 16:42]
  wire [23:0] ShiftRegister_001_io_in; // @[RandomHardware_1_14.scala 16:42]
  wire [23:0] ShiftRegister_001_io_out; // @[RandomHardware_1_14.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_14.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRegister_2 ShiftRegister_001 ( // @[RandomHardware_1_14.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 19:10]
  assign RandomHardware_000_io_in = ShiftRegister_001_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 21:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in; // @[RandomHardware_1_14.scala 18:33]
endmodule
module Accum_2(
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
module CompareMux_2(
  input  [27:0] io_in,
  output [9:0]  io_out
);
  wire [13:0] IN1 = io_in[27:14]; // @[Muxes.scala 134:27]
  wire [9:0] IN2 = io_in[17:8]; // @[Muxes.scala 135:27]
  wire [3:0] SEL1 = io_in[7:4]; // @[Muxes.scala 136:27]
  wire [3:0] SEL2 = io_in[3:0]; // @[Muxes.scala 137:27]
  wire [13:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{4'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[9:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [27:0] io_in,
  output [9:0]  io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_15.scala 15:34]
  wire [9:0] Accum_000_io_in; // @[RandomHardware_1_15.scala 15:34]
  wire [9:0] Accum_000_io_out; // @[RandomHardware_1_15.scala 15:34]
  wire [27:0] CompareMux_001_io_in; // @[RandomHardware_1_15.scala 16:34]
  wire [9:0] CompareMux_001_io_out; // @[RandomHardware_1_15.scala 16:34]
  Accum_2 Accum_000 ( // @[RandomHardware_1_15.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  CompareMux_2 CompareMux_001 ( // @[RandomHardware_1_15.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_15.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = CompareMux_001_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_15.scala 18:25]
endmodule
module ShiftLeft_3(
  input  [14:0] io_in,
  output [15:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Accum_3(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRegister_3(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] r0; // @[Memory.scala 78:19]
  reg [14:0] r1; // @[Memory.scala 79:19]
  reg [14:0] r2; // @[Memory.scala 80:19]
  reg [14:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[14:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[14:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[14:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_2_2(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_2_2.scala 14:42]
  wire [14:0] ShiftRegister_000_io_in; // @[RandomHardware_2_2.scala 14:42]
  wire [14:0] ShiftRegister_000_io_out; // @[RandomHardware_2_2.scala 14:42]
  ShiftRegister_3 ShiftRegister_000 ( // @[RandomHardware_2_2.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_2_2.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_2_2.scala 16:33]
endmodule
module RandomHardware_1_16(
  input         clock,
  input  [14:0] io_in,
  output [15:0] io_out
);
  wire [14:0] ShiftLeft_000_io_in; // @[RandomHardware_1_16.scala 16:34]
  wire [15:0] ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 16:34]
  wire  Accum_001_clock; // @[RandomHardware_1_16.scala 17:34]
  wire [15:0] Accum_001_io_in; // @[RandomHardware_1_16.scala 17:34]
  wire [15:0] Accum_001_io_out; // @[RandomHardware_1_16.scala 17:34]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_16.scala 18:42]
  wire [14:0] RandomHardware_002_io_in; // @[RandomHardware_1_16.scala 18:42]
  wire [14:0] RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 18:42]
  ShiftLeft_3 ShiftLeft_000 ( // @[RandomHardware_1_16.scala 16:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Accum_3 Accum_001 ( // @[RandomHardware_1_16.scala 17:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_16.scala 18:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_16.scala 21:10]
  assign ShiftLeft_000_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 25:18]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 14:24 RandomHardware_1_16.scala 24:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = io_in; // @[RandomHardware_1_16.scala 20:33]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [46:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware.scala 32:42]
  wire [13:0] RandomHardware_000_io_in; // @[RandomHardware.scala 32:42]
  wire [13:0] RandomHardware_000_io_out; // @[RandomHardware.scala 32:42]
  wire [23:0] RandomHardware_001_io_in; // @[RandomHardware.scala 33:42]
  wire [6:0] RandomHardware_001_io_out; // @[RandomHardware.scala 33:42]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware.scala 34:42]
  wire [8:0] RandomHardware_002_io_out; // @[RandomHardware.scala 34:42]
  wire [8:0] SignExtendDouble_003_io_in; // @[RandomHardware.scala 35:42]
  wire [17:0] SignExtendDouble_003_io_out; // @[RandomHardware.scala 35:42]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 36:42]
  wire [61:0] RandomHardware_004_io_in; // @[RandomHardware.scala 36:42]
  wire [11:0] RandomHardware_004_io_out; // @[RandomHardware.scala 36:42]
  wire [9:0] ShiftLeft_005_io_in; // @[RandomHardware.scala 37:34]
  wire [13:0] ShiftLeft_005_io_out; // @[RandomHardware.scala 37:34]
  wire  RandomHardware_006_clock; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_006_io_in; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_006_io_out; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_007_io_in; // @[RandomHardware.scala 39:42]
  wire [14:0] RandomHardware_007_io_out; // @[RandomHardware.scala 39:42]
  wire  ShiftRegister_008_clock; // @[RandomHardware.scala 40:42]
  wire [6:0] ShiftRegister_008_io_in; // @[RandomHardware.scala 40:42]
  wire [6:0] ShiftRegister_008_io_out; // @[RandomHardware.scala 40:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 41:42]
  wire [23:0] RandomHardware_009_io_in; // @[RandomHardware.scala 41:42]
  wire [7:0] RandomHardware_009_io_out; // @[RandomHardware.scala 41:42]
  wire [6:0] ShiftLeft_010_io_in; // @[RandomHardware.scala 42:34]
  wire [11:0] ShiftLeft_010_io_out; // @[RandomHardware.scala 42:34]
  wire [18:0] RandomHardware_011_io_in; // @[RandomHardware.scala 43:42]
  wire [8:0] RandomHardware_011_io_out; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_012_clock; // @[RandomHardware.scala 44:42]
  wire [19:0] RandomHardware_012_io_in; // @[RandomHardware.scala 44:42]
  wire [4:0] RandomHardware_012_io_out; // @[RandomHardware.scala 44:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 45:42]
  wire [8:0] RandomHardware_013_io_out; // @[RandomHardware.scala 45:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 46:42]
  wire [23:0] RandomHardware_014_io_in; // @[RandomHardware.scala 46:42]
  wire [47:0] RandomHardware_014_io_out; // @[RandomHardware.scala 46:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 47:42]
  wire [27:0] RandomHardware_015_io_in; // @[RandomHardware.scala 47:42]
  wire [9:0] RandomHardware_015_io_out; // @[RandomHardware.scala 47:42]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 48:42]
  wire [14:0] RandomHardware_016_io_in; // @[RandomHardware.scala 48:42]
  wire [15:0] RandomHardware_016_io_out; // @[RandomHardware.scala 48:42]
  wire [19:0] io_out_lo = {RandomHardware_007_io_out,RandomHardware_012_io_out}; // @[Cat.scala 30:58]
  wire [26:0] io_out_hi = {RandomHardware_002_io_out,SignExtendDouble_003_io_out}; // @[Cat.scala 30:58]
  wire [13:0] wire_004 = RandomHardware_000_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 57:18]
  wire [47:0] wire_005 = RandomHardware_014_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 80:18]
  wire [5:0] wire_016 = RandomHardware_004_io_out[11:6]; // @[RandomHardware.scala 60:47]
  wire [11:0] wire_011 = RandomHardware_004_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 59:18]
  wire [6:0] wire_012 = ShiftRegister_008_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 66:18]
  wire [8:0] wire_017 = RandomHardware_011_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 72:18]
  wire [11:0] wire_001 = ShiftLeft_010_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 68:18]
  wire [15:0] wire_002 = RandomHardware_016_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 76:18]
  wire [11:0] wire_013 = RandomHardware_006_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 64:18]
  wire [7:0] wire_014 = RandomHardware_009_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 79:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 32:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 33:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 34:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  SignExtendDouble SignExtendDouble_003 ( // @[RandomHardware.scala 35:42]
    .io_in(SignExtendDouble_003_io_in),
    .io_out(SignExtendDouble_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 36:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  ShiftLeft ShiftLeft_005 ( // @[RandomHardware.scala 37:34]
    .io_in(ShiftLeft_005_io_in),
    .io_out(ShiftLeft_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 38:42]
    .clock(RandomHardware_006_clock),
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 39:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  ShiftRegister_1 ShiftRegister_008 ( // @[RandomHardware.scala 40:42]
    .clock(ShiftRegister_008_clock),
    .io_in(ShiftRegister_008_io_in),
    .io_out(ShiftRegister_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 41:42]
    .clock(RandomHardware_009_clock),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  ShiftLeft_2 ShiftLeft_010 ( // @[RandomHardware.scala 42:34]
    .io_in(ShiftLeft_010_io_in),
    .io_out(ShiftLeft_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 43:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 44:42]
    .clock(RandomHardware_012_clock),
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 45:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 46:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 47:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 48:42]
    .clock(RandomHardware_016_clock),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = ShiftLeft_005_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 62:18]
  assign RandomHardware_001_io_in = io_in[99:76]; // @[RandomHardware.scala 50:41]
  assign RandomHardware_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign SignExtendDouble_003_io_in = RandomHardware_013_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 74:18]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = {wire_004,wire_005}; // @[Cat.scala 30:58]
  assign ShiftLeft_005_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 82:18]
  assign RandomHardware_006_clock = clock;
  assign RandomHardware_006_io_in = ShiftLeft_010_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 69:18]
  assign RandomHardware_007_io_in = ShiftLeft_010_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 70:18]
  assign ShiftRegister_008_clock = clock;
  assign ShiftRegister_008_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 77:18]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_io_in = io_in[23:0]; // @[RandomHardware.scala 51:41]
  assign ShiftLeft_010_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 78:18]
  assign RandomHardware_011_io_in = {wire_011,wire_012}; // @[Cat.scala 30:58]
  assign RandomHardware_012_clock = clock;
  assign RandomHardware_012_io_in = {wire_013,wire_014}; // @[Cat.scala 30:58]
  assign RandomHardware_013_io_in = RandomHardware_014_io_out[47:24]; // @[RandomHardware.scala 81:47]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = io_in[23:0]; // @[RandomHardware.scala 52:41]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = io_in[27:0]; // @[RandomHardware.scala 53:41]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_io_in = {wire_016,wire_017}; // @[Cat.scala 30:58]
endmodule
