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
module Reg(
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
  wire  Accum_000_clock; // @[RandomHardware_2_0.scala 16:34]
  wire [10:0] Accum_000_io_in; // @[RandomHardware_2_0.scala 16:34]
  wire [10:0] Accum_000_io_out; // @[RandomHardware_2_0.scala 16:34]
  wire  Reg_001_clock; // @[RandomHardware_2_0.scala 17:26]
  wire [10:0] Reg_001_io_in; // @[RandomHardware_2_0.scala 17:26]
  wire [10:0] Reg_001_io_out; // @[RandomHardware_2_0.scala 17:26]
  wire [22:0] Mux2_002_io_in; // @[RandomHardware_2_0.scala 18:26]
  wire [10:0] Mux2_002_io_out; // @[RandomHardware_2_0.scala 18:26]
  Accum Accum_000 ( // @[RandomHardware_2_0.scala 16:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_2_0.scala 17:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  Mux2 Mux2_002 ( // @[RandomHardware_2_0.scala 18:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_2_0.scala 21:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = Reg_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 24:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Mux2_002_io_out; // @[RandomHardware_2_0.scala 14:24 RandomHardware_2_0.scala 25:18]
  assign Mux2_002_io_in = io_in; // @[RandomHardware_2_0.scala 20:25]
endmodule
module ShiftRight(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{4'd0}, io_in[11:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_0(
  input         clock,
  input  [25:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_0.scala 15:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_0.scala 15:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_0.scala 15:42]
  wire [11:0] ShiftRight_001_io_in; // @[RandomHardware_1_0.scala 16:34]
  wire [11:0] ShiftRight_001_io_out; // @[RandomHardware_1_0.scala 16:34]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_0.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRight ShiftRight_001 ( // @[RandomHardware_1_0.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = ShiftRight_001_io_out; // @[RandomHardware_1_0.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[22:0]; // @[RandomHardware_1_0.scala 18:33]
  assign ShiftRight_001_io_in = {{1'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_0.scala 13:24 RandomHardware_1_0.scala 21:18]
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
module RandomHardware_1_1(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_1.scala 15:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_1.scala 15:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_1.scala 15:34]
  wire  Accum_001_clock; // @[RandomHardware_1_1.scala 16:34]
  wire [11:0] Accum_001_io_in; // @[RandomHardware_1_1.scala 16:34]
  wire [11:0] Accum_001_io_out; // @[RandomHardware_1_1.scala 16:34]
  Accum_1 Accum_000 ( // @[RandomHardware_1_1.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Accum_1 Accum_001 ( // @[RandomHardware_1_1.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_1.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_1.scala 18:25]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = Accum_000_io_out; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 21:18]
endmodule
module Div(
  input  [27:0] io_in,
  output [13:0] io_out
);
  wire [13:0] in1 = io_in[27:14]; // @[ArithmeticLogical.scala 59:20]
  wire [13:0] in2 = io_in[13:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module RandomHardware_1_2(
  input  [27:0] io_in,
  output [13:0] io_out
);
  wire [27:0] Div_000_io_in; // @[RandomHardware_1_2.scala 14:26]
  wire [13:0] Div_000_io_out; // @[RandomHardware_1_2.scala 14:26]
  Div Div_000 ( // @[RandomHardware_1_2.scala 14:26]
    .io_in(Div_000_io_in),
    .io_out(Div_000_io_out)
  );
  assign io_out = Div_000_io_out; // @[RandomHardware_1_2.scala 17:10]
  assign Div_000_io_in = io_in; // @[RandomHardware_1_2.scala 16:25]
endmodule
module ShiftRegister(
  input        clock,
  input  [8:0] io_in,
  output [8:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] r0; // @[Memory.scala 78:19]
  reg [8:0] r1; // @[Memory.scala 79:19]
  reg [8:0] r2; // @[Memory.scala 80:19]
  reg [8:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[8:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[8:0];
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
  input  [23:0] io_in,
  output [31:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_4.scala 14:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_4.scala 14:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_4.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_4.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{21'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_4.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[22:0]; // @[RandomHardware_1_4.scala 16:33]
endmodule
module ShiftLeft(
  input  [11:0] io_in,
  output [15:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_5(
  input  [11:0] io_in,
  output [15:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_5.scala 14:34]
  wire [15:0] ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 14:34]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_5.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module RegFile2R1W(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
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
  wire [2:0] R1_SEL = io_in[11:9]; // @[Memory.scala 37:28]
  wire [2:0] R2_SEL = io_in[8:6]; // @[Memory.scala 38:28]
  wire [5:0] W_DATA = io_in[5:0]; // @[Memory.scala 39:28]
  reg [5:0] registers_0; // @[Memory.scala 41:22]
  reg [5:0] registers_1; // @[Memory.scala 41:22]
  reg [5:0] registers_2; // @[Memory.scala 41:22]
  reg [5:0] registers_3; // @[Memory.scala 41:22]
  reg [5:0] registers_4; // @[Memory.scala 41:22]
  reg [5:0] registers_5; // @[Memory.scala 41:22]
  reg [5:0] registers_6; // @[Memory.scala 41:22]
  reg [5:0] registers_7; // @[Memory.scala 41:22]
  wire [5:0] _GEN_9 = 3'h1 == R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_10 = 3'h2 == R1_SEL ? registers_2 : _GEN_9; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_11 = 3'h3 == R1_SEL ? registers_3 : _GEN_10; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_12 = 3'h4 == R1_SEL ? registers_4 : _GEN_11; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_13 = 3'h5 == R1_SEL ? registers_5 : _GEN_12; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_14 = 3'h6 == R1_SEL ? registers_6 : _GEN_13; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_15 = 3'h7 == R1_SEL ? registers_7 : _GEN_14; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_17 = 3'h1 == R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_18 = 3'h2 == R2_SEL ? registers_2 : _GEN_17; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_19 = 3'h3 == R2_SEL ? registers_3 : _GEN_18; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_20 = 3'h4 == R2_SEL ? registers_4 : _GEN_19; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_21 = 3'h5 == R2_SEL ? registers_5 : _GEN_20; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_22 = 3'h6 == R2_SEL ? registers_6 : _GEN_21; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [5:0] _GEN_23 = 3'h7 == R2_SEL ? registers_7 : _GEN_22; // @[Cat.scala 30:58 Cat.scala 30:58]
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
  registers_0 = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[5:0];
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
  wire  RegFile2R1W_000_clock; // @[RandomHardware_1_6.scala 14:34]
  wire [11:0] RegFile2R1W_000_io_in; // @[RandomHardware_1_6.scala 14:34]
  wire [11:0] RegFile2R1W_000_io_out; // @[RandomHardware_1_6.scala 14:34]
  RegFile2R1W RegFile2R1W_000 ( // @[RandomHardware_1_6.scala 14:34]
    .clock(RegFile2R1W_000_clock),
    .io_in(RegFile2R1W_000_io_in),
    .io_out(RegFile2R1W_000_io_out)
  );
  assign io_out = RegFile2R1W_000_io_out; // @[RandomHardware_1_6.scala 17:10]
  assign RegFile2R1W_000_clock = clock;
  assign RegFile2R1W_000_io_in = io_in; // @[RandomHardware_1_6.scala 16:33]
endmodule
module ReduceXorMux(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[19:13]; // @[Muxes.scala 122:27]
  wire [6:0] IN2 = io_in[12:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module ShiftLeft_1(
  input  [6:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_7(
  input  [19:0] io_in,
  output [10:0] io_out
);
  wire [19:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_7.scala 15:34]
  wire [6:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_7.scala 15:34]
  wire [6:0] ShiftLeft_001_io_in; // @[RandomHardware_1_7.scala 16:34]
  wire [10:0] ShiftLeft_001_io_out; // @[RandomHardware_1_7.scala 16:34]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_7.scala 15:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  ShiftLeft_1 ShiftLeft_001 ( // @[RandomHardware_1_7.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_7.scala 19:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_7.scala 18:33]
  assign ShiftLeft_001_io_in = ReduceXorMux_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 21:18]
endmodule
module ShiftRight_1(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{1'd0}, io_in[11:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_8(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_1_8.scala 14:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_1_8.scala 14:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_1_8.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_8.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_8.scala 16:25]
endmodule
module Mux2_2(
  input  [28:0] io_in,
  output [13:0] io_out
);
  wire  sel = io_in[28]; // @[Muxes.scala 16:18]
  wire [13:0] in1 = io_in[27:14]; // @[Muxes.scala 17:18]
  wire [13:0] in0 = io_in[13:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_9(
  input  [28:0] io_in,
  output [13:0] io_out
);
  wire [28:0] Mux2_000_io_in; // @[RandomHardware_1_9.scala 14:26]
  wire [13:0] Mux2_000_io_out; // @[RandomHardware_1_9.scala 14:26]
  Mux2_2 Mux2_000 ( // @[RandomHardware_1_9.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_9.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_9.scala 16:25]
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
module Mul(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_11(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_11.scala 15:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_11.scala 15:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_11.scala 15:34]
  wire [11:0] Mul_001_io_in; // @[RandomHardware_1_11.scala 16:26]
  wire [11:0] Mul_001_io_out; // @[RandomHardware_1_11.scala 16:26]
  Accum_1 Accum_000 ( // @[RandomHardware_1_11.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  Mul Mul_001 ( // @[RandomHardware_1_11.scala 16:26]
    .io_in(Mul_001_io_in),
    .io_out(Mul_001_io_out)
  );
  assign io_out = Mul_001_io_out; // @[RandomHardware_1_11.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_11.scala 18:25]
  assign Mul_001_io_in = Accum_000_io_out; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 21:18]
endmodule
module ReduceXorMux_1(
  input  [15:0] io_in,
  output [2:0]  io_out
);
  wire [2:0] IN1 = io_in[15:13]; // @[Muxes.scala 122:27]
  wire [2:0] IN2 = io_in[12:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_12(
  input  [15:0] io_in,
  output [2:0]  io_out
);
  wire [15:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_12.scala 14:34]
  wire [2:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 14:34]
  ReduceXorMux_1 ReduceXorMux_000 ( // @[RandomHardware_1_12.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_12.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_12.scala 16:33]
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
module ShiftRight_2(
  input  [5:0] io_in,
  output [5:0] io_out
);
  assign io_out = {{4'd0}, io_in[5:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_13(
  input  [25:0] io_in,
  output [5:0]  io_out
);
  wire [25:0] Mux4_000_io_in; // @[RandomHardware_1_13.scala 15:26]
  wire [5:0] Mux4_000_io_out; // @[RandomHardware_1_13.scala 15:26]
  wire [5:0] ShiftRight_001_io_in; // @[RandomHardware_1_13.scala 16:34]
  wire [5:0] ShiftRight_001_io_out; // @[RandomHardware_1_13.scala 16:34]
  Mux4 Mux4_000 ( // @[RandomHardware_1_13.scala 15:26]
    .io_in(Mux4_000_io_in),
    .io_out(Mux4_000_io_out)
  );
  ShiftRight_2 ShiftRight_001 ( // @[RandomHardware_1_13.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = ShiftRight_001_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign Mux4_000_io_in = io_in; // @[RandomHardware_1_13.scala 18:25]
  assign ShiftRight_001_io_in = Mux4_000_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
endmodule
module SignExtendDouble(
  input  [10:0] io_in,
  output [21:0] io_out
);
  wire [10:0] io_out_hi = io_in[10] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_14(
  input         clock,
  input  [21:0] io_in,
  output [21:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_14.scala 15:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_14.scala 15:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 15:42]
  wire [10:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_14.scala 16:42]
  wire [21:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_14.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_14.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_1_14.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_14.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{1'd0}, io_in}; // @[RandomHardware_1_14.scala 18:33]
  assign SignExtendDouble_001_io_in = RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 21:18]
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_15.scala 14:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_15.scala 14:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_15.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{1'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_15.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{11'd0}, io_in}; // @[RandomHardware_1_15.scala 16:33]
endmodule
module SignExtendDouble_1(
  input  [4:0] io_in,
  output [9:0] io_out
);
  wire [4:0] io_out_hi = io_in[4] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
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
module ShiftLeft_2(
  input  [10:0] io_in,
  output [15:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_16(
  input  [23:0] io_in,
  output [25:0] io_out
);
  wire [4:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_16.scala 16:42]
  wire [9:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_16.scala 16:42]
  wire [23:0] CompareMux_001_io_in; // @[RandomHardware_1_16.scala 17:34]
  wire [10:0] CompareMux_001_io_out; // @[RandomHardware_1_16.scala 17:34]
  wire [10:0] ShiftLeft_002_io_in; // @[RandomHardware_1_16.scala 18:34]
  wire [15:0] ShiftLeft_002_io_out; // @[RandomHardware_1_16.scala 18:34]
  SignExtendDouble_1 SignExtendDouble_000 ( // @[RandomHardware_1_16.scala 16:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_1_16.scala 17:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  ShiftLeft_2 ShiftLeft_002 ( // @[RandomHardware_1_16.scala 18:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  assign io_out = {SignExtendDouble_000_io_out,ShiftLeft_002_io_out}; // @[Cat.scala 30:58]
  assign SignExtendDouble_000_io_in = CompareMux_001_io_out[9:5]; // @[RandomHardware_1_16.scala 23:43]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_16.scala 20:25]
  assign ShiftLeft_002_io_in = CompareMux_001_io_out; // @[RandomHardware_1_16.scala 14:24 RandomHardware_1_16.scala 24:18]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [14:0] r0; // @[Memory.scala 60:19]
  reg [14:0] r1; // @[Memory.scala 61:19]
  reg [14:0] r2; // @[Memory.scala 62:19]
  reg [14:0] r3; // @[Memory.scala 63:19]
  wire [15:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 15'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[14:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 15'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 15'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 15'h0; // @[Memory.scala 63:19]
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
module ShiftRight_3(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{2'd0}, io_in[11:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Reg_5(
  input         clock,
  input  [45:0] io_in,
  output [45:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [45:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[45:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mod(
  input  [45:0] io_in,
  output [22:0] io_out
);
  wire [22:0] in1 = io_in[45:23]; // @[ArithmeticLogical.scala 71:20]
  wire [22:0] in2 = io_in[22:0]; // @[ArithmeticLogical.scala 72:20]
  wire [22:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[22:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_2_3(
  input         clock,
  input  [45:0] io_in,
  output [22:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_2_3.scala 15:26]
  wire [45:0] Reg_000_io_in; // @[RandomHardware_2_3.scala 15:26]
  wire [45:0] Reg_000_io_out; // @[RandomHardware_2_3.scala 15:26]
  wire [45:0] Mod_001_io_in; // @[RandomHardware_2_3.scala 16:26]
  wire [22:0] Mod_001_io_out; // @[RandomHardware_2_3.scala 16:26]
  Reg_5 Reg_000 ( // @[RandomHardware_2_3.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  Mod Mod_001 ( // @[RandomHardware_2_3.scala 16:26]
    .io_in(Mod_001_io_in),
    .io_out(Mod_001_io_out)
  );
  assign io_out = Mod_001_io_out; // @[RandomHardware_2_3.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_2_3.scala 18:25]
  assign Mod_001_io_in = Reg_000_io_out; // @[RandomHardware_2_3.scala 13:24 RandomHardware_2_3.scala 21:18]
endmodule
module Accum_7(
  input         clock,
  input  [48:0] io_in,
  output [48:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [48:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[48:0];
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
  input         reset,
  input  [51:0] io_in,
  output [48:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_17.scala 19:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_17.scala 19:42]
  wire [15:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_17.scala 19:42]
  wire [14:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_17.scala 19:42]
  wire  RegE_001_clock; // @[RandomHardware_1_17.scala 20:26]
  wire [23:0] RegE_001_io_in; // @[RandomHardware_1_17.scala 20:26]
  wire [22:0] RegE_001_io_out; // @[RandomHardware_1_17.scala 20:26]
  wire [11:0] ShiftRight_002_io_in; // @[RandomHardware_1_17.scala 21:34]
  wire [11:0] ShiftRight_002_io_out; // @[RandomHardware_1_17.scala 21:34]
  wire  RandomHardware_003_clock; // @[RandomHardware_1_17.scala 22:42]
  wire [45:0] RandomHardware_003_io_in; // @[RandomHardware_1_17.scala 22:42]
  wire [22:0] RandomHardware_003_io_out; // @[RandomHardware_1_17.scala 22:42]
  wire  Accum_004_clock; // @[RandomHardware_1_17.scala 23:34]
  wire [48:0] Accum_004_io_in; // @[RandomHardware_1_17.scala 23:34]
  wire [48:0] Accum_004_io_out; // @[RandomHardware_1_17.scala 23:34]
  wire [10:0] wire_002 = RegE_001_io_out[10:0]; // @[RandomHardware_1_17.scala 34:37]
  wire [11:0] wire_003 = ShiftRight_002_io_out; // @[RandomHardware_1_17.scala 16:24 RandomHardware_1_17.scala 35:18]
  wire [10:0] wire_004 = RandomHardware_003_io_out[10:0]; // @[RandomHardware_1_17.scala 17:24 RandomHardware_1_17.scala 31:18]
  wire [22:0] Accum_004_io_in_lo = {wire_003,wire_004}; // @[Cat.scala 30:58]
  wire [14:0] wire_000 = ResetShiftRegister_000_io_out; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 32:18]
  wire [25:0] Accum_004_io_in_hi = {wire_000,wire_002}; // @[Cat.scala 30:58]
  ResetShiftRegister ResetShiftRegister_000 ( // @[RandomHardware_1_17.scala 19:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  RegE RegE_001 ( // @[RandomHardware_1_17.scala 20:26]
    .clock(RegE_001_clock),
    .io_in(RegE_001_io_in),
    .io_out(RegE_001_io_out)
  );
  ShiftRight_3 ShiftRight_002 ( // @[RandomHardware_1_17.scala 21:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  RandomHardware_2_3 RandomHardware_003 ( // @[RandomHardware_1_17.scala 22:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  Accum_7 Accum_004 ( // @[RandomHardware_1_17.scala 23:34]
    .clock(Accum_004_clock),
    .io_in(Accum_004_io_in),
    .io_out(Accum_004_io_out)
  );
  assign io_out = Accum_004_io_out; // @[RandomHardware_1_17.scala 28:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in[15:0]; // @[RandomHardware_1_17.scala 25:41]
  assign RegE_001_clock = clock;
  assign RegE_001_io_in = io_in[51:28]; // @[RandomHardware_1_17.scala 26:33]
  assign ShiftRight_002_io_in = io_in[51:40]; // @[RandomHardware_1_17.scala 27:33]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = {{23'd0}, RegE_001_io_out}; // @[RandomHardware_1_17.scala 14:24 RandomHardware_1_17.scala 33:18]
  assign Accum_004_clock = clock;
  assign Accum_004_io_in = {Accum_004_io_in_hi,Accum_004_io_in_lo}; // @[Cat.scala 30:58]
endmodule
module Mux2_5(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire  sel = io_in[18]; // @[Muxes.scala 16:18]
  wire [8:0] in1 = io_in[17:9]; // @[Muxes.scala 17:18]
  wire [8:0] in0 = io_in[8:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_18(
  input  [18:0] io_in,
  output [8:0]  io_out
);
  wire [18:0] Mux2_000_io_in; // @[RandomHardware_1_18.scala 14:26]
  wire [8:0] Mux2_000_io_out; // @[RandomHardware_1_18.scala 14:26]
  Mux2_5 Mux2_000 ( // @[RandomHardware_1_18.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module Accum_8(
  input        clock,
  input  [2:0] io_in,
  output [2:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftLeft_3(
  input  [17:0] io_in,
  output [21:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_20(
  input  [17:0] io_in,
  output [21:0] io_out
);
  wire [17:0] ShiftLeft_000_io_in; // @[RandomHardware_1_20.scala 14:34]
  wire [21:0] ShiftLeft_000_io_out; // @[RandomHardware_1_20.scala 14:34]
  ShiftLeft_3 ShiftLeft_000 ( // @[RandomHardware_1_20.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_20.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_20.scala 16:25]
endmodule
module ShiftRegister_1(
  input         clock,
  input  [17:0] io_in,
  output [17:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] r0; // @[Memory.scala 78:19]
  reg [17:0] r1; // @[Memory.scala 79:19]
  reg [17:0] r2; // @[Memory.scala 80:19]
  reg [17:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[17:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[17:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[17:0];
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
  input  [17:0] io_in,
  output [17:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_21.scala 14:42]
  wire [17:0] ShiftRegister_000_io_in; // @[RandomHardware_1_21.scala 14:42]
  wire [17:0] ShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 14:42]
  ShiftRegister_1 ShiftRegister_000 ( // @[RandomHardware_1_21.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_21.scala 16:33]
endmodule
module Mux4_1(
  input  [21:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] sel = io_in[21:20]; // @[Muxes.scala 28:18]
  wire [4:0] in3 = io_in[19:15]; // @[Muxes.scala 29:18]
  wire [4:0] in2 = io_in[14:10]; // @[Muxes.scala 30:18]
  wire [4:0] in1 = io_in[9:5]; // @[Muxes.scala 31:18]
  wire [4:0] in0 = io_in[4:0]; // @[Muxes.scala 32:18]
  wire [4:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [4:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module ShiftLeft_4(
  input  [43:0] io_in,
  output [45:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_5(
  input  [41:0] io_in,
  output [44:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mux2_6(
  input  [44:0] io_in,
  output [21:0] io_out
);
  wire  sel = io_in[44]; // @[Muxes.scala 16:18]
  wire [21:0] in1 = io_in[43:22]; // @[Muxes.scala 17:18]
  wire [21:0] in0 = io_in[21:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_2_2(
  input  [41:0] io_in,
  output [43:0] io_out
);
  wire [41:0] ShiftLeft_000_io_in; // @[RandomHardware_2_2.scala 16:34]
  wire [44:0] ShiftLeft_000_io_out; // @[RandomHardware_2_2.scala 16:34]
  wire [44:0] Mux2_001_io_in; // @[RandomHardware_2_2.scala 17:26]
  wire [21:0] Mux2_001_io_out; // @[RandomHardware_2_2.scala 17:26]
  wire [44:0] Mux2_002_io_in; // @[RandomHardware_2_2.scala 18:26]
  wire [21:0] Mux2_002_io_out; // @[RandomHardware_2_2.scala 18:26]
  ShiftLeft_5 ShiftLeft_000 ( // @[RandomHardware_2_2.scala 16:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Mux2_6 Mux2_001 ( // @[RandomHardware_2_2.scala 17:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  Mux2_6 Mux2_002 ( // @[RandomHardware_2_2.scala 18:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  assign io_out = {Mux2_001_io_out,Mux2_002_io_out}; // @[Cat.scala 30:58]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_2_2.scala 20:25]
  assign Mux2_001_io_in = ShiftLeft_000_io_out; // @[RandomHardware_2_2.scala 13:24 RandomHardware_2_2.scala 23:18]
  assign Mux2_002_io_in = ShiftLeft_000_io_out; // @[RandomHardware_2_2.scala 14:24 RandomHardware_2_2.scala 24:18]
endmodule
module RandomHardware_1_22(
  input         clock,
  input  [41:0] io_in,
  output [4:0]  io_out
);
  wire [21:0] Mux4_000_io_in; // @[RandomHardware_1_22.scala 18:26]
  wire [4:0] Mux4_000_io_out; // @[RandomHardware_1_22.scala 18:26]
  wire [43:0] ShiftLeft_001_io_in; // @[RandomHardware_1_22.scala 19:34]
  wire [45:0] ShiftLeft_001_io_out; // @[RandomHardware_1_22.scala 19:34]
  wire [41:0] RandomHardware_002_io_in; // @[RandomHardware_1_22.scala 20:42]
  wire [43:0] RandomHardware_002_io_out; // @[RandomHardware_1_22.scala 20:42]
  wire  RandomHardware_003_clock; // @[RandomHardware_1_22.scala 21:42]
  wire [45:0] RandomHardware_003_io_in; // @[RandomHardware_1_22.scala 21:42]
  wire [22:0] RandomHardware_003_io_out; // @[RandomHardware_1_22.scala 21:42]
  wire [21:0] wire_001 = RandomHardware_002_io_out[43:22]; // @[RandomHardware_1_22.scala 30:47]
  wire [22:0] wire_003 = RandomHardware_003_io_out; // @[RandomHardware_1_22.scala 16:24 RandomHardware_1_22.scala 29:18]
  wire [44:0] _Mux4_000_io_in_T = {wire_001,wire_003}; // @[Cat.scala 30:58]
  Mux4_1 Mux4_000 ( // @[RandomHardware_1_22.scala 18:26]
    .io_in(Mux4_000_io_in),
    .io_out(Mux4_000_io_out)
  );
  ShiftLeft_4 ShiftLeft_001 ( // @[RandomHardware_1_22.scala 19:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_22.scala 20:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_2_3 RandomHardware_003 ( // @[RandomHardware_1_22.scala 21:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  assign io_out = Mux4_000_io_out; // @[RandomHardware_1_22.scala 24:10]
  assign Mux4_000_io_in = _Mux4_000_io_in_T[21:0]; // @[RandomHardware_1_22.scala 32:25]
  assign ShiftLeft_001_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_22.scala 15:24 RandomHardware_1_22.scala 31:18]
  assign RandomHardware_002_io_in = io_in; // @[RandomHardware_1_22.scala 23:33]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = ShiftLeft_001_io_out; // @[RandomHardware_1_22.scala 13:24 RandomHardware_1_22.scala 27:18]
endmodule
module Mux2_8(
  input  [62:0] io_in,
  output [30:0] io_out
);
  wire  sel = io_in[62]; // @[Muxes.scala 16:18]
  wire [30:0] in1 = io_in[61:31]; // @[Muxes.scala 17:18]
  wire [30:0] in0 = io_in[30:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module Accum_9(
  input         clock,
  input  [30:0] io_in,
  output [30:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [30:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[30:0];
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
  input  [30:0] io_in,
  output [30:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_2_1.scala 14:34]
  wire [30:0] Accum_000_io_in; // @[RandomHardware_2_1.scala 14:34]
  wire [30:0] Accum_000_io_out; // @[RandomHardware_2_1.scala 14:34]
  Accum_9 Accum_000 ( // @[RandomHardware_2_1.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_2_1.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_2_1.scala 16:25]
endmodule
module ShiftRight_4(
  input  [30:0] io_in,
  output [30:0] io_out
);
  assign io_out = {{4'd0}, io_in[30:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_24(
  input         clock,
  input  [62:0] io_in,
  output [30:0] io_out
);
  wire [62:0] Mux2_000_io_in; // @[RandomHardware_1_24.scala 16:26]
  wire [30:0] Mux2_000_io_out; // @[RandomHardware_1_24.scala 16:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_24.scala 17:42]
  wire [30:0] RandomHardware_001_io_in; // @[RandomHardware_1_24.scala 17:42]
  wire [30:0] RandomHardware_001_io_out; // @[RandomHardware_1_24.scala 17:42]
  wire [30:0] ShiftRight_002_io_in; // @[RandomHardware_1_24.scala 18:34]
  wire [30:0] ShiftRight_002_io_out; // @[RandomHardware_1_24.scala 18:34]
  Mux2_8 Mux2_000 ( // @[RandomHardware_1_24.scala 16:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_24.scala 17:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ShiftRight_4 ShiftRight_002 ( // @[RandomHardware_1_24.scala 18:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  assign io_out = ShiftRight_002_io_out; // @[RandomHardware_1_24.scala 21:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_24.scala 20:25]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = Mux2_000_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 25:18]
  assign ShiftRight_002_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_24.scala 14:24 RandomHardware_1_24.scala 24:18]
endmodule
module ReduceOrMux(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] IN1 = io_in[15:11]; // @[Muxes.scala 110:27]
  wire [4:0] IN2 = io_in[10:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_25(
  input  [15:0] io_in,
  output [4:0]  io_out
);
  wire [15:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_25.scala 14:34]
  wire [4:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_25.scala 14:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_25.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_25.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_25.scala 16:33]
endmodule
module SignExtendDouble_2(
  input  [15:0] io_in,
  output [31:0] io_out
);
  wire [15:0] io_out_hi = io_in[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_26(
  input  [15:0] io_in,
  output [31:0] io_out
);
  wire [15:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_26.scala 14:42]
  wire [31:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_26.scala 14:42]
  SignExtendDouble_2 SignExtendDouble_000 ( // @[RandomHardware_1_26.scala 14:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_26.scala 17:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_1_26.scala 16:33]
endmodule
module RandomHardware_1_27(
  input         clock,
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_27.scala 14:42]
  wire [22:0] RandomHardware_000_io_in; // @[RandomHardware_1_27.scala 14:42]
  wire [10:0] RandomHardware_000_io_out; // @[RandomHardware_1_27.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_27.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_27.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_27.scala 16:33]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [157:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware.scala 54:42]
  wire [25:0] RandomHardware_000_io_in; // @[RandomHardware.scala 54:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware.scala 54:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 55:42]
  wire [11:0] RandomHardware_001_io_in; // @[RandomHardware.scala 55:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware.scala 55:42]
  wire [27:0] RandomHardware_002_io_in; // @[RandomHardware.scala 56:42]
  wire [13:0] RandomHardware_002_io_out; // @[RandomHardware.scala 56:42]
  wire  ShiftRegister_003_clock; // @[RandomHardware.scala 57:42]
  wire [8:0] ShiftRegister_003_io_in; // @[RandomHardware.scala 57:42]
  wire [8:0] ShiftRegister_003_io_out; // @[RandomHardware.scala 57:42]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 58:42]
  wire [23:0] RandomHardware_004_io_in; // @[RandomHardware.scala 58:42]
  wire [31:0] RandomHardware_004_io_out; // @[RandomHardware.scala 58:42]
  wire [11:0] RandomHardware_005_io_in; // @[RandomHardware.scala 59:42]
  wire [15:0] RandomHardware_005_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_006_clock; // @[RandomHardware.scala 60:42]
  wire [11:0] RandomHardware_006_io_in; // @[RandomHardware.scala 60:42]
  wire [11:0] RandomHardware_006_io_out; // @[RandomHardware.scala 60:42]
  wire [19:0] RandomHardware_007_io_in; // @[RandomHardware.scala 61:42]
  wire [10:0] RandomHardware_007_io_out; // @[RandomHardware.scala 61:42]
  wire [11:0] RandomHardware_008_io_in; // @[RandomHardware.scala 62:42]
  wire [11:0] RandomHardware_008_io_out; // @[RandomHardware.scala 62:42]
  wire [28:0] RandomHardware_009_io_in; // @[RandomHardware.scala 63:42]
  wire [13:0] RandomHardware_009_io_out; // @[RandomHardware.scala 63:42]
  wire  Reg_010_clock; // @[RandomHardware.scala 64:26]
  wire [7:0] Reg_010_io_in; // @[RandomHardware.scala 64:26]
  wire [7:0] Reg_010_io_out; // @[RandomHardware.scala 64:26]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_011_io_in; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_011_io_out; // @[RandomHardware.scala 65:42]
  wire [15:0] RandomHardware_012_io_in; // @[RandomHardware.scala 66:42]
  wire [2:0] RandomHardware_012_io_out; // @[RandomHardware.scala 66:42]
  wire [25:0] RandomHardware_013_io_in; // @[RandomHardware.scala 67:42]
  wire [5:0] RandomHardware_013_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 68:42]
  wire [21:0] RandomHardware_014_io_in; // @[RandomHardware.scala 68:42]
  wire [21:0] RandomHardware_014_io_out; // @[RandomHardware.scala 68:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 69:42]
  wire [11:0] RandomHardware_015_io_in; // @[RandomHardware.scala 69:42]
  wire [11:0] RandomHardware_015_io_out; // @[RandomHardware.scala 69:42]
  wire [23:0] RandomHardware_016_io_in; // @[RandomHardware.scala 70:42]
  wire [25:0] RandomHardware_016_io_out; // @[RandomHardware.scala 70:42]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 71:42]
  wire  RandomHardware_017_reset; // @[RandomHardware.scala 71:42]
  wire [51:0] RandomHardware_017_io_in; // @[RandomHardware.scala 71:42]
  wire [48:0] RandomHardware_017_io_out; // @[RandomHardware.scala 71:42]
  wire [18:0] RandomHardware_018_io_in; // @[RandomHardware.scala 72:42]
  wire [8:0] RandomHardware_018_io_out; // @[RandomHardware.scala 72:42]
  wire  Accum_019_clock; // @[RandomHardware.scala 73:34]
  wire [2:0] Accum_019_io_in; // @[RandomHardware.scala 73:34]
  wire [2:0] Accum_019_io_out; // @[RandomHardware.scala 73:34]
  wire [17:0] RandomHardware_020_io_in; // @[RandomHardware.scala 74:42]
  wire [21:0] RandomHardware_020_io_out; // @[RandomHardware.scala 74:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 75:42]
  wire [17:0] RandomHardware_021_io_in; // @[RandomHardware.scala 75:42]
  wire [17:0] RandomHardware_021_io_out; // @[RandomHardware.scala 75:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 76:42]
  wire [41:0] RandomHardware_022_io_in; // @[RandomHardware.scala 76:42]
  wire [4:0] RandomHardware_022_io_out; // @[RandomHardware.scala 76:42]
  wire  Reg_023_clock; // @[RandomHardware.scala 77:26]
  wire [7:0] Reg_023_io_in; // @[RandomHardware.scala 77:26]
  wire [7:0] Reg_023_io_out; // @[RandomHardware.scala 77:26]
  wire  RandomHardware_024_clock; // @[RandomHardware.scala 78:42]
  wire [62:0] RandomHardware_024_io_in; // @[RandomHardware.scala 78:42]
  wire [30:0] RandomHardware_024_io_out; // @[RandomHardware.scala 78:42]
  wire [15:0] RandomHardware_025_io_in; // @[RandomHardware.scala 79:42]
  wire [4:0] RandomHardware_025_io_out; // @[RandomHardware.scala 79:42]
  wire [15:0] RandomHardware_026_io_in; // @[RandomHardware.scala 80:42]
  wire [31:0] RandomHardware_026_io_out; // @[RandomHardware.scala 80:42]
  wire  RandomHardware_027_clock; // @[RandomHardware.scala 81:42]
  wire [22:0] RandomHardware_027_io_in; // @[RandomHardware.scala 81:42]
  wire [10:0] RandomHardware_027_io_out; // @[RandomHardware.scala 81:42]
  wire [65:0] io_out_lo = {Accum_019_io_out,RandomHardware_024_io_out,RandomHardware_026_io_out}; // @[Cat.scala 30:58]
  wire [91:0] io_out_hi = {RandomHardware_006_io_out,RandomHardware_014_io_out,RandomHardware_017_io_out,
    RandomHardware_018_io_out}; // @[Cat.scala 30:58]
  wire [8:0] wire_002 = ShiftRegister_003_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 99:18]
  wire [7:0] wire_003 = Reg_023_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 144:18]
  wire [16:0] RandomHardware_002_io_in_hi = {wire_002,wire_003}; // @[Cat.scala 30:58]
  wire [10:0] wire_004 = RandomHardware_027_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 131:18]
  wire [5:0] wire_005 = RandomHardware_011_io_out[11:6]; // @[RandomHardware.scala 110:47]
  wire [2:0] wire_006 = RandomHardware_012_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 137:18]
  wire [5:0] wire_007 = RandomHardware_011_io_out[5:0]; // @[RandomHardware.scala 111:47]
  wire [11:0] wire_008 = RandomHardware_015_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 117:18]
  wire [17:0] _RandomHardware_005_io_in_T = {wire_007,wire_008}; // @[Cat.scala 30:58]
  wire [25:0] wire_014 = RandomHardware_016_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 141:18]
  wire [34:0] _RandomHardware_009_io_in_T = {wire_002,wire_014}; // @[Cat.scala 30:58]
  wire [13:0] wire_016 = RandomHardware_009_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 108:18]
  wire [5:0] wire_027 = RandomHardware_013_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 114:18]
  wire [7:0] wire_029 = Reg_010_io_out; // @[RandomHardware.scala 42:24 RandomHardware.scala 135:18]
  wire [33:0] RandomHardware_022_io_in_hi = {wire_029,wire_014}; // @[Cat.scala 30:58]
  wire [10:0] wire_010 = RandomHardware_007_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 134:18]
  wire [11:0] wire_012 = RandomHardware_008_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 106:18]
  wire [13:0] wire_020 = RandomHardware_002_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 97:18]
  wire [31:0] wire_021 = RandomHardware_004_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 132:18]
  wire [45:0] RandomHardware_017_io_in_hi = {wire_020,wire_021}; // @[Cat.scala 30:58]
  wire [15:0] wire_023 = RandomHardware_005_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 102:18]
  wire [4:0] wire_036 = RandomHardware_022_io_out; // @[RandomHardware.scala 49:24 RandomHardware.scala 127:18]
  wire [30:0] RandomHardware_024_io_in_lo = {wire_014,wire_036}; // @[Cat.scala 30:58]
  wire [11:0] wire_032 = RandomHardware_001_io_out; // @[RandomHardware.scala 45:24 RandomHardware.scala 95:18]
  wire [31:0] RandomHardware_024_io_in_hi = {wire_032,wire_012,wire_029}; // @[Cat.scala 30:58]
  wire [4:0] wire_039 = RandomHardware_025_io_out; // @[RandomHardware.scala 52:24 RandomHardware.scala 129:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 55:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 56:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftRegister ShiftRegister_003 ( // @[RandomHardware.scala 57:42]
    .clock(ShiftRegister_003_clock),
    .io_in(ShiftRegister_003_io_in),
    .io_out(ShiftRegister_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 58:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 59:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_006_clock),
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 61:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 63:42]
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  Reg_2 Reg_010 ( // @[RandomHardware.scala 64:26]
    .clock(Reg_010_clock),
    .io_in(Reg_010_io_in),
    .io_out(Reg_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 65:42]
    .clock(RandomHardware_011_clock),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 66:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 67:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 70:42]
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 71:42]
    .clock(RandomHardware_017_clock),
    .reset(RandomHardware_017_reset),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 72:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  Accum_8 Accum_019 ( // @[RandomHardware.scala 73:34]
    .clock(Accum_019_clock),
    .io_in(Accum_019_io_in),
    .io_out(Accum_019_io_out)
  );
  RandomHardware_1_20 RandomHardware_020 ( // @[RandomHardware.scala 74:42]
    .io_in(RandomHardware_020_io_in),
    .io_out(RandomHardware_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 75:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 76:42]
    .clock(RandomHardware_022_clock),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  Reg_2 Reg_023 ( // @[RandomHardware.scala 77:26]
    .clock(Reg_023_clock),
    .io_in(Reg_023_io_in),
    .io_out(Reg_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 78:42]
    .clock(RandomHardware_024_clock),
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  RandomHardware_1_25 RandomHardware_025 ( // @[RandomHardware.scala 79:42]
    .io_in(RandomHardware_025_io_in),
    .io_out(RandomHardware_025_io_out)
  );
  RandomHardware_1_26 RandomHardware_026 ( // @[RandomHardware.scala 80:42]
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  RandomHardware_1_27 RandomHardware_027 ( // @[RandomHardware.scala 81:42]
    .clock(RandomHardware_027_clock),
    .io_in(RandomHardware_027_io_in),
    .io_out(RandomHardware_027_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = RandomHardware_016_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 140:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 116:18]
  assign RandomHardware_002_io_in = {RandomHardware_002_io_in_hi,wire_004}; // @[Cat.scala 30:58]
  assign ShiftRegister_003_clock = clock;
  assign ShiftRegister_003_io_in = {wire_005,wire_006}; // @[Cat.scala 30:58]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = io_in[99:76]; // @[RandomHardware.scala 83:41]
  assign RandomHardware_005_io_in = _RandomHardware_005_io_in_T[11:0]; // @[RandomHardware.scala 101:33]
  assign RandomHardware_006_clock = clock;
  assign RandomHardware_006_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 118:18]
  assign RandomHardware_007_io_in = io_in[19:0]; // @[RandomHardware.scala 84:41]
  assign RandomHardware_008_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 94:18]
  assign RandomHardware_009_io_in = _RandomHardware_009_io_in_T[28:0]; // @[RandomHardware.scala 107:33]
  assign Reg_010_clock = clock;
  assign Reg_010_io_in = io_in[99:92]; // @[RandomHardware.scala 85:33]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 119:18]
  assign RandomHardware_012_io_in = io_in[15:0]; // @[RandomHardware.scala 86:41]
  assign RandomHardware_013_io_in = {wire_016,wire_008}; // @[Cat.scala 30:58]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = RandomHardware_020_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 123:18]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = RandomHardware_000_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 92:18]
  assign RandomHardware_016_io_in = io_in[23:0]; // @[RandomHardware.scala 87:41]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_reset = reset;
  assign RandomHardware_017_io_in = {RandomHardware_017_io_in_hi,wire_027}; // @[Cat.scala 30:58]
  assign RandomHardware_018_io_in = {wire_023,wire_006}; // @[Cat.scala 30:58]
  assign Accum_019_clock = clock;
  assign Accum_019_io_in = RandomHardware_012_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 139:18]
  assign RandomHardware_020_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 125:18]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = {wire_027,wire_008}; // @[Cat.scala 30:58]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_io_in = {RandomHardware_022_io_in_hi,wire_003}; // @[Cat.scala 30:58]
  assign Reg_023_clock = clock;
  assign Reg_023_io_in = io_in[99:92]; // @[RandomHardware.scala 88:33]
  assign RandomHardware_024_clock = clock;
  assign RandomHardware_024_io_in = {RandomHardware_024_io_in_hi,RandomHardware_024_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_025_io_in = RandomHardware_005_io_out; // @[RandomHardware.scala 50:24 RandomHardware.scala 103:18]
  assign RandomHardware_026_io_in = {wire_010,wire_039}; // @[Cat.scala 30:58]
  assign RandomHardware_027_clock = clock;
  assign RandomHardware_027_io_in = {wire_010,wire_012}; // @[Cat.scala 30:58]
endmodule
