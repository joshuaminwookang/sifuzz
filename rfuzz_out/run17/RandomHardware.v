module ReduceXorMux(
  input  [49:0] io_in,
  output [21:0] io_out
);
  wire [21:0] IN1 = io_in[49:28]; // @[Muxes.scala 122:27]
  wire [21:0] IN2 = io_in[27:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module ShiftRegister(
  input         clock,
  input  [49:0] io_in,
  output [49:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [49:0] r0; // @[Memory.scala 78:19]
  reg [49:0] r1; // @[Memory.scala 79:19]
  reg [49:0] r2; // @[Memory.scala 80:19]
  reg [49:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[49:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[49:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[49:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[49:0];
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
  input  [49:0] io_in,
  output [21:0] io_out
);
  wire [49:0] ReduceXorMux_000_io_in; // @[RandomHardware_1_0.scala 15:34]
  wire [21:0] ReduceXorMux_000_io_out; // @[RandomHardware_1_0.scala 15:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_0.scala 16:42]
  wire [49:0] ShiftRegister_001_io_in; // @[RandomHardware_1_0.scala 16:42]
  wire [49:0] ShiftRegister_001_io_out; // @[RandomHardware_1_0.scala 16:42]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_1_0.scala 15:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_1_0.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = ReduceXorMux_000_io_out; // @[RandomHardware_1_0.scala 19:10]
  assign ReduceXorMux_000_io_in = ShiftRegister_001_io_out; // @[RandomHardware_1_0.scala 13:24 RandomHardware_1_0.scala 21:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in; // @[RandomHardware_1_0.scala 18:33]
endmodule
module ShiftRight(
  input  [19:0] io_in,
  output [19:0] io_out
);
  assign io_out = {{2'd0}, io_in[19:2]}; // @[ArithmeticLogical.scala 103:21]
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
module RandomHardware_3_0(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire [19:0] ShiftRight_000_io_in; // @[RandomHardware_3_0.scala 15:34]
  wire [19:0] ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 15:34]
  wire  Reg_001_clock; // @[RandomHardware_3_0.scala 16:26]
  wire [19:0] Reg_001_io_in; // @[RandomHardware_3_0.scala 16:26]
  wire [19:0] Reg_001_io_out; // @[RandomHardware_3_0.scala 16:26]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_3_0.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_3_0.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_3_0.scala 19:10]
  assign ShiftRight_000_io_in = Reg_001_io_out; // @[RandomHardware_3_0.scala 13:24 RandomHardware_3_0.scala 21:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = io_in; // @[RandomHardware_3_0.scala 18:25]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [18:0] r0; // @[Memory.scala 60:19]
  reg [18:0] r1; // @[Memory.scala 61:19]
  reg [18:0] r2; // @[Memory.scala 62:19]
  reg [18:0] r3; // @[Memory.scala 63:19]
  wire [19:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 19'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[18:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 19'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 19'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 19'h0; // @[Memory.scala 63:19]
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
module RandomHardware_2_0(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_2_0.scala 15:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 15:42]
  wire [19:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 15:42]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_2_0.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_2_0.scala 16:42]
  wire [19:0] ResetShiftRegister_001_io_in; // @[RandomHardware_2_0.scala 16:42]
  wire [18:0] ResetShiftRegister_001_io_out; // @[RandomHardware_2_0.scala 16:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_0.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_2_0.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = ResetShiftRegister_001_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 18:33]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
endmodule
module RandomHardware_1_1(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_1.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_1.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_1.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_1.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_1.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[11:0]; // @[RandomHardware_1_1.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:33]
endmodule
module ReduceOrMux(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[19:13]; // @[Muxes.scala 110:27]
  wire [6:0] IN2 = io_in[12:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftRight_1(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{3'd0}, io_in[11:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module CompareMux(
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
module RandomHardware_1_2(
  input  [33:0] io_in,
  output [6:0]  io_out
);
  wire [19:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_2.scala 16:34]
  wire [6:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_2.scala 16:34]
  wire [11:0] ShiftRight_001_io_in; // @[RandomHardware_1_2.scala 17:34]
  wire [11:0] ShiftRight_001_io_out; // @[RandomHardware_1_2.scala 17:34]
  wire [21:0] CompareMux_002_io_in; // @[RandomHardware_1_2.scala 18:34]
  wire [7:0] CompareMux_002_io_out; // @[RandomHardware_1_2.scala 18:34]
  wire [11:0] wire_000 = ShiftRight_001_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 24:18]
  wire [7:0] wire_001 = CompareMux_002_io_out; // @[RandomHardware_1_2.scala 14:24 RandomHardware_1_2.scala 25:18]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_2.scala 16:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  ShiftRight_1 ShiftRight_001 ( // @[RandomHardware_1_2.scala 17:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  CompareMux CompareMux_002 ( // @[RandomHardware_1_2.scala 18:34]
    .io_in(CompareMux_002_io_in),
    .io_out(CompareMux_002_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_2.scala 22:10]
  assign ReduceOrMux_000_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign ShiftRight_001_io_in = io_in[33:22]; // @[RandomHardware_1_2.scala 20:33]
  assign CompareMux_002_io_in = io_in[33:12]; // @[RandomHardware_1_2.scala 21:33]
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
module ShiftRight_2(
  input  [5:0] io_in,
  output [5:0] io_out
);
  assign io_out = {{3'd0}, io_in[5:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module SignExtendDouble(
  input  [10:0] io_in,
  output [21:0] io_out
);
  wire [10:0] io_out_hi = io_in[10] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftLeft(
  input  [6:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceXorMux_1(
  input  [15:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[15:9]; // @[Muxes.scala 122:27]
  wire [6:0] IN2 = io_in[8:2]; // @[Muxes.scala 123:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_1_6(
  input  [15:0] io_in,
  output [10:0] io_out
);
  wire [6:0] ShiftLeft_000_io_in; // @[RandomHardware_1_6.scala 15:34]
  wire [10:0] ShiftLeft_000_io_out; // @[RandomHardware_1_6.scala 15:34]
  wire [15:0] ReduceXorMux_001_io_in; // @[RandomHardware_1_6.scala 16:34]
  wire [6:0] ReduceXorMux_001_io_out; // @[RandomHardware_1_6.scala 16:34]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_6.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ReduceXorMux_1 ReduceXorMux_001 ( // @[RandomHardware_1_6.scala 16:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_6.scala 19:10]
  assign ShiftLeft_000_io_in = ReduceXorMux_001_io_out; // @[RandomHardware_1_6.scala 13:24 RandomHardware_1_6.scala 21:18]
  assign ReduceXorMux_001_io_in = io_in; // @[RandomHardware_1_6.scala 18:33]
endmodule
module Reg_1(
  input        clock,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SignExtendDouble_1(
  input  [5:0]  io_in,
  output [11:0] io_out
);
  wire [5:0] io_out_hi = io_in[5] ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Reg_2(
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
module RandomHardware_1_9(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_9.scala 14:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_1_9.scala 14:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_1_9.scala 14:26]
  Reg_2 Reg_000 ( // @[RandomHardware_1_9.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_9.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_9.scala 16:25]
endmodule
module ShiftLeft_1(
  input  [11:0] io_in,
  output [14:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_10(
  input  [11:0] io_in,
  output [14:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_10.scala 14:34]
  wire [14:0] ShiftLeft_000_io_out; // @[RandomHardware_1_10.scala 14:34]
  ShiftLeft_1 ShiftLeft_000 ( // @[RandomHardware_1_10.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_10.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_10.scala 16:25]
endmodule
module ShiftRight_3(
  input  [6:0] io_in,
  output [6:0] io_out
);
  assign io_out = {{5'd0}, io_in[6:5]}; // @[ArithmeticLogical.scala 103:21]
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
module RandomHardware_1_12(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [1:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_12.scala 15:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_12.scala 15:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_12.scala 15:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_12.scala 15:42]
  wire [18:0] Mux8_001_io_in; // @[RandomHardware_1_12.scala 16:26]
  wire [1:0] Mux8_001_io_out; // @[RandomHardware_1_12.scala 16:26]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_12.scala 15:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Mux8 Mux8_001 ( // @[RandomHardware_1_12.scala 16:26]
    .io_in(Mux8_001_io_in),
    .io_out(Mux8_001_io_out)
  );
  assign io_out = Mux8_001_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_12.scala 18:33]
  assign Mux8_001_io_in = RandomHardware_000_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
endmodule
module Mul(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_13(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] Mul_000_io_in; // @[RandomHardware_1_13.scala 14:26]
  wire [11:0] Mul_000_io_out; // @[RandomHardware_1_13.scala 14:26]
  Mul Mul_000 ( // @[RandomHardware_1_13.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:25]
endmodule
module Accum(
  input        clock,
  output [1:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] sum; // @[ArithmeticLogical.scala 82:18]
  wire [2:0] _sum_T = {{1'd0}, sum}; // @[ArithmeticLogical.scala 83:16]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= _sum_T[1:0]; // @[ArithmeticLogical.scala 83:16]
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
module RandomHardware_2_1(
  input         clock,
  input         reset,
  input  [19:0] io_in
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_2_1.scala 16:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_2_1.scala 16:26]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_2_1.scala 17:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_2_1.scala 17:42]
  wire [19:0] ResetShiftRegister_001_io_in; // @[RandomHardware_2_1.scala 17:42]
  wire [18:0] ResetShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 17:42]
  Mux8 Mux8_000 ( // @[RandomHardware_2_1.scala 16:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_2_1.scala 17:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign Mux8_000_io_in = ResetShiftRegister_001_io_out; // @[RandomHardware_2_1.scala 14:24 RandomHardware_2_1.scala 25:18]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = io_in; // @[RandomHardware_2_1.scala 20:33]
endmodule
module SignExtendDouble_2(
  input  [1:0] io_in,
  output [3:0] io_out
);
  wire [1:0] io_out_hi = io_in[1] ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_14(
  input         clock,
  input         reset,
  input  [19:0] io_in,
  output [3:0]  io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_14.scala 16:34]
  wire [1:0] Accum_000_io_out; // @[RandomHardware_1_14.scala 16:34]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_14.scala 17:42]
  wire  RandomHardware_001_reset; // @[RandomHardware_1_14.scala 17:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware_1_14.scala 17:42]
  wire [1:0] SignExtendDouble_002_io_in; // @[RandomHardware_1_14.scala 18:42]
  wire [3:0] SignExtendDouble_002_io_out; // @[RandomHardware_1_14.scala 18:42]
  Accum Accum_000 ( // @[RandomHardware_1_14.scala 16:34]
    .clock(Accum_000_clock),
    .io_out(Accum_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_14.scala 17:42]
    .clock(RandomHardware_001_clock),
    .reset(RandomHardware_001_reset),
    .io_in(RandomHardware_001_io_in)
  );
  SignExtendDouble_2 SignExtendDouble_002 ( // @[RandomHardware_1_14.scala 18:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  assign io_out = SignExtendDouble_002_io_out; // @[RandomHardware_1_14.scala 21:10]
  assign Accum_000_clock = clock;
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_reset = reset;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_14.scala 20:33]
  assign SignExtendDouble_002_io_in = Accum_000_io_out; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 24:18]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [34:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware.scala 29:42]
  wire [49:0] RandomHardware_000_io_in; // @[RandomHardware.scala 29:42]
  wire [21:0] RandomHardware_000_io_out; // @[RandomHardware.scala 29:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 30:42]
  wire  RandomHardware_001_reset; // @[RandomHardware.scala 30:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 30:42]
  wire [11:0] RandomHardware_001_io_out; // @[RandomHardware.scala 30:42]
  wire [33:0] RandomHardware_002_io_in; // @[RandomHardware.scala 31:42]
  wire [6:0] RandomHardware_002_io_out; // @[RandomHardware.scala 31:42]
  wire  ShiftRegister_003_clock; // @[RandomHardware.scala 32:42]
  wire [6:0] ShiftRegister_003_io_in; // @[RandomHardware.scala 32:42]
  wire [6:0] ShiftRegister_003_io_out; // @[RandomHardware.scala 32:42]
  wire [5:0] ShiftRight_004_io_in; // @[RandomHardware.scala 33:34]
  wire [5:0] ShiftRight_004_io_out; // @[RandomHardware.scala 33:34]
  wire [10:0] SignExtendDouble_005_io_in; // @[RandomHardware.scala 34:42]
  wire [21:0] SignExtendDouble_005_io_out; // @[RandomHardware.scala 34:42]
  wire [15:0] RandomHardware_006_io_in; // @[RandomHardware.scala 35:42]
  wire [10:0] RandomHardware_006_io_out; // @[RandomHardware.scala 35:42]
  wire  Reg_007_clock; // @[RandomHardware.scala 36:26]
  wire [3:0] Reg_007_io_in; // @[RandomHardware.scala 36:26]
  wire [3:0] Reg_007_io_out; // @[RandomHardware.scala 36:26]
  wire [5:0] SignExtendDouble_008_io_in; // @[RandomHardware.scala 37:42]
  wire [11:0] SignExtendDouble_008_io_out; // @[RandomHardware.scala 37:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_009_io_in; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_009_io_out; // @[RandomHardware.scala 38:42]
  wire [11:0] RandomHardware_010_io_in; // @[RandomHardware.scala 39:42]
  wire [14:0] RandomHardware_010_io_out; // @[RandomHardware.scala 39:42]
  wire [6:0] ShiftRight_011_io_in; // @[RandomHardware.scala 40:34]
  wire [6:0] ShiftRight_011_io_out; // @[RandomHardware.scala 40:34]
  wire  RandomHardware_012_clock; // @[RandomHardware.scala 41:42]
  wire  RandomHardware_012_reset; // @[RandomHardware.scala 41:42]
  wire [19:0] RandomHardware_012_io_in; // @[RandomHardware.scala 41:42]
  wire [1:0] RandomHardware_012_io_out; // @[RandomHardware.scala 41:42]
  wire [11:0] RandomHardware_013_io_in; // @[RandomHardware.scala 42:42]
  wire [11:0] RandomHardware_013_io_out; // @[RandomHardware.scala 42:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_014_reset; // @[RandomHardware.scala 43:42]
  wire [19:0] RandomHardware_014_io_in; // @[RandomHardware.scala 43:42]
  wire [3:0] RandomHardware_014_io_out; // @[RandomHardware.scala 43:42]
  wire [12:0] io_out_hi = {ShiftRegister_003_io_out,ShiftRight_004_io_out}; // @[Cat.scala 30:58]
  wire [11:0] wire_006 = RandomHardware_009_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 68:18]
  wire [14:0] wire_008 = RandomHardware_010_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 70:18]
  wire [26:0] RandomHardware_000_io_in_lo = {wire_006,wire_008}; // @[Cat.scala 30:58]
  wire [10:0] wire_003 = RandomHardware_006_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 67:18]
  wire [11:0] wire_005 = SignExtendDouble_008_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 60:18]
  wire [22:0] RandomHardware_000_io_in_hi = {wire_003,wire_005}; // @[Cat.scala 30:58]
  wire [21:0] wire_000 = RandomHardware_000_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 54:18]
  wire [11:0] wire_012 = RandomHardware_013_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 65:18]
  wire [3:0] wire_004 = Reg_007_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 58:18]
  wire [1:0] wire_011 = RandomHardware_012_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 71:18]
  wire [6:0] wire_010 = ShiftRight_011_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 63:18]
  wire [3:0] wire_013 = RandomHardware_014_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 72:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 29:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 30:42]
    .clock(RandomHardware_001_clock),
    .reset(RandomHardware_001_reset),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 31:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftRegister_1 ShiftRegister_003 ( // @[RandomHardware.scala 32:42]
    .clock(ShiftRegister_003_clock),
    .io_in(ShiftRegister_003_io_in),
    .io_out(ShiftRegister_003_io_out)
  );
  ShiftRight_2 ShiftRight_004 ( // @[RandomHardware.scala 33:34]
    .io_in(ShiftRight_004_io_in),
    .io_out(ShiftRight_004_io_out)
  );
  SignExtendDouble SignExtendDouble_005 ( // @[RandomHardware.scala 34:42]
    .io_in(SignExtendDouble_005_io_in),
    .io_out(SignExtendDouble_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 35:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  Reg_1 Reg_007 ( // @[RandomHardware.scala 36:26]
    .clock(Reg_007_clock),
    .io_in(Reg_007_io_in),
    .io_out(Reg_007_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_008 ( // @[RandomHardware.scala 37:42]
    .io_in(SignExtendDouble_008_io_in),
    .io_out(SignExtendDouble_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 38:42]
    .clock(RandomHardware_009_clock),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 39:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  ShiftRight_3 ShiftRight_011 ( // @[RandomHardware.scala 40:34]
    .io_in(ShiftRight_011_io_in),
    .io_out(ShiftRight_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 41:42]
    .clock(RandomHardware_012_clock),
    .reset(RandomHardware_012_reset),
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 42:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 43:42]
    .clock(RandomHardware_014_clock),
    .reset(RandomHardware_014_reset),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  assign io_out = {io_out_hi,SignExtendDouble_005_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {RandomHardware_000_io_in_hi,RandomHardware_000_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_reset = reset;
  assign RandomHardware_001_io_in = io_in[99:80]; // @[RandomHardware.scala 45:41]
  assign RandomHardware_002_io_in = {wire_000,wire_012}; // @[Cat.scala 30:58]
  assign ShiftRegister_003_clock = clock;
  assign ShiftRegister_003_io_in = ShiftRight_011_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 62:18]
  assign ShiftRight_004_io_in = {wire_004,wire_011}; // @[Cat.scala 30:58]
  assign SignExtendDouble_005_io_in = {wire_010,wire_013}; // @[Cat.scala 30:58]
  assign RandomHardware_006_io_in = io_in[99:84]; // @[RandomHardware.scala 46:41]
  assign Reg_007_clock = clock;
  assign Reg_007_io_in = RandomHardware_014_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 73:18]
  assign SignExtendDouble_008_io_in = RandomHardware_009_io_out[11:6]; // @[RandomHardware.scala 69:47]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_io_in = io_in[11:0]; // @[RandomHardware.scala 47:41]
  assign RandomHardware_010_io_in = io_in[11:0]; // @[RandomHardware.scala 48:41]
  assign ShiftRight_011_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 56:18]
  assign RandomHardware_012_clock = clock;
  assign RandomHardware_012_reset = reset;
  assign RandomHardware_012_io_in = io_in[19:0]; // @[RandomHardware.scala 49:41]
  assign RandomHardware_013_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 66:18]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_reset = reset;
  assign RandomHardware_014_io_in = io_in[99:80]; // @[RandomHardware.scala 50:41]
endmodule
