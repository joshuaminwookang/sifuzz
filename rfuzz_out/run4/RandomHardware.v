module ShiftRegister(
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
module ReduceOrMux(
  input  [27:0] io_in,
  output [12:0] io_out
);
  wire [12:0] IN1 = io_in[27:15]; // @[Muxes.scala 110:27]
  wire [12:0] IN2 = io_in[14:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftRegister_1(
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
module ShiftLeft(
  input  [5:0] io_in,
  output [7:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRegister_2(
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
module ShiftRight(
  input  [18:0] io_in,
  output [18:0] io_out
);
  assign io_out = {{1'd0}, io_in[18:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RegE(
  input         clock,
  input  [31:0] io_in,
  output [30:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [30:0] data = io_in[31:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [29:0] reg_; // @[Memory.scala 22:18]
  wire [30:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[29:0];
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
  reg_ = _RAND_0[29:0];
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
  input  [46:0] io_in,
  output [38:0] io_out
);
  wire [27:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_1.scala 19:34]
  wire [12:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_1.scala 19:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_1.scala 20:42]
  wire [18:0] ShiftRegister_001_io_in; // @[RandomHardware_1_1.scala 20:42]
  wire [18:0] ShiftRegister_001_io_out; // @[RandomHardware_1_1.scala 20:42]
  wire [5:0] ShiftLeft_002_io_in; // @[RandomHardware_1_1.scala 21:34]
  wire [7:0] ShiftLeft_002_io_out; // @[RandomHardware_1_1.scala 21:34]
  wire  ShiftRegister_003_clock; // @[RandomHardware_1_1.scala 22:42]
  wire [12:0] ShiftRegister_003_io_in; // @[RandomHardware_1_1.scala 22:42]
  wire [12:0] ShiftRegister_003_io_out; // @[RandomHardware_1_1.scala 22:42]
  wire [18:0] ShiftRight_004_io_in; // @[RandomHardware_1_1.scala 23:34]
  wire [18:0] ShiftRight_004_io_out; // @[RandomHardware_1_1.scala 23:34]
  wire  RegE_005_clock; // @[RandomHardware_1_1.scala 24:26]
  wire [31:0] RegE_005_io_in; // @[RandomHardware_1_1.scala 24:26]
  wire [30:0] RegE_005_io_out; // @[RandomHardware_1_1.scala 24:26]
  wire [18:0] wire_003 = ShiftRegister_001_io_out; // @[RandomHardware_1_1.scala 16:24 RandomHardware_1_1.scala 31:18]
  wire [12:0] wire_004 = ShiftRegister_003_io_out; // @[RandomHardware_1_1.scala 17:24 RandomHardware_1_1.scala 34:18]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_1.scala 19:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  ShiftRegister_1 ShiftRegister_001 ( // @[RandomHardware_1_1.scala 20:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  ShiftLeft ShiftLeft_002 ( // @[RandomHardware_1_1.scala 21:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  ShiftRegister_2 ShiftRegister_003 ( // @[RandomHardware_1_1.scala 22:42]
    .clock(ShiftRegister_003_clock),
    .io_in(ShiftRegister_003_io_in),
    .io_out(ShiftRegister_003_io_out)
  );
  ShiftRight ShiftRight_004 ( // @[RandomHardware_1_1.scala 23:34]
    .io_in(ShiftRight_004_io_in),
    .io_out(ShiftRight_004_io_out)
  );
  RegE RegE_005 ( // @[RandomHardware_1_1.scala 24:26]
    .clock(RegE_005_clock),
    .io_in(RegE_005_io_in),
    .io_out(RegE_005_io_out)
  );
  assign io_out = {ShiftLeft_002_io_out,RegE_005_io_out}; // @[Cat.scala 30:58]
  assign ReduceOrMux_000_io_in = io_in[46:19]; // @[RandomHardware_1_1.scala 26:41]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = ShiftRight_004_io_out; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 36:18]
  assign ShiftLeft_002_io_in = ShiftRegister_003_io_out[5:0]; // @[RandomHardware_1_1.scala 33:46]
  assign ShiftRegister_003_clock = clock;
  assign ShiftRegister_003_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_1.scala 15:24 RandomHardware_1_1.scala 35:18]
  assign ShiftRight_004_io_in = io_in[18:0]; // @[RandomHardware_1_1.scala 27:33]
  assign RegE_005_clock = clock;
  assign RegE_005_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
endmodule
module SignExtendDouble(
  input  [4:0] io_in,
  output [9:0] io_out
);
  wire [4:0] io_out_hi = io_in[4] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module SignExtendDouble_1(
  input  [12:0] io_in,
  output [25:0] io_out
);
  wire [12:0] io_out_hi = io_in[12] ? 13'h1fff : 13'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
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
module CompareMux(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [9:0] IN1 = io_in[19:10]; // @[Muxes.scala 134:27]
  wire [7:0] IN2 = io_in[11:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [9:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[7:0]; // @[Muxes.scala 139:12]
endmodule
module Accum(
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
module ReduceOrMux_1(
  input  [31:0] io_in,
  output [10:0] io_out
);
  wire [10:0] IN1 = io_in[31:21]; // @[Muxes.scala 110:27]
  wire [10:0] IN2 = io_in[20:10]; // @[Muxes.scala 111:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
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
module RandomHardware_2_4(
  input         clock,
  input  [31:0] io_in,
  output [10:0] io_out
);
  wire [31:0] ReduceOrMux_000_io_in; // @[RandomHardware_2_4.scala 15:34]
  wire [10:0] ReduceOrMux_000_io_out; // @[RandomHardware_2_4.scala 15:34]
  wire  Reg_001_clock; // @[RandomHardware_2_4.scala 16:26]
  wire [10:0] Reg_001_io_in; // @[RandomHardware_2_4.scala 16:26]
  wire [10:0] Reg_001_io_out; // @[RandomHardware_2_4.scala 16:26]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_2_4.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_2_4.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_2_4.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_2_4.scala 18:33]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_2_4.scala 13:24 RandomHardware_2_4.scala 21:18]
endmodule
module ShiftRegister_3(
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
module Mul(
  input  [9:0] io_in,
  output [9:0] io_out
);
  wire [4:0] in1 = io_in[9:5]; // @[ArithmeticLogical.scala 47:20]
  wire [4:0] in2 = io_in[4:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_3(
  input         clock,
  input  [72:0] io_in,
  output [55:0] io_out
);
  wire [12:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_3.scala 21:42]
  wire [25:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_3.scala 21:42]
  wire [20:0] Mux2_001_io_in; // @[RandomHardware_1_3.scala 22:26]
  wire [9:0] Mux2_001_io_out; // @[RandomHardware_1_3.scala 22:26]
  wire [19:0] CompareMux_002_io_in; // @[RandomHardware_1_3.scala 23:34]
  wire [7:0] CompareMux_002_io_out; // @[RandomHardware_1_3.scala 23:34]
  wire  Accum_003_clock; // @[RandomHardware_1_3.scala 24:34]
  wire [9:0] Accum_003_io_in; // @[RandomHardware_1_3.scala 24:34]
  wire [9:0] Accum_003_io_out; // @[RandomHardware_1_3.scala 24:34]
  wire  RandomHardware_004_clock; // @[RandomHardware_1_3.scala 25:42]
  wire [31:0] RandomHardware_004_io_in; // @[RandomHardware_1_3.scala 25:42]
  wire [10:0] RandomHardware_004_io_out; // @[RandomHardware_1_3.scala 25:42]
  wire [20:0] Mux2_005_io_in; // @[RandomHardware_1_3.scala 26:26]
  wire [9:0] Mux2_005_io_out; // @[RandomHardware_1_3.scala 26:26]
  wire  ShiftRegister_006_clock; // @[RandomHardware_1_3.scala 27:42]
  wire [9:0] ShiftRegister_006_io_in; // @[RandomHardware_1_3.scala 27:42]
  wire [9:0] ShiftRegister_006_io_out; // @[RandomHardware_1_3.scala 27:42]
  wire [9:0] Mul_007_io_in; // @[RandomHardware_1_3.scala 28:26]
  wire [9:0] Mul_007_io_out; // @[RandomHardware_1_3.scala 28:26]
  wire [19:0] io_out_lo = {Accum_003_io_out,Mul_007_io_out}; // @[Cat.scala 30:58]
  wire [35:0] io_out_hi = {SignExtendDouble_000_io_out,Mux2_001_io_out}; // @[Cat.scala 30:58]
  wire [4:0] wire_001 = RandomHardware_004_io_out[9:5]; // @[RandomHardware_1_3.scala 38:47]
  wire [7:0] wire_000 = CompareMux_002_io_out; // @[RandomHardware_1_3.scala 13:24 RandomHardware_1_3.scala 37:18]
  wire [10:0] wire_002 = RandomHardware_004_io_out; // @[RandomHardware_1_3.scala 15:24 RandomHardware_1_3.scala 39:18]
  wire [9:0] wire_003 = Mux2_005_io_out; // @[RandomHardware_1_3.scala 16:24 RandomHardware_1_3.scala 40:18]
  SignExtendDouble_1 SignExtendDouble_000 ( // @[RandomHardware_1_3.scala 21:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_1_3.scala 22:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  CompareMux CompareMux_002 ( // @[RandomHardware_1_3.scala 23:34]
    .io_in(CompareMux_002_io_in),
    .io_out(CompareMux_002_io_out)
  );
  Accum Accum_003 ( // @[RandomHardware_1_3.scala 24:34]
    .clock(Accum_003_clock),
    .io_in(Accum_003_io_in),
    .io_out(Accum_003_io_out)
  );
  RandomHardware_2_4 RandomHardware_004 ( // @[RandomHardware_1_3.scala 25:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  Mux2 Mux2_005 ( // @[RandomHardware_1_3.scala 26:26]
    .io_in(Mux2_005_io_in),
    .io_out(Mux2_005_io_out)
  );
  ShiftRegister_3 ShiftRegister_006 ( // @[RandomHardware_1_3.scala 27:42]
    .clock(ShiftRegister_006_clock),
    .io_in(ShiftRegister_006_io_in),
    .io_out(ShiftRegister_006_io_out)
  );
  Mul Mul_007 ( // @[RandomHardware_1_3.scala 28:26]
    .io_in(Mul_007_io_in),
    .io_out(Mul_007_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign SignExtendDouble_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign Mux2_001_io_in = {wire_002,wire_003}; // @[Cat.scala 30:58]
  assign CompareMux_002_io_in = io_in[19:0]; // @[RandomHardware_1_3.scala 30:33]
  assign Accum_003_clock = clock;
  assign Accum_003_io_in = ShiftRegister_006_io_out; // @[RandomHardware_1_3.scala 17:24 RandomHardware_1_3.scala 36:18]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = io_in[31:0]; // @[RandomHardware_1_3.scala 31:41]
  assign Mux2_005_io_in = io_in[20:0]; // @[RandomHardware_1_3.scala 32:33]
  assign ShiftRegister_006_clock = clock;
  assign ShiftRegister_006_io_in = Mux2_005_io_out; // @[RandomHardware_1_3.scala 18:24 RandomHardware_1_3.scala 41:18]
  assign Mul_007_io_in = Mux2_005_io_out; // @[RandomHardware_1_3.scala 19:24 RandomHardware_1_3.scala 42:18]
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
module Accum_1(
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
module SignExtendDouble_2(
  input  [15:0] io_in,
  output [31:0] io_out
);
  wire [15:0] io_out_hi = io_in[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceOrMux_2(
  input  [31:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[31:17]; // @[Muxes.scala 110:27]
  wire [14:0] IN2 = io_in[16:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
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
module RandomHardware_3_1(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [29:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_3_1.scala 17:34]
  wire [29:0] Accum_000_io_in; // @[RandomHardware_3_1.scala 17:34]
  wire [29:0] Accum_000_io_out; // @[RandomHardware_3_1.scala 17:34]
  wire [15:0] SignExtendDouble_001_io_in; // @[RandomHardware_3_1.scala 18:42]
  wire [31:0] SignExtendDouble_001_io_out; // @[RandomHardware_3_1.scala 18:42]
  wire [31:0] ReduceOrMux_002_io_in; // @[RandomHardware_3_1.scala 19:34]
  wire [14:0] ReduceOrMux_002_io_out; // @[RandomHardware_3_1.scala 19:34]
  wire  ResetShiftRegister_003_clock; // @[RandomHardware_3_1.scala 20:42]
  wire  ResetShiftRegister_003_reset; // @[RandomHardware_3_1.scala 20:42]
  wire [15:0] ResetShiftRegister_003_io_in; // @[RandomHardware_3_1.scala 20:42]
  wire [14:0] ResetShiftRegister_003_io_out; // @[RandomHardware_3_1.scala 20:42]
  wire [14:0] wire_000 = ReduceOrMux_002_io_out; // @[RandomHardware_3_1.scala 13:24 RandomHardware_3_1.scala 27:18]
  wire [14:0] wire_001 = ResetShiftRegister_003_io_out; // @[RandomHardware_3_1.scala 14:24 RandomHardware_3_1.scala 29:18]
  Accum_1 Accum_000 ( // @[RandomHardware_3_1.scala 17:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_001 ( // @[RandomHardware_3_1.scala 18:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  ReduceOrMux_2 ReduceOrMux_002 ( // @[RandomHardware_3_1.scala 19:34]
    .io_in(ReduceOrMux_002_io_in),
    .io_out(ReduceOrMux_002_io_out)
  );
  ResetShiftRegister ResetShiftRegister_003 ( // @[RandomHardware_3_1.scala 20:42]
    .clock(ResetShiftRegister_003_clock),
    .reset(ResetShiftRegister_003_reset),
    .io_in(ResetShiftRegister_003_io_in),
    .io_out(ResetShiftRegister_003_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_3_1.scala 24:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign SignExtendDouble_001_io_in = io_in[31:16]; // @[RandomHardware_3_1.scala 22:41]
  assign ReduceOrMux_002_io_in = SignExtendDouble_001_io_out; // @[RandomHardware_3_1.scala 15:24 RandomHardware_3_1.scala 28:18]
  assign ResetShiftRegister_003_clock = clock;
  assign ResetShiftRegister_003_reset = reset;
  assign ResetShiftRegister_003_io_in = io_in[15:0]; // @[RandomHardware_3_1.scala 23:41]
endmodule
module RandomHardware_2_0(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [15:0] io_out
);
  wire [29:0] Sub_000_io_in; // @[RandomHardware_2_0.scala 15:26]
  wire [15:0] Sub_000_io_out; // @[RandomHardware_2_0.scala 15:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_2_0.scala 16:42]
  wire  RandomHardware_001_reset; // @[RandomHardware_2_0.scala 16:42]
  wire [31:0] RandomHardware_001_io_in; // @[RandomHardware_2_0.scala 16:42]
  wire [29:0] RandomHardware_001_io_out; // @[RandomHardware_2_0.scala 16:42]
  Sub Sub_000 ( // @[RandomHardware_2_0.scala 15:26]
    .io_in(Sub_000_io_in),
    .io_out(Sub_000_io_out)
  );
  RandomHardware_3_1 RandomHardware_001 ( // @[RandomHardware_2_0.scala 16:42]
    .clock(RandomHardware_001_clock),
    .reset(RandomHardware_001_reset),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Sub_000_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign Sub_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_reset = reset;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_2_0.scala 18:33]
endmodule
module RandomHardware_1_4(
  input         clock,
  input         reset,
  input  [21:0] io_in,
  output [12:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_4.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_4.scala 14:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_4.scala 14:42]
  wire [15:0] RandomHardware_000_io_out; // @[RandomHardware_1_4.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_4.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[12:0]; // @[RandomHardware_1_4.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{10'd0}, io_in}; // @[RandomHardware_1_4.scala 16:33]
endmodule
module ShiftLeft_1(
  input  [12:0] io_in,
  output [14:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_5(
  input  [12:0] io_in,
  output [14:0] io_out
);
  wire [12:0] ShiftLeft_000_io_in; // @[RandomHardware_1_5.scala 14:34]
  wire [14:0] ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 14:34]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_5.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module ShiftLeft_2(
  input  [13:0] io_in,
  output [16:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mod(
  input  [27:0] io_in,
  output [13:0] io_out
);
  wire [13:0] in1 = io_in[27:14]; // @[ArithmeticLogical.scala 71:20]
  wire [13:0] in2 = io_in[13:0]; // @[ArithmeticLogical.scala 72:20]
  wire [13:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[13:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_1_6(
  input  [27:0] io_in,
  output [16:0] io_out
);
  wire [13:0] ShiftLeft_000_io_in; // @[RandomHardware_1_6.scala 15:34]
  wire [16:0] ShiftLeft_000_io_out; // @[RandomHardware_1_6.scala 15:34]
  wire [27:0] Mod_001_io_in; // @[RandomHardware_1_6.scala 16:26]
  wire [13:0] Mod_001_io_out; // @[RandomHardware_1_6.scala 16:26]
  ShiftLeft_2 ShiftLeft_000 ( // @[RandomHardware_1_6.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Mod Mod_001 ( // @[RandomHardware_1_6.scala 16:26]
    .io_in(Mod_001_io_in),
    .io_out(Mod_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_6.scala 19:10]
  assign ShiftLeft_000_io_in = Mod_001_io_out; // @[RandomHardware_1_6.scala 13:24 RandomHardware_1_6.scala 21:18]
  assign Mod_001_io_in = io_in; // @[RandomHardware_1_6.scala 18:25]
endmodule
module Accum_2(
  input         clock,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ResetShiftRegister_1(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [30:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [30:0] r0; // @[Memory.scala 60:19]
  reg [30:0] r1; // @[Memory.scala 61:19]
  reg [30:0] r2; // @[Memory.scala 62:19]
  reg [30:0] r3; // @[Memory.scala 63:19]
  wire [31:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 31'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[30:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 31'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 31'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 31'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[30:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[30:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_7(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [30:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_7.scala 15:34]
  wire [31:0] Accum_000_io_in; // @[RandomHardware_1_7.scala 15:34]
  wire [31:0] Accum_000_io_out; // @[RandomHardware_1_7.scala 15:34]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_7.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_7.scala 16:42]
  wire [31:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_7.scala 16:42]
  wire [30:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_7.scala 16:42]
  Accum_2 Accum_000 ( // @[RandomHardware_1_7.scala 15:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  ResetShiftRegister_1 ResetShiftRegister_001 ( // @[RandomHardware_1_7.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = ResetShiftRegister_001_io_out; // @[RandomHardware_1_7.scala 19:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_7.scala 18:25]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = Accum_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 21:18]
endmodule
module SignExtendDouble_3(
  input  [14:0] io_in,
  output [29:0] io_out
);
  wire [14:0] io_out_hi = io_in[14] ? 15'h7fff : 15'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft_3(
  input  [34:0] io_in,
  output [37:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_2_1(
  input  [34:0] io_in,
  output [37:0] io_out
);
  wire [34:0] ShiftLeft_000_io_in; // @[RandomHardware_2_1.scala 14:34]
  wire [37:0] ShiftLeft_000_io_out; // @[RandomHardware_2_1.scala 14:34]
  ShiftLeft_3 ShiftLeft_000 ( // @[RandomHardware_2_1.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_2_1.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_2_1.scala 16:25]
endmodule
module And(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 36:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module ReduceOrMux_3(
  input  [49:0] io_in,
  output [21:0] io_out
);
  wire [21:0] IN1 = io_in[49:28]; // @[Muxes.scala 110:27]
  wire [21:0] IN2 = io_in[27:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftRight_1(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{5'd0}, io_in[11:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_3_0(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_3_0.scala 14:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 14:34]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_3_0.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_3_0.scala 16:25]
endmodule
module Accum_4(
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
module ShiftRegister_5(
  input         clock,
  input  [10:0] io_in,
  output [10:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] r0; // @[Memory.scala 78:19]
  reg [10:0] r1; // @[Memory.scala 79:19]
  reg [10:0] r2; // @[Memory.scala 80:19]
  reg [10:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[10:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[10:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2_2(
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  sel = io_in[22]; // @[Muxes.scala 16:18]
  wire [10:0] in1 = io_in[21:11]; // @[Muxes.scala 17:18]
  wire [10:0] in0 = io_in[10:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module Mul_1(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_2_5(
  input         clock,
  input         reset,
  input  [54:0] io_in,
  output [34:0] io_out
);
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_2_5.scala 20:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_2_5.scala 20:42]
  wire  RandomHardware_001_clock; // @[RandomHardware_2_5.scala 21:42]
  wire  RandomHardware_001_reset; // @[RandomHardware_2_5.scala 21:42]
  wire [31:0] RandomHardware_001_io_in; // @[RandomHardware_2_5.scala 21:42]
  wire [29:0] RandomHardware_001_io_out; // @[RandomHardware_2_5.scala 21:42]
  wire  Accum_002_clock; // @[RandomHardware_2_5.scala 22:34]
  wire [10:0] Accum_002_io_in; // @[RandomHardware_2_5.scala 22:34]
  wire [10:0] Accum_002_io_out; // @[RandomHardware_2_5.scala 22:34]
  wire [31:0] ReduceOrMux_003_io_in; // @[RandomHardware_2_5.scala 23:34]
  wire [10:0] ReduceOrMux_003_io_out; // @[RandomHardware_2_5.scala 23:34]
  wire  ShiftRegister_004_clock; // @[RandomHardware_2_5.scala 24:42]
  wire [10:0] ShiftRegister_004_io_in; // @[RandomHardware_2_5.scala 24:42]
  wire [10:0] ShiftRegister_004_io_out; // @[RandomHardware_2_5.scala 24:42]
  wire [22:0] Mux2_005_io_in; // @[RandomHardware_2_5.scala 25:26]
  wire [10:0] Mux2_005_io_out; // @[RandomHardware_2_5.scala 25:26]
  wire [11:0] Mul_006_io_in; // @[RandomHardware_2_5.scala 26:26]
  wire [11:0] Mul_006_io_out; // @[RandomHardware_2_5.scala 26:26]
  wire [22:0] io_out_hi = {RandomHardware_000_io_out,ShiftRegister_004_io_out}; // @[Cat.scala 30:58]
  wire [10:0] wire_001 = Accum_002_io_out; // @[RandomHardware_2_5.scala 14:24 RandomHardware_2_5.scala 36:18]
  wire [10:0] wire_002 = ReduceOrMux_003_io_out; // @[RandomHardware_2_5.scala 15:24 RandomHardware_2_5.scala 37:18]
  wire [21:0] _RandomHardware_001_io_in_T = {wire_001,wire_002}; // @[Cat.scala 30:58]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_5.scala 20:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_3_1 RandomHardware_001 ( // @[RandomHardware_2_5.scala 21:42]
    .clock(RandomHardware_001_clock),
    .reset(RandomHardware_001_reset),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  Accum_4 Accum_002 ( // @[RandomHardware_2_5.scala 22:34]
    .clock(Accum_002_clock),
    .io_in(Accum_002_io_in),
    .io_out(Accum_002_io_out)
  );
  ReduceOrMux_1 ReduceOrMux_003 ( // @[RandomHardware_2_5.scala 23:34]
    .io_in(ReduceOrMux_003_io_in),
    .io_out(ReduceOrMux_003_io_out)
  );
  ShiftRegister_5 ShiftRegister_004 ( // @[RandomHardware_2_5.scala 24:42]
    .clock(ShiftRegister_004_clock),
    .io_in(ShiftRegister_004_io_in),
    .io_out(ShiftRegister_004_io_out)
  );
  Mux2_2 Mux2_005 ( // @[RandomHardware_2_5.scala 25:26]
    .io_in(Mux2_005_io_in),
    .io_out(Mux2_005_io_out)
  );
  Mul_1 Mul_006 ( // @[RandomHardware_2_5.scala 26:26]
    .io_in(Mul_006_io_in),
    .io_out(Mul_006_io_out)
  );
  assign io_out = {io_out_hi,Mul_006_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = RandomHardware_001_io_out[11:0]; // @[RandomHardware_2_5.scala 13:24 RandomHardware_2_5.scala 33:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_reset = reset;
  assign RandomHardware_001_io_in = {{10'd0}, _RandomHardware_001_io_in_T}; // @[Cat.scala 30:58]
  assign Accum_002_clock = clock;
  assign Accum_002_io_in = Mux2_005_io_out; // @[RandomHardware_2_5.scala 16:24 RandomHardware_2_5.scala 39:18]
  assign ReduceOrMux_003_io_in = io_in[31:0]; // @[RandomHardware_2_5.scala 28:41]
  assign ShiftRegister_004_clock = clock;
  assign ShiftRegister_004_io_in = ReduceOrMux_003_io_out; // @[RandomHardware_2_5.scala 17:24 RandomHardware_2_5.scala 38:18]
  assign Mux2_005_io_in = io_in[22:0]; // @[RandomHardware_2_5.scala 29:33]
  assign Mul_006_io_in = RandomHardware_001_io_out[11:0]; // @[RandomHardware_2_5.scala 18:24 RandomHardware_2_5.scala 34:18]
endmodule
module Reg_1(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[14:0];
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
  input         reset,
  input  [50:0] io_in,
  output [9:0]  io_out
);
  wire [14:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_8.scala 22:42]
  wire [29:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_8.scala 22:42]
  wire [34:0] RandomHardware_001_io_in; // @[RandomHardware_1_8.scala 23:42]
  wire [37:0] RandomHardware_001_io_out; // @[RandomHardware_1_8.scala 23:42]
  wire  ShiftRegister_002_clock; // @[RandomHardware_1_8.scala 24:42]
  wire [9:0] ShiftRegister_002_io_in; // @[RandomHardware_1_8.scala 24:42]
  wire [9:0] ShiftRegister_002_io_out; // @[RandomHardware_1_8.scala 24:42]
  wire [19:0] And_003_io_in; // @[RandomHardware_1_8.scala 25:26]
  wire [9:0] And_003_io_out; // @[RandomHardware_1_8.scala 25:26]
  wire [49:0] ReduceOrMux_004_io_in; // @[RandomHardware_1_8.scala 26:34]
  wire [21:0] ReduceOrMux_004_io_out; // @[RandomHardware_1_8.scala 26:34]
  wire  RandomHardware_005_clock; // @[RandomHardware_1_8.scala 27:42]
  wire  RandomHardware_005_reset; // @[RandomHardware_1_8.scala 27:42]
  wire [54:0] RandomHardware_005_io_in; // @[RandomHardware_1_8.scala 27:42]
  wire [34:0] RandomHardware_005_io_out; // @[RandomHardware_1_8.scala 27:42]
  wire  ResetShiftRegister_006_clock; // @[RandomHardware_1_8.scala 28:42]
  wire  ResetShiftRegister_006_reset; // @[RandomHardware_1_8.scala 28:42]
  wire [15:0] ResetShiftRegister_006_io_in; // @[RandomHardware_1_8.scala 28:42]
  wire [14:0] ResetShiftRegister_006_io_out; // @[RandomHardware_1_8.scala 28:42]
  wire  Reg_007_clock; // @[RandomHardware_1_8.scala 29:26]
  wire [14:0] Reg_007_io_in; // @[RandomHardware_1_8.scala 29:26]
  wire [14:0] Reg_007_io_out; // @[RandomHardware_1_8.scala 29:26]
  wire [34:0] wire_003 = RandomHardware_005_io_out; // @[RandomHardware_1_8.scala 16:24 RandomHardware_1_8.scala 43:18]
  wire [14:0] wire_004 = ResetShiftRegister_006_io_out; // @[RandomHardware_1_8.scala 17:24 RandomHardware_1_8.scala 45:18]
  wire [29:0] wire_005 = SignExtendDouble_000_io_out; // @[RandomHardware_1_8.scala 18:24 RandomHardware_1_8.scala 37:18]
  wire [9:0] wire_006 = ShiftRegister_002_io_out; // @[RandomHardware_1_8.scala 19:24 RandomHardware_1_8.scala 39:18]
  wire [39:0] RandomHardware_005_io_in_hi = {wire_005,wire_006}; // @[Cat.scala 30:58]
  wire [14:0] wire_007 = Reg_007_io_out; // @[RandomHardware_1_8.scala 20:24 RandomHardware_1_8.scala 47:18]
  SignExtendDouble_3 SignExtendDouble_000 ( // @[RandomHardware_1_8.scala 22:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_8.scala 23:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ShiftRegister_3 ShiftRegister_002 ( // @[RandomHardware_1_8.scala 24:42]
    .clock(ShiftRegister_002_clock),
    .io_in(ShiftRegister_002_io_in),
    .io_out(ShiftRegister_002_io_out)
  );
  And And_003 ( // @[RandomHardware_1_8.scala 25:26]
    .io_in(And_003_io_in),
    .io_out(And_003_io_out)
  );
  ReduceOrMux_3 ReduceOrMux_004 ( // @[RandomHardware_1_8.scala 26:34]
    .io_in(ReduceOrMux_004_io_in),
    .io_out(ReduceOrMux_004_io_out)
  );
  RandomHardware_2_5 RandomHardware_005 ( // @[RandomHardware_1_8.scala 27:42]
    .clock(RandomHardware_005_clock),
    .reset(RandomHardware_005_reset),
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  ResetShiftRegister ResetShiftRegister_006 ( // @[RandomHardware_1_8.scala 28:42]
    .clock(ResetShiftRegister_006_clock),
    .reset(ResetShiftRegister_006_reset),
    .io_in(ResetShiftRegister_006_io_in),
    .io_out(ResetShiftRegister_006_io_out)
  );
  Reg_1 Reg_007 ( // @[RandomHardware_1_8.scala 29:26]
    .clock(Reg_007_clock),
    .io_in(Reg_007_io_in),
    .io_out(Reg_007_io_out)
  );
  assign io_out = RandomHardware_001_io_out[9:0]; // @[RandomHardware_1_8.scala 34:10]
  assign SignExtendDouble_000_io_in = Reg_007_io_out; // @[RandomHardware_1_8.scala 13:24 RandomHardware_1_8.scala 46:18]
  assign RandomHardware_001_io_in = {{13'd0}, ReduceOrMux_004_io_out}; // @[RandomHardware_1_8.scala 14:24 RandomHardware_1_8.scala 41:18]
  assign ShiftRegister_002_clock = clock;
  assign ShiftRegister_002_io_in = And_003_io_out; // @[RandomHardware_1_8.scala 15:24 RandomHardware_1_8.scala 44:18]
  assign And_003_io_in = io_in[50:31]; // @[RandomHardware_1_8.scala 31:33]
  assign ReduceOrMux_004_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
  assign RandomHardware_005_clock = clock;
  assign RandomHardware_005_reset = reset;
  assign RandomHardware_005_io_in = {RandomHardware_005_io_in_hi,wire_007}; // @[Cat.scala 30:58]
  assign ResetShiftRegister_006_clock = clock;
  assign ResetShiftRegister_006_reset = reset;
  assign ResetShiftRegister_006_io_in = io_in[15:0]; // @[RandomHardware_1_8.scala 32:41]
  assign Reg_007_clock = clock;
  assign Reg_007_io_in = io_in[50:36]; // @[RandomHardware_1_8.scala 33:33]
endmodule
module ShiftLeft_4(
  input  [6:0] io_in,
  output [9:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module And_1(
  input  [55:0] io_in,
  output [27:0] io_out
);
  wire [27:0] in1 = io_in[55:28]; // @[ArithmeticLogical.scala 36:20]
  wire [27:0] in2 = io_in[27:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module ShiftRight_2(
  input  [55:0] io_in,
  output [55:0] io_out
);
  assign io_out = {{4'd0}, io_in[55:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_10(
  input  [55:0] io_in,
  output [27:0] io_out
);
  wire [55:0] And_000_io_in; // @[RandomHardware_1_10.scala 15:26]
  wire [27:0] And_000_io_out; // @[RandomHardware_1_10.scala 15:26]
  wire [55:0] ShiftRight_001_io_in; // @[RandomHardware_1_10.scala 16:34]
  wire [55:0] ShiftRight_001_io_out; // @[RandomHardware_1_10.scala 16:34]
  And_1 And_000 ( // @[RandomHardware_1_10.scala 15:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  ShiftRight_2 ShiftRight_001 ( // @[RandomHardware_1_10.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = And_000_io_out; // @[RandomHardware_1_10.scala 19:10]
  assign And_000_io_in = ShiftRight_001_io_out; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  assign ShiftRight_001_io_in = io_in; // @[RandomHardware_1_10.scala 18:25]
endmodule
module ReduceXorMux(
  input  [29:0] io_in,
  output [13:0] io_out
);
  wire [13:0] IN1 = io_in[29:16]; // @[Muxes.scala 122:27]
  wire [13:0] IN2 = io_in[15:2]; // @[Muxes.scala 123:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_11(
  input  [29:0] io_in,
  output [13:0] io_out
);
  wire [29:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_11.scala 14:34]
  wire [13:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_11.scala 14:34]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_11.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_11.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_11.scala 16:33]
endmodule
module SignExtendDouble_5(
  input  [6:0]  io_in,
  output [13:0] io_out
);
  wire [6:0] io_out_hi = io_in[6] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Accum_5(
  input        clock,
  input  [6:0] io_in,
  output [6:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftLeft_5(
  input  [6:0] io_in,
  output [7:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceAndMux(
  input  [31:0] io_in,
  output [13:0] io_out
);
  wire [13:0] IN1 = io_in[29:16]; // @[Muxes.scala 98:27]
  wire [13:0] IN2 = io_in[15:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ReduceAndMux_1(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[19:12]; // @[Muxes.scala 98:27]
  wire [7:0] IN2 = io_in[11:4]; // @[Muxes.scala 99:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ReduceAndMux_2(
  input  [21:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[17:11]; // @[Muxes.scala 98:27]
  wire [6:0] IN2 = io_in[10:4]; // @[Muxes.scala 99:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_2_3(
  input  [55:0] io_in,
  output [6:0]  io_out
);
  wire [31:0] ReduceAndMux_000_io_in; // @[RandomHardware_2_3.scala 16:34]
  wire [13:0] ReduceAndMux_000_io_out; // @[RandomHardware_2_3.scala 16:34]
  wire [23:0] ReduceAndMux_001_io_in; // @[RandomHardware_2_3.scala 17:34]
  wire [7:0] ReduceAndMux_001_io_out; // @[RandomHardware_2_3.scala 17:34]
  wire [21:0] ReduceAndMux_002_io_in; // @[RandomHardware_2_3.scala 18:34]
  wire [6:0] ReduceAndMux_002_io_out; // @[RandomHardware_2_3.scala 18:34]
  wire [13:0] wire_000 = ReduceAndMux_000_io_out; // @[RandomHardware_2_3.scala 13:24 RandomHardware_2_3.scala 24:18]
  wire [7:0] wire_001 = ReduceAndMux_001_io_out; // @[RandomHardware_2_3.scala 14:24 RandomHardware_2_3.scala 25:18]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_2_3.scala 16:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  ReduceAndMux_1 ReduceAndMux_001 ( // @[RandomHardware_2_3.scala 17:34]
    .io_in(ReduceAndMux_001_io_in),
    .io_out(ReduceAndMux_001_io_out)
  );
  ReduceAndMux_2 ReduceAndMux_002 ( // @[RandomHardware_2_3.scala 18:34]
    .io_in(ReduceAndMux_002_io_in),
    .io_out(ReduceAndMux_002_io_out)
  );
  assign io_out = ReduceAndMux_002_io_out; // @[RandomHardware_2_3.scala 22:10]
  assign ReduceAndMux_000_io_in = io_in[55:24]; // @[RandomHardware_2_3.scala 20:41]
  assign ReduceAndMux_001_io_in = io_in[23:0]; // @[RandomHardware_2_3.scala 21:41]
  assign ReduceAndMux_002_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_12(
  input         clock,
  input  [55:0] io_in,
  output [21:0] io_out
);
  wire [6:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_12.scala 17:42]
  wire [13:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_12.scala 17:42]
  wire  Accum_001_clock; // @[RandomHardware_1_12.scala 18:34]
  wire [6:0] Accum_001_io_in; // @[RandomHardware_1_12.scala 18:34]
  wire [6:0] Accum_001_io_out; // @[RandomHardware_1_12.scala 18:34]
  wire [6:0] ShiftLeft_002_io_in; // @[RandomHardware_1_12.scala 19:34]
  wire [7:0] ShiftLeft_002_io_out; // @[RandomHardware_1_12.scala 19:34]
  wire [55:0] RandomHardware_003_io_in; // @[RandomHardware_1_12.scala 20:42]
  wire [6:0] RandomHardware_003_io_out; // @[RandomHardware_1_12.scala 20:42]
  SignExtendDouble_5 SignExtendDouble_000 ( // @[RandomHardware_1_12.scala 17:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  Accum_5 Accum_001 ( // @[RandomHardware_1_12.scala 18:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  ShiftLeft_5 ShiftLeft_002 ( // @[RandomHardware_1_12.scala 19:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  RandomHardware_2_3 RandomHardware_003 ( // @[RandomHardware_1_12.scala 20:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  assign io_out = {SignExtendDouble_000_io_out,ShiftLeft_002_io_out}; // @[Cat.scala 30:58]
  assign SignExtendDouble_000_io_in = RandomHardware_003_io_out; // @[RandomHardware_1_12.scala 14:24 RandomHardware_1_12.scala 27:18]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = RandomHardware_003_io_out; // @[RandomHardware_1_12.scala 15:24 RandomHardware_1_12.scala 28:18]
  assign ShiftLeft_002_io_in = Accum_001_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 26:18]
  assign RandomHardware_003_io_in = io_in; // @[RandomHardware_1_12.scala 22:33]
endmodule
module ShiftLeft_6(
  input  [12:0] io_in,
  output [16:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_13(
  input  [12:0] io_in,
  output [16:0] io_out
);
  wire [12:0] ShiftLeft_000_io_in; // @[RandomHardware_1_13.scala 14:34]
  wire [16:0] ShiftLeft_000_io_out; // @[RandomHardware_1_13.scala 14:34]
  ShiftLeft_6 ShiftLeft_000 ( // @[RandomHardware_1_13.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:25]
endmodule
module ShiftLeft_7(
  input  [54:0] io_in,
  output [58:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_8(
  input  [41:0] io_in,
  output [43:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_14(
  input         clock,
  input         reset,
  input  [73:0] io_in,
  output [58:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_14.scala 16:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_14.scala 16:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_14.scala 16:42]
  wire [15:0] RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 16:42]
  wire [54:0] ShiftLeft_001_io_in; // @[RandomHardware_1_14.scala 17:34]
  wire [58:0] ShiftLeft_001_io_out; // @[RandomHardware_1_14.scala 17:34]
  wire [41:0] ShiftLeft_002_io_in; // @[RandomHardware_1_14.scala 18:34]
  wire [43:0] ShiftLeft_002_io_out; // @[RandomHardware_1_14.scala 18:34]
  wire [10:0] wire_000 = RandomHardware_000_io_out[10:0]; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 24:18]
  wire [43:0] wire_001 = ShiftLeft_002_io_out; // @[RandomHardware_1_14.scala 14:24 RandomHardware_1_14.scala 25:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_14.scala 16:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftLeft_7 ShiftLeft_001 ( // @[RandomHardware_1_14.scala 17:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  ShiftLeft_8 ShiftLeft_002 ( // @[RandomHardware_1_14.scala 18:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_14.scala 22:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in[73:42]; // @[RandomHardware_1_14.scala 20:41]
  assign ShiftLeft_001_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign ShiftLeft_002_io_in = io_in[73:32]; // @[RandomHardware_1_14.scala 21:33]
endmodule
module ShiftLeft_9(
  input  [48:0] io_in,
  output [50:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module Mux2_3(
  input  [50:0] io_in,
  output [24:0] io_out
);
  wire  sel = io_in[50]; // @[Muxes.scala 16:18]
  wire [24:0] in1 = io_in[49:25]; // @[Muxes.scala 17:18]
  wire [24:0] in0 = io_in[24:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_15(
  input  [48:0] io_in,
  output [24:0] io_out
);
  wire [48:0] ShiftLeft_000_io_in; // @[RandomHardware_1_15.scala 15:34]
  wire [50:0] ShiftLeft_000_io_out; // @[RandomHardware_1_15.scala 15:34]
  wire [50:0] Mux2_001_io_in; // @[RandomHardware_1_15.scala 16:26]
  wire [24:0] Mux2_001_io_out; // @[RandomHardware_1_15.scala 16:26]
  ShiftLeft_9 ShiftLeft_000 ( // @[RandomHardware_1_15.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Mux2_3 Mux2_001 ( // @[RandomHardware_1_15.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Mux2_001_io_out; // @[RandomHardware_1_15.scala 19:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_15.scala 18:25]
  assign Mux2_001_io_in = ShiftLeft_000_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 21:18]
endmodule
module And_2(
  input  [39:0] io_in,
  output [19:0] io_out
);
  wire [19:0] in1 = io_in[39:20]; // @[ArithmeticLogical.scala 36:20]
  wire [19:0] in2 = io_in[19:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module ShiftRegister_6(
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
module ResetShiftRegister_5(
  input         clock,
  input         reset,
  input  [18:0] io_in,
  output [17:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [17:0] r0; // @[Memory.scala 60:19]
  reg [17:0] r1; // @[Memory.scala 61:19]
  reg [17:0] r2; // @[Memory.scala 62:19]
  reg [17:0] r3; // @[Memory.scala 63:19]
  wire [18:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 18'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[17:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 18'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 18'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 18'h0; // @[Memory.scala 63:19]
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
module Mux2_4(
  input  [38:0] io_in,
  output [18:0] io_out
);
  wire  sel = io_in[38]; // @[Muxes.scala 16:18]
  wire [18:0] in1 = io_in[37:19]; // @[Muxes.scala 17:18]
  wire [18:0] in0 = io_in[18:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_2_2(
  input         clock,
  input         reset,
  input  [38:0] io_in,
  output [17:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_2_2.scala 15:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_2_2.scala 15:42]
  wire [18:0] ResetShiftRegister_000_io_in; // @[RandomHardware_2_2.scala 15:42]
  wire [17:0] ResetShiftRegister_000_io_out; // @[RandomHardware_2_2.scala 15:42]
  wire [38:0] Mux2_001_io_in; // @[RandomHardware_2_2.scala 16:26]
  wire [18:0] Mux2_001_io_out; // @[RandomHardware_2_2.scala 16:26]
  ResetShiftRegister_5 ResetShiftRegister_000 ( // @[RandomHardware_2_2.scala 15:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  Mux2_4 Mux2_001 ( // @[RandomHardware_2_2.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_2_2.scala 19:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = Mux2_001_io_out; // @[RandomHardware_2_2.scala 13:24 RandomHardware_2_2.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_2_2.scala 18:25]
endmodule
module RegE_1(
  input         clock,
  input  [18:0] io_in,
  output [17:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [17:0] data = io_in[18:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [16:0] reg_; // @[Memory.scala 22:18]
  wire [17:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[16:0];
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
  reg_ = _RAND_0[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegE_2(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [18:0] data = io_in[19:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [17:0] reg_; // @[Memory.scala 22:18]
  wire [18:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[17:0];
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
  reg_ = _RAND_0[17:0];
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
  input         reset,
  input  [39:0] io_in,
  output [37:0] io_out
);
  wire [39:0] And_000_io_in; // @[RandomHardware_1_16.scala 20:26]
  wire [19:0] And_000_io_out; // @[RandomHardware_1_16.scala 20:26]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_16.scala 21:42]
  wire [19:0] ShiftRegister_001_io_in; // @[RandomHardware_1_16.scala 21:42]
  wire [19:0] ShiftRegister_001_io_out; // @[RandomHardware_1_16.scala 21:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_16.scala 22:42]
  wire  RandomHardware_002_reset; // @[RandomHardware_1_16.scala 22:42]
  wire [38:0] RandomHardware_002_io_in; // @[RandomHardware_1_16.scala 22:42]
  wire [17:0] RandomHardware_002_io_out; // @[RandomHardware_1_16.scala 22:42]
  wire  RegE_003_clock; // @[RandomHardware_1_16.scala 23:26]
  wire [18:0] RegE_003_io_in; // @[RandomHardware_1_16.scala 23:26]
  wire [17:0] RegE_003_io_out; // @[RandomHardware_1_16.scala 23:26]
  wire  RegE_004_clock; // @[RandomHardware_1_16.scala 24:26]
  wire [19:0] RegE_004_io_in; // @[RandomHardware_1_16.scala 24:26]
  wire [18:0] RegE_004_io_out; // @[RandomHardware_1_16.scala 24:26]
  wire [19:0] wire_000 = And_000_io_out; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 35:18]
  wire [1:0] wire_001 = RandomHardware_002_io_out[1:0]; // @[RandomHardware_1_16.scala 14:24 RandomHardware_1_16.scala 30:18]
  wire [18:0] wire_002 = RegE_004_io_out; // @[RandomHardware_1_16.scala 15:24 RandomHardware_1_16.scala 32:18]
  wire [40:0] _ShiftRegister_001_io_in_T = {wire_000,wire_001,wire_002}; // @[Cat.scala 30:58]
  And_2 And_000 ( // @[RandomHardware_1_16.scala 20:26]
    .io_in(And_000_io_in),
    .io_out(And_000_io_out)
  );
  ShiftRegister_6 ShiftRegister_001 ( // @[RandomHardware_1_16.scala 21:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_16.scala 22:42]
    .clock(RandomHardware_002_clock),
    .reset(RandomHardware_002_reset),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RegE_1 RegE_003 ( // @[RandomHardware_1_16.scala 23:26]
    .clock(RegE_003_clock),
    .io_in(RegE_003_io_in),
    .io_out(RegE_003_io_out)
  );
  RegE_2 RegE_004 ( // @[RandomHardware_1_16.scala 24:26]
    .clock(RegE_004_clock),
    .io_in(RegE_004_io_in),
    .io_out(RegE_004_io_out)
  );
  assign io_out = {ShiftRegister_001_io_out,RegE_003_io_out}; // @[Cat.scala 30:58]
  assign And_000_io_in = io_in; // @[RandomHardware_1_16.scala 26:25]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = _ShiftRegister_001_io_in_T[19:0]; // @[RandomHardware_1_16.scala 37:33]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_reset = reset;
  assign RandomHardware_002_io_in = {{20'd0}, RegE_004_io_out}; // @[RandomHardware_1_16.scala 16:24 RandomHardware_1_16.scala 33:18]
  assign RegE_003_clock = clock;
  assign RegE_003_io_in = RegE_004_io_out; // @[RandomHardware_1_16.scala 17:24 RandomHardware_1_16.scala 34:18]
  assign RegE_004_clock = clock;
  assign RegE_004_io_in = And_000_io_out; // @[RandomHardware_1_16.scala 18:24 RandomHardware_1_16.scala 36:18]
endmodule
module Mux8(
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
module Reg_2(
  input        clock,
  input  [2:0] io_in,
  output [2:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[2:0];
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
  input  [26:0] io_in,
  output [2:0]  io_out
);
  wire [26:0] Mux8_000_io_in; // @[RandomHardware_1_17.scala 15:26]
  wire [2:0] Mux8_000_io_out; // @[RandomHardware_1_17.scala 15:26]
  wire  Reg_001_clock; // @[RandomHardware_1_17.scala 16:26]
  wire [2:0] Reg_001_io_in; // @[RandomHardware_1_17.scala 16:26]
  wire [2:0] Reg_001_io_out; // @[RandomHardware_1_17.scala 16:26]
  Mux8 Mux8_000 ( // @[RandomHardware_1_17.scala 15:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  Reg_2 Reg_001 ( // @[RandomHardware_1_17.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_17.scala 19:10]
  assign Mux8_000_io_in = io_in; // @[RandomHardware_1_17.scala 18:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Mux8_000_io_out; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 21:18]
endmodule
module RandomHardware_1_18(
  input         clock,
  input         reset,
  input  [35:0] io_in,
  output [26:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_18.scala 15:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_18.scala 15:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_18.scala 15:42]
  wire [15:0] RandomHardware_000_io_out; // @[RandomHardware_1_18.scala 15:42]
  wire [34:0] RandomHardware_001_io_in; // @[RandomHardware_1_18.scala 16:42]
  wire [37:0] RandomHardware_001_io_out; // @[RandomHardware_1_18.scala 16:42]
  wire [41:0] wire_000 = {{4'd0}, RandomHardware_001_io_out}; // @[RandomHardware_1_18.scala 13:24 RandomHardware_1_18.scala 21:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_18.scala 15:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_18.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = {{11'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_18.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = wire_000[31:0]; // @[RandomHardware_1_18.scala 22:33]
  assign RandomHardware_001_io_in = io_in[34:0]; // @[RandomHardware_1_18.scala 18:33]
endmodule
module Accum_8(
  input         clock,
  input  [20:0] io_in,
  output [20:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [20:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[20:0];
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
  input  [20:0] io_in,
  output [20:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_19.scala 14:34]
  wire [20:0] Accum_000_io_in; // @[RandomHardware_1_19.scala 14:34]
  wire [20:0] Accum_000_io_out; // @[RandomHardware_1_19.scala 14:34]
  Accum_8 Accum_000 ( // @[RandomHardware_1_19.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_19.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_19.scala 16:25]
endmodule
module SignExtendDouble_9(
  input  [27:0] io_in,
  output [55:0] io_out
);
  wire [27:0] io_out_hi = io_in[27] ? 28'hfffffff : 28'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_20(
  input         clock,
  input         reset,
  input  [38:0] io_in,
  output [55:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_20.scala 15:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_20.scala 15:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_20.scala 15:42]
  wire [15:0] RandomHardware_000_io_out; // @[RandomHardware_1_20.scala 15:42]
  wire [27:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_20.scala 16:42]
  wire [55:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_20.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_20.scala 15:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  SignExtendDouble_9 SignExtendDouble_001 ( // @[RandomHardware_1_20.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_20.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in[31:0]; // @[RandomHardware_1_20.scala 18:33]
  assign SignExtendDouble_001_io_in = {{12'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_20.scala 13:24 RandomHardware_1_20.scala 21:18]
endmodule
module ResetShiftRegister_8(
  input         clock,
  input         reset,
  input  [30:0] io_in,
  output [29:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [29:0] r0; // @[Memory.scala 60:19]
  reg [29:0] r1; // @[Memory.scala 61:19]
  reg [29:0] r2; // @[Memory.scala 62:19]
  reg [29:0] r3; // @[Memory.scala 63:19]
  wire [30:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 30'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[29:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 30'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 30'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 30'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[29:0];
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
  input         reset,
  input  [30:0] io_in,
  output [29:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_21.scala 14:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_21.scala 14:42]
  wire [30:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_21.scala 14:42]
  wire [29:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 14:42]
  ResetShiftRegister_8 ResetShiftRegister_000 ( // @[RandomHardware_1_21.scala 14:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 17:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_21.scala 16:33]
endmodule
module CompareMux_1(
  input  [17:0] io_in,
  output [6:0]  io_out
);
  wire [8:0] IN1 = io_in[17:9]; // @[Muxes.scala 134:27]
  wire [6:0] IN2 = io_in[10:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [8:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[6:0]; // @[Muxes.scala 139:12]
endmodule
module ResetShiftRegister_9(
  input         clock,
  input         reset,
  input  [17:0] io_in,
  output [16:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [16:0] r0; // @[Memory.scala 60:19]
  reg [16:0] r1; // @[Memory.scala 61:19]
  reg [16:0] r2; // @[Memory.scala 62:19]
  reg [16:0] r3; // @[Memory.scala 63:19]
  wire [17:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 17'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[16:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 17'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 17'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 17'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[16:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[16:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[16:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[16:0];
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
  input  [38:0] io_in,
  output [6:0]  io_out
);
  wire [17:0] CompareMux_000_io_in; // @[RandomHardware_1_22.scala 17:34]
  wire [6:0] CompareMux_000_io_out; // @[RandomHardware_1_22.scala 17:34]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_22.scala 18:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_22.scala 18:42]
  wire [17:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_22.scala 18:42]
  wire [16:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_22.scala 18:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_22.scala 19:42]
  wire  RandomHardware_002_reset; // @[RandomHardware_1_22.scala 19:42]
  wire [38:0] RandomHardware_002_io_in; // @[RandomHardware_1_22.scala 19:42]
  wire [17:0] RandomHardware_002_io_out; // @[RandomHardware_1_22.scala 19:42]
  wire [16:0] wire_000 = ResetShiftRegister_001_io_out; // @[RandomHardware_1_22.scala 13:24 RandomHardware_1_22.scala 25:18]
  wire [17:0] wire_001 = RandomHardware_002_io_out; // @[RandomHardware_1_22.scala 14:24 RandomHardware_1_22.scala 26:18]
  wire [34:0] _CompareMux_000_io_in_T = {wire_000,wire_001}; // @[Cat.scala 30:58]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_1_22.scala 17:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ResetShiftRegister_9 ResetShiftRegister_001 ( // @[RandomHardware_1_22.scala 18:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_22.scala 19:42]
    .clock(RandomHardware_002_clock),
    .reset(RandomHardware_002_reset),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_22.scala 22:10]
  assign CompareMux_000_io_in = _CompareMux_000_io_in_T[17:0]; // @[RandomHardware_1_22.scala 28:25]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_22.scala 15:24 RandomHardware_1_22.scala 27:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_reset = reset;
  assign RandomHardware_002_io_in = io_in; // @[RandomHardware_1_22.scala 21:33]
endmodule
module SignExtendDouble_10(
  input  [8:0]  io_in,
  output [17:0] io_out
);
  wire [8:0] io_out_hi = io_in[8] ? 9'h1ff : 9'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceOrMux_9(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[23:15]; // @[Muxes.scala 110:27]
  wire [8:0] IN2 = io_in[14:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_23(
  input  [23:0] io_in,
  output [17:0] io_out
);
  wire [8:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_23.scala 15:42]
  wire [17:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_23.scala 15:42]
  wire [23:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_23.scala 16:34]
  wire [8:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_23.scala 16:34]
  SignExtendDouble_10 SignExtendDouble_000 ( // @[RandomHardware_1_23.scala 15:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  ReduceOrMux_9 ReduceOrMux_001 ( // @[RandomHardware_1_23.scala 16:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_23.scala 19:10]
  assign SignExtendDouble_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_23.scala 13:24 RandomHardware_1_23.scala 21:18]
  assign ReduceOrMux_001_io_in = io_in; // @[RandomHardware_1_23.scala 18:33]
endmodule
module CompareMux_2(
  input  [21:0] io_in,
  output [8:0]  io_out
);
  wire [10:0] IN1 = io_in[21:11]; // @[Muxes.scala 134:27]
  wire [8:0] IN2 = io_in[12:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [10:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[8:0]; // @[Muxes.scala 139:12]
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
module RandomHardware_1_24(
  input         clock,
  input  [21:0] io_in,
  output [8:0]  io_out
);
  wire [21:0] CompareMux_000_io_in; // @[RandomHardware_1_24.scala 15:34]
  wire [8:0] CompareMux_000_io_out; // @[RandomHardware_1_24.scala 15:34]
  wire  Reg_001_clock; // @[RandomHardware_1_24.scala 16:26]
  wire [8:0] Reg_001_io_in; // @[RandomHardware_1_24.scala 16:26]
  wire [8:0] Reg_001_io_out; // @[RandomHardware_1_24.scala 16:26]
  CompareMux_2 CompareMux_000 ( // @[RandomHardware_1_24.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  Reg_3 Reg_001 ( // @[RandomHardware_1_24.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_24.scala 19:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_24.scala 18:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = CompareMux_000_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 21:18]
endmodule
module Accum_11(
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
module RandomHardware_1_25(
  input         clock,
  input         reset,
  input  [50:0] io_in,
  output [37:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_25.scala 16:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_25.scala 16:42]
  wire [31:0] RandomHardware_000_io_in; // @[RandomHardware_1_25.scala 16:42]
  wire [15:0] RandomHardware_000_io_out; // @[RandomHardware_1_25.scala 16:42]
  wire [34:0] RandomHardware_001_io_in; // @[RandomHardware_1_25.scala 17:42]
  wire [37:0] RandomHardware_001_io_out; // @[RandomHardware_1_25.scala 17:42]
  wire  Accum_002_clock; // @[RandomHardware_1_25.scala 18:34]
  wire [18:0] Accum_002_io_in; // @[RandomHardware_1_25.scala 18:34]
  wire [18:0] Accum_002_io_out; // @[RandomHardware_1_25.scala 18:34]
  wire [15:0] wire_000 = RandomHardware_000_io_out; // @[RandomHardware_1_25.scala 13:24 RandomHardware_1_25.scala 24:18]
  wire [18:0] wire_001 = Accum_002_io_out; // @[RandomHardware_1_25.scala 14:24 RandomHardware_1_25.scala 25:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_25.scala 16:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_25.scala 17:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  Accum_11 Accum_002 ( // @[RandomHardware_1_25.scala 18:34]
    .clock(Accum_002_clock),
    .io_in(Accum_002_io_in),
    .io_out(Accum_002_io_out)
  );
  assign io_out = RandomHardware_001_io_out; // @[RandomHardware_1_25.scala 22:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in[50:19]; // @[RandomHardware_1_25.scala 20:41]
  assign RandomHardware_001_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign Accum_002_clock = clock;
  assign Accum_002_io_in = io_in[50:32]; // @[RandomHardware_1_25.scala 21:33]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [110:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware.scala 56:42]
  wire [4:0] ShiftRegister_000_io_in; // @[RandomHardware.scala 56:42]
  wire [4:0] ShiftRegister_000_io_out; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 57:42]
  wire [46:0] RandomHardware_001_io_in; // @[RandomHardware.scala 57:42]
  wire [38:0] RandomHardware_001_io_out; // @[RandomHardware.scala 57:42]
  wire [4:0] SignExtendDouble_002_io_in; // @[RandomHardware.scala 58:42]
  wire [9:0] SignExtendDouble_002_io_out; // @[RandomHardware.scala 58:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 59:42]
  wire [72:0] RandomHardware_003_io_in; // @[RandomHardware.scala 59:42]
  wire [55:0] RandomHardware_003_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_004_reset; // @[RandomHardware.scala 60:42]
  wire [21:0] RandomHardware_004_io_in; // @[RandomHardware.scala 60:42]
  wire [12:0] RandomHardware_004_io_out; // @[RandomHardware.scala 60:42]
  wire [12:0] RandomHardware_005_io_in; // @[RandomHardware.scala 61:42]
  wire [14:0] RandomHardware_005_io_out; // @[RandomHardware.scala 61:42]
  wire [27:0] RandomHardware_006_io_in; // @[RandomHardware.scala 62:42]
  wire [16:0] RandomHardware_006_io_out; // @[RandomHardware.scala 62:42]
  wire  RandomHardware_007_clock; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_007_reset; // @[RandomHardware.scala 63:42]
  wire [31:0] RandomHardware_007_io_in; // @[RandomHardware.scala 63:42]
  wire [30:0] RandomHardware_007_io_out; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_008_clock; // @[RandomHardware.scala 64:42]
  wire  RandomHardware_008_reset; // @[RandomHardware.scala 64:42]
  wire [50:0] RandomHardware_008_io_in; // @[RandomHardware.scala 64:42]
  wire [9:0] RandomHardware_008_io_out; // @[RandomHardware.scala 64:42]
  wire [6:0] ShiftLeft_009_io_in; // @[RandomHardware.scala 65:34]
  wire [9:0] ShiftLeft_009_io_out; // @[RandomHardware.scala 65:34]
  wire [55:0] RandomHardware_010_io_in; // @[RandomHardware.scala 66:42]
  wire [27:0] RandomHardware_010_io_out; // @[RandomHardware.scala 66:42]
  wire [29:0] RandomHardware_011_io_in; // @[RandomHardware.scala 67:42]
  wire [13:0] RandomHardware_011_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_012_clock; // @[RandomHardware.scala 68:42]
  wire [55:0] RandomHardware_012_io_in; // @[RandomHardware.scala 68:42]
  wire [21:0] RandomHardware_012_io_out; // @[RandomHardware.scala 68:42]
  wire [12:0] RandomHardware_013_io_in; // @[RandomHardware.scala 69:42]
  wire [16:0] RandomHardware_013_io_out; // @[RandomHardware.scala 69:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 70:42]
  wire  RandomHardware_014_reset; // @[RandomHardware.scala 70:42]
  wire [73:0] RandomHardware_014_io_in; // @[RandomHardware.scala 70:42]
  wire [58:0] RandomHardware_014_io_out; // @[RandomHardware.scala 70:42]
  wire [48:0] RandomHardware_015_io_in; // @[RandomHardware.scala 71:42]
  wire [24:0] RandomHardware_015_io_out; // @[RandomHardware.scala 71:42]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 72:42]
  wire  RandomHardware_016_reset; // @[RandomHardware.scala 72:42]
  wire [39:0] RandomHardware_016_io_in; // @[RandomHardware.scala 72:42]
  wire [37:0] RandomHardware_016_io_out; // @[RandomHardware.scala 72:42]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 73:42]
  wire [26:0] RandomHardware_017_io_in; // @[RandomHardware.scala 73:42]
  wire [2:0] RandomHardware_017_io_out; // @[RandomHardware.scala 73:42]
  wire  RandomHardware_018_clock; // @[RandomHardware.scala 74:42]
  wire  RandomHardware_018_reset; // @[RandomHardware.scala 74:42]
  wire [35:0] RandomHardware_018_io_in; // @[RandomHardware.scala 74:42]
  wire [26:0] RandomHardware_018_io_out; // @[RandomHardware.scala 74:42]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 75:42]
  wire [20:0] RandomHardware_019_io_in; // @[RandomHardware.scala 75:42]
  wire [20:0] RandomHardware_019_io_out; // @[RandomHardware.scala 75:42]
  wire  RandomHardware_020_clock; // @[RandomHardware.scala 76:42]
  wire  RandomHardware_020_reset; // @[RandomHardware.scala 76:42]
  wire [38:0] RandomHardware_020_io_in; // @[RandomHardware.scala 76:42]
  wire [55:0] RandomHardware_020_io_out; // @[RandomHardware.scala 76:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 77:42]
  wire  RandomHardware_021_reset; // @[RandomHardware.scala 77:42]
  wire [30:0] RandomHardware_021_io_in; // @[RandomHardware.scala 77:42]
  wire [29:0] RandomHardware_021_io_out; // @[RandomHardware.scala 77:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 78:42]
  wire  RandomHardware_022_reset; // @[RandomHardware.scala 78:42]
  wire [38:0] RandomHardware_022_io_in; // @[RandomHardware.scala 78:42]
  wire [6:0] RandomHardware_022_io_out; // @[RandomHardware.scala 78:42]
  wire [23:0] RandomHardware_023_io_in; // @[RandomHardware.scala 79:42]
  wire [17:0] RandomHardware_023_io_out; // @[RandomHardware.scala 79:42]
  wire  RandomHardware_024_clock; // @[RandomHardware.scala 80:42]
  wire [21:0] RandomHardware_024_io_in; // @[RandomHardware.scala 80:42]
  wire [8:0] RandomHardware_024_io_out; // @[RandomHardware.scala 80:42]
  wire  RandomHardware_025_clock; // @[RandomHardware.scala 81:42]
  wire  RandomHardware_025_reset; // @[RandomHardware.scala 81:42]
  wire [50:0] RandomHardware_025_io_in; // @[RandomHardware.scala 81:42]
  wire [37:0] RandomHardware_025_io_out; // @[RandomHardware.scala 81:42]
  wire  Accum_026_clock; // @[RandomHardware.scala 82:34]
  wire [9:0] Accum_026_io_in; // @[RandomHardware.scala 82:34]
  wire [9:0] Accum_026_io_out; // @[RandomHardware.scala 82:34]
  wire [34:0] io_out_lo = {RandomHardware_015_io_out,Accum_026_io_out}; // @[Cat.scala 30:58]
  wire [75:0] io_out_hi = {RandomHardware_013_io_out,RandomHardware_014_io_out}; // @[Cat.scala 30:58]
  wire [16:0] wire_001 = RandomHardware_006_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 143:18]
  wire [29:0] wire_002 = RandomHardware_021_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 129:18]
  wire [5:0] wire_004 = RandomHardware_004_io_out[11:6]; // @[RandomHardware.scala 101:47]
  wire [55:0] wire_005 = RandomHardware_020_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 127:18]
  wire [61:0] _RandomHardware_003_io_in_T = {wire_004,wire_005}; // @[Cat.scala 30:58]
  wire [4:0] wire_006 = ShiftRegister_000_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 91:18]
  wire [14:0] wire_010 = RandomHardware_005_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 104:18]
  wire [49:0] _RandomHardware_008_io_in_T = {wire_006,wire_010,wire_002}; // @[Cat.scala 30:58]
  wire [4:0] wire_038 = ShiftLeft_009_io_out[9:5]; // @[RandomHardware.scala 111:42]
  wire [17:0] wire_016 = RandomHardware_023_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 137:18]
  wire [37:0] wire_017 = RandomHardware_025_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 142:18]
  wire [18:0] wire_027 = RandomHardware_016_io_out[37:19]; // @[RandomHardware.scala 150:47]
  wire [2:0] wire_028 = RandomHardware_017_io_out; // @[RandomHardware.scala 41:24 RandomHardware.scala 121:18]
  wire [13:0] wire_032 = RandomHardware_011_io_out; // @[RandomHardware.scala 45:24 RandomHardware.scala 116:18]
  wire [45:0] _RandomHardware_020_io_in_T = {wire_010,wire_001,wire_032}; // @[Cat.scala 30:58]
  wire [9:0] wire_035 = RandomHardware_008_io_out; // @[RandomHardware.scala 48:24 RandomHardware.scala 107:18]
  wire [9:0] wire_039 = SignExtendDouble_002_io_out; // @[RandomHardware.scala 52:24 RandomHardware.scala 97:18]
  wire [8:0] wire_041 = RandomHardware_024_io_out; // @[RandomHardware.scala 54:24 RandomHardware.scala 140:18]
  wire [48:0] _RandomHardware_025_io_in_T = {wire_039,wire_002,wire_041}; // @[Cat.scala 30:58]
  wire [6:0] wire_019 = RandomHardware_022_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 135:18]
  wire [16:0] _RandomHardware_013_io_in_T = {wire_039,wire_019}; // @[Cat.scala 30:58]
  wire [21:0] wire_021 = RandomHardware_012_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 119:18]
  wire [35:0] RandomHardware_014_io_in_hi = {wire_032,wire_021}; // @[Cat.scala 30:58]
  wire [37:0] wire_022 = RandomHardware_016_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 149:18]
  wire [27:0] wire_023 = RandomHardware_010_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 113:18]
  wire [20:0] wire_024 = RandomHardware_019_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 125:18]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware.scala 56:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 57:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  SignExtendDouble SignExtendDouble_002 ( // @[RandomHardware.scala 58:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 59:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_004_clock),
    .reset(RandomHardware_004_reset),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 61:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 63:42]
    .clock(RandomHardware_007_clock),
    .reset(RandomHardware_007_reset),
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 64:42]
    .clock(RandomHardware_008_clock),
    .reset(RandomHardware_008_reset),
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  ShiftLeft_4 ShiftLeft_009 ( // @[RandomHardware.scala 65:34]
    .io_in(ShiftLeft_009_io_in),
    .io_out(ShiftLeft_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 66:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 67:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_012_clock),
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 69:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 70:42]
    .clock(RandomHardware_014_clock),
    .reset(RandomHardware_014_reset),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 71:42]
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 72:42]
    .clock(RandomHardware_016_clock),
    .reset(RandomHardware_016_reset),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 73:42]
    .clock(RandomHardware_017_clock),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 74:42]
    .clock(RandomHardware_018_clock),
    .reset(RandomHardware_018_reset),
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 75:42]
    .clock(RandomHardware_019_clock),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  RandomHardware_1_20 RandomHardware_020 ( // @[RandomHardware.scala 76:42]
    .clock(RandomHardware_020_clock),
    .reset(RandomHardware_020_reset),
    .io_in(RandomHardware_020_io_in),
    .io_out(RandomHardware_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 77:42]
    .clock(RandomHardware_021_clock),
    .reset(RandomHardware_021_reset),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 78:42]
    .clock(RandomHardware_022_clock),
    .reset(RandomHardware_022_reset),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 79:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 80:42]
    .clock(RandomHardware_024_clock),
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  RandomHardware_1_25 RandomHardware_025 ( // @[RandomHardware.scala 81:42]
    .clock(RandomHardware_025_clock),
    .reset(RandomHardware_025_reset),
    .io_in(RandomHardware_025_io_in),
    .io_out(RandomHardware_025_io_out)
  );
  Accum Accum_026 ( // @[RandomHardware.scala 82:34]
    .clock(Accum_026_clock),
    .io_in(Accum_026_io_in),
    .io_out(Accum_026_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = ShiftLeft_009_io_out[4:0]; // @[RandomHardware.scala 110:42]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign SignExtendDouble_002_io_in = ShiftRegister_000_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 90:18]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = {{11'd0}, _RandomHardware_003_io_in_T}; // @[Cat.scala 30:58]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_reset = reset;
  assign RandomHardware_004_io_in = {wire_006,wire_001}; // @[Cat.scala 30:58]
  assign RandomHardware_005_io_in = RandomHardware_004_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 102:18]
  assign RandomHardware_006_io_in = io_in[99:72]; // @[RandomHardware.scala 84:41]
  assign RandomHardware_007_clock = clock;
  assign RandomHardware_007_reset = reset;
  assign RandomHardware_007_io_in = io_in[99:68]; // @[RandomHardware.scala 85:41]
  assign RandomHardware_008_clock = clock;
  assign RandomHardware_008_reset = reset;
  assign RandomHardware_008_io_in = {{1'd0}, _RandomHardware_008_io_in_T}; // @[Cat.scala 30:58]
  assign ShiftLeft_009_io_in = RandomHardware_022_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 134:18]
  assign RandomHardware_010_io_in = RandomHardware_003_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 99:18]
  assign RandomHardware_011_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 131:18]
  assign RandomHardware_012_clock = clock;
  assign RandomHardware_012_io_in = {wire_016,wire_017}; // @[Cat.scala 30:58]
  assign RandomHardware_013_io_in = _RandomHardware_013_io_in_T[12:0]; // @[RandomHardware.scala 151:33]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_reset = reset;
  assign RandomHardware_014_io_in = {RandomHardware_014_io_in_hi,wire_022}; // @[Cat.scala 30:58]
  assign RandomHardware_015_io_in = {wire_023,wire_024}; // @[Cat.scala 30:58]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_reset = reset;
  assign RandomHardware_016_io_in = io_in[39:0]; // @[RandomHardware.scala 86:41]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_io_in = RandomHardware_018_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 123:18]
  assign RandomHardware_018_clock = clock;
  assign RandomHardware_018_reset = reset;
  assign RandomHardware_018_io_in = {wire_001,wire_027}; // @[Cat.scala 30:58]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_io_in = {wire_028,wire_016}; // @[Cat.scala 30:58]
  assign RandomHardware_020_clock = clock;
  assign RandomHardware_020_reset = reset;
  assign RandomHardware_020_io_in = _RandomHardware_020_io_in_T[38:0]; // @[RandomHardware.scala 126:33]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_reset = reset;
  assign RandomHardware_021_io_in = RandomHardware_007_io_out; // @[RandomHardware.scala 46:24 RandomHardware.scala 148:18]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_reset = reset;
  assign RandomHardware_022_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 47:24 RandomHardware.scala 94:18]
  assign RandomHardware_023_io_in = {wire_035,wire_032}; // @[Cat.scala 30:58]
  assign RandomHardware_024_clock = clock;
  assign RandomHardware_024_io_in = {wire_001,wire_038}; // @[Cat.scala 30:58]
  assign RandomHardware_025_clock = clock;
  assign RandomHardware_025_reset = reset;
  assign RandomHardware_025_io_in = {{2'd0}, _RandomHardware_025_io_in_T}; // @[Cat.scala 30:58]
  assign Accum_026_clock = clock;
  assign Accum_026_io_in = RandomHardware_008_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 108:18]
endmodule
