module ReduceAndMux(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [5:0] IN1 = io_in[13:8]; // @[Muxes.scala 98:27]
  wire [5:0] IN2 = io_in[7:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_0(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [15:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_0.scala 14:34]
  wire [5:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_0.scala 14:34]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_1_0.scala 14:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:33]
endmodule
module Accum(
  input         clock,
  input  [10:0] io_in,
  output [10:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2(
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  sel = io_in[22]; // @[Muxes.scala 16:18]
  wire [10:0] in1 = io_in[21:11]; // @[Muxes.scala 17:18]
  wire [10:0] in0 = io_in[10:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_2_0(
  input         clock,
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_2_0.scala 15:34]
  wire [10:0] Accum_000_io_in; // @[RandomHardware_2_0.scala 15:34]
  wire [10:0] Accum_000_io_out; // @[RandomHardware_2_0.scala 15:34]
  wire [22:0] Mux2_001_io_in; // @[RandomHardware_2_0.scala 16:26]
  wire [10:0] Mux2_001_io_out; // @[RandomHardware_2_0.scala 16:26]
  Accum Accum_000 ( // @[RandomHardware_2_0.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_2_0.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = Mux2_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_2_0.scala 18:25]
endmodule
module RandomHardware_1_1(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_1.scala 14:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_1.scala 14:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_1.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_1.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{1'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_1.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{11'd0}, io_in}; // @[RandomHardware_1_1.scala 16:33]
endmodule
module RegE(
  input         clock,
  input  [24:0] io_in,
  output [23:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] data = io_in[24:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [22:0] reg_; // @[Memory.scala 22:18]
  wire [23:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[22:0];
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
  reg_ = _RAND_0[22:0];
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
  input  [24:0] io_in,
  output [24:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [24:0] r0; // @[Memory.scala 78:19]
  reg [24:0] r1; // @[Memory.scala 79:19]
  reg [24:0] r2; // @[Memory.scala 80:19]
  reg [24:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[24:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[24:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[24:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[24:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_2(
  input         clock,
  input  [24:0] io_in,
  output [23:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_2.scala 15:26]
  wire [24:0] RegE_000_io_in; // @[RandomHardware_1_2.scala 15:26]
  wire [23:0] RegE_000_io_out; // @[RandomHardware_1_2.scala 15:26]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_2.scala 16:42]
  wire [24:0] ShiftRegister_001_io_in; // @[RandomHardware_1_2.scala 16:42]
  wire [24:0] ShiftRegister_001_io_out; // @[RandomHardware_1_2.scala 16:42]
  RegE RegE_000 ( // @[RandomHardware_1_2.scala 15:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_1_2.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = RegE_000_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = ShiftRegister_001_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in; // @[RandomHardware_1_2.scala 18:33]
endmodule
module Accum_1(
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
  Accum_1 Accum_000 ( // @[RandomHardware_1_3.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module Reg(
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
module SignExtendDouble(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] io_out_hi = io_in[13] ? 14'h3fff : 14'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_1(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] SignExtendDouble_000_io_in; // @[RandomHardware_2_1.scala 14:42]
  wire [27:0] SignExtendDouble_000_io_out; // @[RandomHardware_2_1.scala 14:42]
  SignExtendDouble SignExtendDouble_000 ( // @[RandomHardware_2_1.scala 14:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_2_1.scala 17:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_2_1.scala 16:33]
endmodule
module Add(
  input  [19:0] io_in,
  output [10:0] io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 13:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 14:20]
  wire [9:0] _io_out_T_1 = in1 + in2; // @[ArithmeticLogical.scala 15:19]
  assign io_out = {{1'd0}, _io_out_T_1}; // @[ArithmeticLogical.scala 15:19]
endmodule
module RandomHardware_1_4(
  input         clock,
  input  [19:0] io_in,
  output [10:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_4.scala 16:26]
  wire [7:0] Reg_000_io_in; // @[RandomHardware_1_4.scala 16:26]
  wire [7:0] Reg_000_io_out; // @[RandomHardware_1_4.scala 16:26]
  wire [13:0] RandomHardware_001_io_in; // @[RandomHardware_1_4.scala 17:42]
  wire [27:0] RandomHardware_001_io_out; // @[RandomHardware_1_4.scala 17:42]
  wire [19:0] Add_002_io_in; // @[RandomHardware_1_4.scala 18:26]
  wire [10:0] Add_002_io_out; // @[RandomHardware_1_4.scala 18:26]
  wire [7:0] wire_000 = Reg_000_io_out; // @[RandomHardware_1_4.scala 13:24 RandomHardware_1_4.scala 24:18]
  wire [11:0] wire_001 = RandomHardware_001_io_out[11:0]; // @[RandomHardware_1_4.scala 14:24 RandomHardware_1_4.scala 25:18]
  Reg Reg_000 ( // @[RandomHardware_1_4.scala 16:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_4.scala 17:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  Add Add_002 ( // @[RandomHardware_1_4.scala 18:26]
    .io_in(Add_002_io_in),
    .io_out(Add_002_io_out)
  );
  assign io_out = Add_002_io_out; // @[RandomHardware_1_4.scala 22:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in[7:0]; // @[RandomHardware_1_4.scala 20:33]
  assign RandomHardware_001_io_in = {{2'd0}, io_in[11:0]}; // @[RandomHardware_1_4.scala 21:41]
  assign Add_002_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
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
module Accum_2(
  input        clock,
  input  [1:0] io_in,
  output [1:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_5(
  input         clock,
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_1_5.scala 15:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_1_5.scala 15:26]
  wire  Accum_001_clock; // @[RandomHardware_1_5.scala 16:34]
  wire [1:0] Accum_001_io_in; // @[RandomHardware_1_5.scala 16:34]
  wire [1:0] Accum_001_io_out; // @[RandomHardware_1_5.scala 16:34]
  Mux8 Mux8_000 ( // @[RandomHardware_1_5.scala 15:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  Accum_2 Accum_001 ( // @[RandomHardware_1_5.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_5.scala 19:10]
  assign Mux8_000_io_in = io_in; // @[RandomHardware_1_5.scala 18:25]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = Mux8_000_io_out; // @[RandomHardware_1_5.scala 13:24 RandomHardware_1_5.scala 21:18]
endmodule
module RegFile2R1W(
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
  wire [1:0] R1_SEL = io_in[7:6]; // @[Memory.scala 37:28]
  wire [1:0] R2_SEL = io_in[5:4]; // @[Memory.scala 38:28]
  wire [3:0] W_DATA = io_in[3:0]; // @[Memory.scala 39:28]
  reg [3:0] registers_0; // @[Memory.scala 41:22]
  reg [3:0] registers_1; // @[Memory.scala 41:22]
  reg [3:0] registers_2; // @[Memory.scala 41:22]
  reg [3:0] registers_3; // @[Memory.scala 41:22]
  wire [3:0] _GEN_5 = 2'h1 == R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_6 = 2'h2 == R1_SEL ? registers_2 : _GEN_5; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_7 = 2'h3 == R1_SEL ? registers_3 : _GEN_6; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_9 = 2'h1 == R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_10 = 2'h2 == R2_SEL ? registers_2 : _GEN_9; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [3:0] _GEN_11 = 2'h3 == R2_SEL ? registers_3 : _GEN_10; // @[Cat.scala 30:58 Cat.scala 30:58]
  assign io_out = {_GEN_7,_GEN_11}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (2'h0 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_0 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (2'h1 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_1 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (2'h2 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_2 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (2'h3 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_3 <= W_DATA; // @[Memory.scala 44:21]
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
  registers_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[3:0];
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
  input  [49:0] io_in,
  output [48:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [48:0] r0; // @[Memory.scala 60:19]
  reg [48:0] r1; // @[Memory.scala 61:19]
  reg [48:0] r2; // @[Memory.scala 62:19]
  reg [48:0] r3; // @[Memory.scala 63:19]
  wire [49:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 49'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[48:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 49'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 49'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 49'h0; // @[Memory.scala 63:19]
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
  _RAND_0 = {2{`RANDOM}};
  r0 = _RAND_0[48:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[48:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[48:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[48:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2_1(
  input  [48:0] io_in,
  output [23:0] io_out
);
  wire  sel = io_in[48]; // @[Muxes.scala 16:18]
  wire [23:0] in1 = io_in[47:24]; // @[Muxes.scala 17:18]
  wire [23:0] in0 = io_in[23:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_7(
  input         clock,
  input         reset,
  input  [49:0] io_in,
  output [23:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_7.scala 15:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_7.scala 15:42]
  wire [49:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_7.scala 15:42]
  wire [48:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_7.scala 15:42]
  wire [48:0] Mux2_001_io_in; // @[RandomHardware_1_7.scala 16:26]
  wire [23:0] Mux2_001_io_out; // @[RandomHardware_1_7.scala 16:26]
  ResetShiftRegister ResetShiftRegister_000 ( // @[RandomHardware_1_7.scala 15:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  Mux2_1 Mux2_001 ( // @[RandomHardware_1_7.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Mux2_001_io_out; // @[RandomHardware_1_7.scala 19:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_7.scala 18:33]
  assign Mux2_001_io_in = ResetShiftRegister_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 21:18]
endmodule
module Mod(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 71:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 72:20]
  wire [7:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[7:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_1_8(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] Mod_000_io_in; // @[RandomHardware_1_8.scala 14:26]
  wire [7:0] Mod_000_io_out; // @[RandomHardware_1_8.scala 14:26]
  Mod Mod_000 ( // @[RandomHardware_1_8.scala 14:26]
    .io_in(Mod_000_io_in),
    .io_out(Mod_000_io_out)
  );
  assign io_out = Mod_000_io_out; // @[RandomHardware_1_8.scala 17:10]
  assign Mod_000_io_in = io_in; // @[RandomHardware_1_8.scala 16:25]
endmodule
module ResetShiftRegister_1(
  input         clock,
  input         reset,
  input  [44:0] io_in,
  output [43:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [43:0] r0; // @[Memory.scala 60:19]
  reg [43:0] r1; // @[Memory.scala 61:19]
  reg [43:0] r2; // @[Memory.scala 62:19]
  reg [43:0] r3; // @[Memory.scala 63:19]
  wire [44:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 44'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[43:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 44'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 44'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 44'h0; // @[Memory.scala 63:19]
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
  _RAND_0 = {2{`RANDOM}};
  r0 = _RAND_0[43:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[43:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[43:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[43:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ResetShiftRegister_2(
  input         clock,
  input         reset,
  input  [43:0] io_in,
  output [42:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [42:0] r0; // @[Memory.scala 60:19]
  reg [42:0] r1; // @[Memory.scala 61:19]
  reg [42:0] r2; // @[Memory.scala 62:19]
  reg [42:0] r3; // @[Memory.scala 63:19]
  wire [43:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 43'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[42:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 43'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 43'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 43'h0; // @[Memory.scala 63:19]
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
  _RAND_0 = {2{`RANDOM}};
  r0 = _RAND_0[42:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[42:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[42:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[42:0];
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
  input         reset,
  input  [44:0] io_in,
  output [42:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_9.scala 15:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_9.scala 15:42]
  wire [44:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_9.scala 15:42]
  wire [43:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 15:42]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_9.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_9.scala 16:42]
  wire [43:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_9.scala 16:42]
  wire [42:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_9.scala 16:42]
  ResetShiftRegister_1 ResetShiftRegister_000 ( // @[RandomHardware_1_9.scala 15:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  ResetShiftRegister_2 ResetShiftRegister_001 ( // @[RandomHardware_1_9.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = ResetShiftRegister_001_io_out; // @[RandomHardware_1_9.scala 19:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_9.scala 18:33]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = ResetShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 21:18]
endmodule
module ResetShiftRegister_3(
  input         clock,
  input         reset,
  input  [33:0] io_in,
  output [32:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [32:0] r0; // @[Memory.scala 60:19]
  reg [32:0] r1; // @[Memory.scala 61:19]
  reg [32:0] r2; // @[Memory.scala 62:19]
  reg [32:0] r3; // @[Memory.scala 63:19]
  wire [33:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 33'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[32:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 33'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 33'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 33'h0; // @[Memory.scala 63:19]
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
  _RAND_0 = {2{`RANDOM}};
  r0 = _RAND_0[32:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[32:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[32:0];
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
  input         reset,
  input  [33:0] io_in,
  output [32:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_10.scala 14:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_10.scala 14:42]
  wire [33:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_10.scala 14:42]
  wire [32:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_10.scala 14:42]
  ResetShiftRegister_3 ResetShiftRegister_000 ( // @[RandomHardware_1_10.scala 14:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_1_10.scala 17:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_10.scala 16:33]
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
module Reg_1(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [18:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_11(
  input         clock,
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire [18:0] Mux2_000_io_in; // @[RandomHardware_1_11.scala 15:26]
  wire [8:0] Mux2_000_io_out; // @[RandomHardware_1_11.scala 15:26]
  wire  Reg_001_clock; // @[RandomHardware_1_11.scala 16:26]
  wire [18:0] Reg_001_io_in; // @[RandomHardware_1_11.scala 16:26]
  wire [18:0] Reg_001_io_out; // @[RandomHardware_1_11.scala 16:26]
  Mux2_2 Mux2_000 ( // @[RandomHardware_1_11.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  Reg_1 Reg_001 ( // @[RandomHardware_1_11.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_11.scala 19:10]
  assign Mux2_000_io_in = Reg_001_io_out; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 21:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = io_in; // @[RandomHardware_1_11.scala 18:25]
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
module Accum_4(
  input        clock,
  input  [5:0] io_in,
  output [5:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux4(
  input  [41:0] io_in,
  output [9:0]  io_out
);
  wire [1:0] sel = io_in[41:40]; // @[Muxes.scala 28:18]
  wire [9:0] in3 = io_in[39:30]; // @[Muxes.scala 29:18]
  wire [9:0] in2 = io_in[29:20]; // @[Muxes.scala 30:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 31:18]
  wire [9:0] in0 = io_in[9:0]; // @[Muxes.scala 32:18]
  wire [9:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [9:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module ShiftRight(
  input  [9:0] io_in,
  output [9:0] io_out
);
  assign io_out = {{2'd0}, io_in[9:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_14(
  input  [41:0] io_in,
  output [9:0]  io_out
);
  wire [41:0] Mux4_000_io_in; // @[RandomHardware_1_14.scala 15:26]
  wire [9:0] Mux4_000_io_out; // @[RandomHardware_1_14.scala 15:26]
  wire [9:0] ShiftRight_001_io_in; // @[RandomHardware_1_14.scala 16:34]
  wire [9:0] ShiftRight_001_io_out; // @[RandomHardware_1_14.scala 16:34]
  Mux4 Mux4_000 ( // @[RandomHardware_1_14.scala 15:26]
    .io_in(Mux4_000_io_in),
    .io_out(Mux4_000_io_out)
  );
  ShiftRight ShiftRight_001 ( // @[RandomHardware_1_14.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = ShiftRight_001_io_out; // @[RandomHardware_1_14.scala 19:10]
  assign Mux4_000_io_in = io_in; // @[RandomHardware_1_14.scala 18:25]
  assign ShiftRight_001_io_in = Mux4_000_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 21:18]
endmodule
module Accum_6(
  input         clock,
  input  [29:0] io_in,
  output [29:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [29:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[29:0];
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
  input  [29:0] io_in,
  output [29:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [29:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[29:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_1(
  input  [10:0] io_in,
  output [10:0] io_out
);
  assign io_out = {{1'd0}, io_in[10:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module CompareMux(
  input  [27:0] io_in,
  output [10:0] io_out
);
  wire [13:0] IN1 = io_in[27:14]; // @[Muxes.scala 134:27]
  wire [10:0] IN2 = io_in[16:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [13:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[10:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_2_2(
  input  [27:0] io_in,
  output [10:0] io_out
);
  wire [10:0] ShiftRight_000_io_in; // @[RandomHardware_2_2.scala 15:34]
  wire [10:0] ShiftRight_000_io_out; // @[RandomHardware_2_2.scala 15:34]
  wire [27:0] CompareMux_001_io_in; // @[RandomHardware_2_2.scala 16:34]
  wire [10:0] CompareMux_001_io_out; // @[RandomHardware_2_2.scala 16:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_2_2.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_2_2.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_2_2.scala 19:10]
  assign ShiftRight_000_io_in = CompareMux_001_io_out; // @[RandomHardware_2_2.scala 13:24 RandomHardware_2_2.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_2_2.scala 18:25]
endmodule
module RandomHardware_1_16(
  input         clock,
  input  [29:0] io_in,
  output [44:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_16.scala 16:34]
  wire [29:0] Accum_000_io_in; // @[RandomHardware_1_16.scala 16:34]
  wire [29:0] Accum_000_io_out; // @[RandomHardware_1_16.scala 16:34]
  wire  Reg_001_clock; // @[RandomHardware_1_16.scala 17:26]
  wire [29:0] Reg_001_io_in; // @[RandomHardware_1_16.scala 17:26]
  wire [29:0] Reg_001_io_out; // @[RandomHardware_1_16.scala 17:26]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware_1_16.scala 18:42]
  wire [10:0] RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 18:42]
  wire [40:0] _io_out_T = {Reg_001_io_out,RandomHardware_002_io_out}; // @[Cat.scala 30:58]
  wire [29:0] wire_000 = Accum_000_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 23:18]
  Accum_6 Accum_000 ( // @[RandomHardware_1_16.scala 16:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Reg_2 Reg_001 ( // @[RandomHardware_1_16.scala 17:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_16.scala 18:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = {{4'd0}, _io_out_T}; // @[Cat.scala 30:58]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_16.scala 20:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Accum_000_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 23:18]
  assign RandomHardware_002_io_in = wire_000[27:0]; // @[RandomHardware_1_16.scala 26:33]
endmodule
module ShiftRight_2(
  input  [13:0] io_in,
  output [13:0] io_out
);
  assign io_out = {{2'd0}, io_in[13:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_17(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] ShiftRight_000_io_in; // @[RandomHardware_1_17.scala 15:34]
  wire [13:0] ShiftRight_000_io_out; // @[RandomHardware_1_17.scala 15:34]
  wire [13:0] RandomHardware_001_io_in; // @[RandomHardware_1_17.scala 16:42]
  wire [27:0] RandomHardware_001_io_out; // @[RandomHardware_1_17.scala 16:42]
  ShiftRight_2 ShiftRight_000 ( // @[RandomHardware_1_17.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_17.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = RandomHardware_001_io_out; // @[RandomHardware_1_17.scala 19:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_17.scala 18:25]
  assign RandomHardware_001_io_in = ShiftRight_000_io_out; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 21:18]
endmodule
module ShiftRight_3(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{3'd0}, io_in[11:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_18(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_1_18.scala 14:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_1_18.scala 14:34]
  ShiftRight_3 ShiftRight_000 ( // @[RandomHardware_1_18.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module ResetShiftRegister_4(
  input         clock,
  input         reset,
  input  [23:0] io_in,
  output [22:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [22:0] r0; // @[Memory.scala 60:19]
  reg [22:0] r1; // @[Memory.scala 61:19]
  reg [22:0] r2; // @[Memory.scala 62:19]
  reg [22:0] r3; // @[Memory.scala 63:19]
  wire [23:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 23'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[22:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 23'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 23'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 23'h0; // @[Memory.scala 63:19]
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
module RandomHardware_1_19(
  input         clock,
  input         reset,
  input  [23:0] io_in,
  output [22:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_19.scala 14:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_19.scala 14:42]
  wire [23:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_19.scala 14:42]
  wire [22:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_19.scala 14:42]
  ResetShiftRegister_4 ResetShiftRegister_000 ( // @[RandomHardware_1_19.scala 14:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_1_19.scala 17:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_19.scala 16:33]
endmodule
module Reg_3(
  input         clock,
  input  [21:0] io_in,
  output [21:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [21:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[21:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_4(
  input  [39:0] io_in,
  output [39:0] io_out
);
  assign io_out = {{3'd0}, io_in[39:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RegE_1(
  input         clock,
  input  [61:0] io_in,
  output [60:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [60:0] data = io_in[61:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [59:0] reg_; // @[Memory.scala 22:18]
  wire [60:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[59:0];
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
  reg_ = _RAND_0[59:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2_3(
  input  [60:0] io_in,
  output [29:0] io_out
);
  wire  sel = io_in[60]; // @[Muxes.scala 16:18]
  wire [29:0] in1 = io_in[59:30]; // @[Muxes.scala 17:18]
  wire [29:0] in0 = io_in[29:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_20(
  input         clock,
  input  [63:0] io_in,
  output [51:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_20.scala 18:26]
  wire [21:0] Reg_000_io_in; // @[RandomHardware_1_20.scala 18:26]
  wire [21:0] Reg_000_io_out; // @[RandomHardware_1_20.scala 18:26]
  wire [39:0] ShiftRight_001_io_in; // @[RandomHardware_1_20.scala 19:34]
  wire [39:0] ShiftRight_001_io_out; // @[RandomHardware_1_20.scala 19:34]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware_1_20.scala 20:42]
  wire [10:0] RandomHardware_002_io_out; // @[RandomHardware_1_20.scala 20:42]
  wire  RegE_003_clock; // @[RandomHardware_1_20.scala 21:26]
  wire [61:0] RegE_003_io_in; // @[RandomHardware_1_20.scala 21:26]
  wire [60:0] RegE_003_io_out; // @[RandomHardware_1_20.scala 21:26]
  wire [60:0] Mux2_004_io_in; // @[RandomHardware_1_20.scala 22:26]
  wire [29:0] Mux2_004_io_out; // @[RandomHardware_1_20.scala 22:26]
  wire [39:0] wire_000 = ShiftRight_001_io_out; // @[RandomHardware_1_20.scala 13:24 RandomHardware_1_20.scala 30:18]
  wire [21:0] wire_002 = {{11'd0}, RandomHardware_002_io_out}; // @[RandomHardware_1_20.scala 15:24 RandomHardware_1_20.scala 32:18]
  Reg_3 Reg_000 ( // @[RandomHardware_1_20.scala 18:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ShiftRight_4 ShiftRight_001 ( // @[RandomHardware_1_20.scala 19:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_20.scala 20:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RegE_1 RegE_003 ( // @[RandomHardware_1_20.scala 21:26]
    .clock(RegE_003_clock),
    .io_in(RegE_003_io_in),
    .io_out(RegE_003_io_out)
  );
  Mux2_3 Mux2_004 ( // @[RandomHardware_1_20.scala 22:26]
    .io_in(Mux2_004_io_in),
    .io_out(Mux2_004_io_out)
  );
  assign io_out = {Reg_000_io_out,Mux2_004_io_out}; // @[Cat.scala 30:58]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = {{11'd0}, RandomHardware_002_io_out}; // @[RandomHardware_1_20.scala 14:24 RandomHardware_1_20.scala 31:18]
  assign ShiftRight_001_io_in = io_in[39:0]; // @[RandomHardware_1_20.scala 24:33]
  assign RandomHardware_002_io_in = {{4'd0}, io_in[23:0]}; // @[RandomHardware_1_20.scala 25:41]
  assign RegE_003_clock = clock;
  assign RegE_003_io_in = {wire_000,wire_002}; // @[Cat.scala 30:58]
  assign Mux2_004_io_in = RegE_003_io_out; // @[RandomHardware_1_20.scala 16:24 RandomHardware_1_20.scala 29:18]
endmodule
module ShiftRight_6(
  input  [12:0] io_in,
  output [12:0] io_out
);
  assign io_out = {{5'd0}, io_in[12:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftRegister_1(
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
module RandomHardware_1_21(
  input         clock,
  input  [43:0] io_in,
  output [12:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_21.scala 16:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_21.scala 16:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_21.scala 16:42]
  wire [12:0] ShiftRight_001_io_in; // @[RandomHardware_1_21.scala 17:34]
  wire [12:0] ShiftRight_001_io_out; // @[RandomHardware_1_21.scala 17:34]
  wire  ShiftRegister_002_clock; // @[RandomHardware_1_21.scala 18:42]
  wire [12:0] ShiftRegister_002_io_in; // @[RandomHardware_1_21.scala 18:42]
  wire [12:0] ShiftRegister_002_io_out; // @[RandomHardware_1_21.scala 18:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_21.scala 16:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRight_6 ShiftRight_001 ( // @[RandomHardware_1_21.scala 17:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  ShiftRegister_1 ShiftRegister_002 ( // @[RandomHardware_1_21.scala 18:42]
    .clock(ShiftRegister_002_clock),
    .io_in(ShiftRegister_002_io_in),
    .io_out(ShiftRegister_002_io_out)
  );
  assign io_out = ShiftRegister_002_io_out; // @[RandomHardware_1_21.scala 21:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[22:0]; // @[RandomHardware_1_21.scala 20:33]
  assign ShiftRight_001_io_in = {{2'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 25:18]
  assign ShiftRegister_002_clock = clock;
  assign ShiftRegister_002_io_in = ShiftRight_001_io_out; // @[RandomHardware_1_21.scala 14:24 RandomHardware_1_21.scala 24:18]
endmodule
module ShiftRegister_2(
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
module RandomHardware_1_23(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_23.scala 14:42]
  wire [19:0] ShiftRegister_000_io_in; // @[RandomHardware_1_23.scala 14:42]
  wire [19:0] ShiftRegister_000_io_out; // @[RandomHardware_1_23.scala 14:42]
  ShiftRegister_3 ShiftRegister_000 ( // @[RandomHardware_1_23.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:33]
endmodule
module ReduceOrMux(
  input  [59:0] io_in,
  output [28:0] io_out
);
  wire [28:0] IN1 = io_in[59:31]; // @[Muxes.scala 110:27]
  wire [28:0] IN2 = io_in[30:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module SignExtendDouble_2(
  input  [29:0] io_in,
  output [59:0] io_out
);
  wire [29:0] io_out_hi = io_in[29] ? 30'h3fffffff : 30'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft(
  input  [28:0] io_in,
  output [32:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_1(
  input  [14:0] io_in,
  output [18:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_24(
  input  [42:0] io_in,
  output [32:0] io_out
);
  wire [59:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_24.scala 18:34]
  wire [28:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_24.scala 18:34]
  wire [29:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_24.scala 19:42]
  wire [59:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_24.scala 19:42]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware_1_24.scala 20:42]
  wire [10:0] RandomHardware_002_io_out; // @[RandomHardware_1_24.scala 20:42]
  wire [28:0] ShiftLeft_003_io_in; // @[RandomHardware_1_24.scala 21:34]
  wire [32:0] ShiftLeft_003_io_out; // @[RandomHardware_1_24.scala 21:34]
  wire [14:0] ShiftLeft_004_io_in; // @[RandomHardware_1_24.scala 22:34]
  wire [18:0] ShiftLeft_004_io_out; // @[RandomHardware_1_24.scala 22:34]
  wire [10:0] wire_001 = RandomHardware_002_io_out; // @[RandomHardware_1_24.scala 14:24 RandomHardware_1_24.scala 32:18]
  wire [18:0] wire_002 = ShiftLeft_004_io_out; // @[RandomHardware_1_24.scala 15:24 RandomHardware_1_24.scala 33:18]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_24.scala 18:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_001 ( // @[RandomHardware_1_24.scala 19:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_24.scala 20:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftLeft ShiftLeft_003 ( // @[RandomHardware_1_24.scala 21:34]
    .io_in(ShiftLeft_003_io_in),
    .io_out(ShiftLeft_003_io_out)
  );
  ShiftLeft_1 ShiftLeft_004 ( // @[RandomHardware_1_24.scala 22:34]
    .io_in(ShiftLeft_004_io_in),
    .io_out(ShiftLeft_004_io_out)
  );
  assign io_out = ShiftLeft_003_io_out; // @[RandomHardware_1_24.scala 26:10]
  assign ReduceOrMux_000_io_in = SignExtendDouble_001_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 31:18]
  assign SignExtendDouble_001_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_002_io_in = io_in[27:0]; // @[RandomHardware_1_24.scala 24:41]
  assign ShiftLeft_003_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_24.scala 16:24 RandomHardware_1_24.scala 29:18]
  assign ShiftLeft_004_io_in = io_in[14:0]; // @[RandomHardware_1_24.scala 25:33]
endmodule
module Reg_4(
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
module ReduceXorMux(
  input  [31:0] io_in,
  output [10:0] io_out
);
  wire [10:0] IN1 = io_in[31:21]; // @[Muxes.scala 122:27]
  wire [10:0] IN2 = io_in[20:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_25(
  input         clock,
  input  [31:0] io_in,
  output [10:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_25.scala 15:26]
  wire [10:0] Reg_000_io_in; // @[RandomHardware_1_25.scala 15:26]
  wire [10:0] Reg_000_io_out; // @[RandomHardware_1_25.scala 15:26]
  wire [31:0] ReduceXorMux_001_io_in; // @[RandomHardware_1_25.scala 16:34]
  wire [10:0] ReduceXorMux_001_io_out; // @[RandomHardware_1_25.scala 16:34]
  Reg_4 Reg_000 ( // @[RandomHardware_1_25.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ReduceXorMux ReduceXorMux_001 ( // @[RandomHardware_1_25.scala 16:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_25.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = ReduceXorMux_001_io_out; // @[RandomHardware_1_25.scala 13:24 RandomHardware_1_25.scala 21:18]
  assign ReduceXorMux_001_io_in = io_in; // @[RandomHardware_1_25.scala 18:33]
endmodule
module RandomHardware_1_26(
  input         clock,
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_26.scala 14:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_26.scala 14:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_26.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_26.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_26.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_26.scala 16:33]
endmodule
module Mux2_6(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  sel = io_in[20]; // @[Muxes.scala 16:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 17:18]
  wire [9:0] in0 = io_in[9:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_27(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire [20:0] Mux2_000_io_in; // @[RandomHardware_1_27.scala 14:26]
  wire [9:0] Mux2_000_io_out; // @[RandomHardware_1_27.scala 14:26]
  Mux2_6 Mux2_000 ( // @[RandomHardware_1_27.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_27.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_27.scala 16:25]
endmodule
module ShiftLeft_2(
  input  [2:0] io_in,
  output [5:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mux8_1(
  input  [26:0] io_in,
  output [2:0]  io_out
);
  wire [2:0] sel = io_in[26:24]; // @[Muxes.scala 44:18]
  wire [14:0] in7 = io_in[23:9]; // @[Muxes.scala 45:18]
  wire [14:0] in6 = io_in[20:6]; // @[Muxes.scala 46:18]
  wire [2:0] in5 = io_in[17:15]; // @[Muxes.scala 47:18]
  wire [2:0] in4 = io_in[14:12]; // @[Muxes.scala 48:18]
  wire [2:0] in3 = io_in[11:9]; // @[Muxes.scala 49:18]
  wire [2:0] in2 = io_in[8:6]; // @[Muxes.scala 50:18]
  wire [2:0] in1 = io_in[5:3]; // @[Muxes.scala 51:18]
  wire [2:0] in0 = io_in[2:0]; // @[Muxes.scala 52:18]
  wire [2:0] _GEN_0 = sel == 3'h1 ? in1 : in0; // @[Muxes.scala 59:32 Muxes.scala 59:41 Muxes.scala 60:36]
  wire [2:0] _GEN_1 = sel == 3'h2 ? in2 : _GEN_0; // @[Muxes.scala 58:32 Muxes.scala 58:41]
  wire [2:0] _GEN_2 = sel == 3'h3 ? in3 : _GEN_1; // @[Muxes.scala 57:32 Muxes.scala 57:41]
  wire [2:0] _GEN_3 = sel == 3'h4 ? in4 : _GEN_2; // @[Muxes.scala 56:32 Muxes.scala 56:41]
  wire [2:0] _GEN_4 = sel == 3'h5 ? in5 : _GEN_3; // @[Muxes.scala 55:32 Muxes.scala 55:41]
  wire [14:0] _GEN_5 = sel == 3'h6 ? in6 : {{12'd0}, _GEN_4}; // @[Muxes.scala 54:32 Muxes.scala 54:41]
  wire [14:0] _GEN_6 = sel == 3'h7 ? in7 : _GEN_5; // @[Muxes.scala 53:32 Muxes.scala 53:41]
  assign io_out = _GEN_6[2:0];
endmodule
module RandomHardware_1_28(
  input  [26:0] io_in,
  output [5:0]  io_out
);
  wire [2:0] ShiftLeft_000_io_in; // @[RandomHardware_1_28.scala 15:34]
  wire [5:0] ShiftLeft_000_io_out; // @[RandomHardware_1_28.scala 15:34]
  wire [26:0] Mux8_001_io_in; // @[RandomHardware_1_28.scala 16:26]
  wire [2:0] Mux8_001_io_out; // @[RandomHardware_1_28.scala 16:26]
  ShiftLeft_2 ShiftLeft_000 ( // @[RandomHardware_1_28.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Mux8_1 Mux8_001 ( // @[RandomHardware_1_28.scala 16:26]
    .io_in(Mux8_001_io_in),
    .io_out(Mux8_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_28.scala 19:10]
  assign ShiftLeft_000_io_in = Mux8_001_io_out; // @[RandomHardware_1_28.scala 13:24 RandomHardware_1_28.scala 21:18]
  assign Mux8_001_io_in = io_in; // @[RandomHardware_1_28.scala 18:25]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [135:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware.scala 65:42]
  wire [5:0] RandomHardware_000_io_out; // @[RandomHardware.scala 65:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 66:42]
  wire [11:0] RandomHardware_001_io_in; // @[RandomHardware.scala 66:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware.scala 66:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 67:42]
  wire [24:0] RandomHardware_002_io_in; // @[RandomHardware.scala 67:42]
  wire [23:0] RandomHardware_002_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 68:42]
  wire [11:0] RandomHardware_003_io_in; // @[RandomHardware.scala 68:42]
  wire [11:0] RandomHardware_003_io_out; // @[RandomHardware.scala 68:42]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 69:42]
  wire [19:0] RandomHardware_004_io_in; // @[RandomHardware.scala 69:42]
  wire [10:0] RandomHardware_004_io_out; // @[RandomHardware.scala 69:42]
  wire  RandomHardware_005_clock; // @[RandomHardware.scala 70:42]
  wire [18:0] RandomHardware_005_io_in; // @[RandomHardware.scala 70:42]
  wire [1:0] RandomHardware_005_io_out; // @[RandomHardware.scala 70:42]
  wire  RegFile2R1W_006_clock; // @[RandomHardware.scala 71:34]
  wire [7:0] RegFile2R1W_006_io_in; // @[RandomHardware.scala 71:34]
  wire [7:0] RegFile2R1W_006_io_out; // @[RandomHardware.scala 71:34]
  wire  RandomHardware_007_clock; // @[RandomHardware.scala 72:42]
  wire  RandomHardware_007_reset; // @[RandomHardware.scala 72:42]
  wire [49:0] RandomHardware_007_io_in; // @[RandomHardware.scala 72:42]
  wire [23:0] RandomHardware_007_io_out; // @[RandomHardware.scala 72:42]
  wire [15:0] RandomHardware_008_io_in; // @[RandomHardware.scala 73:42]
  wire [7:0] RandomHardware_008_io_out; // @[RandomHardware.scala 73:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 74:42]
  wire  RandomHardware_009_reset; // @[RandomHardware.scala 74:42]
  wire [44:0] RandomHardware_009_io_in; // @[RandomHardware.scala 74:42]
  wire [42:0] RandomHardware_009_io_out; // @[RandomHardware.scala 74:42]
  wire  RandomHardware_010_clock; // @[RandomHardware.scala 75:42]
  wire  RandomHardware_010_reset; // @[RandomHardware.scala 75:42]
  wire [33:0] RandomHardware_010_io_in; // @[RandomHardware.scala 75:42]
  wire [32:0] RandomHardware_010_io_out; // @[RandomHardware.scala 75:42]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 76:42]
  wire [18:0] RandomHardware_011_io_in; // @[RandomHardware.scala 76:42]
  wire [8:0] RandomHardware_011_io_out; // @[RandomHardware.scala 76:42]
  wire  Accum_012_clock; // @[RandomHardware.scala 77:34]
  wire [7:0] Accum_012_io_in; // @[RandomHardware.scala 77:34]
  wire [7:0] Accum_012_io_out; // @[RandomHardware.scala 77:34]
  wire  Accum_013_clock; // @[RandomHardware.scala 78:34]
  wire [5:0] Accum_013_io_in; // @[RandomHardware.scala 78:34]
  wire [5:0] Accum_013_io_out; // @[RandomHardware.scala 78:34]
  wire [41:0] RandomHardware_014_io_in; // @[RandomHardware.scala 79:42]
  wire [9:0] RandomHardware_014_io_out; // @[RandomHardware.scala 79:42]
  wire  Accum_015_clock; // @[RandomHardware.scala 80:34]
  wire [5:0] Accum_015_io_in; // @[RandomHardware.scala 80:34]
  wire [5:0] Accum_015_io_out; // @[RandomHardware.scala 80:34]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 81:42]
  wire [29:0] RandomHardware_016_io_in; // @[RandomHardware.scala 81:42]
  wire [44:0] RandomHardware_016_io_out; // @[RandomHardware.scala 81:42]
  wire [13:0] RandomHardware_017_io_in; // @[RandomHardware.scala 82:42]
  wire [27:0] RandomHardware_017_io_out; // @[RandomHardware.scala 82:42]
  wire [11:0] RandomHardware_018_io_in; // @[RandomHardware.scala 83:42]
  wire [11:0] RandomHardware_018_io_out; // @[RandomHardware.scala 83:42]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 84:42]
  wire  RandomHardware_019_reset; // @[RandomHardware.scala 84:42]
  wire [23:0] RandomHardware_019_io_in; // @[RandomHardware.scala 84:42]
  wire [22:0] RandomHardware_019_io_out; // @[RandomHardware.scala 84:42]
  wire  RandomHardware_020_clock; // @[RandomHardware.scala 85:42]
  wire [63:0] RandomHardware_020_io_in; // @[RandomHardware.scala 85:42]
  wire [51:0] RandomHardware_020_io_out; // @[RandomHardware.scala 85:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 86:42]
  wire [43:0] RandomHardware_021_io_in; // @[RandomHardware.scala 86:42]
  wire [12:0] RandomHardware_021_io_out; // @[RandomHardware.scala 86:42]
  wire  ShiftRegister_022_clock; // @[RandomHardware.scala 87:42]
  wire [5:0] ShiftRegister_022_io_in; // @[RandomHardware.scala 87:42]
  wire [5:0] ShiftRegister_022_io_out; // @[RandomHardware.scala 87:42]
  wire  RandomHardware_023_clock; // @[RandomHardware.scala 88:42]
  wire [19:0] RandomHardware_023_io_in; // @[RandomHardware.scala 88:42]
  wire [19:0] RandomHardware_023_io_out; // @[RandomHardware.scala 88:42]
  wire [42:0] RandomHardware_024_io_in; // @[RandomHardware.scala 89:42]
  wire [32:0] RandomHardware_024_io_out; // @[RandomHardware.scala 89:42]
  wire  RandomHardware_025_clock; // @[RandomHardware.scala 90:42]
  wire [31:0] RandomHardware_025_io_in; // @[RandomHardware.scala 90:42]
  wire [10:0] RandomHardware_025_io_out; // @[RandomHardware.scala 90:42]
  wire  RandomHardware_026_clock; // @[RandomHardware.scala 91:42]
  wire [22:0] RandomHardware_026_io_in; // @[RandomHardware.scala 91:42]
  wire [10:0] RandomHardware_026_io_out; // @[RandomHardware.scala 91:42]
  wire [20:0] RandomHardware_027_io_in; // @[RandomHardware.scala 92:42]
  wire [9:0] RandomHardware_027_io_out; // @[RandomHardware.scala 92:42]
  wire [26:0] RandomHardware_028_io_in; // @[RandomHardware.scala 93:42]
  wire [5:0] RandomHardware_028_io_out; // @[RandomHardware.scala 93:42]
  wire [84:0] io_out_lo = {RandomHardware_020_io_out,RandomHardware_024_io_out}; // @[Cat.scala 30:58]
  wire [50:0] io_out_hi = {RegFile2R1W_006_io_out,RandomHardware_009_io_out}; // @[Cat.scala 30:58]
  wire [1:0] wire_001 = RandomHardware_005_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 111:18]
  wire [22:0] wire_002 = RandomHardware_019_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 168:18]
  wire [11:0] wire_003 = RandomHardware_001_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 104:18]
  wire [7:0] wire_004 = RandomHardware_008_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 163:18]
  wire [5:0] wire_005 = RandomHardware_000_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 157:18]
  wire [12:0] wire_006 = RandomHardware_021_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 141:18]
  wire [44:0] wire_008 = RandomHardware_016_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 136:18]
  wire [4:0] wire_009 = RandomHardware_027_io_out[9:5]; // @[RandomHardware.scala 153:47]
  wire [57:0] _RandomHardware_010_io_in_T = {wire_008,wire_006}; // @[Cat.scala 30:58]
  wire [5:0] wire_015 = Accum_015_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 133:18]
  wire [32:0] wire_021 = RandomHardware_010_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 119:18]
  wire [5:0] wire_022 = ShiftRegister_022_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 146:18]
  wire [40:0] _RandomHardware_014_io_in_T = {wire_001,wire_021,wire_022}; // @[Cat.scala 30:58]
  wire [5:0] wire_027 = RandomHardware_018_io_out[11:6]; // @[RandomHardware.scala 166:47]
  wire [10:0] wire_028 = RandomHardware_026_io_out; // @[RandomHardware.scala 41:24 RandomHardware.scala 151:18]
  wire [16:0] RandomHardware_016_io_in_lo = {wire_027,wire_028}; // @[Cat.scala 30:58]
  wire [10:0] wire_025 = RandomHardware_004_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 109:18]
  wire [12:0] RandomHardware_016_io_in_hi = {wire_025,wire_001}; // @[Cat.scala 30:58]
  wire [7:0] wire_029 = Accum_012_io_out; // @[RandomHardware.scala 42:24 RandomHardware.scala 123:18]
  wire [11:0] wire_038 = RandomHardware_018_io_out; // @[RandomHardware.scala 51:24 RandomHardware.scala 167:18]
  wire [19:0] wire_039 = RandomHardware_023_io_out; // @[RandomHardware.scala 52:24 RandomHardware.scala 172:18]
  wire [31:0] RandomHardware_021_io_in_lo = {wire_038,wire_039}; // @[Cat.scala 30:58]
  wire [5:0] wire_037 = Accum_013_io_out; // @[RandomHardware.scala 50:24 RandomHardware.scala 128:18]
  wire [11:0] RandomHardware_021_io_in_hi = {wire_005,wire_037}; // @[Cat.scala 30:58]
  wire [23:0] wire_043 = RandomHardware_007_io_out; // @[RandomHardware.scala 56:24 RandomHardware.scala 117:18]
  wire [8:0] wire_048 = RandomHardware_011_io_out; // @[RandomHardware.scala 61:24 RandomHardware.scala 121:18]
  wire [14:0] RandomHardware_027_io_in_hi = {wire_005,wire_048}; // @[Cat.scala 30:58]
  wire [10:0] wire_045 = RandomHardware_025_io_out; // @[RandomHardware.scala 58:24 RandomHardware.scala 149:18]
  wire [29:0] _RandomHardware_028_io_in_T = {wire_029,wire_015,wire_045,wire_009}; // @[Cat.scala 30:58]
  wire [9:0] wire_011 = RandomHardware_014_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 131:18]
  wire [21:0] RandomHardware_009_io_in_hi = {wire_003,wire_011}; // @[Cat.scala 30:58]
  wire [11:0] wire_031 = RandomHardware_003_io_out; // @[RandomHardware.scala 44:24 RandomHardware.scala 162:18]
  wire [79:0] _RandomHardware_020_io_in_T = {wire_031,wire_043,wire_004,wire_002,wire_006}; // @[Cat.scala 30:58]
  wire [23:0] wire_041 = RandomHardware_002_io_out; // @[RandomHardware.scala 54:24 RandomHardware.scala 107:18]
  wire [27:0] wire_042 = RandomHardware_017_io_out; // @[RandomHardware.scala 55:24 RandomHardware.scala 139:18]
  wire [51:0] _RandomHardware_024_io_in_T = {wire_041,wire_042}; // @[Cat.scala 30:58]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 66:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 67:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 70:42]
    .clock(RandomHardware_005_clock),
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RegFile2R1W RegFile2R1W_006 ( // @[RandomHardware.scala 71:34]
    .clock(RegFile2R1W_006_clock),
    .io_in(RegFile2R1W_006_io_in),
    .io_out(RegFile2R1W_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 72:42]
    .clock(RandomHardware_007_clock),
    .reset(RandomHardware_007_reset),
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 73:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 74:42]
    .clock(RandomHardware_009_clock),
    .reset(RandomHardware_009_reset),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 75:42]
    .clock(RandomHardware_010_clock),
    .reset(RandomHardware_010_reset),
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 76:42]
    .clock(RandomHardware_011_clock),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  Accum_3 Accum_012 ( // @[RandomHardware.scala 77:34]
    .clock(Accum_012_clock),
    .io_in(Accum_012_io_in),
    .io_out(Accum_012_io_out)
  );
  Accum_4 Accum_013 ( // @[RandomHardware.scala 78:34]
    .clock(Accum_013_clock),
    .io_in(Accum_013_io_in),
    .io_out(Accum_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 79:42]
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  Accum_4 Accum_015 ( // @[RandomHardware.scala 80:34]
    .clock(Accum_015_clock),
    .io_in(Accum_015_io_in),
    .io_out(Accum_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 81:42]
    .clock(RandomHardware_016_clock),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 82:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 83:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 84:42]
    .clock(RandomHardware_019_clock),
    .reset(RandomHardware_019_reset),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  RandomHardware_1_20 RandomHardware_020 ( // @[RandomHardware.scala 85:42]
    .clock(RandomHardware_020_clock),
    .io_in(RandomHardware_020_io_in),
    .io_out(RandomHardware_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 86:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  ShiftRegister_2 ShiftRegister_022 ( // @[RandomHardware.scala 87:42]
    .clock(ShiftRegister_022_clock),
    .io_in(ShiftRegister_022_io_in),
    .io_out(ShiftRegister_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 88:42]
    .clock(RandomHardware_023_clock),
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 89:42]
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  RandomHardware_1_25 RandomHardware_025 ( // @[RandomHardware.scala 90:42]
    .clock(RandomHardware_025_clock),
    .io_in(RandomHardware_025_io_in),
    .io_out(RandomHardware_025_io_out)
  );
  RandomHardware_1_26 RandomHardware_026 ( // @[RandomHardware.scala 91:42]
    .clock(RandomHardware_026_clock),
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  RandomHardware_1_27 RandomHardware_027 ( // @[RandomHardware.scala 92:42]
    .io_in(RandomHardware_027_io_in),
    .io_out(RandomHardware_027_io_out)
  );
  RandomHardware_1_28 RandomHardware_028 ( // @[RandomHardware.scala 93:42]
    .io_in(RandomHardware_028_io_in),
    .io_out(RandomHardware_028_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[99:84]; // @[RandomHardware.scala 95:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = RandomHardware_003_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 161:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = io_in[99:88]; // @[RandomHardware.scala 96:41]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
  assign RandomHardware_005_clock = clock;
  assign RandomHardware_005_io_in = {wire_005,wire_006}; // @[Cat.scala 30:58]
  assign RegFile2R1W_006_clock = clock;
  assign RegFile2R1W_006_io_in = RandomHardware_007_io_out[19:12]; // @[RandomHardware.scala 115:47]
  assign RandomHardware_007_clock = clock;
  assign RandomHardware_007_reset = reset;
  assign RandomHardware_007_io_in = {wire_008,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_008_io_in = io_in[99:84]; // @[RandomHardware.scala 97:41]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_reset = reset;
  assign RandomHardware_009_io_in = {RandomHardware_009_io_in_hi,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_010_clock = clock;
  assign RandomHardware_010_reset = reset;
  assign RandomHardware_010_io_in = _RandomHardware_010_io_in_T[33:0]; // @[RandomHardware.scala 118:33]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_io_in = {wire_015,wire_006}; // @[Cat.scala 30:58]
  assign Accum_012_clock = clock;
  assign Accum_012_io_in = RandomHardware_008_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 164:18]
  assign Accum_013_clock = clock;
  assign Accum_013_io_in = RandomHardware_000_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 158:18]
  assign RandomHardware_014_io_in = {{1'd0}, _RandomHardware_014_io_in_T}; // @[Cat.scala 30:58]
  assign Accum_015_clock = clock;
  assign Accum_015_io_in = Accum_013_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 127:18]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_io_in = {RandomHardware_016_io_in_hi,RandomHardware_016_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_017_io_in = {wire_029,wire_022}; // @[Cat.scala 30:58]
  assign RandomHardware_018_io_in = io_in[99:88]; // @[RandomHardware.scala 98:41]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_reset = reset;
  assign RandomHardware_019_io_in = io_in[99:76]; // @[RandomHardware.scala 99:41]
  assign RandomHardware_020_clock = clock;
  assign RandomHardware_020_io_in = _RandomHardware_020_io_in_T[63:0]; // @[RandomHardware.scala 175:33]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = {RandomHardware_021_io_in_hi,RandomHardware_021_io_in_lo}; // @[Cat.scala 30:58]
  assign ShiftRegister_022_clock = clock;
  assign ShiftRegister_022_io_in = RandomHardware_028_io_out; // @[RandomHardware.scala 53:24 RandomHardware.scala 156:18]
  assign RandomHardware_023_clock = clock;
  assign RandomHardware_023_io_in = io_in[99:80]; // @[RandomHardware.scala 100:41]
  assign RandomHardware_024_io_in = _RandomHardware_024_io_in_T[42:0]; // @[RandomHardware.scala 176:33]
  assign RandomHardware_025_clock = clock;
  assign RandomHardware_025_io_in = {wire_043,wire_029}; // @[Cat.scala 30:58]
  assign RandomHardware_026_clock = clock;
  assign RandomHardware_026_io_in = RandomHardware_019_io_out; // @[RandomHardware.scala 59:24 RandomHardware.scala 171:18]
  assign RandomHardware_027_io_in = {RandomHardware_027_io_in_hi,wire_037}; // @[Cat.scala 30:58]
  assign RandomHardware_028_io_in = _RandomHardware_028_io_in_T[26:0]; // @[RandomHardware.scala 155:33]
endmodule
