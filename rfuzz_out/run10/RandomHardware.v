module And(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 36:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module RandomHardware_1_0(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] And_000_io_in; // @[RandomHardware_1_0.scala 14:26]
  wire [7:0] And_000_io_out; // @[RandomHardware_1_0.scala 14:26]
  And And_000 ( // @[RandomHardware_1_0.scala 14:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  assign io_out = And_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign And_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:25]
endmodule
module Reg(
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
module RandomHardware_1_1(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_1.scala 14:26]
  wire [19:0] Reg_000_io_in; // @[RandomHardware_1_1.scala 14:26]
  wire [19:0] Reg_000_io_out; // @[RandomHardware_1_1.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_1_1.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:25]
endmodule
module SignExtendDouble(
  input  [4:0] io_in,
  output [9:0] io_out
);
  wire [4:0] io_out_hi = io_in[4] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Mul(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [3:0] in1 = io_in[7:4]; // @[ArithmeticLogical.scala 47:20]
  wire [3:0] in2 = io_in[3:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module ReduceXorMux(
  input  [27:0] io_in,
  output [11:0] io_out
);
  wire [11:0] IN1 = io_in[27:16]; // @[Muxes.scala 122:27]
  wire [11:0] IN2 = io_in[15:4]; // @[Muxes.scala 123:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
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
module SignExtendDouble_1(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_1(
  input         clock,
  input  [19:0] io_in,
  output [11:0] io_out
);
  wire [27:0] ReduceXorMux_000_io_in; // @[RandomHardware_2_1.scala 16:34]
  wire [11:0] ReduceXorMux_000_io_out; // @[RandomHardware_2_1.scala 16:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_2_1.scala 17:42]
  wire [11:0] ShiftRegister_001_io_in; // @[RandomHardware_2_1.scala 17:42]
  wire [11:0] ShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 17:42]
  wire [7:0] SignExtendDouble_002_io_in; // @[RandomHardware_2_1.scala 18:42]
  wire [15:0] SignExtendDouble_002_io_out; // @[RandomHardware_2_1.scala 18:42]
  wire [11:0] wire_000 = ShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 24:18]
  wire [15:0] wire_001 = SignExtendDouble_002_io_out; // @[RandomHardware_2_1.scala 14:24 RandomHardware_2_1.scala 25:18]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_2_1.scala 16:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_2_1.scala 17:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_002 ( // @[RandomHardware_2_1.scala 18:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_2_1.scala 22:10]
  assign ReduceXorMux_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in[19:8]; // @[RandomHardware_2_1.scala 20:41]
  assign SignExtendDouble_002_io_in = io_in[7:0]; // @[RandomHardware_2_1.scala 21:41]
endmodule
module RandomHardware_1_3(
  input         clock,
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] Mul_000_io_in; // @[RandomHardware_1_3.scala 15:26]
  wire [7:0] Mul_000_io_out; // @[RandomHardware_1_3.scala 15:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_3.scala 16:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware_1_3.scala 16:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware_1_3.scala 16:42]
  Mul Mul_000 ( // @[RandomHardware_1_3.scala 15:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_3.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_3.scala 19:10]
  assign Mul_000_io_in = RandomHardware_001_io_out[7:0]; // @[RandomHardware_1_3.scala 13:24 RandomHardware_1_3.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_3.scala 18:33]
endmodule
module ShiftLeft(
  input  [4:0] io_in,
  output [8:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRegister_1(
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
module SignExtendDouble_3(
  input  [6:0]  io_in,
  output [13:0] io_out
);
  wire [6:0] io_out_hi = io_in[6] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module CompareMux(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [9:0] IN1 = io_in[19:10]; // @[Muxes.scala 134:27]
  wire [6:0] IN2 = io_in[12:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [9:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[6:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_9(
  input  [19:0] io_in,
  output [13:0] io_out
);
  wire [6:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_9.scala 15:42]
  wire [13:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_9.scala 15:42]
  wire [19:0] CompareMux_001_io_in; // @[RandomHardware_1_9.scala 16:34]
  wire [6:0] CompareMux_001_io_out; // @[RandomHardware_1_9.scala 16:34]
  SignExtendDouble_3 SignExtendDouble_000 ( // @[RandomHardware_1_9.scala 15:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_1_9.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_9.scala 19:10]
  assign SignExtendDouble_000_io_in = CompareMux_001_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_9.scala 18:25]
endmodule
module ShiftRight(
  input  [5:0] io_in,
  output [5:0] io_out
);
  assign io_out = {{3'd0}, io_in[5:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ReduceAndMux(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [5:0] IN1 = io_in[13:8]; // @[Muxes.scala 98:27]
  wire [5:0] IN2 = io_in[7:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_10(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [5:0] ShiftRight_000_io_in; // @[RandomHardware_1_10.scala 15:34]
  wire [5:0] ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 15:34]
  wire [15:0] ReduceAndMux_001_io_in; // @[RandomHardware_1_10.scala 16:34]
  wire [5:0] ReduceAndMux_001_io_out; // @[RandomHardware_1_10.scala 16:34]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_10.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ReduceAndMux ReduceAndMux_001 ( // @[RandomHardware_1_10.scala 16:34]
    .io_in(ReduceAndMux_001_io_in),
    .io_out(ReduceAndMux_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 19:10]
  assign ShiftRight_000_io_in = ReduceAndMux_001_io_out; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  assign ReduceAndMux_001_io_in = io_in; // @[RandomHardware_1_10.scala 18:33]
endmodule
module RegFile2R1W(
  input         clock,
  input  [12:0] io_in,
  output [13:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire [2:0] R1_SEL = io_in[12:10]; // @[Memory.scala 37:28]
  wire [2:0] R2_SEL = io_in[9:7]; // @[Memory.scala 38:28]
  wire [6:0] W_DATA = io_in[6:0]; // @[Memory.scala 39:28]
  reg [6:0] registers_0; // @[Memory.scala 41:22]
  reg [6:0] registers_1; // @[Memory.scala 41:22]
  reg [6:0] registers_2; // @[Memory.scala 41:22]
  reg [6:0] registers_3; // @[Memory.scala 41:22]
  reg [6:0] registers_4; // @[Memory.scala 41:22]
  reg [6:0] registers_5; // @[Memory.scala 41:22]
  reg [6:0] registers_6; // @[Memory.scala 41:22]
  reg [6:0] registers_7; // @[Memory.scala 41:22]
  wire [6:0] _GEN_9 = 3'h1 == R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_10 = 3'h2 == R1_SEL ? registers_2 : _GEN_9; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_11 = 3'h3 == R1_SEL ? registers_3 : _GEN_10; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_12 = 3'h4 == R1_SEL ? registers_4 : _GEN_11; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_13 = 3'h5 == R1_SEL ? registers_5 : _GEN_12; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_14 = 3'h6 == R1_SEL ? registers_6 : _GEN_13; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_15 = 3'h7 == R1_SEL ? registers_7 : _GEN_14; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_17 = 3'h1 == R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_18 = 3'h2 == R2_SEL ? registers_2 : _GEN_17; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_19 = 3'h3 == R2_SEL ? registers_3 : _GEN_18; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_20 = 3'h4 == R2_SEL ? registers_4 : _GEN_19; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_21 = 3'h5 == R2_SEL ? registers_5 : _GEN_20; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_22 = 3'h6 == R2_SEL ? registers_6 : _GEN_21; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [6:0] _GEN_23 = 3'h7 == R2_SEL ? registers_7 : _GEN_22; // @[Cat.scala 30:58 Cat.scala 30:58]
  assign io_out = {_GEN_15,_GEN_23}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (3'h0 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_0 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h1 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_1 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h2 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_2 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h3 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_3 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h4 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_4 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h5 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_5 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h6 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_6 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (3'h7 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_7 <= W_DATA; // @[Memory.scala 44:21]
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
  registers_0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[6:0];
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
  input  [12:0] io_in,
  output [13:0] io_out
);
  wire  RegFile2R1W_000_clock; // @[RandomHardware_1_11.scala 14:34]
  wire [12:0] RegFile2R1W_000_io_in; // @[RandomHardware_1_11.scala 14:34]
  wire [13:0] RegFile2R1W_000_io_out; // @[RandomHardware_1_11.scala 14:34]
  RegFile2R1W RegFile2R1W_000 ( // @[RandomHardware_1_11.scala 14:34]
    .clock(RegFile2R1W_000_clock),
    .io_in(RegFile2R1W_000_io_in),
    .io_out(RegFile2R1W_000_io_out)
  );
  assign io_out = RegFile2R1W_000_io_out; // @[RandomHardware_1_11.scala 17:10]
  assign RegFile2R1W_000_clock = clock;
  assign RegFile2R1W_000_io_in = io_in; // @[RandomHardware_1_11.scala 16:33]
endmodule
module Accum(
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
module RandomHardware_1_13(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_13.scala 14:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_13.scala 14:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_13.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_1_13.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:25]
endmodule
module Div(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 59:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module RandomHardware_1_14(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [19:0] Div_000_io_in; // @[RandomHardware_1_14.scala 14:26]
  wire [9:0] Div_000_io_out; // @[RandomHardware_1_14.scala 14:26]
  Div Div_000 ( // @[RandomHardware_1_14.scala 14:26]
    .io_in(Div_000_io_in),
    .io_out(Div_000_io_out)
  );
  assign io_out = Div_000_io_out; // @[RandomHardware_1_14.scala 17:10]
  assign Div_000_io_in = io_in; // @[RandomHardware_1_14.scala 16:25]
endmodule
module CompareMux_1(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [7:0] IN1 = io_in[15:8]; // @[Muxes.scala 134:27]
  wire [4:0] IN2 = io_in[10:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [7:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[4:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_15(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [15:0] CompareMux_000_io_in; // @[RandomHardware_1_15.scala 14:34]
  wire [4:0] CompareMux_000_io_out; // @[RandomHardware_1_15.scala 14:34]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_1_15.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_15.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_15.scala 16:25]
endmodule
module ShiftRight_1(
  input  [19:0] io_in,
  output [19:0] io_out
);
  assign io_out = {{3'd0}, io_in[19:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_2_2(
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire [19:0] ShiftRight_000_io_in; // @[RandomHardware_2_2.scala 14:34]
  wire [19:0] ShiftRight_000_io_out; // @[RandomHardware_2_2.scala 14:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_2_2.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_2_2.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_2_2.scala 16:25]
endmodule
module RandomHardware_1_16(
  input         clock,
  input  [19:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_16.scala 16:26]
  wire [19:0] Reg_000_io_in; // @[RandomHardware_1_16.scala 16:26]
  wire [19:0] Reg_000_io_out; // @[RandomHardware_1_16.scala 16:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_16.scala 17:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware_1_16.scala 17:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware_1_16.scala 17:42]
  wire [19:0] RandomHardware_002_io_in; // @[RandomHardware_1_16.scala 18:42]
  wire [19:0] RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 18:42]
  Reg Reg_000 ( // @[RandomHardware_1_16.scala 16:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_16.scala 17:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_16.scala 18:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = RandomHardware_001_io_out; // @[RandomHardware_1_16.scala 21:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_16.scala 20:25]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 14:24 RandomHardware_1_16.scala 24:18]
  assign RandomHardware_002_io_in = Reg_000_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 25:18]
endmodule
module ReduceXorMux_2(
  input  [25:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] IN1 = io_in[25:16]; // @[Muxes.scala 122:27]
  wire [9:0] IN2 = io_in[15:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_17(
  input  [25:0] io_in,
  output [9:0]  io_out
);
  wire [25:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_17.scala 14:34]
  wire [9:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_17.scala 14:34]
  ReduceXorMux_2 ReduceXorMux_000 ( // @[RandomHardware_1_17.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:33]
endmodule
module SignExtendDouble_5(
  input  [24:0] io_in,
  output [49:0] io_out
);
  wire [24:0] io_out_hi = io_in[24] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [25:0] io_in,
  output [24:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [24:0] r0; // @[Memory.scala 60:19]
  reg [24:0] r1; // @[Memory.scala 61:19]
  reg [24:0] r2; // @[Memory.scala 62:19]
  reg [24:0] r3; // @[Memory.scala 63:19]
  wire [25:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 25'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[24:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 25'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 25'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 25'h0; // @[Memory.scala 63:19]
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
module RandomHardware_1_19(
  input         clock,
  input         reset,
  input  [25:0] io_in,
  output [49:0] io_out
);
  wire [24:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_19.scala 15:42]
  wire [49:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_19.scala 15:42]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_19.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_19.scala 16:42]
  wire [25:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_19.scala 16:42]
  wire [24:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_19.scala 16:42]
  SignExtendDouble_5 SignExtendDouble_000 ( // @[RandomHardware_1_19.scala 15:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_1_19.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_19.scala 19:10]
  assign SignExtendDouble_000_io_in = ResetShiftRegister_001_io_out; // @[RandomHardware_1_19.scala 13:24 RandomHardware_1_19.scala 21:18]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = io_in; // @[RandomHardware_1_19.scala 18:33]
endmodule
module SignExtendDouble_6(
  input  [10:0] io_in,
  output [21:0] io_out
);
  wire [10:0] io_out_hi = io_in[10] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft_2(
  input  [11:0] io_in,
  output [12:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceOrMux(
  input  [27:0] io_in,
  output [11:0] io_out
);
  wire [11:0] IN1 = io_in[27:16]; // @[Muxes.scala 110:27]
  wire [11:0] IN2 = io_in[15:4]; // @[Muxes.scala 111:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_21(
  input  [27:0] io_in,
  output [12:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_21.scala 15:34]
  wire [12:0] ShiftLeft_000_io_out; // @[RandomHardware_1_21.scala 15:34]
  wire [27:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_21.scala 16:34]
  wire [11:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_21.scala 16:34]
  ShiftLeft_2 ShiftLeft_000 ( // @[RandomHardware_1_21.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ReduceOrMux ReduceOrMux_001 ( // @[RandomHardware_1_21.scala 16:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_21.scala 19:10]
  assign ShiftLeft_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 21:18]
  assign ReduceOrMux_001_io_in = io_in; // @[RandomHardware_1_21.scala 18:33]
endmodule
module ReduceOrMux_1(
  input  [49:0] io_in,
  output [20:0] io_out
);
  wire [20:0] IN1 = io_in[49:29]; // @[Muxes.scala 110:27]
  wire [20:0] IN2 = io_in[28:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
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
module Mux2(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  sel = io_in[20]; // @[Muxes.scala 16:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 17:18]
  wire [9:0] in0 = io_in[9:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module Reg_2(
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
module RandomHardware_1_22(
  input         clock,
  input  [49:0] io_in,
  output [19:0] io_out
);
  wire [49:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_22.scala 17:34]
  wire [20:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_22.scala 17:34]
  wire  Accum_001_clock; // @[RandomHardware_1_22.scala 18:34]
  wire [9:0] Accum_001_io_in; // @[RandomHardware_1_22.scala 18:34]
  wire [9:0] Accum_001_io_out; // @[RandomHardware_1_22.scala 18:34]
  wire [20:0] Mux2_002_io_in; // @[RandomHardware_1_22.scala 19:26]
  wire [9:0] Mux2_002_io_out; // @[RandomHardware_1_22.scala 19:26]
  wire  Reg_003_clock; // @[RandomHardware_1_22.scala 20:26]
  wire [9:0] Reg_003_io_in; // @[RandomHardware_1_22.scala 20:26]
  wire [9:0] Reg_003_io_out; // @[RandomHardware_1_22.scala 20:26]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_1_22.scala 17:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  Accum_2 Accum_001 ( // @[RandomHardware_1_22.scala 18:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  Mux2 Mux2_002 ( // @[RandomHardware_1_22.scala 19:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  Reg_2 Reg_003 ( // @[RandomHardware_1_22.scala 20:26]
    .clock(Reg_003_clock),
    .io_in(Reg_003_io_in),
    .io_out(Reg_003_io_out)
  );
  assign io_out = {Accum_001_io_out,Reg_003_io_out}; // @[Cat.scala 30:58]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_22.scala 22:33]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = Mux2_002_io_out; // @[RandomHardware_1_22.scala 15:24 RandomHardware_1_22.scala 26:18]
  assign Mux2_002_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_22.scala 13:24 RandomHardware_1_22.scala 27:18]
  assign Reg_003_clock = clock;
  assign Reg_003_io_in = ReduceOrMux_000_io_out[9:0]; // @[RandomHardware_1_22.scala 28:44]
endmodule
module ShiftLeft_3(
  input  [3:0] io_in,
  output [5:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_4(
  input  [7:0]  io_in,
  output [11:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Reg_3(
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
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [86:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware.scala 41:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware.scala 41:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 42:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 42:42]
  wire [19:0] RandomHardware_001_io_out; // @[RandomHardware.scala 42:42]
  wire [4:0] SignExtendDouble_002_io_in; // @[RandomHardware.scala 43:42]
  wire [9:0] SignExtendDouble_002_io_out; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 44:42]
  wire [19:0] RandomHardware_003_io_in; // @[RandomHardware.scala 44:42]
  wire [7:0] RandomHardware_003_io_out; // @[RandomHardware.scala 44:42]
  wire [4:0] ShiftLeft_004_io_in; // @[RandomHardware.scala 45:34]
  wire [8:0] ShiftLeft_004_io_out; // @[RandomHardware.scala 45:34]
  wire  ShiftRegister_005_clock; // @[RandomHardware.scala 46:42]
  wire [4:0] ShiftRegister_005_io_in; // @[RandomHardware.scala 46:42]
  wire [4:0] ShiftRegister_005_io_out; // @[RandomHardware.scala 46:42]
  wire [4:0] ShiftLeft_006_io_in; // @[RandomHardware.scala 47:34]
  wire [8:0] ShiftLeft_006_io_out; // @[RandomHardware.scala 47:34]
  wire  ShiftRegister_007_clock; // @[RandomHardware.scala 48:42]
  wire [4:0] ShiftRegister_007_io_in; // @[RandomHardware.scala 48:42]
  wire [4:0] ShiftRegister_007_io_out; // @[RandomHardware.scala 48:42]
  wire [4:0] SignExtendDouble_008_io_in; // @[RandomHardware.scala 49:42]
  wire [9:0] SignExtendDouble_008_io_out; // @[RandomHardware.scala 49:42]
  wire [19:0] RandomHardware_009_io_in; // @[RandomHardware.scala 50:42]
  wire [13:0] RandomHardware_009_io_out; // @[RandomHardware.scala 50:42]
  wire [15:0] RandomHardware_010_io_in; // @[RandomHardware.scala 51:42]
  wire [5:0] RandomHardware_010_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 52:42]
  wire [12:0] RandomHardware_011_io_in; // @[RandomHardware.scala 52:42]
  wire [13:0] RandomHardware_011_io_out; // @[RandomHardware.scala 52:42]
  wire  Accum_012_clock; // @[RandomHardware.scala 53:34]
  wire [4:0] Accum_012_io_in; // @[RandomHardware.scala 53:34]
  wire [4:0] Accum_012_io_out; // @[RandomHardware.scala 53:34]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 54:42]
  wire [11:0] RandomHardware_013_io_in; // @[RandomHardware.scala 54:42]
  wire [11:0] RandomHardware_013_io_out; // @[RandomHardware.scala 54:42]
  wire [19:0] RandomHardware_014_io_in; // @[RandomHardware.scala 55:42]
  wire [9:0] RandomHardware_014_io_out; // @[RandomHardware.scala 55:42]
  wire [15:0] RandomHardware_015_io_in; // @[RandomHardware.scala 56:42]
  wire [4:0] RandomHardware_015_io_out; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 57:42]
  wire [19:0] RandomHardware_016_io_in; // @[RandomHardware.scala 57:42]
  wire [11:0] RandomHardware_016_io_out; // @[RandomHardware.scala 57:42]
  wire [25:0] RandomHardware_017_io_in; // @[RandomHardware.scala 58:42]
  wire [9:0] RandomHardware_017_io_out; // @[RandomHardware.scala 58:42]
  wire  ShiftRegister_018_clock; // @[RandomHardware.scala 59:42]
  wire [4:0] ShiftRegister_018_io_in; // @[RandomHardware.scala 59:42]
  wire [4:0] ShiftRegister_018_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_019_reset; // @[RandomHardware.scala 60:42]
  wire [25:0] RandomHardware_019_io_in; // @[RandomHardware.scala 60:42]
  wire [49:0] RandomHardware_019_io_out; // @[RandomHardware.scala 60:42]
  wire [10:0] SignExtendDouble_020_io_in; // @[RandomHardware.scala 61:42]
  wire [21:0] SignExtendDouble_020_io_out; // @[RandomHardware.scala 61:42]
  wire [27:0] RandomHardware_021_io_in; // @[RandomHardware.scala 62:42]
  wire [12:0] RandomHardware_021_io_out; // @[RandomHardware.scala 62:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 63:42]
  wire [49:0] RandomHardware_022_io_in; // @[RandomHardware.scala 63:42]
  wire [19:0] RandomHardware_022_io_out; // @[RandomHardware.scala 63:42]
  wire [3:0] ShiftLeft_023_io_in; // @[RandomHardware.scala 64:34]
  wire [5:0] ShiftLeft_023_io_out; // @[RandomHardware.scala 64:34]
  wire [7:0] ShiftLeft_024_io_in; // @[RandomHardware.scala 65:34]
  wire [11:0] ShiftLeft_024_io_out; // @[RandomHardware.scala 65:34]
  wire  Reg_025_clock; // @[RandomHardware.scala 66:26]
  wire [4:0] Reg_025_io_in; // @[RandomHardware.scala 66:26]
  wire [4:0] Reg_025_io_out; // @[RandomHardware.scala 66:26]
  wire [44:0] io_out_lo = {RandomHardware_017_io_out,SignExtendDouble_020_io_out,RandomHardware_021_io_out}; // @[Cat.scala 30:58]
  wire [41:0] io_out_hi = {ShiftLeft_004_io_out,ShiftLeft_006_io_out,RandomHardware_009_io_out,RandomHardware_014_io_out
    }; // @[Cat.scala 30:58]
  wire [7:0] wire_008 = RandomHardware_003_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 107:18]
  wire [9:0] wire_009 = SignExtendDouble_008_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 84:18]
  wire [4:0] wire_010 = Accum_012_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 89:18]
  wire [22:0] _RandomHardware_011_io_in_T = {wire_008,wire_009,wire_010}; // @[Cat.scala 30:58]
  wire [13:0] wire_019 = RandomHardware_011_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 86:18]
  wire [11:0] wire_020 = RandomHardware_013_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 91:18]
  wire [9:0] wire_000 = SignExtendDouble_002_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 78:18]
  wire [4:0] wire_014 = RandomHardware_015_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 113:18]
  wire [14:0] _Reg_025_io_in_T = {wire_000,wire_014}; // @[Cat.scala 30:58]
  wire [19:0] wire_016 = RandomHardware_001_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 106:18]
  wire [5:0] wire_017 = ShiftLeft_023_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 114:18]
  wire [5:0] wire_021 = RandomHardware_010_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 109:18]
  wire [4:0] wire_022 = ShiftRegister_018_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 95:18]
  wire [7:0] wire_023 = RandomHardware_000_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 103:18]
  wire [15:0] RandomHardware_021_io_in_hi = {wire_023,wire_008}; // @[Cat.scala 30:58]
  wire [11:0] wire_025 = ShiftLeft_024_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 115:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 41:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 42:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  SignExtendDouble SignExtendDouble_002 ( // @[RandomHardware.scala 43:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 44:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  ShiftLeft ShiftLeft_004 ( // @[RandomHardware.scala 45:34]
    .io_in(ShiftLeft_004_io_in),
    .io_out(ShiftLeft_004_io_out)
  );
  ShiftRegister_1 ShiftRegister_005 ( // @[RandomHardware.scala 46:42]
    .clock(ShiftRegister_005_clock),
    .io_in(ShiftRegister_005_io_in),
    .io_out(ShiftRegister_005_io_out)
  );
  ShiftLeft ShiftLeft_006 ( // @[RandomHardware.scala 47:34]
    .io_in(ShiftLeft_006_io_in),
    .io_out(ShiftLeft_006_io_out)
  );
  ShiftRegister_1 ShiftRegister_007 ( // @[RandomHardware.scala 48:42]
    .clock(ShiftRegister_007_clock),
    .io_in(ShiftRegister_007_io_in),
    .io_out(ShiftRegister_007_io_out)
  );
  SignExtendDouble SignExtendDouble_008 ( // @[RandomHardware.scala 49:42]
    .io_in(SignExtendDouble_008_io_in),
    .io_out(SignExtendDouble_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 50:42]
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 51:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_011_clock),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  Accum Accum_012 ( // @[RandomHardware.scala 53:34]
    .clock(Accum_012_clock),
    .io_in(Accum_012_io_in),
    .io_out(Accum_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 56:42]
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 57:42]
    .clock(RandomHardware_016_clock),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 58:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  ShiftRegister_1 ShiftRegister_018 ( // @[RandomHardware.scala 59:42]
    .clock(ShiftRegister_018_clock),
    .io_in(ShiftRegister_018_io_in),
    .io_out(ShiftRegister_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_019_clock),
    .reset(RandomHardware_019_reset),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  SignExtendDouble_6 SignExtendDouble_020 ( // @[RandomHardware.scala 61:42]
    .io_in(SignExtendDouble_020_io_in),
    .io_out(SignExtendDouble_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 63:42]
    .clock(RandomHardware_022_clock),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  ShiftLeft_3 ShiftLeft_023 ( // @[RandomHardware.scala 64:34]
    .io_in(ShiftLeft_023_io_in),
    .io_out(ShiftLeft_023_io_out)
  );
  ShiftLeft_4 ShiftLeft_024 ( // @[RandomHardware.scala 65:34]
    .io_in(ShiftLeft_024_io_in),
    .io_out(ShiftLeft_024_io_out)
  );
  Reg_3 Reg_025 ( // @[RandomHardware.scala 66:26]
    .clock(Reg_025_clock),
    .io_in(Reg_025_io_in),
    .io_out(Reg_025_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[15:0]; // @[RandomHardware.scala 68:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in[19:0]; // @[RandomHardware.scala 69:41]
  assign SignExtendDouble_002_io_in = Accum_012_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 88:18]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = io_in[99:80]; // @[RandomHardware.scala 70:41]
  assign ShiftLeft_004_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 110:18]
  assign ShiftRegister_005_clock = clock;
  assign ShiftRegister_005_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 111:18]
  assign ShiftLeft_006_io_in = ShiftRegister_007_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 82:18]
  assign ShiftRegister_007_clock = clock;
  assign ShiftRegister_007_io_in = Reg_025_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 101:18]
  assign SignExtendDouble_008_io_in = Reg_025_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 102:18]
  assign RandomHardware_009_io_in = RandomHardware_022_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 99:18]
  assign RandomHardware_010_io_in = io_in[15:0]; // @[RandomHardware.scala 71:41]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_io_in = _RandomHardware_011_io_in_T[12:0]; // @[RandomHardware.scala 85:33]
  assign Accum_012_clock = clock;
  assign Accum_012_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 112:18]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = RandomHardware_016_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 93:18]
  assign RandomHardware_014_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 104:18]
  assign RandomHardware_015_io_in = io_in[15:0]; // @[RandomHardware.scala 72:41]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 105:18]
  assign RandomHardware_017_io_in = {wire_016,wire_017}; // @[Cat.scala 30:58]
  assign ShiftRegister_018_clock = clock;
  assign ShiftRegister_018_io_in = ShiftRegister_005_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 80:18]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_reset = reset;
  assign RandomHardware_019_io_in = {wire_019,wire_020}; // @[Cat.scala 30:58]
  assign SignExtendDouble_020_io_in = {wire_021,wire_022}; // @[Cat.scala 30:58]
  assign RandomHardware_021_io_in = {RandomHardware_021_io_in_hi,wire_025}; // @[Cat.scala 30:58]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_io_in = RandomHardware_019_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 97:18]
  assign ShiftLeft_023_io_in = io_in[3:0]; // @[RandomHardware.scala 73:33]
  assign ShiftLeft_024_io_in = io_in[7:0]; // @[RandomHardware.scala 74:33]
  assign Reg_025_clock = clock;
  assign Reg_025_io_in = _Reg_025_io_in_T[4:0]; // @[RandomHardware.scala 100:25]
endmodule
