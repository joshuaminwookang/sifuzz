module ReduceXorMux(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[19:12]; // @[Muxes.scala 122:27]
  wire [7:0] IN2 = io_in[11:4]; // @[Muxes.scala 123:27]
  wire [3:0] SEL = io_in[3:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_0(
  input  [19:0] io_in,
  output [7:0]  io_out
);
  wire [19:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_0.scala 14:34]
  wire [7:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_0.scala 14:34]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_0.scala 14:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:33]
endmodule
module ShiftLeft(
  input  [16:0] io_in,
  output [17:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_1(
  input  [16:0] io_in,
  output [17:0] io_out
);
  wire [16:0] ShiftLeft_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [17:0] ShiftLeft_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_1.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:25]
endmodule
module ShiftRegister(
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
module RandomHardware_3_0(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_3_0.scala 14:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_3_0.scala 14:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_3_0.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_3_0.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_3_0.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_3_0.scala 16:25]
endmodule
module RandomHardware_2_0(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_2_0.scala 14:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 14:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 14:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_0.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:33]
endmodule
module RandomHardware_1_4(
  input         clock,
  input  [15:0] io_in,
  output [6:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_4.scala 14:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_4.scala 14:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_4.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_4.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[6:0]; // @[RandomHardware_1_4.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[11:0]; // @[RandomHardware_1_4.scala 16:33]
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
module Accum_2(
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
module RandomHardware_1_8(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_1_8.scala 14:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_1_8.scala 14:26]
  Mux8 Mux8_000 ( // @[RandomHardware_1_8.scala 14:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  assign io_out = Mux8_000_io_out; // @[RandomHardware_1_8.scala 17:10]
  assign Mux8_000_io_in = io_in; // @[RandomHardware_1_8.scala 16:25]
endmodule
module ShiftRegister_1(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] r0; // @[Memory.scala 78:19]
  reg [15:0] r1; // @[Memory.scala 79:19]
  reg [15:0] r2; // @[Memory.scala 80:19]
  reg [15:0] r3; // @[Memory.scala 81:19]
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
module RandomHardware_1_9(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_9.scala 14:42]
  wire [15:0] ShiftRegister_000_io_in; // @[RandomHardware_1_9.scala 14:42]
  wire [15:0] ShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 14:42]
  ShiftRegister_1 ShiftRegister_000 ( // @[RandomHardware_1_9.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_9.scala 16:33]
endmodule
module Mod(
  input  [23:0] io_in,
  output [11:0] io_out
);
  wire [11:0] in1 = io_in[23:12]; // @[ArithmeticLogical.scala 71:20]
  wire [11:0] in2 = io_in[11:0]; // @[ArithmeticLogical.scala 72:20]
  wire [11:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[11:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_1_10(
  input         clock,
  input  [23:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_10.scala 15:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_1_10.scala 15:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 15:42]
  wire [23:0] Mod_001_io_in; // @[RandomHardware_1_10.scala 16:26]
  wire [11:0] Mod_001_io_out; // @[RandomHardware_1_10.scala 16:26]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_10.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Mod Mod_001 ( // @[RandomHardware_1_10.scala 16:26]
    .io_in(Mod_001_io_in),
    .io_out(Mod_001_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = Mod_001_io_out; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  assign Mod_001_io_in = io_in; // @[RandomHardware_1_10.scala 18:25]
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
module ShiftRight(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{3'd0}, io_in[11:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_11(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_11.scala 15:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_1_11.scala 15:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_1_11.scala 15:26]
  wire [11:0] ShiftRight_001_io_in; // @[RandomHardware_1_11.scala 16:34]
  wire [11:0] ShiftRight_001_io_out; // @[RandomHardware_1_11.scala 16:34]
  Reg_1 Reg_000 ( // @[RandomHardware_1_11.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  ShiftRight ShiftRight_001 ( // @[RandomHardware_1_11.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_11.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = ShiftRight_001_io_out; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 21:18]
  assign ShiftRight_001_io_in = io_in; // @[RandomHardware_1_11.scala 18:25]
endmodule
module ReduceXorMux_1(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[23:16]; // @[Muxes.scala 122:27]
  wire [7:0] IN2 = io_in[15:8]; // @[Muxes.scala 123:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module SignExtendDouble(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_13(
  input  [23:0] io_in,
  output [15:0] io_out
);
  wire [23:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_13.scala 15:34]
  wire [7:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_13.scala 15:34]
  wire [7:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_13.scala 16:42]
  wire [15:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_13.scala 16:42]
  ReduceXorMux_1 ReduceXorMux_000 ( // @[RandomHardware_1_13.scala 15:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_1_13.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign ReduceXorMux_000_io_in = io_in; // @[RandomHardware_1_13.scala 18:33]
  assign SignExtendDouble_001_io_in = ReduceXorMux_000_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
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
module CompareMux(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [11:0] IN1 = io_in[23:12]; // @[Muxes.scala 134:27]
  wire [7:0] IN2 = io_in[15:8]; // @[Muxes.scala 135:27]
  wire [3:0] SEL1 = io_in[7:4]; // @[Muxes.scala 136:27]
  wire [3:0] SEL2 = io_in[3:0]; // @[Muxes.scala 137:27]
  wire [11:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{4'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[7:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_14(
  input         clock,
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire  RegFile2R1W_000_clock; // @[RandomHardware_1_14.scala 15:34]
  wire [7:0] RegFile2R1W_000_io_in; // @[RandomHardware_1_14.scala 15:34]
  wire [7:0] RegFile2R1W_000_io_out; // @[RandomHardware_1_14.scala 15:34]
  wire [23:0] CompareMux_001_io_in; // @[RandomHardware_1_14.scala 16:34]
  wire [7:0] CompareMux_001_io_out; // @[RandomHardware_1_14.scala 16:34]
  RegFile2R1W RegFile2R1W_000 ( // @[RandomHardware_1_14.scala 15:34]
    .clock(RegFile2R1W_000_clock),
    .io_in(RegFile2R1W_000_io_in),
    .io_out(RegFile2R1W_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_1_14.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = RegFile2R1W_000_io_out; // @[RandomHardware_1_14.scala 19:10]
  assign RegFile2R1W_000_clock = clock;
  assign RegFile2R1W_000_io_in = CompareMux_001_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_1_14.scala 18:25]
endmodule
module ReduceOrMux(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[23:15]; // @[Muxes.scala 110:27]
  wire [8:0] IN2 = io_in[14:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_17(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [23:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_17.scala 14:34]
  wire [8:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_17.scala 14:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_17.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:33]
endmodule
module ShiftLeft_1(
  input  [8:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
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
module RandomHardware_1_18(
  input  [18:0] io_in,
  output [10:0] io_out
);
  wire [8:0] ShiftLeft_000_io_in; // @[RandomHardware_1_18.scala 15:34]
  wire [10:0] ShiftLeft_000_io_out; // @[RandomHardware_1_18.scala 15:34]
  wire [18:0] Mux2_001_io_in; // @[RandomHardware_1_18.scala 16:26]
  wire [8:0] Mux2_001_io_out; // @[RandomHardware_1_18.scala 16:26]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_18.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_1_18.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_18.scala 19:10]
  assign ShiftLeft_000_io_in = Mux2_001_io_out; // @[RandomHardware_1_18.scala 13:24 RandomHardware_1_18.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_1_18.scala 18:25]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [51:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware.scala 35:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware.scala 35:42]
  wire [16:0] RandomHardware_001_io_in; // @[RandomHardware.scala 36:42]
  wire [17:0] RandomHardware_001_io_out; // @[RandomHardware.scala 36:42]
  wire  ShiftRegister_002_clock; // @[RandomHardware.scala 37:42]
  wire [7:0] ShiftRegister_002_io_in; // @[RandomHardware.scala 37:42]
  wire [7:0] ShiftRegister_002_io_out; // @[RandomHardware.scala 37:42]
  wire  Accum_003_clock; // @[RandomHardware.scala 38:34]
  wire [10:0] Accum_003_io_in; // @[RandomHardware.scala 38:34]
  wire [10:0] Accum_003_io_out; // @[RandomHardware.scala 38:34]
  wire  RandomHardware_004_clock; // @[RandomHardware.scala 39:42]
  wire [15:0] RandomHardware_004_io_in; // @[RandomHardware.scala 39:42]
  wire [6:0] RandomHardware_004_io_out; // @[RandomHardware.scala 39:42]
  wire  Reg_005_clock; // @[RandomHardware.scala 40:26]
  wire [7:0] Reg_005_io_in; // @[RandomHardware.scala 40:26]
  wire [7:0] Reg_005_io_out; // @[RandomHardware.scala 40:26]
  wire  Accum_006_clock; // @[RandomHardware.scala 41:34]
  wire [7:0] Accum_006_io_in; // @[RandomHardware.scala 41:34]
  wire [7:0] Accum_006_io_out; // @[RandomHardware.scala 41:34]
  wire  Accum_007_clock; // @[RandomHardware.scala 42:34]
  wire [7:0] Accum_007_io_in; // @[RandomHardware.scala 42:34]
  wire [7:0] Accum_007_io_out; // @[RandomHardware.scala 42:34]
  wire [18:0] RandomHardware_008_io_in; // @[RandomHardware.scala 43:42]
  wire [1:0] RandomHardware_008_io_out; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 44:42]
  wire [15:0] RandomHardware_009_io_in; // @[RandomHardware.scala 44:42]
  wire [15:0] RandomHardware_009_io_out; // @[RandomHardware.scala 44:42]
  wire  RandomHardware_010_clock; // @[RandomHardware.scala 45:42]
  wire [23:0] RandomHardware_010_io_in; // @[RandomHardware.scala 45:42]
  wire [11:0] RandomHardware_010_io_out; // @[RandomHardware.scala 45:42]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 46:42]
  wire [11:0] RandomHardware_011_io_in; // @[RandomHardware.scala 46:42]
  wire [11:0] RandomHardware_011_io_out; // @[RandomHardware.scala 46:42]
  wire  RandomHardware_012_clock; // @[RandomHardware.scala 47:42]
  wire [15:0] RandomHardware_012_io_in; // @[RandomHardware.scala 47:42]
  wire [15:0] RandomHardware_012_io_out; // @[RandomHardware.scala 47:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 48:42]
  wire [15:0] RandomHardware_013_io_out; // @[RandomHardware.scala 48:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 49:42]
  wire [23:0] RandomHardware_014_io_in; // @[RandomHardware.scala 49:42]
  wire [7:0] RandomHardware_014_io_out; // @[RandomHardware.scala 49:42]
  wire  Accum_015_clock; // @[RandomHardware.scala 50:34]
  wire [7:0] Accum_015_io_in; // @[RandomHardware.scala 50:34]
  wire [7:0] Accum_015_io_out; // @[RandomHardware.scala 50:34]
  wire  Accum_016_clock; // @[RandomHardware.scala 51:34]
  wire [7:0] Accum_016_io_in; // @[RandomHardware.scala 51:34]
  wire [7:0] Accum_016_io_out; // @[RandomHardware.scala 51:34]
  wire [23:0] RandomHardware_017_io_in; // @[RandomHardware.scala 52:42]
  wire [8:0] RandomHardware_017_io_out; // @[RandomHardware.scala 52:42]
  wire [18:0] RandomHardware_018_io_in; // @[RandomHardware.scala 53:42]
  wire [10:0] RandomHardware_018_io_out; // @[RandomHardware.scala 53:42]
  wire [23:0] io_out_lo = {RandomHardware_009_io_out,Accum_015_io_out}; // @[Cat.scala 30:58]
  wire [27:0] io_out_hi = {RandomHardware_001_io_out,ShiftRegister_002_io_out,RandomHardware_008_io_out}; // @[Cat.scala 30:58]
  wire [7:0] wire_004 = RandomHardware_014_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 88:18]
  wire [7:0] wire_005 = Accum_016_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 89:18]
  wire [6:0] wire_013 = RandomHardware_004_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 65:18]
  wire [8:0] wire_014 = RandomHardware_017_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 80:18]
  wire [7:0] wire_017 = RandomHardware_000_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 84:18]
  wire [15:0] wire_018 = RandomHardware_013_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 87:18]
  wire [11:0] wire_020 = RandomHardware_011_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 76:18]
  wire [4:0] wire_001 = RandomHardware_018_io_out[4:0]; // @[RandomHardware.scala 82:47]
  wire [11:0] wire_000 = RandomHardware_010_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 85:18]
  wire [10:0] wire_009 = Accum_003_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 63:18]
  wire [7:0] wire_010 = Reg_005_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 69:18]
  wire [15:0] _Accum_015_io_in_T = {wire_010,wire_005}; // @[Cat.scala 30:58]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 35:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 36:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ShiftRegister ShiftRegister_002 ( // @[RandomHardware.scala 37:42]
    .clock(ShiftRegister_002_clock),
    .io_in(ShiftRegister_002_io_in),
    .io_out(ShiftRegister_002_io_out)
  );
  Accum Accum_003 ( // @[RandomHardware.scala 38:34]
    .clock(Accum_003_clock),
    .io_in(Accum_003_io_in),
    .io_out(Accum_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 39:42]
    .clock(RandomHardware_004_clock),
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  Reg Reg_005 ( // @[RandomHardware.scala 40:26]
    .clock(Reg_005_clock),
    .io_in(Reg_005_io_in),
    .io_out(Reg_005_io_out)
  );
  Accum_2 Accum_006 ( // @[RandomHardware.scala 41:34]
    .clock(Accum_006_clock),
    .io_in(Accum_006_io_in),
    .io_out(Accum_006_io_out)
  );
  Accum_2 Accum_007 ( // @[RandomHardware.scala 42:34]
    .clock(Accum_007_clock),
    .io_in(Accum_007_io_in),
    .io_out(Accum_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 43:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 44:42]
    .clock(RandomHardware_009_clock),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 45:42]
    .clock(RandomHardware_010_clock),
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 46:42]
    .clock(RandomHardware_011_clock),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_9 RandomHardware_012 ( // @[RandomHardware.scala 47:42]
    .clock(RandomHardware_012_clock),
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 48:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 49:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  Accum_2 Accum_015 ( // @[RandomHardware.scala 50:34]
    .clock(Accum_015_clock),
    .io_in(Accum_015_io_in),
    .io_out(Accum_015_io_out)
  );
  Accum_2 Accum_016 ( // @[RandomHardware.scala 51:34]
    .clock(Accum_016_clock),
    .io_in(Accum_016_io_in),
    .io_out(Accum_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 52:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[99:80]; // @[RandomHardware.scala 55:41]
  assign RandomHardware_001_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign ShiftRegister_002_clock = clock;
  assign ShiftRegister_002_io_in = Accum_006_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 72:18]
  assign Accum_003_clock = clock;
  assign Accum_003_io_in = RandomHardware_018_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 83:18]
  assign RandomHardware_004_clock = clock;
  assign RandomHardware_004_io_in = {wire_004,wire_005}; // @[Cat.scala 30:58]
  assign Reg_005_clock = clock;
  assign Reg_005_io_in = Accum_007_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 74:18]
  assign Accum_006_clock = clock;
  assign Accum_006_io_in = Reg_005_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 68:18]
  assign Accum_007_clock = clock;
  assign Accum_007_io_in = Accum_016_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 90:18]
  assign RandomHardware_008_io_in = {wire_009,wire_010}; // @[Cat.scala 30:58]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_io_in = RandomHardware_012_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 78:18]
  assign RandomHardware_010_clock = clock;
  assign RandomHardware_010_io_in = io_in[99:76]; // @[RandomHardware.scala 56:41]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_io_in = RandomHardware_010_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 86:18]
  assign RandomHardware_012_clock = clock;
  assign RandomHardware_012_io_in = {wire_013,wire_014}; // @[Cat.scala 30:58]
  assign RandomHardware_013_io_in = io_in[99:76]; // @[RandomHardware.scala 57:41]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = io_in[99:76]; // @[RandomHardware.scala 58:41]
  assign Accum_015_clock = clock;
  assign Accum_015_io_in = _Accum_015_io_in_T[7:0]; // @[RandomHardware.scala 96:25]
  assign Accum_016_clock = clock;
  assign Accum_016_io_in = io_in[7:0]; // @[RandomHardware.scala 59:33]
  assign RandomHardware_017_io_in = {wire_017,wire_018}; // @[Cat.scala 30:58]
  assign RandomHardware_018_io_in = {wire_013,wire_020}; // @[Cat.scala 30:58]
endmodule
