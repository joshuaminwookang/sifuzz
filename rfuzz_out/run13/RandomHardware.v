module ReduceAndMux(
  input  [25:0] io_in,
  output [10:0] io_out
);
  wire [10:0] IN1 = io_in[23:13]; // @[Muxes.scala 98:27]
  wire [10:0] IN2 = io_in[12:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_0(
  input  [25:0] io_in,
  output [10:0] io_out
);
  wire [25:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_0.scala 14:34]
  wire [10:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_0.scala 14:34]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_1_0.scala 14:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:33]
endmodule
module ShiftRight(
  input  [8:0] io_in,
  output [8:0] io_out
);
  assign io_out = {{3'd0}, io_in[8:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftRight_1(
  input  [9:0] io_in,
  output [9:0] io_out
);
  assign io_out = {{2'd0}, io_in[9:2]}; // @[ArithmeticLogical.scala 103:21]
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
module Mux2(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  sel = io_in[20]; // @[Muxes.scala 16:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 17:18]
  wire [9:0] in0 = io_in[9:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_2_1(
  input         clock,
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  Reg_000_clock; // @[RandomHardware_2_1.scala 15:26]
  wire [9:0] Reg_000_io_in; // @[RandomHardware_2_1.scala 15:26]
  wire [9:0] Reg_000_io_out; // @[RandomHardware_2_1.scala 15:26]
  wire [20:0] Mux2_001_io_in; // @[RandomHardware_2_1.scala 16:26]
  wire [9:0] Mux2_001_io_out; // @[RandomHardware_2_1.scala 16:26]
  Reg Reg_000 ( // @[RandomHardware_2_1.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_2_1.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_2_1.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = Mux2_001_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_2_1.scala 18:25]
endmodule
module RandomHardware_1_2(
  input         clock,
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] ShiftRight_000_io_in; // @[RandomHardware_1_2.scala 15:34]
  wire [9:0] ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 15:34]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_2.scala 16:42]
  wire [20:0] RandomHardware_001_io_in; // @[RandomHardware_1_2.scala 16:42]
  wire [9:0] RandomHardware_001_io_out; // @[RandomHardware_1_2.scala 16:42]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_1_2.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_2.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign ShiftRight_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_2.scala 18:33]
endmodule
module Accum(
  input        clock,
  input  [8:0] io_in,
  output [8:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceXorMux(
  input  [27:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[27:19]; // @[Muxes.scala 122:27]
  wire [8:0] IN2 = io_in[18:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_5(
  input  [27:0] io_in,
  output [8:0]  io_out
);
  wire [27:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_5.scala 14:34]
  wire [8:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_5.scala 14:34]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_5.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:33]
endmodule
module ShiftLeft(
  input  [9:0]  io_in,
  output [12:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRight_2(
  input  [10:0] io_in,
  output [10:0] io_out
);
  assign io_out = {{3'd0}, io_in[10:3]}; // @[ArithmeticLogical.scala 103:21]
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
module ShiftRight_3(
  input  [12:0] io_in,
  output [12:0] io_out
);
  assign io_out = {{5'd0}, io_in[12:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_3_0(
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire [12:0] ShiftRight_000_io_in; // @[RandomHardware_3_0.scala 14:34]
  wire [12:0] ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 14:34]
  ShiftRight_3 ShiftRight_000 ( // @[RandomHardware_3_0.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_3_0.scala 16:25]
endmodule
module RandomHardware_2_0(
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire [12:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 14:42]
  wire [12:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 14:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_0.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:33]
endmodule
module CompareMux(
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
module RandomHardware_1_10(
  input  [29:0] io_in,
  output [12:0] io_out
);
  wire [12:0] RandomHardware_000_io_in; // @[RandomHardware_1_10.scala 15:42]
  wire [12:0] RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 15:42]
  wire [29:0] CompareMux_001_io_in; // @[RandomHardware_1_10.scala 16:34]
  wire [12:0] CompareMux_001_io_out; // @[RandomHardware_1_10.scala 16:34]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_10.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_1_10.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 19:10]
  assign RandomHardware_000_io_in = CompareMux_001_io_out; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_10.scala 18:25]
endmodule
module Mux2_1(
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
  Mux2_1 Mux2_000 ( // @[RandomHardware_1_11.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_11.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_11.scala 16:25]
endmodule
module SignExtendDouble(
  input  [8:0]  io_in,
  output [17:0] io_out
);
  wire [8:0] io_out_hi = io_in[8] ? 9'h1ff : 9'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_12(
  input  [27:0] io_in,
  output [17:0] io_out
);
  wire [27:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_12.scala 15:34]
  wire [8:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 15:34]
  wire [8:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_12.scala 16:42]
  wire [17:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_12.scala 16:42]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_12.scala 15:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_1_12.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_12.scala 18:33]
  assign SignExtendDouble_001_io_in = ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
endmodule
module And(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 36:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module RandomHardware_1_13(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [19:0] And_000_io_in; // @[RandomHardware_1_13.scala 14:26]
  wire [9:0] And_000_io_out; // @[RandomHardware_1_13.scala 14:26]
  And And_000 ( // @[RandomHardware_1_13.scala 14:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  assign io_out = And_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign And_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:25]
endmodule
module RegE(
  input         clock,
  input  [21:0] io_in,
  output [20:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [20:0] data = io_in[21:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [19:0] reg_; // @[Memory.scala 22:18]
  wire [20:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[19:0];
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
  reg_ = _RAND_0[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_2(
  input         clock,
  input  [20:0] io_in,
  output [20:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [20:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[20:0];
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
  input  [21:0] io_in,
  output [20:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_14.scala 15:26]
  wire [21:0] RegE_000_io_in; // @[RandomHardware_1_14.scala 15:26]
  wire [20:0] RegE_000_io_out; // @[RandomHardware_1_14.scala 15:26]
  wire  Reg_001_clock; // @[RandomHardware_1_14.scala 16:26]
  wire [20:0] Reg_001_io_in; // @[RandomHardware_1_14.scala 16:26]
  wire [20:0] Reg_001_io_out; // @[RandomHardware_1_14.scala 16:26]
  RegE RegE_000 ( // @[RandomHardware_1_14.scala 15:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  Reg_2 Reg_001 ( // @[RandomHardware_1_14.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_14.scala 19:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = io_in; // @[RandomHardware_1_14.scala 18:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = RegE_000_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 21:18]
endmodule
module ShiftLeft_1(
  input  [17:0] io_in,
  output [18:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_16(
  input  [17:0] io_in,
  output [18:0] io_out
);
  wire [17:0] ShiftLeft_000_io_in; // @[RandomHardware_1_16.scala 14:34]
  wire [18:0] ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 14:34]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_16.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_16.scala 16:25]
endmodule
module CompareMux_1(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [11:0] IN1 = io_in[23:12]; // @[Muxes.scala 134:27]
  wire [6:0] IN2 = io_in[16:10]; // @[Muxes.scala 135:27]
  wire [4:0] SEL1 = io_in[9:5]; // @[Muxes.scala 136:27]
  wire [4:0] SEL2 = io_in[4:0]; // @[Muxes.scala 137:27]
  wire [11:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{5'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[6:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_17(
  input  [23:0] io_in,
  output [6:0]  io_out
);
  wire [23:0] CompareMux_000_io_in; // @[RandomHardware_1_17.scala 14:34]
  wire [6:0] CompareMux_000_io_out; // @[RandomHardware_1_17.scala 14:34]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_1_17.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:25]
endmodule
module Reg_3(
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
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [40:0] io_out
);
  wire [25:0] RandomHardware_000_io_in; // @[RandomHardware.scala 34:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware.scala 34:42]
  wire [8:0] ShiftRight_001_io_in; // @[RandomHardware.scala 35:34]
  wire [8:0] ShiftRight_001_io_out; // @[RandomHardware.scala 35:34]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 36:42]
  wire [20:0] RandomHardware_002_io_in; // @[RandomHardware.scala 36:42]
  wire [9:0] RandomHardware_002_io_out; // @[RandomHardware.scala 36:42]
  wire  Reg_003_clock; // @[RandomHardware.scala 37:26]
  wire [9:0] Reg_003_io_in; // @[RandomHardware.scala 37:26]
  wire [9:0] Reg_003_io_out; // @[RandomHardware.scala 37:26]
  wire  Accum_004_clock; // @[RandomHardware.scala 38:34]
  wire [8:0] Accum_004_io_in; // @[RandomHardware.scala 38:34]
  wire [8:0] Accum_004_io_out; // @[RandomHardware.scala 38:34]
  wire [27:0] RandomHardware_005_io_in; // @[RandomHardware.scala 39:42]
  wire [8:0] RandomHardware_005_io_out; // @[RandomHardware.scala 39:42]
  wire  Accum_006_clock; // @[RandomHardware.scala 40:34]
  wire [8:0] Accum_006_io_in; // @[RandomHardware.scala 40:34]
  wire [8:0] Accum_006_io_out; // @[RandomHardware.scala 40:34]
  wire [9:0] ShiftLeft_007_io_in; // @[RandomHardware.scala 41:34]
  wire [12:0] ShiftLeft_007_io_out; // @[RandomHardware.scala 41:34]
  wire [10:0] ShiftRight_008_io_in; // @[RandomHardware.scala 42:34]
  wire [10:0] ShiftRight_008_io_out; // @[RandomHardware.scala 42:34]
  wire  Accum_009_clock; // @[RandomHardware.scala 43:34]
  wire [9:0] Accum_009_io_in; // @[RandomHardware.scala 43:34]
  wire [9:0] Accum_009_io_out; // @[RandomHardware.scala 43:34]
  wire [29:0] RandomHardware_010_io_in; // @[RandomHardware.scala 44:42]
  wire [12:0] RandomHardware_010_io_out; // @[RandomHardware.scala 44:42]
  wire [18:0] RandomHardware_011_io_in; // @[RandomHardware.scala 45:42]
  wire [8:0] RandomHardware_011_io_out; // @[RandomHardware.scala 45:42]
  wire [27:0] RandomHardware_012_io_in; // @[RandomHardware.scala 46:42]
  wire [17:0] RandomHardware_012_io_out; // @[RandomHardware.scala 46:42]
  wire [19:0] RandomHardware_013_io_in; // @[RandomHardware.scala 47:42]
  wire [9:0] RandomHardware_013_io_out; // @[RandomHardware.scala 47:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 48:42]
  wire [21:0] RandomHardware_014_io_in; // @[RandomHardware.scala 48:42]
  wire [20:0] RandomHardware_014_io_out; // @[RandomHardware.scala 48:42]
  wire [9:0] ShiftRight_015_io_in; // @[RandomHardware.scala 49:34]
  wire [9:0] ShiftRight_015_io_out; // @[RandomHardware.scala 49:34]
  wire [17:0] RandomHardware_016_io_in; // @[RandomHardware.scala 50:42]
  wire [18:0] RandomHardware_016_io_out; // @[RandomHardware.scala 50:42]
  wire [23:0] RandomHardware_017_io_in; // @[RandomHardware.scala 51:42]
  wire [6:0] RandomHardware_017_io_out; // @[RandomHardware.scala 51:42]
  wire  Reg_018_clock; // @[RandomHardware.scala 52:26]
  wire [8:0] Reg_018_io_in; // @[RandomHardware.scala 52:26]
  wire [8:0] Reg_018_io_out; // @[RandomHardware.scala 52:26]
  wire [18:0] io_out_lo = {RandomHardware_011_io_out,ShiftRight_015_io_out}; // @[Cat.scala 30:58]
  wire [21:0] io_out_hi = {Accum_004_io_out,RandomHardware_010_io_out}; // @[Cat.scala 30:58]
  wire [18:0] wire_000 = RandomHardware_016_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 82:18]
  wire [6:0] wire_001 = RandomHardware_017_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 90:18]
  wire [10:0] wire_003 = ShiftRight_008_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 74:18]
  wire [9:0] wire_004 = RandomHardware_013_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 89:18]
  wire [12:0] wire_016 = ShiftLeft_007_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 72:18]
  wire [8:0] wire_017 = Reg_018_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 85:18]
  wire [20:0] wire_012 = RandomHardware_014_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 80:18]
  wire [8:0] wire_014 = RandomHardware_005_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 87:18]
  wire [9:0] wire_015 = Accum_009_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 77:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 34:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRight ShiftRight_001 ( // @[RandomHardware.scala 35:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 36:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  Reg Reg_003 ( // @[RandomHardware.scala 37:26]
    .clock(Reg_003_clock),
    .io_in(Reg_003_io_in),
    .io_out(Reg_003_io_out)
  );
  Accum Accum_004 ( // @[RandomHardware.scala 38:34]
    .clock(Accum_004_clock),
    .io_in(Accum_004_io_in),
    .io_out(Accum_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 39:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  Accum Accum_006 ( // @[RandomHardware.scala 40:34]
    .clock(Accum_006_clock),
    .io_in(Accum_006_io_in),
    .io_out(Accum_006_io_out)
  );
  ShiftLeft ShiftLeft_007 ( // @[RandomHardware.scala 41:34]
    .io_in(ShiftLeft_007_io_in),
    .io_out(ShiftLeft_007_io_out)
  );
  ShiftRight_2 ShiftRight_008 ( // @[RandomHardware.scala 42:34]
    .io_in(ShiftRight_008_io_in),
    .io_out(ShiftRight_008_io_out)
  );
  Accum_2 Accum_009 ( // @[RandomHardware.scala 43:34]
    .clock(Accum_009_clock),
    .io_in(Accum_009_io_in),
    .io_out(Accum_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 44:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 45:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 46:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 47:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 48:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  ShiftRight_1 ShiftRight_015 ( // @[RandomHardware.scala 49:34]
    .io_in(ShiftRight_015_io_in),
    .io_out(ShiftRight_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 50:42]
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 51:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  Reg_3 Reg_018 ( // @[RandomHardware.scala 52:26]
    .clock(Reg_018_clock),
    .io_in(Reg_018_io_in),
    .io_out(Reg_018_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign ShiftRight_001_io_in = RandomHardware_005_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 86:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
  assign Reg_003_clock = clock;
  assign Reg_003_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 66:18]
  assign Accum_004_clock = clock;
  assign Accum_004_io_in = ShiftRight_001_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 63:18]
  assign RandomHardware_005_io_in = io_in[27:0]; // @[RandomHardware.scala 54:41]
  assign Accum_006_clock = clock;
  assign Accum_006_io_in = ShiftRight_001_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 64:18]
  assign ShiftLeft_007_io_in = Accum_009_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 76:18]
  assign ShiftRight_008_io_in = RandomHardware_000_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 61:18]
  assign Accum_009_clock = clock;
  assign Accum_009_io_in = Reg_003_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 68:18]
  assign RandomHardware_010_io_in = {wire_012,wire_017}; // @[Cat.scala 30:58]
  assign RandomHardware_011_io_in = {wire_014,wire_015}; // @[Cat.scala 30:58]
  assign RandomHardware_012_io_in = io_in[27:0]; // @[RandomHardware.scala 55:41]
  assign RandomHardware_013_io_in = io_in[19:0]; // @[RandomHardware.scala 56:41]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = {wire_016,wire_017}; // @[Cat.scala 30:58]
  assign ShiftRight_015_io_in = Accum_009_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 78:18]
  assign RandomHardware_016_io_in = RandomHardware_012_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 88:18]
  assign RandomHardware_017_io_in = io_in[99:76]; // @[RandomHardware.scala 57:41]
  assign Reg_018_clock = clock;
  assign Reg_018_io_in = Accum_006_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 70:18]
endmodule
