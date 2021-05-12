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
module ReduceAndMux(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[17:10]; // @[Muxes.scala 98:27]
  wire [7:0] IN2 = io_in[9:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ShiftRight(
  input  [39:0] io_in,
  output [39:0] io_out
);
  assign io_out = {{2'd0}, io_in[39:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ReduceXorMux(
  input  [39:0] io_in,
  output [16:0] io_out
);
  wire [16:0] IN1 = io_in[39:23]; // @[Muxes.scala 122:27]
  wire [16:0] IN2 = io_in[22:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_2_1(
  input  [39:0] io_in,
  output [16:0] io_out
);
  wire [39:0] ShiftRight_000_io_in; // @[RandomHardware_2_1.scala 15:34]
  wire [39:0] ShiftRight_000_io_out; // @[RandomHardware_2_1.scala 15:34]
  wire [39:0] ReduceXorMux_001_io_in; // @[RandomHardware_2_1.scala 16:34]
  wire [16:0] ReduceXorMux_001_io_out; // @[RandomHardware_2_1.scala 16:34]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_2_1.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ReduceXorMux ReduceXorMux_001 ( // @[RandomHardware_2_1.scala 16:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  assign io_out = ReduceXorMux_001_io_out; // @[RandomHardware_2_1.scala 19:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_2_1.scala 18:25]
  assign ReduceXorMux_001_io_in = ShiftRight_000_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 21:18]
endmodule
module RandomHardware_1_1(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [19:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_1.scala 15:34]
  wire [7:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_1.scala 15:34]
  wire [39:0] RandomHardware_001_io_in; // @[RandomHardware_1_1.scala 16:42]
  wire [16:0] RandomHardware_001_io_out; // @[RandomHardware_1_1.scala 16:42]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_1_1.scala 15:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_1.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_1.scala 19:10]
  assign ReduceAndMux_000_io_in = {{3'd0}, RandomHardware_001_io_out}; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 21:18]
  assign RandomHardware_001_io_in = {{20'd0}, io_in}; // @[RandomHardware_1_1.scala 18:33]
endmodule
module ShiftRight_1(
  input  [13:0] io_in,
  output [13:0] io_out
);
  assign io_out = {{2'd0}, io_in[13:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module SignExtendDouble(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] io_out_hi = io_in[13] ? 14'h3fff : 14'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
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
module RandomHardware_3_0(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_3_0.scala 14:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_3_0.scala 14:26]
  Mux8 Mux8_000 ( // @[RandomHardware_3_0.scala 14:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  assign io_out = Mux8_000_io_out; // @[RandomHardware_3_0.scala 17:10]
  assign Mux8_000_io_in = io_in; // @[RandomHardware_3_0.scala 16:25]
endmodule
module RandomHardware_2_2(
  input  [27:0] io_in,
  output [13:0] io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_2_2.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_2_2.scala 14:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_2.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{12'd0}, RandomHardware_000_io_out}; // @[RandomHardware_2_2.scala 17:10]
  assign RandomHardware_000_io_in = io_in[18:0]; // @[RandomHardware_2_2.scala 16:33]
endmodule
module RandomHardware_1_2(
  input  [27:0] io_in,
  output [27:0] io_out
);
  wire [13:0] ShiftRight_000_io_in; // @[RandomHardware_1_2.scala 17:34]
  wire [13:0] ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 17:34]
  wire [13:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_2.scala 18:42]
  wire [27:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_2.scala 18:42]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware_1_2.scala 19:42]
  wire [13:0] RandomHardware_002_io_out; // @[RandomHardware_1_2.scala 19:42]
  wire [13:0] ShiftRight_003_io_in; // @[RandomHardware_1_2.scala 20:34]
  wire [13:0] ShiftRight_003_io_out; // @[RandomHardware_1_2.scala 20:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_1_2.scala 17:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_1_2.scala 18:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_2.scala 19:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftRight_1 ShiftRight_003 ( // @[RandomHardware_1_2.scala 20:34]
    .io_in(ShiftRight_003_io_in),
    .io_out(ShiftRight_003_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_2.scala 23:10]
  assign ShiftRight_000_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_2.scala 14:24 RandomHardware_1_2.scala 29:18]
  assign SignExtendDouble_001_io_in = ShiftRight_003_io_out; // @[RandomHardware_1_2.scala 15:24 RandomHardware_1_2.scala 28:18]
  assign RandomHardware_002_io_in = io_in; // @[RandomHardware_1_2.scala 22:33]
  assign ShiftRight_003_io_in = ShiftRight_000_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 26:18]
endmodule
module Reg(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[15:0];
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
  input  [15:0] io_in,
  output [15:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_3.scala 14:26]
  wire [15:0] Reg_000_io_in; // @[RandomHardware_1_3.scala 14:26]
  wire [15:0] Reg_000_io_out; // @[RandomHardware_1_3.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_1_3.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module ShiftRight_3(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{5'd0}, io_in[11:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_4(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_1_4.scala 14:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_1_4.scala 14:34]
  ShiftRight_3 ShiftRight_000 ( // @[RandomHardware_1_4.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_4.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_4.scala 16:25]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [27:0] io_in,
  output [26:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [26:0] r0; // @[Memory.scala 60:19]
  reg [26:0] r1; // @[Memory.scala 61:19]
  reg [26:0] r2; // @[Memory.scala 62:19]
  reg [26:0] r3; // @[Memory.scala 63:19]
  wire [27:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 27'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[26:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 27'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 27'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 27'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[26:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[26:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[26:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Accum(
  input         clock,
  input  [33:0] io_in,
  output [33:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [33:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[33:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SignExtendDouble_1(
  input  [60:0]  io_in,
  output [121:0] io_out
);
  wire [60:0] io_out_hi = io_in[60] ? 61'h1fffffffffffffff : 61'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_5(
  input          clock,
  input          reset,
  input  [61:0]  io_in,
  output [121:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_5.scala 16:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_5.scala 16:42]
  wire [27:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_5.scala 16:42]
  wire [26:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_5.scala 16:42]
  wire  Accum_001_clock; // @[RandomHardware_1_5.scala 17:34]
  wire [33:0] Accum_001_io_in; // @[RandomHardware_1_5.scala 17:34]
  wire [33:0] Accum_001_io_out; // @[RandomHardware_1_5.scala 17:34]
  wire [60:0] SignExtendDouble_002_io_in; // @[RandomHardware_1_5.scala 18:42]
  wire [121:0] SignExtendDouble_002_io_out; // @[RandomHardware_1_5.scala 18:42]
  wire [26:0] wire_000 = ResetShiftRegister_000_io_out; // @[RandomHardware_1_5.scala 13:24 RandomHardware_1_5.scala 24:18]
  wire [33:0] wire_001 = Accum_001_io_out; // @[RandomHardware_1_5.scala 14:24 RandomHardware_1_5.scala 25:18]
  ResetShiftRegister ResetShiftRegister_000 ( // @[RandomHardware_1_5.scala 16:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  Accum Accum_001 ( // @[RandomHardware_1_5.scala 17:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_002 ( // @[RandomHardware_1_5.scala 18:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  assign io_out = SignExtendDouble_002_io_out; // @[RandomHardware_1_5.scala 22:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in[61:34]; // @[RandomHardware_1_5.scala 20:41]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = io_in[61:28]; // @[RandomHardware_1_5.scala 21:33]
  assign SignExtendDouble_002_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_0(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 14:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_0.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:33]
endmodule
module RandomHardware_1_6(
  input  [15:0] io_in,
  output [8:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_6.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_6.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_6.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{7'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_6.scala 17:10]
  assign RandomHardware_000_io_in = {{3'd0}, io_in}; // @[RandomHardware_1_6.scala 16:33]
endmodule
module ShiftLeft(
  input  [12:0] io_in,
  output [16:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceXorMux_1(
  input  [27:0] io_in,
  output [12:0] io_out
);
  wire [12:0] IN1 = io_in[27:15]; // @[Muxes.scala 122:27]
  wire [12:0] IN2 = io_in[14:2]; // @[Muxes.scala 123:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module ShiftRight_4(
  input  [16:0] io_in,
  output [16:0] io_out
);
  assign io_out = {{3'd0}, io_in[16:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_7(
  input  [27:0] io_in,
  output [16:0] io_out
);
  wire [12:0] ShiftLeft_000_io_in; // @[RandomHardware_1_7.scala 16:34]
  wire [16:0] ShiftLeft_000_io_out; // @[RandomHardware_1_7.scala 16:34]
  wire [27:0] ReduceXorMux_001_io_in; // @[RandomHardware_1_7.scala 17:34]
  wire [12:0] ReduceXorMux_001_io_out; // @[RandomHardware_1_7.scala 17:34]
  wire [16:0] ShiftRight_002_io_in; // @[RandomHardware_1_7.scala 18:34]
  wire [16:0] ShiftRight_002_io_out; // @[RandomHardware_1_7.scala 18:34]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_7.scala 16:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ReduceXorMux_1 ReduceXorMux_001 ( // @[RandomHardware_1_7.scala 17:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  ShiftRight_4 ShiftRight_002 ( // @[RandomHardware_1_7.scala 18:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  assign io_out = ShiftRight_002_io_out; // @[RandomHardware_1_7.scala 21:10]
  assign ShiftLeft_000_io_in = ReduceXorMux_001_io_out; // @[RandomHardware_1_7.scala 14:24 RandomHardware_1_7.scala 25:18]
  assign ReduceXorMux_001_io_in = io_in; // @[RandomHardware_1_7.scala 20:33]
  assign ShiftRight_002_io_in = ShiftLeft_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 24:18]
endmodule
module RandomHardware_1_8(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_8.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_8.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_8.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{8'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_8.scala 17:10]
  assign RandomHardware_000_io_in = io_in[18:0]; // @[RandomHardware_1_8.scala 16:33]
endmodule
module ReduceOrMux(
  input  [37:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[37:23]; // @[Muxes.scala 110:27]
  wire [14:0] IN2 = io_in[22:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module SignExtendDouble_2(
  input  [15:0] io_in,
  output [31:0] io_out
);
  wire [15:0] io_out_hi = io_in[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft_1(
  input  [30:0] io_in,
  output [33:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRegister(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [13:0] r0; // @[Memory.scala 78:19]
  reg [13:0] r1; // @[Memory.scala 79:19]
  reg [13:0] r2; // @[Memory.scala 80:19]
  reg [13:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[13:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[13:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[13:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux4(
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
module ResetShiftRegister_1(
  input         clock,
  input         reset,
  input  [16:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [15:0] r0; // @[Memory.scala 60:19]
  reg [15:0] r1; // @[Memory.scala 61:19]
  reg [15:0] r2; // @[Memory.scala 62:19]
  reg [15:0] r3; // @[Memory.scala 63:19]
  wire [16:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 16'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[15:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 16'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 16'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 16'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mod(
  input  [33:0] io_in,
  output [16:0] io_out
);
  wire [16:0] in1 = io_in[33:17]; // @[ArithmeticLogical.scala 71:20]
  wire [16:0] in2 = io_in[16:0]; // @[ArithmeticLogical.scala 72:20]
  wire [16:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[16:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module ReduceXorMux_3(
  input  [33:0] io_in,
  output [13:0] io_out
);
  wire [13:0] IN1 = io_in[33:20]; // @[Muxes.scala 122:27]
  wire [13:0] IN2 = io_in[19:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_9(
  input         clock,
  input         reset,
  input  [66:0] io_in,
  output [52:0] io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_9.scala 23:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_9.scala 23:42]
  wire [39:0] RandomHardware_001_io_in; // @[RandomHardware_1_9.scala 24:42]
  wire [16:0] RandomHardware_001_io_out; // @[RandomHardware_1_9.scala 24:42]
  wire [37:0] ReduceOrMux_002_io_in; // @[RandomHardware_1_9.scala 25:34]
  wire [14:0] ReduceOrMux_002_io_out; // @[RandomHardware_1_9.scala 25:34]
  wire [15:0] SignExtendDouble_003_io_in; // @[RandomHardware_1_9.scala 26:42]
  wire [31:0] SignExtendDouble_003_io_out; // @[RandomHardware_1_9.scala 26:42]
  wire [30:0] ShiftLeft_004_io_in; // @[RandomHardware_1_9.scala 27:34]
  wire [33:0] ShiftLeft_004_io_out; // @[RandomHardware_1_9.scala 27:34]
  wire  ShiftRegister_005_clock; // @[RandomHardware_1_9.scala 28:42]
  wire [13:0] ShiftRegister_005_io_in; // @[RandomHardware_1_9.scala 28:42]
  wire [13:0] ShiftRegister_005_io_out; // @[RandomHardware_1_9.scala 28:42]
  wire [25:0] Mux4_006_io_in; // @[RandomHardware_1_9.scala 29:26]
  wire [5:0] Mux4_006_io_out; // @[RandomHardware_1_9.scala 29:26]
  wire  ResetShiftRegister_007_clock; // @[RandomHardware_1_9.scala 30:42]
  wire  ResetShiftRegister_007_reset; // @[RandomHardware_1_9.scala 30:42]
  wire [16:0] ResetShiftRegister_007_io_in; // @[RandomHardware_1_9.scala 30:42]
  wire [15:0] ResetShiftRegister_007_io_out; // @[RandomHardware_1_9.scala 30:42]
  wire [33:0] Mod_008_io_in; // @[RandomHardware_1_9.scala 31:26]
  wire [16:0] Mod_008_io_out; // @[RandomHardware_1_9.scala 31:26]
  wire [33:0] ReduceXorMux_009_io_in; // @[RandomHardware_1_9.scala 32:34]
  wire [13:0] ReduceXorMux_009_io_out; // @[RandomHardware_1_9.scala 32:34]
  wire [61:0] _io_out_T = {RandomHardware_001_io_out,ReduceOrMux_002_io_out,ShiftRegister_005_io_out,
    ResetShiftRegister_007_io_out}; // @[Cat.scala 30:58]
  wire [8:0] wire_005 = {{7'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_9.scala 18:24 RandomHardware_1_9.scala 47:18]
  wire [16:0] wire_006 = Mod_008_io_out; // @[RandomHardware_1_9.scala 19:24 RandomHardware_1_9.scala 43:18]
  wire [31:0] wire_001 = SignExtendDouble_003_io_out; // @[RandomHardware_1_9.scala 14:24 RandomHardware_1_9.scala 48:18]
  wire [5:0] wire_002 = Mux4_006_io_out; // @[RandomHardware_1_9.scala 15:24 RandomHardware_1_9.scala 40:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_9.scala 23:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_9.scala 24:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ReduceOrMux ReduceOrMux_002 ( // @[RandomHardware_1_9.scala 25:34]
    .io_in(ReduceOrMux_002_io_in),
    .io_out(ReduceOrMux_002_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_003 ( // @[RandomHardware_1_9.scala 26:42]
    .io_in(SignExtendDouble_003_io_in),
    .io_out(SignExtendDouble_003_io_out)
  );
  ShiftLeft_1 ShiftLeft_004 ( // @[RandomHardware_1_9.scala 27:34]
    .io_in(ShiftLeft_004_io_in),
    .io_out(ShiftLeft_004_io_out)
  );
  ShiftRegister ShiftRegister_005 ( // @[RandomHardware_1_9.scala 28:42]
    .clock(ShiftRegister_005_clock),
    .io_in(ShiftRegister_005_io_in),
    .io_out(ShiftRegister_005_io_out)
  );
  Mux4 Mux4_006 ( // @[RandomHardware_1_9.scala 29:26]
    .io_in(Mux4_006_io_in),
    .io_out(Mux4_006_io_out)
  );
  ResetShiftRegister_1 ResetShiftRegister_007 ( // @[RandomHardware_1_9.scala 30:42]
    .clock(ResetShiftRegister_007_clock),
    .reset(ResetShiftRegister_007_reset),
    .io_in(ResetShiftRegister_007_io_in),
    .io_out(ResetShiftRegister_007_io_out)
  );
  Mod Mod_008 ( // @[RandomHardware_1_9.scala 31:26]
    .io_in(Mod_008_io_in),
    .io_out(Mod_008_io_out)
  );
  ReduceXorMux_3 ReduceXorMux_009 ( // @[RandomHardware_1_9.scala 32:34]
    .io_in(ReduceXorMux_009_io_in),
    .io_out(ReduceXorMux_009_io_out)
  );
  assign io_out = _io_out_T[52:0]; // @[RandomHardware_1_9.scala 37:10]
  assign RandomHardware_000_io_in = io_in[65:47]; // @[RandomHardware_1_9.scala 34:33]
  assign RandomHardware_001_io_in = {{23'd0}, Mod_008_io_out}; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 42:18]
  assign ReduceOrMux_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign SignExtendDouble_003_io_in = io_in[15:0]; // @[RandomHardware_1_9.scala 35:41]
  assign ShiftLeft_004_io_in = io_in[30:0]; // @[RandomHardware_1_9.scala 36:33]
  assign ShiftRegister_005_clock = clock;
  assign ShiftRegister_005_io_in = ReduceXorMux_009_io_out; // @[RandomHardware_1_9.scala 17:24 RandomHardware_1_9.scala 46:18]
  assign Mux4_006_io_in = {wire_005,wire_006}; // @[Cat.scala 30:58]
  assign ResetShiftRegister_007_clock = clock;
  assign ResetShiftRegister_007_reset = reset;
  assign ResetShiftRegister_007_io_in = Mod_008_io_out; // @[RandomHardware_1_9.scala 20:24 RandomHardware_1_9.scala 44:18]
  assign Mod_008_io_in = ShiftLeft_004_io_out; // @[RandomHardware_1_9.scala 21:24 RandomHardware_1_9.scala 49:18]
  assign ReduceXorMux_009_io_in = ShiftLeft_004_io_out; // @[RandomHardware_1_9.scala 16:24 RandomHardware_1_9.scala 50:18]
endmodule
module RandomHardware_1_10(
  input  [25:0] io_in,
  output [27:0] io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_10.scala 15:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 15:42]
  wire [39:0] RandomHardware_001_io_in; // @[RandomHardware_1_10.scala 16:42]
  wire [16:0] RandomHardware_001_io_out; // @[RandomHardware_1_10.scala 16:42]
  wire [13:0] wire_000 = {{12'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_10.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_10.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = {{11'd0}, RandomHardware_001_io_out}; // @[RandomHardware_1_10.scala 19:10]
  assign RandomHardware_000_io_in = io_in[18:0]; // @[RandomHardware_1_10.scala 18:33]
  assign RandomHardware_001_io_in = {{26'd0}, wire_000}; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
endmodule
module SignExtendDouble_3(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
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
module Accum_1(
  input         clock,
  input  [16:0] io_in,
  output [16:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [16:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[16:0];
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
  input  [39:0] io_in,
  output [16:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_13.scala 15:34]
  wire [16:0] Accum_000_io_in; // @[RandomHardware_1_13.scala 15:34]
  wire [16:0] Accum_000_io_out; // @[RandomHardware_1_13.scala 15:34]
  wire [39:0] RandomHardware_001_io_in; // @[RandomHardware_1_13.scala 16:42]
  wire [16:0] RandomHardware_001_io_out; // @[RandomHardware_1_13.scala 16:42]
  Accum_1 Accum_000 ( // @[RandomHardware_1_13.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_13.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_13.scala 18:33]
endmodule
module Accum_2(
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
module Mux2(
  input  [16:0] io_in,
  output [7:0]  io_out
);
  wire  sel = io_in[16]; // @[Muxes.scala 16:18]
  wire [7:0] in1 = io_in[15:8]; // @[Muxes.scala 17:18]
  wire [7:0] in0 = io_in[7:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_15(
  input  [16:0] io_in,
  output [7:0]  io_out
);
  wire [16:0] Mux2_000_io_in; // @[RandomHardware_1_15.scala 14:26]
  wire [7:0] Mux2_000_io_out; // @[RandomHardware_1_15.scala 14:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_15.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_15.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_15.scala 16:25]
endmodule
module RandomHardware_1_16(
  input  [15:0] io_in,
  output [3:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_16.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_16.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_16.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{2'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_16.scala 17:10]
  assign RandomHardware_000_io_in = {{3'd0}, io_in}; // @[RandomHardware_1_16.scala 16:33]
endmodule
module Reg_1(
  input         clock,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[31:0];
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
  input  [31:0] io_in,
  output [4:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_17.scala 15:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 15:42]
  wire  Reg_001_clock; // @[RandomHardware_1_17.scala 16:26]
  wire [31:0] Reg_001_io_in; // @[RandomHardware_1_17.scala 16:26]
  wire [31:0] Reg_001_io_out; // @[RandomHardware_1_17.scala 16:26]
  wire [31:0] wire_000 = Reg_001_io_out; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 21:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_17.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Reg_1 Reg_001 ( // @[RandomHardware_1_17.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = {{3'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_17.scala 19:10]
  assign RandomHardware_000_io_in = wire_000[18:0]; // @[RandomHardware_1_17.scala 22:33]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = io_in; // @[RandomHardware_1_17.scala 18:25]
endmodule
module Mux2_1(
  input  [24:0] io_in,
  output [11:0] io_out
);
  wire  sel = io_in[24]; // @[Muxes.scala 16:18]
  wire [11:0] in1 = io_in[23:12]; // @[Muxes.scala 17:18]
  wire [11:0] in0 = io_in[11:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_18(
  input  [24:0] io_in,
  output [11:0] io_out
);
  wire [24:0] Mux2_000_io_in; // @[RandomHardware_1_18.scala 14:26]
  wire [11:0] Mux2_000_io_out; // @[RandomHardware_1_18.scala 14:26]
  Mux2_1 Mux2_000 ( // @[RandomHardware_1_18.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module SignExtendDouble_4(
  input  [8:0]  io_in,
  output [17:0] io_out
);
  wire [8:0] io_out_hi = io_in[8] ? 9'h1ff : 9'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Reg_2(
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
module ReduceOrMux_1(
  input  [19:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[19:11]; // @[Muxes.scala 110:27]
  wire [8:0] IN2 = io_in[10:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_21(
  input         clock,
  input  [19:0] io_in,
  output [8:0]  io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_21.scala 15:26]
  wire [8:0] Reg_000_io_in; // @[RandomHardware_1_21.scala 15:26]
  wire [8:0] Reg_000_io_out; // @[RandomHardware_1_21.scala 15:26]
  wire [19:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_21.scala 16:34]
  wire [8:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_21.scala 16:34]
  Reg_2 Reg_000 ( // @[RandomHardware_1_21.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ReduceOrMux_1 ReduceOrMux_001 ( // @[RandomHardware_1_21.scala 16:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_21.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 21:18]
  assign ReduceOrMux_001_io_in = io_in; // @[RandomHardware_1_21.scala 18:33]
endmodule
module ResetShiftRegister_2(
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
module RandomHardware_1_22(
  input         clock,
  input         reset,
  input  [23:0] io_in,
  output [22:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_22.scala 14:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_22.scala 14:42]
  wire [23:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_22.scala 14:42]
  wire [22:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_22.scala 14:42]
  ResetShiftRegister_2 ResetShiftRegister_000 ( // @[RandomHardware_1_22.scala 14:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_1_22.scala 17:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_22.scala 16:33]
endmodule
module RandomHardware_1_23(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] RandomHardware_000_io_in; // @[RandomHardware_1_23.scala 14:42]
  wire [1:0] RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_23.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:33]
endmodule
module ShiftRight_8(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{5'd0}, io_in[7:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [209:0] io_out
);
  wire  RegFile2R1W_000_clock; // @[RandomHardware.scala 47:34]
  wire [7:0] RegFile2R1W_000_io_in; // @[RandomHardware.scala 47:34]
  wire [7:0] RegFile2R1W_000_io_out; // @[RandomHardware.scala 47:34]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 48:42]
  wire [7:0] RandomHardware_001_io_out; // @[RandomHardware.scala 48:42]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware.scala 49:42]
  wire [27:0] RandomHardware_002_io_out; // @[RandomHardware.scala 49:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 50:42]
  wire [15:0] RandomHardware_003_io_in; // @[RandomHardware.scala 50:42]
  wire [15:0] RandomHardware_003_io_out; // @[RandomHardware.scala 50:42]
  wire [11:0] RandomHardware_004_io_in; // @[RandomHardware.scala 51:42]
  wire [11:0] RandomHardware_004_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_005_clock; // @[RandomHardware.scala 52:42]
  wire  RandomHardware_005_reset; // @[RandomHardware.scala 52:42]
  wire [61:0] RandomHardware_005_io_in; // @[RandomHardware.scala 52:42]
  wire [121:0] RandomHardware_005_io_out; // @[RandomHardware.scala 52:42]
  wire [15:0] RandomHardware_006_io_in; // @[RandomHardware.scala 53:42]
  wire [8:0] RandomHardware_006_io_out; // @[RandomHardware.scala 53:42]
  wire [27:0] RandomHardware_007_io_in; // @[RandomHardware.scala 54:42]
  wire [16:0] RandomHardware_007_io_out; // @[RandomHardware.scala 54:42]
  wire [19:0] RandomHardware_008_io_in; // @[RandomHardware.scala 55:42]
  wire [9:0] RandomHardware_008_io_out; // @[RandomHardware.scala 55:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_009_reset; // @[RandomHardware.scala 56:42]
  wire [66:0] RandomHardware_009_io_in; // @[RandomHardware.scala 56:42]
  wire [52:0] RandomHardware_009_io_out; // @[RandomHardware.scala 56:42]
  wire [25:0] RandomHardware_010_io_in; // @[RandomHardware.scala 57:42]
  wire [27:0] RandomHardware_010_io_out; // @[RandomHardware.scala 57:42]
  wire [7:0] SignExtendDouble_011_io_in; // @[RandomHardware.scala 58:42]
  wire [15:0] SignExtendDouble_011_io_out; // @[RandomHardware.scala 58:42]
  wire  ShiftRegister_012_clock; // @[RandomHardware.scala 59:42]
  wire [7:0] ShiftRegister_012_io_in; // @[RandomHardware.scala 59:42]
  wire [7:0] ShiftRegister_012_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 60:42]
  wire [39:0] RandomHardware_013_io_in; // @[RandomHardware.scala 60:42]
  wire [16:0] RandomHardware_013_io_out; // @[RandomHardware.scala 60:42]
  wire  Accum_014_clock; // @[RandomHardware.scala 61:34]
  wire [8:0] Accum_014_io_in; // @[RandomHardware.scala 61:34]
  wire [8:0] Accum_014_io_out; // @[RandomHardware.scala 61:34]
  wire [16:0] RandomHardware_015_io_in; // @[RandomHardware.scala 62:42]
  wire [7:0] RandomHardware_015_io_out; // @[RandomHardware.scala 62:42]
  wire [15:0] RandomHardware_016_io_in; // @[RandomHardware.scala 63:42]
  wire [3:0] RandomHardware_016_io_out; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 64:42]
  wire [31:0] RandomHardware_017_io_in; // @[RandomHardware.scala 64:42]
  wire [4:0] RandomHardware_017_io_out; // @[RandomHardware.scala 64:42]
  wire [24:0] RandomHardware_018_io_in; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_018_io_out; // @[RandomHardware.scala 65:42]
  wire [16:0] RandomHardware_019_io_in; // @[RandomHardware.scala 66:42]
  wire [7:0] RandomHardware_019_io_out; // @[RandomHardware.scala 66:42]
  wire [8:0] SignExtendDouble_020_io_in; // @[RandomHardware.scala 67:42]
  wire [17:0] SignExtendDouble_020_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 68:42]
  wire [19:0] RandomHardware_021_io_in; // @[RandomHardware.scala 68:42]
  wire [8:0] RandomHardware_021_io_out; // @[RandomHardware.scala 68:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 69:42]
  wire  RandomHardware_022_reset; // @[RandomHardware.scala 69:42]
  wire [23:0] RandomHardware_022_io_in; // @[RandomHardware.scala 69:42]
  wire [22:0] RandomHardware_022_io_out; // @[RandomHardware.scala 69:42]
  wire [18:0] RandomHardware_023_io_in; // @[RandomHardware.scala 70:42]
  wire [1:0] RandomHardware_023_io_out; // @[RandomHardware.scala 70:42]
  wire [7:0] ShiftRight_024_io_in; // @[RandomHardware.scala 71:34]
  wire [7:0] ShiftRight_024_io_out; // @[RandomHardware.scala 71:34]
  wire [31:0] io_out_lo = {RandomHardware_016_io_out,RandomHardware_019_io_out,SignExtendDouble_020_io_out,
    RandomHardware_023_io_out}; // @[Cat.scala 30:58]
  wire [177:0] io_out_hi = {RandomHardware_005_io_out,RandomHardware_006_io_out,RandomHardware_008_io_out,
    RandomHardware_010_io_out,Accum_014_io_out}; // @[Cat.scala 30:58]
  wire [15:0] wire_001 = RandomHardware_003_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 107:18]
  wire [11:0] wire_002 = RandomHardware_004_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 111:18]
  wire [11:0] wire_012 = RandomHardware_018_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 105:18]
  wire [22:0] wire_013 = RandomHardware_022_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 119:18]
  wire [34:0] RandomHardware_009_io_in_lo = {wire_012,wire_013}; // @[Cat.scala 30:58]
  wire [15:0] wire_011 = SignExtendDouble_011_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 93:18]
  wire [31:0] RandomHardware_009_io_in_hi = {wire_001,wire_011}; // @[Cat.scala 30:58]
  wire [27:0] wire_018 = RandomHardware_002_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 85:18]
  wire [7:0] wire_023 = RegFile2R1W_000_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 82:18]
  wire [7:0] wire_024 = RandomHardware_001_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 106:18]
  wire [15:0] RandomHardware_017_io_in_hi = {wire_023,wire_024}; // @[Cat.scala 30:58]
  wire [8:0] wire_027 = RandomHardware_021_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 115:18]
  wire [10:0] wire_005 = RandomHardware_022_io_out[10:0]; // @[RandomHardware.scala 118:47]
  wire [52:0] wire_004 = RandomHardware_009_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 90:18]
  wire [79:0] _RandomHardware_005_io_in_T = {wire_001,wire_004,wire_005}; // @[Cat.scala 30:58]
  wire [7:0] wire_009 = ShiftRight_024_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 121:18]
  wire [16:0] wire_014 = RandomHardware_007_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 88:18]
  wire [4:0] wire_031 = RandomHardware_017_io_out; // @[RandomHardware.scala 44:24 RandomHardware.scala 103:18]
  wire [12:0] _RandomHardware_023_io_in_T = {wire_031,wire_009}; // @[Cat.scala 30:58]
  RegFile2R1W RegFile2R1W_000 ( // @[RandomHardware.scala 47:34]
    .clock(RegFile2R1W_000_clock),
    .io_in(RegFile2R1W_000_io_in),
    .io_out(RegFile2R1W_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 48:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 49:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 50:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 51:42]
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_005_clock),
    .reset(RandomHardware_005_reset),
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 54:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 56:42]
    .clock(RandomHardware_009_clock),
    .reset(RandomHardware_009_reset),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 57:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  SignExtendDouble_3 SignExtendDouble_011 ( // @[RandomHardware.scala 58:42]
    .io_in(SignExtendDouble_011_io_in),
    .io_out(SignExtendDouble_011_io_out)
  );
  ShiftRegister_1 ShiftRegister_012 ( // @[RandomHardware.scala 59:42]
    .clock(ShiftRegister_012_clock),
    .io_in(ShiftRegister_012_io_in),
    .io_out(ShiftRegister_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  Accum_2 Accum_014 ( // @[RandomHardware.scala 61:34]
    .clock(Accum_014_clock),
    .io_in(Accum_014_io_in),
    .io_out(Accum_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 63:42]
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 64:42]
    .clock(RandomHardware_017_clock),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_15 RandomHardware_019 ( // @[RandomHardware.scala 66:42]
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  SignExtendDouble_4 SignExtendDouble_020 ( // @[RandomHardware.scala 67:42]
    .io_in(SignExtendDouble_020_io_in),
    .io_out(SignExtendDouble_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_022_clock),
    .reset(RandomHardware_022_reset),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 70:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  ShiftRight_8 ShiftRight_024 ( // @[RandomHardware.scala 71:34]
    .io_in(ShiftRight_024_io_in),
    .io_out(ShiftRight_024_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RegFile2R1W_000_clock = clock;
  assign RegFile2R1W_000_io_in = ShiftRight_024_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 120:18]
  assign RandomHardware_001_io_in = io_in[99:80]; // @[RandomHardware.scala 73:41]
  assign RandomHardware_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = io_in[15:0]; // @[RandomHardware.scala 74:41]
  assign RandomHardware_004_io_in = io_in[11:0]; // @[RandomHardware.scala 75:41]
  assign RandomHardware_005_clock = clock;
  assign RandomHardware_005_reset = reset;
  assign RandomHardware_005_io_in = _RandomHardware_005_io_in_T[61:0]; // @[RandomHardware.scala 124:33]
  assign RandomHardware_006_io_in = SignExtendDouble_011_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 92:18]
  assign RandomHardware_007_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 84:18]
  assign RandomHardware_008_io_in = {wire_002,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_reset = reset;
  assign RandomHardware_009_io_in = {RandomHardware_009_io_in_hi,RandomHardware_009_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_010_io_in = {wire_014,wire_027}; // @[Cat.scala 30:58]
  assign SignExtendDouble_011_io_in = ShiftRegister_012_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 97:18]
  assign ShiftRegister_012_clock = clock;
  assign ShiftRegister_012_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 101:18]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = {wire_018,wire_002}; // @[Cat.scala 30:58]
  assign Accum_014_clock = clock;
  assign Accum_014_io_in = RandomHardware_002_io_out[8:0]; // @[RandomHardware.scala 86:47]
  assign RandomHardware_015_io_in = RandomHardware_013_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 99:18]
  assign RandomHardware_016_io_in = RandomHardware_003_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 110:18]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_io_in = {RandomHardware_017_io_in_hi,wire_011}; // @[Cat.scala 30:58]
  assign RandomHardware_018_io_in = {wire_011,wire_027}; // @[Cat.scala 30:58]
  assign RandomHardware_019_io_in = {wire_027,wire_009}; // @[Cat.scala 30:58]
  assign SignExtendDouble_020_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 43:24 RandomHardware.scala 117:18]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = io_in[19:0]; // @[RandomHardware.scala 76:41]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_reset = reset;
  assign RandomHardware_022_io_in = io_in[23:0]; // @[RandomHardware.scala 77:41]
  assign RandomHardware_023_io_in = {{6'd0}, _RandomHardware_023_io_in_T}; // @[Cat.scala 30:58]
  assign ShiftRight_024_io_in = io_in[99:92]; // @[RandomHardware.scala 78:33]
endmodule
