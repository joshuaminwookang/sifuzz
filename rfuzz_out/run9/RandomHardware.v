module Reg(
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
module RandomHardware_1_0(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_0.scala 14:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_1_0.scala 14:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_1_0.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_1_0.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_0.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:25]
endmodule
module Reg_1(
  input        clock,
  input  [6:0] io_in,
  output [6:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Div(
  input  [23:0] io_in,
  output [11:0] io_out
);
  wire [11:0] in1 = io_in[23:12]; // @[ArithmeticLogical.scala 59:20]
  wire [11:0] in2 = io_in[11:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module RandomHardware_1_2(
  input         clock,
  input  [23:0] io_in,
  output [11:0] io_out
);
  wire [23:0] Div_000_io_in; // @[RandomHardware_1_2.scala 15:26]
  wire [11:0] Div_000_io_out; // @[RandomHardware_1_2.scala 15:26]
  wire  Reg_001_clock; // @[RandomHardware_1_2.scala 16:26]
  wire [11:0] Reg_001_io_in; // @[RandomHardware_1_2.scala 16:26]
  wire [11:0] Reg_001_io_out; // @[RandomHardware_1_2.scala 16:26]
  Div Div_000 ( // @[RandomHardware_1_2.scala 15:26]
    .io_in(Div_000_io_in),
    .io_out(Div_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_1_2.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign Div_000_io_in = io_in; // @[RandomHardware_1_2.scala 18:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Div_000_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [32:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [31:0] r0; // @[Memory.scala 60:19]
  reg [31:0] r1; // @[Memory.scala 61:19]
  reg [31:0] r2; // @[Memory.scala 62:19]
  reg [31:0] r3; // @[Memory.scala 63:19]
  wire [32:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 32'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[31:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 32'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 32'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 32'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftLeft(
  input  [28:0] io_in,
  output [32:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_3_0(
  input         clock,
  input         reset,
  input  [28:0] io_in,
  output [31:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_3_0.scala 15:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_3_0.scala 15:42]
  wire [32:0] ResetShiftRegister_000_io_in; // @[RandomHardware_3_0.scala 15:42]
  wire [31:0] ResetShiftRegister_000_io_out; // @[RandomHardware_3_0.scala 15:42]
  wire [28:0] ShiftLeft_001_io_in; // @[RandomHardware_3_0.scala 16:34]
  wire [32:0] ShiftLeft_001_io_out; // @[RandomHardware_3_0.scala 16:34]
  ResetShiftRegister ResetShiftRegister_000 ( // @[RandomHardware_3_0.scala 15:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  ShiftLeft ShiftLeft_001 ( // @[RandomHardware_3_0.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ResetShiftRegister_000_io_out; // @[RandomHardware_3_0.scala 19:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = ShiftLeft_001_io_out; // @[RandomHardware_3_0.scala 13:24 RandomHardware_3_0.scala 21:18]
  assign ShiftLeft_001_io_in = io_in; // @[RandomHardware_3_0.scala 18:25]
endmodule
module RandomHardware_2_0(
  input         clock,
  input         reset,
  input  [28:0] io_in,
  output [31:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_2_0.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_2_0.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_2_0.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 14:42]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_0.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:33]
endmodule
module Accum(
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
module Accum_1(
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
module RandomHardware_1_3(
  input         clock,
  input         reset,
  input  [46:0] io_in,
  output [18:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_3.scala 16:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_3.scala 16:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_3.scala 16:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_3.scala 16:42]
  wire  Accum_001_clock; // @[RandomHardware_1_3.scala 17:34]
  wire [12:0] Accum_001_io_in; // @[RandomHardware_1_3.scala 17:34]
  wire [12:0] Accum_001_io_out; // @[RandomHardware_1_3.scala 17:34]
  wire  Accum_002_clock; // @[RandomHardware_1_3.scala 18:34]
  wire [5:0] Accum_002_io_in; // @[RandomHardware_1_3.scala 18:34]
  wire [5:0] Accum_002_io_out; // @[RandomHardware_1_3.scala 18:34]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_3.scala 16:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Accum Accum_001 ( // @[RandomHardware_1_3.scala 17:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  Accum_1 Accum_002 ( // @[RandomHardware_1_3.scala 18:34]
    .clock(Accum_002_clock),
    .io_in(Accum_002_io_in),
    .io_out(Accum_002_io_out)
  );
  assign io_out = {Accum_001_io_out,Accum_002_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in[28:0]; // @[RandomHardware_1_3.scala 20:33]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = RandomHardware_000_io_out[12:0]; // @[RandomHardware_1_3.scala 13:24 RandomHardware_1_3.scala 23:18]
  assign Accum_002_clock = clock;
  assign Accum_002_io_in = RandomHardware_000_io_out[11:6]; // @[RandomHardware_1_3.scala 24:47]
endmodule
module CompareMux(
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
module RandomHardware_1_4(
  input  [17:0] io_in,
  output [6:0]  io_out
);
  wire [17:0] CompareMux_000_io_in; // @[RandomHardware_1_4.scala 14:34]
  wire [6:0] CompareMux_000_io_out; // @[RandomHardware_1_4.scala 14:34]
  CompareMux CompareMux_000 ( // @[RandomHardware_1_4.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_4.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_4.scala 16:25]
endmodule
module Reg_3(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [12:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[12:0];
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
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_5.scala 14:26]
  wire [12:0] Reg_000_io_in; // @[RandomHardware_1_5.scala 14:26]
  wire [12:0] Reg_000_io_out; // @[RandomHardware_1_5.scala 14:26]
  Reg_3 Reg_000 ( // @[RandomHardware_1_5.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module RandomHardware_1_6(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [20:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_6.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_6.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_6.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_6.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_6.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[20:0]; // @[RandomHardware_1_6.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{13'd0}, io_in}; // @[RandomHardware_1_6.scala 16:33]
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
module ShiftRegister(
  input         clock,
  input  [39:0] io_in,
  output [39:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] r0; // @[Memory.scala 78:19]
  reg [39:0] r1; // @[Memory.scala 79:19]
  reg [39:0] r2; // @[Memory.scala 80:19]
  reg [39:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[39:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[39:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[39:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Add(
  input  [21:0] io_in,
  output [11:0] io_out
);
  wire [10:0] in1 = io_in[21:11]; // @[ArithmeticLogical.scala 13:20]
  wire [10:0] in2 = io_in[10:0]; // @[ArithmeticLogical.scala 14:20]
  wire [10:0] _io_out_T_1 = in1 + in2; // @[ArithmeticLogical.scala 15:19]
  assign io_out = {{1'd0}, _io_out_T_1}; // @[ArithmeticLogical.scala 15:19]
endmodule
module ReduceXorMux(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [4:0] IN1 = io_in[19:15]; // @[Muxes.scala 122:27]
  wire [4:0] IN2 = io_in[14:10]; // @[Muxes.scala 123:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module ShiftRegister_1(
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
module SignExtendDouble(
  input  [10:0] io_in,
  output [21:0] io_out
);
  wire [10:0] io_out_hi = io_in[10] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_3_1(
  input         clock,
  input  [25:0] io_in,
  output [21:0] io_out
);
  wire [19:0] ReduceXorMux_000_io_in; // @[RandomHardware_3_1.scala 16:34]
  wire [4:0] ReduceXorMux_000_io_out; // @[RandomHardware_3_1.scala 16:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_3_1.scala 17:42]
  wire [5:0] ShiftRegister_001_io_in; // @[RandomHardware_3_1.scala 17:42]
  wire [5:0] ShiftRegister_001_io_out; // @[RandomHardware_3_1.scala 17:42]
  wire [10:0] SignExtendDouble_002_io_in; // @[RandomHardware_3_1.scala 18:42]
  wire [21:0] SignExtendDouble_002_io_out; // @[RandomHardware_3_1.scala 18:42]
  wire [4:0] wire_000 = ReduceXorMux_000_io_out; // @[RandomHardware_3_1.scala 13:24 RandomHardware_3_1.scala 24:18]
  wire [5:0] wire_001 = ShiftRegister_001_io_out; // @[RandomHardware_3_1.scala 14:24 RandomHardware_3_1.scala 25:18]
  ReduceXorMux ReduceXorMux_000 ( // @[RandomHardware_3_1.scala 16:34]
    .io_in(ReduceXorMux_000_io_in),
    .io_out(ReduceXorMux_000_io_out)
  );
  ShiftRegister_1 ShiftRegister_001 ( // @[RandomHardware_3_1.scala 17:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  SignExtendDouble SignExtendDouble_002 ( // @[RandomHardware_3_1.scala 18:42]
    .io_in(SignExtendDouble_002_io_in),
    .io_out(SignExtendDouble_002_io_out)
  );
  assign io_out = SignExtendDouble_002_io_out; // @[RandomHardware_3_1.scala 22:10]
  assign ReduceXorMux_000_io_in = io_in[25:6]; // @[RandomHardware_3_1.scala 20:41]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in[25:20]; // @[RandomHardware_3_1.scala 21:41]
  assign SignExtendDouble_002_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_2(
  input         clock,
  input  [25:0] io_in,
  output [11:0] io_out
);
  wire [21:0] Add_000_io_in; // @[RandomHardware_2_2.scala 15:26]
  wire [11:0] Add_000_io_out; // @[RandomHardware_2_2.scala 15:26]
  wire  RandomHardware_001_clock; // @[RandomHardware_2_2.scala 16:42]
  wire [25:0] RandomHardware_001_io_in; // @[RandomHardware_2_2.scala 16:42]
  wire [21:0] RandomHardware_001_io_out; // @[RandomHardware_2_2.scala 16:42]
  Add Add_000 ( // @[RandomHardware_2_2.scala 15:26]
    .io_in(Add_000_io_in),
    .io_out(Add_000_io_out)
  );
  RandomHardware_3_1 RandomHardware_001 ( // @[RandomHardware_2_2.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Add_000_io_out; // @[RandomHardware_2_2.scala 19:10]
  assign Add_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_2_2.scala 13:24 RandomHardware_2_2.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_2_2.scala 18:33]
endmodule
module ShiftLeft_2(
  input  [26:0] io_in,
  output [27:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_2_3(
  input  [26:0] io_in,
  output [27:0] io_out
);
  wire [26:0] ShiftLeft_000_io_in; // @[RandomHardware_2_3.scala 14:34]
  wire [27:0] ShiftLeft_000_io_out; // @[RandomHardware_2_3.scala 14:34]
  ShiftLeft_2 ShiftLeft_000 ( // @[RandomHardware_2_3.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_2_3.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_2_3.scala 16:25]
endmodule
module RandomHardware_1_7(
  input         clock,
  input  [38:0] io_in,
  output [39:0] io_out
);
  wire [23:0] Mod_000_io_in; // @[RandomHardware_1_7.scala 17:26]
  wire [11:0] Mod_000_io_out; // @[RandomHardware_1_7.scala 17:26]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_7.scala 18:42]
  wire [39:0] ShiftRegister_001_io_in; // @[RandomHardware_1_7.scala 18:42]
  wire [39:0] ShiftRegister_001_io_out; // @[RandomHardware_1_7.scala 18:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_7.scala 19:42]
  wire [25:0] RandomHardware_002_io_in; // @[RandomHardware_1_7.scala 19:42]
  wire [11:0] RandomHardware_002_io_out; // @[RandomHardware_1_7.scala 19:42]
  wire [26:0] RandomHardware_003_io_in; // @[RandomHardware_1_7.scala 20:42]
  wire [27:0] RandomHardware_003_io_out; // @[RandomHardware_1_7.scala 20:42]
  wire [11:0] wire_001 = Mod_000_io_out; // @[RandomHardware_1_7.scala 14:24 RandomHardware_1_7.scala 27:18]
  wire [27:0] wire_002 = RandomHardware_003_io_out; // @[RandomHardware_1_7.scala 15:24 RandomHardware_1_7.scala 29:18]
  Mod Mod_000 ( // @[RandomHardware_1_7.scala 17:26]
    .io_in(Mod_000_io_in),
    .io_out(Mod_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_1_7.scala 18:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_7.scala 19:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_2_3 RandomHardware_003 ( // @[RandomHardware_1_7.scala 20:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_7.scala 24:10]
  assign Mod_000_io_in = {{12'd0}, RandomHardware_002_io_out}; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 28:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {{14'd0}, io_in[38:27]}; // @[RandomHardware_1_7.scala 22:41]
  assign RandomHardware_003_io_in = io_in[38:12]; // @[RandomHardware_1_7.scala 23:41]
endmodule
module RandomHardware_1_8(
  input         clock,
  input         reset,
  input  [20:0] io_in,
  output [20:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_8.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_8.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_8.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_8.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_8.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[20:0]; // @[RandomHardware_1_8.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{8'd0}, io_in}; // @[RandomHardware_1_8.scala 16:33]
endmodule
module RandomHardware_1_9(
  input         clock,
  input         reset,
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_9.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_9.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_9.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_9.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_9.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[12:0]; // @[RandomHardware_1_9.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{16'd0}, io_in}; // @[RandomHardware_1_9.scala 16:33]
endmodule
module ShiftRight(
  input  [19:0] io_in,
  output [19:0] io_out
);
  assign io_out = {{4'd0}, io_in[19:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftRight_1(
  input  [19:0] io_in,
  output [19:0] io_out
);
  assign io_out = {{2'd0}, io_in[19:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_10(
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire [19:0] ShiftRight_000_io_in; // @[RandomHardware_1_10.scala 15:34]
  wire [19:0] ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 15:34]
  wire [19:0] ShiftRight_001_io_in; // @[RandomHardware_1_10.scala 16:34]
  wire [19:0] ShiftRight_001_io_out; // @[RandomHardware_1_10.scala 16:34]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_10.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ShiftRight_1 ShiftRight_001 ( // @[RandomHardware_1_10.scala 16:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 19:10]
  assign ShiftRight_000_io_in = ShiftRight_001_io_out; // @[RandomHardware_1_10.scala 13:24 RandomHardware_1_10.scala 21:18]
  assign ShiftRight_001_io_in = io_in; // @[RandomHardware_1_10.scala 18:25]
endmodule
module RandomHardware_1_11(
  input         clock,
  input         reset,
  input  [20:0] io_in,
  output [4:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_11.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_11.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_11.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_11.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_11.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[4:0]; // @[RandomHardware_1_11.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{8'd0}, io_in}; // @[RandomHardware_1_11.scala 16:33]
endmodule
module ShiftRight_2(
  input  [11:0] io_in,
  output [11:0] io_out
);
  assign io_out = {{3'd0}, io_in[11:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_12(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] ShiftRight_000_io_in; // @[RandomHardware_1_12.scala 15:34]
  wire [11:0] ShiftRight_000_io_out; // @[RandomHardware_1_12.scala 15:34]
  wire  Reg_001_clock; // @[RandomHardware_1_12.scala 16:26]
  wire [11:0] Reg_001_io_in; // @[RandomHardware_1_12.scala 16:26]
  wire [11:0] Reg_001_io_out; // @[RandomHardware_1_12.scala 16:26]
  ShiftRight_2 ShiftRight_000 ( // @[RandomHardware_1_12.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_1_12.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign ShiftRight_000_io_in = Reg_001_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = io_in; // @[RandomHardware_1_12.scala 18:25]
endmodule
module Mul(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module SignExtendDouble_1(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] io_out_hi = io_in[11] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_13(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] Mul_000_io_in; // @[RandomHardware_1_13.scala 15:26]
  wire [11:0] Mul_000_io_out; // @[RandomHardware_1_13.scala 15:26]
  wire [11:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_13.scala 16:42]
  wire [23:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_13.scala 16:42]
  Mul Mul_000 ( // @[RandomHardware_1_13.scala 15:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_001 ( // @[RandomHardware_1_13.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_13.scala 19:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_13.scala 18:25]
  assign SignExtendDouble_001_io_in = Mul_000_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 21:18]
endmodule
module ShiftRight_3(
  input  [8:0] io_in,
  output [8:0] io_out
);
  assign io_out = {{2'd0}, io_in[8:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ReduceXorMux_1(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] IN1 = io_in[23:15]; // @[Muxes.scala 122:27]
  wire [8:0] IN2 = io_in[14:6]; // @[Muxes.scala 123:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 124:27]
  assign io_out = ^SEL ? IN1 : IN2; // @[Muxes.scala 126:18]
endmodule
module RandomHardware_2_1(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] ShiftRight_000_io_in; // @[RandomHardware_2_1.scala 15:34]
  wire [8:0] ShiftRight_000_io_out; // @[RandomHardware_2_1.scala 15:34]
  wire [23:0] ReduceXorMux_001_io_in; // @[RandomHardware_2_1.scala 16:34]
  wire [8:0] ReduceXorMux_001_io_out; // @[RandomHardware_2_1.scala 16:34]
  ShiftRight_3 ShiftRight_000 ( // @[RandomHardware_2_1.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  ReduceXorMux_1 ReduceXorMux_001 ( // @[RandomHardware_2_1.scala 16:34]
    .io_in(ReduceXorMux_001_io_in),
    .io_out(ReduceXorMux_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_2_1.scala 19:10]
  assign ShiftRight_000_io_in = ReduceXorMux_001_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 21:18]
  assign ReduceXorMux_001_io_in = io_in; // @[RandomHardware_2_1.scala 18:33]
endmodule
module RandomHardware_1_14(
  input         clock,
  input         reset,
  input  [29:0] io_in,
  output [1:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_14.scala 16:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_14.scala 16:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_14.scala 16:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 16:42]
  wire [23:0] RandomHardware_001_io_in; // @[RandomHardware_1_14.scala 17:42]
  wire [8:0] RandomHardware_001_io_out; // @[RandomHardware_1_14.scala 17:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_14.scala 18:42]
  wire [25:0] RandomHardware_002_io_in; // @[RandomHardware_1_14.scala 18:42]
  wire [11:0] RandomHardware_002_io_out; // @[RandomHardware_1_14.scala 18:42]
  wire [5:0] wire_000 = RandomHardware_001_io_out[5:0]; // @[RandomHardware_1_14.scala 13:24 RandomHardware_1_14.scala 24:18]
  wire [13:0] wire_001 = {{2'd0}, RandomHardware_002_io_out}; // @[RandomHardware_1_14.scala 14:24 RandomHardware_1_14.scala 25:18]
  wire [19:0] _RandomHardware_000_io_in_T = {wire_000,wire_001}; // @[Cat.scala 30:58]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_14.scala 16:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_14.scala 17:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_14.scala 18:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = RandomHardware_000_io_out[1:0]; // @[RandomHardware_1_14.scala 22:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{9'd0}, _RandomHardware_000_io_in_T}; // @[Cat.scala 30:58]
  assign RandomHardware_001_io_in = {{8'd0}, io_in[29:14]}; // @[RandomHardware_1_14.scala 20:41]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {{12'd0}, io_in[13:0]}; // @[RandomHardware_1_14.scala 21:41]
endmodule
module RandomHardware_1_15(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] Mul_000_io_in; // @[RandomHardware_1_15.scala 14:26]
  wire [11:0] Mul_000_io_out; // @[RandomHardware_1_15.scala 14:26]
  Mul Mul_000 ( // @[RandomHardware_1_15.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_15.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_15.scala 16:25]
endmodule
module ResetShiftRegister_7(
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
module RandomHardware_1_16(
  input         clock,
  input         reset,
  input  [23:0] io_in,
  output [16:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_16.scala 15:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_16.scala 15:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_16.scala 15:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_16.scala 15:42]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_16.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_16.scala 16:42]
  wire [17:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_16.scala 16:42]
  wire [16:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_16.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_16.scala 15:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ResetShiftRegister_7 ResetShiftRegister_001 ( // @[RandomHardware_1_16.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = ResetShiftRegister_001_io_out; // @[RandomHardware_1_16.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = {{5'd0}, io_in}; // @[RandomHardware_1_16.scala 18:33]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = RandomHardware_000_io_out[17:0]; // @[RandomHardware_1_16.scala 13:24 RandomHardware_1_16.scala 21:18]
endmodule
module RandomHardware_1_17(
  input         clock,
  input         reset,
  input  [28:0] io_in,
  output [31:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_17.scala 14:42]
  wire  RandomHardware_000_reset; // @[RandomHardware_1_17.scala 14:42]
  wire [28:0] RandomHardware_000_io_in; // @[RandomHardware_1_17.scala 14:42]
  wire [31:0] RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_17.scala 14:42]
    .clock(RandomHardware_000_clock),
    .reset(RandomHardware_000_reset),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_reset = reset;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:33]
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
module RandomHardware_1_18(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_18.scala 14:42]
  wire [14:0] ShiftRegister_000_io_in; // @[RandomHardware_1_18.scala 14:42]
  wire [14:0] ShiftRegister_000_io_out; // @[RandomHardware_1_18.scala 14:42]
  ShiftRegister_3 ShiftRegister_000 ( // @[RandomHardware_1_18.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:33]
endmodule
module ReduceOrMux(
  input  [33:0] io_in,
  output [11:0] io_out
);
  wire [11:0] IN1 = io_in[33:22]; // @[Muxes.scala 110:27]
  wire [11:0] IN2 = io_in[21:10]; // @[Muxes.scala 111:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftLeft_9(
  input  [11:0] io_in,
  output [16:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_19(
  input  [33:0] io_in,
  output [16:0] io_out
);
  wire [33:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_19.scala 15:34]
  wire [11:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_19.scala 15:34]
  wire [11:0] ShiftLeft_001_io_in; // @[RandomHardware_1_19.scala 16:34]
  wire [16:0] ShiftLeft_001_io_out; // @[RandomHardware_1_19.scala 16:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_19.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  ShiftLeft_9 ShiftLeft_001 ( // @[RandomHardware_1_19.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_19.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_19.scala 18:33]
  assign ShiftLeft_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_19.scala 13:24 RandomHardware_1_19.scala 21:18]
endmodule
module Accum_2(
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
module ResetShiftRegister_9(
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
module RandomHardware_1_21(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [14:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_21.scala 14:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_21.scala 14:42]
  wire [15:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_21.scala 14:42]
  wire [14:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 14:42]
  ResetShiftRegister_9 ResetShiftRegister_000 ( // @[RandomHardware_1_21.scala 14:42]
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
module Reg_5(
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
module RandomHardware_1_22(
  input         clock,
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_22.scala 15:26]
  wire [8:0] Reg_000_io_in; // @[RandomHardware_1_22.scala 15:26]
  wire [8:0] Reg_000_io_out; // @[RandomHardware_1_22.scala 15:26]
  wire [23:0] RandomHardware_001_io_in; // @[RandomHardware_1_22.scala 16:42]
  wire [8:0] RandomHardware_001_io_out; // @[RandomHardware_1_22.scala 16:42]
  Reg_5 Reg_000 ( // @[RandomHardware_1_22.scala 15:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_22.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_22.scala 19:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_22.scala 13:24 RandomHardware_1_22.scala 21:18]
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_22.scala 18:33]
endmodule
module Reg_6(
  input         clock,
  input  [28:0] io_in,
  output [28:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [28:0] io_out_REG; // @[Memory.scala 12:22]
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
  io_out_REG = _RAND_0[28:0];
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
  input  [28:0] io_in,
  output [28:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_23.scala 14:26]
  wire [28:0] Reg_000_io_in; // @[RandomHardware_1_23.scala 14:26]
  wire [28:0] Reg_000_io_out; // @[RandomHardware_1_23.scala 14:26]
  Reg_6 Reg_000 ( // @[RandomHardware_1_23.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:25]
endmodule
module RegE(
  input         clock,
  input  [51:0] io_in,
  output [50:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [50:0] data = io_in[51:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [49:0] reg_; // @[Memory.scala 22:18]
  wire [50:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[49:0];
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
  reg_ = _RAND_0[49:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux8(
  input  [50:0] io_in,
  output [5:0]  io_out
);
  wire [2:0] sel = io_in[50:48]; // @[Muxes.scala 44:18]
  wire [29:0] in7 = io_in[47:18]; // @[Muxes.scala 45:18]
  wire [29:0] in6 = io_in[41:12]; // @[Muxes.scala 46:18]
  wire [5:0] in5 = io_in[35:30]; // @[Muxes.scala 47:18]
  wire [5:0] in4 = io_in[29:24]; // @[Muxes.scala 48:18]
  wire [5:0] in3 = io_in[23:18]; // @[Muxes.scala 49:18]
  wire [5:0] in2 = io_in[17:12]; // @[Muxes.scala 50:18]
  wire [5:0] in1 = io_in[11:6]; // @[Muxes.scala 51:18]
  wire [5:0] in0 = io_in[5:0]; // @[Muxes.scala 52:18]
  wire [5:0] _GEN_0 = sel == 3'h1 ? in1 : in0; // @[Muxes.scala 59:32 Muxes.scala 59:41 Muxes.scala 60:36]
  wire [5:0] _GEN_1 = sel == 3'h2 ? in2 : _GEN_0; // @[Muxes.scala 58:32 Muxes.scala 58:41]
  wire [5:0] _GEN_2 = sel == 3'h3 ? in3 : _GEN_1; // @[Muxes.scala 57:32 Muxes.scala 57:41]
  wire [5:0] _GEN_3 = sel == 3'h4 ? in4 : _GEN_2; // @[Muxes.scala 56:32 Muxes.scala 56:41]
  wire [5:0] _GEN_4 = sel == 3'h5 ? in5 : _GEN_3; // @[Muxes.scala 55:32 Muxes.scala 55:41]
  wire [29:0] _GEN_5 = sel == 3'h6 ? in6 : {{24'd0}, _GEN_4}; // @[Muxes.scala 54:32 Muxes.scala 54:41]
  wire [29:0] _GEN_6 = sel == 3'h7 ? in7 : _GEN_5; // @[Muxes.scala 53:32 Muxes.scala 53:41]
  assign io_out = _GEN_6[5:0];
endmodule
module ShiftRight_5(
  input  [51:0] io_in,
  output [51:0] io_out
);
  assign io_out = {{2'd0}, io_in[51:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_24(
  input         clock,
  input  [51:0] io_in,
  output [17:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_24.scala 17:26]
  wire [51:0] RegE_000_io_in; // @[RandomHardware_1_24.scala 17:26]
  wire [50:0] RegE_000_io_out; // @[RandomHardware_1_24.scala 17:26]
  wire [50:0] Mux8_001_io_in; // @[RandomHardware_1_24.scala 18:26]
  wire [5:0] Mux8_001_io_out; // @[RandomHardware_1_24.scala 18:26]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_24.scala 19:42]
  wire [25:0] RandomHardware_002_io_in; // @[RandomHardware_1_24.scala 19:42]
  wire [11:0] RandomHardware_002_io_out; // @[RandomHardware_1_24.scala 19:42]
  wire [51:0] ShiftRight_003_io_in; // @[RandomHardware_1_24.scala 20:34]
  wire [51:0] ShiftRight_003_io_out; // @[RandomHardware_1_24.scala 20:34]
  RegE RegE_000 ( // @[RandomHardware_1_24.scala 17:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  Mux8 Mux8_001 ( // @[RandomHardware_1_24.scala 18:26]
    .io_in(Mux8_001_io_in),
    .io_out(Mux8_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_24.scala 19:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftRight_5 ShiftRight_003 ( // @[RandomHardware_1_24.scala 20:34]
    .io_in(ShiftRight_003_io_in),
    .io_out(ShiftRight_003_io_out)
  );
  assign io_out = {Mux8_001_io_out,RandomHardware_002_io_out}; // @[Cat.scala 30:58]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = ShiftRight_003_io_out; // @[RandomHardware_1_24.scala 14:24 RandomHardware_1_24.scala 27:18]
  assign Mux8_001_io_in = RegE_000_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 26:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = ShiftRight_003_io_out[51:26]; // @[RandomHardware_1_24.scala 28:43]
  assign ShiftRight_003_io_in = io_in; // @[RandomHardware_1_24.scala 22:25]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [84:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware.scala 46:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware.scala 46:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware.scala 46:42]
  wire  Reg_001_clock; // @[RandomHardware.scala 47:26]
  wire [6:0] Reg_001_io_in; // @[RandomHardware.scala 47:26]
  wire [6:0] Reg_001_io_out; // @[RandomHardware.scala 47:26]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 48:42]
  wire [23:0] RandomHardware_002_io_in; // @[RandomHardware.scala 48:42]
  wire [11:0] RandomHardware_002_io_out; // @[RandomHardware.scala 48:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 49:42]
  wire  RandomHardware_003_reset; // @[RandomHardware.scala 49:42]
  wire [46:0] RandomHardware_003_io_in; // @[RandomHardware.scala 49:42]
  wire [18:0] RandomHardware_003_io_out; // @[RandomHardware.scala 49:42]
  wire [17:0] RandomHardware_004_io_in; // @[RandomHardware.scala 50:42]
  wire [6:0] RandomHardware_004_io_out; // @[RandomHardware.scala 50:42]
  wire  RandomHardware_005_clock; // @[RandomHardware.scala 51:42]
  wire [12:0] RandomHardware_005_io_in; // @[RandomHardware.scala 51:42]
  wire [12:0] RandomHardware_005_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_006_clock; // @[RandomHardware.scala 52:42]
  wire  RandomHardware_006_reset; // @[RandomHardware.scala 52:42]
  wire [15:0] RandomHardware_006_io_in; // @[RandomHardware.scala 52:42]
  wire [20:0] RandomHardware_006_io_out; // @[RandomHardware.scala 52:42]
  wire  RandomHardware_007_clock; // @[RandomHardware.scala 53:42]
  wire [38:0] RandomHardware_007_io_in; // @[RandomHardware.scala 53:42]
  wire [39:0] RandomHardware_007_io_out; // @[RandomHardware.scala 53:42]
  wire  RandomHardware_008_clock; // @[RandomHardware.scala 54:42]
  wire  RandomHardware_008_reset; // @[RandomHardware.scala 54:42]
  wire [20:0] RandomHardware_008_io_in; // @[RandomHardware.scala 54:42]
  wire [20:0] RandomHardware_008_io_out; // @[RandomHardware.scala 54:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 55:42]
  wire  RandomHardware_009_reset; // @[RandomHardware.scala 55:42]
  wire [12:0] RandomHardware_009_io_in; // @[RandomHardware.scala 55:42]
  wire [12:0] RandomHardware_009_io_out; // @[RandomHardware.scala 55:42]
  wire [19:0] RandomHardware_010_io_in; // @[RandomHardware.scala 56:42]
  wire [19:0] RandomHardware_010_io_out; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 57:42]
  wire  RandomHardware_011_reset; // @[RandomHardware.scala 57:42]
  wire [20:0] RandomHardware_011_io_in; // @[RandomHardware.scala 57:42]
  wire [4:0] RandomHardware_011_io_out; // @[RandomHardware.scala 57:42]
  wire  RandomHardware_012_clock; // @[RandomHardware.scala 58:42]
  wire [11:0] RandomHardware_012_io_in; // @[RandomHardware.scala 58:42]
  wire [11:0] RandomHardware_012_io_out; // @[RandomHardware.scala 58:42]
  wire [11:0] RandomHardware_013_io_in; // @[RandomHardware.scala 59:42]
  wire [23:0] RandomHardware_013_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_014_reset; // @[RandomHardware.scala 60:42]
  wire [29:0] RandomHardware_014_io_in; // @[RandomHardware.scala 60:42]
  wire [1:0] RandomHardware_014_io_out; // @[RandomHardware.scala 60:42]
  wire [11:0] RandomHardware_015_io_in; // @[RandomHardware.scala 61:42]
  wire [11:0] RandomHardware_015_io_out; // @[RandomHardware.scala 61:42]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 62:42]
  wire  RandomHardware_016_reset; // @[RandomHardware.scala 62:42]
  wire [23:0] RandomHardware_016_io_in; // @[RandomHardware.scala 62:42]
  wire [16:0] RandomHardware_016_io_out; // @[RandomHardware.scala 62:42]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_017_reset; // @[RandomHardware.scala 63:42]
  wire [28:0] RandomHardware_017_io_in; // @[RandomHardware.scala 63:42]
  wire [31:0] RandomHardware_017_io_out; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_018_clock; // @[RandomHardware.scala 64:42]
  wire [14:0] RandomHardware_018_io_in; // @[RandomHardware.scala 64:42]
  wire [14:0] RandomHardware_018_io_out; // @[RandomHardware.scala 64:42]
  wire [33:0] RandomHardware_019_io_in; // @[RandomHardware.scala 65:42]
  wire [16:0] RandomHardware_019_io_out; // @[RandomHardware.scala 65:42]
  wire  Accum_020_clock; // @[RandomHardware.scala 66:34]
  wire [4:0] Accum_020_io_in; // @[RandomHardware.scala 66:34]
  wire [4:0] Accum_020_io_out; // @[RandomHardware.scala 66:34]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_021_reset; // @[RandomHardware.scala 67:42]
  wire [15:0] RandomHardware_021_io_in; // @[RandomHardware.scala 67:42]
  wire [14:0] RandomHardware_021_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 68:42]
  wire [23:0] RandomHardware_022_io_in; // @[RandomHardware.scala 68:42]
  wire [8:0] RandomHardware_022_io_out; // @[RandomHardware.scala 68:42]
  wire  RandomHardware_023_clock; // @[RandomHardware.scala 69:42]
  wire [28:0] RandomHardware_023_io_in; // @[RandomHardware.scala 69:42]
  wire [28:0] RandomHardware_023_io_out; // @[RandomHardware.scala 69:42]
  wire  RandomHardware_024_clock; // @[RandomHardware.scala 70:42]
  wire [51:0] RandomHardware_024_io_in; // @[RandomHardware.scala 70:42]
  wire [17:0] RandomHardware_024_io_out; // @[RandomHardware.scala 70:42]
  wire [18:0] io_out_lo = {RandomHardware_014_io_out,RandomHardware_019_io_out}; // @[Cat.scala 30:58]
  wire [65:0] io_out_hi = {Reg_001_io_out,RandomHardware_003_io_out,RandomHardware_007_io_out}; // @[Cat.scala 30:58]
  wire [5:0] wire_005 = RandomHardware_012_io_out[5:0]; // @[RandomHardware.scala 92:47]
  wire [6:0] wire_006 = RandomHardware_018_io_out[13:7]; // @[RandomHardware.scala 104:47]
  wire [11:0] wire_010 = RandomHardware_015_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 122:18]
  wire [8:0] wire_011 = RandomHardware_022_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 110:18]
  wire [5:0] wire_009 = RandomHardware_012_io_out[11:6]; // @[RandomHardware.scala 93:47]
  wire [14:0] wire_019 = RandomHardware_021_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 124:18]
  wire [4:0] wire_018 = RandomHardware_016_io_out[4:0]; // @[RandomHardware.scala 98:47]
  wire [4:0] wire_025 = RandomHardware_016_io_out[12:8]; // @[RandomHardware.scala 99:47]
  wire [12:0] wire_028 = RandomHardware_009_io_out; // @[RandomHardware.scala 41:24 RandomHardware.scala 88:18]
  wire [14:0] wire_029 = RandomHardware_018_io_out; // @[RandomHardware.scala 42:24 RandomHardware.scala 105:18]
  wire [27:0] _RandomHardware_022_io_in_T = {wire_028,wire_029}; // @[Cat.scala 30:58]
  wire [16:0] wire_031 = RandomHardware_016_io_out; // @[RandomHardware.scala 44:24 RandomHardware.scala 100:18]
  wire [19:0] wire_013 = RandomHardware_010_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 121:18]
  wire [31:0] wire_021 = RandomHardware_017_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 102:18]
  wire [23:0] wire_001 = RandomHardware_013_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 95:18]
  wire [4:0] wire_002 = Accum_020_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 107:18]
  wire [28:0] RandomHardware_003_io_in_hi = {wire_001,wire_002}; // @[Cat.scala 30:58]
  wire [17:0] wire_003 = RandomHardware_024_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 115:18]
  wire [11:0] wire_007 = RandomHardware_002_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 119:18]
  wire [20:0] wire_008 = RandomHardware_008_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 85:18]
  wire [32:0] RandomHardware_007_io_in_hi = {wire_007,wire_008}; // @[Cat.scala 30:58]
  wire [25:0] _RandomHardware_014_io_in_T = {wire_008,wire_018}; // @[Cat.scala 30:58]
  wire [28:0] RandomHardware_019_io_in_hi = {wire_001,wire_025}; // @[Cat.scala 30:58]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 46:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Reg_1 Reg_001 ( // @[RandomHardware.scala 47:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 48:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 49:42]
    .clock(RandomHardware_003_clock),
    .reset(RandomHardware_003_reset),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 50:42]
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 51:42]
    .clock(RandomHardware_005_clock),
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_006_clock),
    .reset(RandomHardware_006_reset),
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 53:42]
    .clock(RandomHardware_007_clock),
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_008_clock),
    .reset(RandomHardware_008_reset),
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 55:42]
    .clock(RandomHardware_009_clock),
    .reset(RandomHardware_009_reset),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 56:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 57:42]
    .clock(RandomHardware_011_clock),
    .reset(RandomHardware_011_reset),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 58:42]
    .clock(RandomHardware_012_clock),
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 59:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_014_clock),
    .reset(RandomHardware_014_reset),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 61:42]
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 62:42]
    .clock(RandomHardware_016_clock),
    .reset(RandomHardware_016_reset),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 63:42]
    .clock(RandomHardware_017_clock),
    .reset(RandomHardware_017_reset),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 64:42]
    .clock(RandomHardware_018_clock),
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  Accum_2 Accum_020 ( // @[RandomHardware.scala 66:34]
    .clock(Accum_020_clock),
    .io_in(Accum_020_io_in),
    .io_out(Accum_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 67:42]
    .clock(RandomHardware_021_clock),
    .reset(RandomHardware_021_reset),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_022_clock),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 69:42]
    .clock(RandomHardware_023_clock),
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 70:42]
    .clock(RandomHardware_024_clock),
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[99:88]; // @[RandomHardware.scala 72:41]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = RandomHardware_004_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 81:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = io_in[99:76]; // @[RandomHardware.scala 73:41]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_reset = reset;
  assign RandomHardware_003_io_in = {RandomHardware_003_io_in_hi,wire_003}; // @[Cat.scala 30:58]
  assign RandomHardware_004_io_in = RandomHardware_024_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 116:18]
  assign RandomHardware_005_clock = clock;
  assign RandomHardware_005_io_in = {wire_005,wire_006}; // @[Cat.scala 30:58]
  assign RandomHardware_006_clock = clock;
  assign RandomHardware_006_reset = reset;
  assign RandomHardware_006_io_in = io_in[99:84]; // @[RandomHardware.scala 74:41]
  assign RandomHardware_007_clock = clock;
  assign RandomHardware_007_io_in = {RandomHardware_007_io_in_hi,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_008_clock = clock;
  assign RandomHardware_008_reset = reset;
  assign RandomHardware_008_io_in = {wire_010,wire_011}; // @[Cat.scala 30:58]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_reset = reset;
  assign RandomHardware_009_io_in = RandomHardware_005_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 83:18]
  assign RandomHardware_010_io_in = io_in[19:0]; // @[RandomHardware.scala 75:41]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_reset = reset;
  assign RandomHardware_011_io_in = RandomHardware_006_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 120:18]
  assign RandomHardware_012_clock = clock;
  assign RandomHardware_012_io_in = RandomHardware_000_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 117:18]
  assign RandomHardware_013_io_in = RandomHardware_000_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 118:18]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_reset = reset;
  assign RandomHardware_014_io_in = {{4'd0}, _RandomHardware_014_io_in_T}; // @[Cat.scala 30:58]
  assign RandomHardware_015_io_in = io_in[99:88]; // @[RandomHardware.scala 76:41]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_reset = reset;
  assign RandomHardware_016_io_in = {wire_019,wire_011}; // @[Cat.scala 30:58]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_reset = reset;
  assign RandomHardware_017_io_in = RandomHardware_023_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 113:18]
  assign RandomHardware_018_clock = clock;
  assign RandomHardware_018_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 125:18]
  assign RandomHardware_019_io_in = {RandomHardware_019_io_in_hi,wire_002}; // @[Cat.scala 30:58]
  assign Accum_020_clock = clock;
  assign Accum_020_io_in = RandomHardware_011_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 90:18]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_reset = reset;
  assign RandomHardware_021_io_in = io_in[15:0]; // @[RandomHardware.scala 77:41]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_io_in = _RandomHardware_022_io_in_T[23:0]; // @[RandomHardware.scala 109:33]
  assign RandomHardware_023_clock = clock;
  assign RandomHardware_023_io_in = {wire_010,wire_031}; // @[Cat.scala 30:58]
  assign RandomHardware_024_clock = clock;
  assign RandomHardware_024_io_in = {wire_013,wire_021}; // @[Cat.scala 30:58]
endmodule
