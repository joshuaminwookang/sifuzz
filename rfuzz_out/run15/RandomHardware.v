module ReduceOrMux(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[19:13]; // @[Muxes.scala 110:27]
  wire [6:0] IN2 = io_in[12:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module SignExtendDouble(
  input  [6:0]  io_in,
  output [13:0] io_out
);
  wire [6:0] io_out_hi = io_in[6] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_0(
  input  [19:0] io_in,
  output [13:0] io_out
);
  wire [19:0] ReduceOrMux_000_io_in; // @[RandomHardware_2_0.scala 15:34]
  wire [6:0] ReduceOrMux_000_io_out; // @[RandomHardware_2_0.scala 15:34]
  wire [6:0] SignExtendDouble_001_io_in; // @[RandomHardware_2_0.scala 16:42]
  wire [13:0] SignExtendDouble_001_io_out; // @[RandomHardware_2_0.scala 16:42]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_2_0.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_2_0.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_2_0.scala 18:33]
  assign SignExtendDouble_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
endmodule
module RandomHardware_1_0(
  input  [19:0] io_in,
  output [8:0]  io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_0.scala 14:42]
  wire [13:0] RandomHardware_000_io_out; // @[RandomHardware_1_0.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_0.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[8:0]; // @[RandomHardware_1_0.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_0.scala 16:33]
endmodule
module Accum(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[19:0];
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
  wire  Accum_000_clock; // @[RandomHardware_1_1.scala 14:34]
  wire [19:0] Accum_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [19:0] Accum_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  Accum Accum_000 ( // @[RandomHardware_1_1.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:25]
endmodule
module Mux4(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [1:0] sel = io_in[17:16]; // @[Muxes.scala 28:18]
  wire [3:0] in3 = io_in[15:12]; // @[Muxes.scala 29:18]
  wire [3:0] in2 = io_in[11:8]; // @[Muxes.scala 30:18]
  wire [3:0] in1 = io_in[7:4]; // @[Muxes.scala 31:18]
  wire [3:0] in0 = io_in[3:0]; // @[Muxes.scala 32:18]
  wire [3:0] _GEN_0 = sel == 2'h1 ? in1 : in0; // @[Muxes.scala 35:31 Muxes.scala 35:40 Muxes.scala 36:36]
  wire [3:0] _GEN_1 = sel == 2'h2 ? in2 : _GEN_0; // @[Muxes.scala 34:31 Muxes.scala 34:40]
  assign io_out = sel == 2'h3 ? in3 : _GEN_1; // @[Muxes.scala 33:31 Muxes.scala 33:40]
endmodule
module ResetShiftRegister(
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
module RandomHardware_1_2(
  input         clock,
  input         reset,
  input  [18:0] io_in,
  output [3:0]  io_out
);
  wire [17:0] Mux4_000_io_in; // @[RandomHardware_1_2.scala 15:26]
  wire [3:0] Mux4_000_io_out; // @[RandomHardware_1_2.scala 15:26]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_2.scala 16:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_2.scala 16:42]
  wire [18:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_2.scala 16:42]
  wire [17:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_2.scala 16:42]
  Mux4 Mux4_000 ( // @[RandomHardware_1_2.scala 15:26]
    .io_in(Mux4_000_io_in),
    .io_out(Mux4_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_1_2.scala 16:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  assign io_out = Mux4_000_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign Mux4_000_io_in = ResetShiftRegister_001_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = io_in; // @[RandomHardware_1_2.scala 18:33]
endmodule
module ShiftRight(
  input  [6:0] io_in,
  output [6:0] io_out
);
  assign io_out = {{5'd0}, io_in[6:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module SignExtendDouble_1(
  input  [5:0]  io_in,
  output [11:0] io_out
);
  wire [5:0] io_out_hi = io_in[5] ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Mux2(
  input  [28:0] io_in,
  output [13:0] io_out
);
  wire  sel = io_in[28]; // @[Muxes.scala 16:18]
  wire [13:0] in1 = io_in[27:14]; // @[Muxes.scala 17:18]
  wire [13:0] in0 = io_in[13:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_5(
  input  [28:0] io_in,
  output [13:0] io_out
);
  wire [28:0] Mux2_000_io_in; // @[RandomHardware_1_5.scala 14:26]
  wire [13:0] Mux2_000_io_out; // @[RandomHardware_1_5.scala 14:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_5.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module RandomHardware_1_6(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_6.scala 14:42]
  wire [13:0] RandomHardware_000_io_out; // @[RandomHardware_1_6.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_6.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[11:0]; // @[RandomHardware_1_6.scala 17:10]
  assign RandomHardware_000_io_in = {{8'd0}, io_in}; // @[RandomHardware_1_6.scala 16:33]
endmodule
module SignExtendDouble_3(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] io_out_hi = io_in[11] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module CompareMux(
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
module RandomHardware_1_7(
  input  [11:0] io_in,
  output [6:0]  io_out
);
  wire [11:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_7.scala 15:42]
  wire [23:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_7.scala 15:42]
  wire [23:0] CompareMux_001_io_in; // @[RandomHardware_1_7.scala 16:34]
  wire [6:0] CompareMux_001_io_out; // @[RandomHardware_1_7.scala 16:34]
  SignExtendDouble_3 SignExtendDouble_000 ( // @[RandomHardware_1_7.scala 15:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_1_7.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = CompareMux_001_io_out; // @[RandomHardware_1_7.scala 19:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_1_7.scala 18:33]
  assign CompareMux_001_io_in = SignExtendDouble_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 21:18]
endmodule
module ShiftLeft(
  input  [9:0]  io_in,
  output [12:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module And(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 36:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module RandomHardware_1_9(
  input  [19:0] io_in,
  output [12:0] io_out
);
  wire [9:0] ShiftLeft_000_io_in; // @[RandomHardware_1_9.scala 15:34]
  wire [12:0] ShiftLeft_000_io_out; // @[RandomHardware_1_9.scala 15:34]
  wire [19:0] And_001_io_in; // @[RandomHardware_1_9.scala 16:26]
  wire [9:0] And_001_io_out; // @[RandomHardware_1_9.scala 16:26]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware_1_9.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  And And_001 ( // @[RandomHardware_1_9.scala 16:26]
    .io_in(And_001_io_in),
    .io_out(And_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_9.scala 19:10]
  assign ShiftLeft_000_io_in = And_001_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 21:18]
  assign And_001_io_in = io_in; // @[RandomHardware_1_9.scala 18:25]
endmodule
module Mux2_1(
  input  [32:0] io_in,
  output [15:0] io_out
);
  wire  sel = io_in[32]; // @[Muxes.scala 16:18]
  wire [15:0] in1 = io_in[31:16]; // @[Muxes.scala 17:18]
  wire [15:0] in0 = io_in[15:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_10(
  input  [32:0] io_in,
  output [15:0] io_out
);
  wire [32:0] Mux2_000_io_in; // @[RandomHardware_1_10.scala 14:26]
  wire [15:0] Mux2_000_io_out; // @[RandomHardware_1_10.scala 14:26]
  Mux2_1 Mux2_000 ( // @[RandomHardware_1_10.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_10.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_10.scala 16:25]
endmodule
module Mul(
  input  [5:0] io_in,
  output [5:0] io_out
);
  wire [2:0] in1 = io_in[5:3]; // @[ArithmeticLogical.scala 47:20]
  wire [2:0] in2 = io_in[2:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module ReduceOrMux_3(
  input  [31:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[31:17]; // @[Muxes.scala 110:27]
  wire [14:0] IN2 = io_in[16:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module ShiftLeft_1(
  input  [14:0] io_in,
  output [19:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_12(
  input  [31:0] io_in,
  output [19:0] io_out
);
  wire [31:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_12.scala 15:34]
  wire [14:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_12.scala 15:34]
  wire [14:0] ShiftLeft_001_io_in; // @[RandomHardware_1_12.scala 16:34]
  wire [19:0] ShiftLeft_001_io_out; // @[RandomHardware_1_12.scala 16:34]
  ReduceOrMux_3 ReduceOrMux_000 ( // @[RandomHardware_1_12.scala 15:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  ShiftLeft_1 ShiftLeft_001 ( // @[RandomHardware_1_12.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_1_12.scala 19:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_12.scala 18:33]
  assign ShiftLeft_001_io_in = ReduceOrMux_000_io_out; // @[RandomHardware_1_12.scala 13:24 RandomHardware_1_12.scala 21:18]
endmodule
module ReduceOrMux_4(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] IN1 = io_in[23:16]; // @[Muxes.scala 110:27]
  wire [7:0] IN2 = io_in[15:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_13(
  input  [23:0] io_in,
  output [7:0]  io_out
);
  wire [23:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_13.scala 14:34]
  wire [7:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_13.scala 14:34]
  ReduceOrMux_4 ReduceOrMux_000 ( // @[RandomHardware_1_13.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:33]
endmodule
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
module RandomHardware_1_14(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_14.scala 14:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_1_14.scala 14:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_1_14.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_1_14.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_14.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_14.scala 16:25]
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
module Accum_1(
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
module RandomHardware_2_2(
  input         clock,
  input  [13:0] io_in,
  output [13:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_2_2.scala 14:34]
  wire [13:0] Accum_000_io_in; // @[RandomHardware_2_2.scala 14:34]
  wire [13:0] Accum_000_io_out; // @[RandomHardware_2_2.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_2_2.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_2_2.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_2_2.scala 16:25]
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [19:0] io_in,
  output [13:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_15.scala 16:42]
  wire [13:0] RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 16:42]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_15.scala 17:42]
  wire [13:0] ShiftRegister_001_io_in; // @[RandomHardware_1_15.scala 17:42]
  wire [13:0] ShiftRegister_001_io_out; // @[RandomHardware_1_15.scala 17:42]
  wire  RandomHardware_002_clock; // @[RandomHardware_1_15.scala 18:42]
  wire [13:0] RandomHardware_002_io_in; // @[RandomHardware_1_15.scala 18:42]
  wire [13:0] RandomHardware_002_io_out; // @[RandomHardware_1_15.scala 18:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_15.scala 16:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_1_15.scala 17:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_15.scala 18:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  assign io_out = ShiftRegister_001_io_out; // @[RandomHardware_1_15.scala 21:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_15.scala 20:33]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = RandomHardware_002_io_out; // @[RandomHardware_1_15.scala 14:24 RandomHardware_1_15.scala 24:18]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 25:18]
endmodule
module Div(
  input  [17:0] io_in,
  output [8:0]  io_out
);
  wire [8:0] in1 = io_in[17:9]; // @[ArithmeticLogical.scala 59:20]
  wire [8:0] in2 = io_in[8:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module RandomHardware_1_17(
  input  [17:0] io_in,
  output [8:0]  io_out
);
  wire [17:0] Div_000_io_in; // @[RandomHardware_1_17.scala 14:26]
  wire [8:0] Div_000_io_out; // @[RandomHardware_1_17.scala 14:26]
  Div Div_000 ( // @[RandomHardware_1_17.scala 14:26]
    .io_in(Div_000_io_in),
    .io_out(Div_000_io_out)
  );
  assign io_out = Div_000_io_out; // @[RandomHardware_1_17.scala 17:10]
  assign Div_000_io_in = io_in; // @[RandomHardware_1_17.scala 16:25]
endmodule
module RegE(
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
module RandomHardware_1_18(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_18.scala 14:26]
  wire [19:0] RegE_000_io_in; // @[RandomHardware_1_18.scala 14:26]
  wire [18:0] RegE_000_io_out; // @[RandomHardware_1_18.scala 14:26]
  RegE RegE_000 ( // @[RandomHardware_1_18.scala 14:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  assign io_out = RegE_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module Reg_2(
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
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [71:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware.scala 36:42]
  wire [8:0] RandomHardware_000_io_out; // @[RandomHardware.scala 36:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 37:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 37:42]
  wire [19:0] RandomHardware_001_io_out; // @[RandomHardware.scala 37:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 38:42]
  wire  RandomHardware_002_reset; // @[RandomHardware.scala 38:42]
  wire [18:0] RandomHardware_002_io_in; // @[RandomHardware.scala 38:42]
  wire [3:0] RandomHardware_002_io_out; // @[RandomHardware.scala 38:42]
  wire [6:0] ShiftRight_003_io_in; // @[RandomHardware.scala 39:34]
  wire [6:0] ShiftRight_003_io_out; // @[RandomHardware.scala 39:34]
  wire [5:0] SignExtendDouble_004_io_in; // @[RandomHardware.scala 40:42]
  wire [11:0] SignExtendDouble_004_io_out; // @[RandomHardware.scala 40:42]
  wire [28:0] RandomHardware_005_io_in; // @[RandomHardware.scala 41:42]
  wire [13:0] RandomHardware_005_io_out; // @[RandomHardware.scala 41:42]
  wire [11:0] RandomHardware_006_io_in; // @[RandomHardware.scala 42:42]
  wire [11:0] RandomHardware_006_io_out; // @[RandomHardware.scala 42:42]
  wire [11:0] RandomHardware_007_io_in; // @[RandomHardware.scala 43:42]
  wire [6:0] RandomHardware_007_io_out; // @[RandomHardware.scala 43:42]
  wire [11:0] RandomHardware_008_io_in; // @[RandomHardware.scala 44:42]
  wire [11:0] RandomHardware_008_io_out; // @[RandomHardware.scala 44:42]
  wire [19:0] RandomHardware_009_io_in; // @[RandomHardware.scala 45:42]
  wire [12:0] RandomHardware_009_io_out; // @[RandomHardware.scala 45:42]
  wire [32:0] RandomHardware_010_io_in; // @[RandomHardware.scala 46:42]
  wire [15:0] RandomHardware_010_io_out; // @[RandomHardware.scala 46:42]
  wire [5:0] Mul_011_io_in; // @[RandomHardware.scala 47:26]
  wire [5:0] Mul_011_io_out; // @[RandomHardware.scala 47:26]
  wire [31:0] RandomHardware_012_io_in; // @[RandomHardware.scala 48:42]
  wire [19:0] RandomHardware_012_io_out; // @[RandomHardware.scala 48:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 49:42]
  wire [7:0] RandomHardware_013_io_out; // @[RandomHardware.scala 49:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 50:42]
  wire [11:0] RandomHardware_014_io_in; // @[RandomHardware.scala 50:42]
  wire [11:0] RandomHardware_014_io_out; // @[RandomHardware.scala 50:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 51:42]
  wire [19:0] RandomHardware_015_io_in; // @[RandomHardware.scala 51:42]
  wire [13:0] RandomHardware_015_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_016_clock; // @[RandomHardware.scala 52:42]
  wire [11:0] RandomHardware_016_io_in; // @[RandomHardware.scala 52:42]
  wire [11:0] RandomHardware_016_io_out; // @[RandomHardware.scala 52:42]
  wire [17:0] RandomHardware_017_io_in; // @[RandomHardware.scala 53:42]
  wire [8:0] RandomHardware_017_io_out; // @[RandomHardware.scala 53:42]
  wire  RandomHardware_018_clock; // @[RandomHardware.scala 54:42]
  wire [19:0] RandomHardware_018_io_in; // @[RandomHardware.scala 54:42]
  wire [18:0] RandomHardware_018_io_out; // @[RandomHardware.scala 54:42]
  wire  Reg_019_clock; // @[RandomHardware.scala 55:26]
  wire [5:0] Reg_019_io_in; // @[RandomHardware.scala 55:26]
  wire [5:0] Reg_019_io_out; // @[RandomHardware.scala 55:26]
  wire [44:0] io_out_lo = {Mul_011_io_out,RandomHardware_012_io_out,RandomHardware_018_io_out}; // @[Cat.scala 30:58]
  wire [26:0] io_out_hi = {RandomHardware_002_io_out,ShiftRight_003_io_out,RandomHardware_010_io_out}; // @[Cat.scala 30:58]
  wire [8:0] wire_004 = RandomHardware_000_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 83:18]
  wire [19:0] wire_005 = RandomHardware_001_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 84:18]
  wire [7:0] wire_008 = RandomHardware_013_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 91:18]
  wire [11:0] wire_009 = RandomHardware_016_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 93:18]
  wire [6:0] wire_017 = RandomHardware_007_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 90:18]
  wire [12:0] wire_018 = RandomHardware_009_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 73:18]
  wire [5:0] wire_019 = RandomHardware_006_io_out[11:6]; // @[RandomHardware.scala 86:47]
  wire [11:0] wire_020 = RandomHardware_014_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 75:18]
  wire [11:0] wire_000 = SignExtendDouble_004_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 66:18]
  wire [13:0] wire_011 = RandomHardware_015_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 77:18]
  wire [26:0] _RandomHardware_010_io_in_T = {wire_018,wire_011}; // @[Cat.scala 30:58]
  wire [13:0] wire_013 = RandomHardware_005_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 68:18]
  wire [11:0] wire_014 = RandomHardware_008_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 70:18]
  wire [8:0] wire_015 = RandomHardware_017_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 79:18]
  wire [34:0] _RandomHardware_012_io_in_T = {wire_013,wire_014,wire_015}; // @[Cat.scala 30:58]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 36:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 37:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 38:42]
    .clock(RandomHardware_002_clock),
    .reset(RandomHardware_002_reset),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftRight ShiftRight_003 ( // @[RandomHardware.scala 39:34]
    .io_in(ShiftRight_003_io_in),
    .io_out(ShiftRight_003_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_004 ( // @[RandomHardware.scala 40:42]
    .io_in(SignExtendDouble_004_io_in),
    .io_out(SignExtendDouble_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 41:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 42:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 43:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_6 RandomHardware_008 ( // @[RandomHardware.scala 44:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 45:42]
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 46:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  Mul Mul_011 ( // @[RandomHardware.scala 47:26]
    .io_in(Mul_011_io_in),
    .io_out(Mul_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 48:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 49:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 50:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 51:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_14 RandomHardware_016 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_016_clock),
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_018_clock),
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  Reg_2 Reg_019 ( // @[RandomHardware.scala 55:26]
    .clock(Reg_019_clock),
    .io_in(Reg_019_io_in),
    .io_out(Reg_019_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[19:0]; // @[RandomHardware.scala 57:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in[19:0]; // @[RandomHardware.scala 58:41]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_reset = reset;
  assign RandomHardware_002_io_in = {wire_000,wire_017}; // @[Cat.scala 30:58]
  assign ShiftRight_003_io_in = RandomHardware_007_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 89:18]
  assign SignExtendDouble_004_io_in = Reg_019_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 81:18]
  assign RandomHardware_005_io_in = {wire_004,wire_005}; // @[Cat.scala 30:58]
  assign RandomHardware_006_io_in = io_in[99:88]; // @[RandomHardware.scala 59:41]
  assign RandomHardware_007_io_in = io_in[11:0]; // @[RandomHardware.scala 60:41]
  assign RandomHardware_008_io_in = RandomHardware_016_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 92:18]
  assign RandomHardware_009_io_in = {wire_008,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_010_io_in = {{6'd0}, _RandomHardware_010_io_in_T}; // @[Cat.scala 30:58]
  assign Mul_011_io_in = Reg_019_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 82:18]
  assign RandomHardware_012_io_in = _RandomHardware_012_io_in_T[31:0]; // @[RandomHardware.scala 99:33]
  assign RandomHardware_013_io_in = io_in[99:76]; // @[RandomHardware.scala 61:41]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = RandomHardware_016_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 94:18]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = {wire_017,wire_018}; // @[Cat.scala 30:58]
  assign RandomHardware_016_clock = clock;
  assign RandomHardware_016_io_in = io_in[99:88]; // @[RandomHardware.scala 62:41]
  assign RandomHardware_017_io_in = {wire_019,wire_020}; // @[Cat.scala 30:58]
  assign RandomHardware_018_clock = clock;
  assign RandomHardware_018_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 85:18]
  assign Reg_019_clock = clock;
  assign Reg_019_io_in = RandomHardware_006_io_out[5:0]; // @[RandomHardware.scala 87:47]
endmodule
