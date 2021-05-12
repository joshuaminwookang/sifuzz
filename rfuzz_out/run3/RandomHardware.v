module Accum(
  input        clock,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CompareMux(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [9:0] IN1 = io_in[19:10]; // @[Muxes.scala 134:27]
  wire [4:0] IN2 = io_in[14:10]; // @[Muxes.scala 135:27]
  wire [4:0] SEL1 = io_in[9:5]; // @[Muxes.scala 136:27]
  wire [4:0] SEL2 = io_in[4:0]; // @[Muxes.scala 137:27]
  wire [9:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{5'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[4:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_1(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [19:0] CompareMux_000_io_in; // @[RandomHardware_1_1.scala 14:34]
  wire [4:0] CompareMux_000_io_out; // @[RandomHardware_1_1.scala 14:34]
  CompareMux CompareMux_000 ( // @[RandomHardware_1_1.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_1.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_1.scala 16:25]
endmodule
module CompareMux_1(
  input  [15:0] io_in,
  output [5:0]  io_out
);
  wire [7:0] IN1 = io_in[15:8]; // @[Muxes.scala 134:27]
  wire [5:0] IN2 = io_in[9:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [7:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[5:0]; // @[Muxes.scala 139:12]
endmodule
module ShiftLeft(
  input  [5:0] io_in,
  output [7:0] io_out
);
  assign io_out = {io_in, 2'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_2_0(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] CompareMux_000_io_in; // @[RandomHardware_2_0.scala 15:34]
  wire [5:0] CompareMux_000_io_out; // @[RandomHardware_2_0.scala 15:34]
  wire [5:0] ShiftLeft_001_io_in; // @[RandomHardware_2_0.scala 16:34]
  wire [7:0] ShiftLeft_001_io_out; // @[RandomHardware_2_0.scala 16:34]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_2_0.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ShiftLeft ShiftLeft_001 ( // @[RandomHardware_2_0.scala 16:34]
    .io_in(ShiftLeft_001_io_in),
    .io_out(ShiftLeft_001_io_out)
  );
  assign io_out = ShiftLeft_001_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_2_0.scala 18:25]
  assign ShiftLeft_001_io_in = CompareMux_000_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
endmodule
module RandomHardware_1_2(
  input  [23:0] io_in,
  output [9:0]  io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_2.scala 14:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_2.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_2.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{2'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_2.scala 17:10]
  assign RandomHardware_000_io_in = io_in[15:0]; // @[RandomHardware_1_2.scala 16:33]
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
module RandomHardware_1_3(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire [20:0] Mux2_000_io_in; // @[RandomHardware_1_3.scala 14:26]
  wire [9:0] Mux2_000_io_out; // @[RandomHardware_1_3.scala 14:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_3.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module ShiftRight(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{3'd0}, io_in[7:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Sub(
  input  [23:0] io_in,
  output [12:0] io_out
);
  wire [11:0] in1 = io_in[23:12]; // @[ArithmeticLogical.scala 24:30]
  wire [11:0] in2 = io_in[11:0]; // @[ArithmeticLogical.scala 25:28]
  wire [11:0] _io_out_T = $signed(in1) - $signed(in2); // @[ArithmeticLogical.scala 27:19]
  assign io_out = {{1'd0}, _io_out_T}; // @[ArithmeticLogical.scala 27:19]
endmodule
module RandomHardware_1_5(
  input  [23:0] io_in,
  output [12:0] io_out
);
  wire [23:0] Sub_000_io_in; // @[RandomHardware_1_5.scala 14:26]
  wire [12:0] Sub_000_io_out; // @[RandomHardware_1_5.scala 14:26]
  Sub Sub_000 ( // @[RandomHardware_1_5.scala 14:26]
    .io_in(Sub_000_io_in),
    .io_out(Sub_000_io_out)
  );
  assign io_out = Sub_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign Sub_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
endmodule
module Mul(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [5:0] in1 = io_in[11:6]; // @[ArithmeticLogical.scala 47:20]
  wire [5:0] in2 = io_in[5:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_6(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [11:0] Mul_000_io_in; // @[RandomHardware_1_6.scala 14:26]
  wire [11:0] Mul_000_io_out; // @[RandomHardware_1_6.scala 14:26]
  Mul Mul_000 ( // @[RandomHardware_1_6.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_6.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_6.scala 16:25]
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
module RandomHardware_1_7(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_7.scala 14:34]
  wire [11:0] Accum_000_io_in; // @[RandomHardware_1_7.scala 14:34]
  wire [11:0] Accum_000_io_out; // @[RandomHardware_1_7.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_1_7.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_7.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_7.scala 16:25]
endmodule
module Reg(
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
module RandomHardware_1_8(
  input         clock,
  input  [12:0] io_in,
  output [12:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_8.scala 14:26]
  wire [12:0] Reg_000_io_in; // @[RandomHardware_1_8.scala 14:26]
  wire [12:0] Reg_000_io_out; // @[RandomHardware_1_8.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_1_8.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_8.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_8.scala 16:25]
endmodule
module RandomHardware_1_9(
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_9.scala 14:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_9.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_9.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{4'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_9.scala 17:10]
  assign RandomHardware_000_io_in = {{4'd0}, io_in}; // @[RandomHardware_1_9.scala 16:33]
endmodule
module RandomHardware_1_10(
  input  [29:0] io_in,
  output [13:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_10.scala 14:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_10.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_10.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{6'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_10.scala 17:10]
  assign RandomHardware_000_io_in = io_in[15:0]; // @[RandomHardware_1_10.scala 16:33]
endmodule
module SignExtendDouble(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Reg_1(
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
module SignExtendDouble_1(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] io_out_hi = io_in[13] ? 14'h3fff : 14'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_2_2(
  input  [13:0] io_in,
  output [27:0] io_out
);
  wire [13:0] SignExtendDouble_000_io_in; // @[RandomHardware_2_2.scala 14:42]
  wire [27:0] SignExtendDouble_000_io_out; // @[RandomHardware_2_2.scala 14:42]
  SignExtendDouble_1 SignExtendDouble_000 ( // @[RandomHardware_2_2.scala 14:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_2_2.scala 17:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_2_2.scala 16:33]
endmodule
module ShiftRight_1(
  input  [10:0] io_in,
  output [10:0] io_out
);
  assign io_out = {{1'd0}, io_in[10:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_13(
  input         clock,
  input  [26:0] io_in,
  output [38:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 18:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 18:42]
  wire  Reg_001_clock; // @[RandomHardware_1_13.scala 19:26]
  wire [10:0] Reg_001_io_in; // @[RandomHardware_1_13.scala 19:26]
  wire [10:0] Reg_001_io_out; // @[RandomHardware_1_13.scala 19:26]
  wire [13:0] RandomHardware_002_io_in; // @[RandomHardware_1_13.scala 20:42]
  wire [27:0] RandomHardware_002_io_out; // @[RandomHardware_1_13.scala 20:42]
  wire  Reg_003_clock; // @[RandomHardware_1_13.scala 21:26]
  wire [10:0] Reg_003_io_in; // @[RandomHardware_1_13.scala 21:26]
  wire [10:0] Reg_003_io_out; // @[RandomHardware_1_13.scala 21:26]
  wire [10:0] ShiftRight_004_io_in; // @[RandomHardware_1_13.scala 22:34]
  wire [10:0] ShiftRight_004_io_out; // @[RandomHardware_1_13.scala 22:34]
  wire [2:0] wire_002 = RandomHardware_000_io_out[2:0]; // @[RandomHardware_1_13.scala 15:24 RandomHardware_1_13.scala 30:18]
  wire [10:0] wire_003 = Reg_003_io_out; // @[RandomHardware_1_13.scala 16:24 RandomHardware_1_13.scala 32:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 18:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Reg_1 Reg_001 ( // @[RandomHardware_1_13.scala 19:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_13.scala 20:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  Reg_1 Reg_003 ( // @[RandomHardware_1_13.scala 21:26]
    .clock(Reg_003_clock),
    .io_in(Reg_003_io_in),
    .io_out(Reg_003_io_out)
  );
  ShiftRight_1 ShiftRight_004 ( // @[RandomHardware_1_13.scala 22:34]
    .io_in(ShiftRight_004_io_in),
    .io_out(ShiftRight_004_io_out)
  );
  assign io_out = {RandomHardware_002_io_out,ShiftRight_004_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_io_in = io_in[26:11]; // @[RandomHardware_1_13.scala 24:41]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Reg_003_io_out; // @[RandomHardware_1_13.scala 14:24 RandomHardware_1_13.scala 31:18]
  assign RandomHardware_002_io_in = {wire_002,wire_003}; // @[Cat.scala 30:58]
  assign Reg_003_clock = clock;
  assign Reg_003_io_in = io_in[10:0]; // @[RandomHardware_1_13.scala 25:33]
  assign ShiftRight_004_io_in = Reg_001_io_out; // @[RandomHardware_1_13.scala 13:24 RandomHardware_1_13.scala 29:18]
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
module RandomHardware_1_15(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_15.scala 14:26]
  wire [19:0] RegE_000_io_in; // @[RandomHardware_1_15.scala 14:26]
  wire [18:0] RegE_000_io_out; // @[RandomHardware_1_15.scala 14:26]
  RegE RegE_000 ( // @[RandomHardware_1_15.scala 14:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  assign io_out = RegE_000_io_out; // @[RandomHardware_1_15.scala 17:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = io_in; // @[RandomHardware_1_15.scala 16:25]
endmodule
module ShiftLeft_6(
  input  [18:0] io_in,
  output [22:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_16(
  input  [18:0] io_in,
  output [22:0] io_out
);
  wire [18:0] ShiftLeft_000_io_in; // @[RandomHardware_1_16.scala 14:34]
  wire [22:0] ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 14:34]
  ShiftLeft_6 ShiftLeft_000 ( // @[RandomHardware_1_16.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_16.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_16.scala 16:25]
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
module Mul_1(
  input  [13:0] io_in,
  output [13:0] io_out
);
  wire [6:0] in1 = io_in[13:7]; // @[ArithmeticLogical.scala 47:20]
  wire [6:0] in2 = io_in[6:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_18(
  input  [13:0] io_in,
  output [13:0] io_out
);
  wire [13:0] Mul_000_io_in; // @[RandomHardware_1_18.scala 14:26]
  wire [13:0] Mul_000_io_out; // @[RandomHardware_1_18.scala 14:26]
  Mul_1 Mul_000 ( // @[RandomHardware_1_18.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module RandomHardware_1_19(
  input  [32:0] io_in,
  output [15:0] io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_19.scala 14:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_19.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_19.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{8'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_19.scala 17:10]
  assign RandomHardware_000_io_in = io_in[15:0]; // @[RandomHardware_1_19.scala 16:33]
endmodule
module CompareMux_8(
  input  [35:0] io_in,
  output [15:0] io_out
);
  wire [17:0] IN1 = io_in[35:18]; // @[Muxes.scala 134:27]
  wire [15:0] IN2 = io_in[19:4]; // @[Muxes.scala 135:27]
  wire [1:0] SEL1 = io_in[3:2]; // @[Muxes.scala 136:27]
  wire [1:0] SEL2 = io_in[1:0]; // @[Muxes.scala 137:27]
  wire [17:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{2'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[15:0]; // @[Muxes.scala 139:12]
endmodule
module ShiftRegister(
  input         clock,
  input  [35:0] io_in,
  output [35:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [35:0] r0; // @[Memory.scala 78:19]
  reg [35:0] r1; // @[Memory.scala 79:19]
  reg [35:0] r2; // @[Memory.scala 80:19]
  reg [35:0] r3; // @[Memory.scala 81:19]
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
  r0 = _RAND_0[35:0];
  _RAND_1 = {2{`RANDOM}};
  r1 = _RAND_1[35:0];
  _RAND_2 = {2{`RANDOM}};
  r2 = _RAND_2[35:0];
  _RAND_3 = {2{`RANDOM}};
  r3 = _RAND_3[35:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware_1_20(
  input         clock,
  input  [35:0] io_in,
  output [15:0] io_out
);
  wire [35:0] CompareMux_000_io_in; // @[RandomHardware_1_20.scala 15:34]
  wire [15:0] CompareMux_000_io_out; // @[RandomHardware_1_20.scala 15:34]
  wire  ShiftRegister_001_clock; // @[RandomHardware_1_20.scala 16:42]
  wire [35:0] ShiftRegister_001_io_in; // @[RandomHardware_1_20.scala 16:42]
  wire [35:0] ShiftRegister_001_io_out; // @[RandomHardware_1_20.scala 16:42]
  CompareMux_8 CompareMux_000 ( // @[RandomHardware_1_20.scala 15:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  ShiftRegister ShiftRegister_001 ( // @[RandomHardware_1_20.scala 16:42]
    .clock(ShiftRegister_001_clock),
    .io_in(ShiftRegister_001_io_in),
    .io_out(ShiftRegister_001_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_20.scala 19:10]
  assign CompareMux_000_io_in = ShiftRegister_001_io_out; // @[RandomHardware_1_20.scala 13:24 RandomHardware_1_20.scala 21:18]
  assign ShiftRegister_001_clock = clock;
  assign ShiftRegister_001_io_in = io_in; // @[RandomHardware_1_20.scala 18:33]
endmodule
module Mul_2(
  input  [21:0] io_in,
  output [21:0] io_out
);
  wire [10:0] in1 = io_in[21:11]; // @[ArithmeticLogical.scala 47:20]
  wire [10:0] in2 = io_in[10:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RegE_1(
  input         clock,
  input  [22:0] io_in,
  output [21:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [21:0] data = io_in[22:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [20:0] reg_; // @[Memory.scala 22:18]
  wire [21:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[20:0];
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
  reg_ = _RAND_0[20:0];
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
  input  [22:0] io_in,
  output [21:0] io_out
);
  wire [21:0] Mul_000_io_in; // @[RandomHardware_1_21.scala 15:26]
  wire [21:0] Mul_000_io_out; // @[RandomHardware_1_21.scala 15:26]
  wire  RegE_001_clock; // @[RandomHardware_1_21.scala 16:26]
  wire [22:0] RegE_001_io_in; // @[RandomHardware_1_21.scala 16:26]
  wire [21:0] RegE_001_io_out; // @[RandomHardware_1_21.scala 16:26]
  Mul_2 Mul_000 ( // @[RandomHardware_1_21.scala 15:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  RegE_1 RegE_001 ( // @[RandomHardware_1_21.scala 16:26]
    .clock(RegE_001_clock),
    .io_in(RegE_001_io_in),
    .io_out(RegE_001_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_21.scala 19:10]
  assign Mul_000_io_in = RegE_001_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 21:18]
  assign RegE_001_clock = clock;
  assign RegE_001_io_in = io_in; // @[RandomHardware_1_21.scala 18:25]
endmodule
module Mul_3(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [15:0] in1 = io_in[31:16]; // @[ArithmeticLogical.scala 47:20]
  wire [15:0] in2 = io_in[15:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module RandomHardware_1_22(
  input  [31:0] io_in,
  output [31:0] io_out
);
  wire [31:0] Mul_000_io_in; // @[RandomHardware_1_22.scala 14:26]
  wire [31:0] Mul_000_io_out; // @[RandomHardware_1_22.scala 14:26]
  Mul_3 Mul_000 ( // @[RandomHardware_1_22.scala 14:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  assign io_out = Mul_000_io_out; // @[RandomHardware_1_22.scala 17:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_22.scala 16:25]
endmodule
module ShiftRegister_1(
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
module RandomHardware_1_24(
  input         clock,
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] RandomHardware_000_io_in; // @[RandomHardware_1_24.scala 15:42]
  wire [7:0] RandomHardware_000_io_out; // @[RandomHardware_1_24.scala 15:42]
  wire  Accum_001_clock; // @[RandomHardware_1_24.scala 16:34]
  wire [7:0] Accum_001_io_in; // @[RandomHardware_1_24.scala 16:34]
  wire [7:0] Accum_001_io_out; // @[RandomHardware_1_24.scala 16:34]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_24.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Accum_3 Accum_001 ( // @[RandomHardware_1_24.scala 16:34]
    .clock(Accum_001_clock),
    .io_in(Accum_001_io_in),
    .io_out(Accum_001_io_out)
  );
  assign io_out = Accum_001_io_out; // @[RandomHardware_1_24.scala 19:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_24.scala 18:33]
  assign Accum_001_clock = clock;
  assign Accum_001_io_in = RandomHardware_000_io_out; // @[RandomHardware_1_24.scala 13:24 RandomHardware_1_24.scala 21:18]
endmodule
module ReduceOrMux(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [3:0] IN1 = io_in[17:14]; // @[Muxes.scala 110:27]
  wire [3:0] IN2 = io_in[13:10]; // @[Muxes.scala 111:27]
  wire [9:0] SEL = io_in[9:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_25(
  input  [17:0] io_in,
  output [3:0]  io_out
);
  wire [17:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_25.scala 14:34]
  wire [3:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_25.scala 14:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_25.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_25.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_25.scala 16:33]
endmodule
module ShiftRegister_2(
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
module ShiftLeft_9(
  input  [5:0]  io_in,
  output [10:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ReduceAndMux(
  input  [21:0] io_in,
  output [5:0]  io_out
);
  wire [5:0] IN1 = io_in[16:11]; // @[Muxes.scala 98:27]
  wire [5:0] IN2 = io_in[10:5]; // @[Muxes.scala 99:27]
  wire [4:0] SEL = io_in[4:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_2_1(
  input  [21:0] io_in,
  output [10:0] io_out
);
  wire [5:0] ShiftLeft_000_io_in; // @[RandomHardware_2_1.scala 15:34]
  wire [10:0] ShiftLeft_000_io_out; // @[RandomHardware_2_1.scala 15:34]
  wire [21:0] ReduceAndMux_001_io_in; // @[RandomHardware_2_1.scala 16:34]
  wire [5:0] ReduceAndMux_001_io_out; // @[RandomHardware_2_1.scala 16:34]
  ShiftLeft_9 ShiftLeft_000 ( // @[RandomHardware_2_1.scala 15:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ReduceAndMux ReduceAndMux_001 ( // @[RandomHardware_2_1.scala 16:34]
    .io_in(ReduceAndMux_001_io_in),
    .io_out(ReduceAndMux_001_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_2_1.scala 19:10]
  assign ShiftLeft_000_io_in = ReduceAndMux_001_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 21:18]
  assign ReduceAndMux_001_io_in = io_in; // @[RandomHardware_2_1.scala 18:33]
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
module RandomHardware_1_26(
  input         clock,
  input  [27:0] io_in,
  output [11:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_26.scala 16:42]
  wire [11:0] ShiftRegister_000_io_in; // @[RandomHardware_1_26.scala 16:42]
  wire [11:0] ShiftRegister_000_io_out; // @[RandomHardware_1_26.scala 16:42]
  wire [21:0] RandomHardware_001_io_in; // @[RandomHardware_1_26.scala 17:42]
  wire [10:0] RandomHardware_001_io_out; // @[RandomHardware_1_26.scala 17:42]
  wire [27:0] ReduceXorMux_002_io_in; // @[RandomHardware_1_26.scala 18:34]
  wire [11:0] ReduceXorMux_002_io_out; // @[RandomHardware_1_26.scala 18:34]
  ShiftRegister_2 ShiftRegister_000 ( // @[RandomHardware_1_26.scala 16:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_26.scala 17:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  ReduceXorMux ReduceXorMux_002 ( // @[RandomHardware_1_26.scala 18:34]
    .io_in(ReduceXorMux_002_io_in),
    .io_out(ReduceXorMux_002_io_out)
  );
  assign io_out = {{1'd0}, RandomHardware_001_io_out}; // @[RandomHardware_1_26.scala 21:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = ReduceXorMux_002_io_out; // @[RandomHardware_1_26.scala 13:24 RandomHardware_1_26.scala 25:18]
  assign RandomHardware_001_io_in = {{10'd0}, ShiftRegister_000_io_out}; // @[RandomHardware_1_26.scala 14:24 RandomHardware_1_26.scala 24:18]
  assign ReduceXorMux_002_io_in = io_in; // @[RandomHardware_1_26.scala 20:33]
endmodule
module Div(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 59:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 60:20]
  assign io_out = in1 / in2; // @[ArithmeticLogical.scala 61:19]
endmodule
module RandomHardware_1_27(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] Div_000_io_in; // @[RandomHardware_1_27.scala 14:26]
  wire [7:0] Div_000_io_out; // @[RandomHardware_1_27.scala 14:26]
  Div Div_000 ( // @[RandomHardware_1_27.scala 14:26]
    .io_in(Div_000_io_in),
    .io_out(Div_000_io_out)
  );
  assign io_out = Div_000_io_out; // @[RandomHardware_1_27.scala 17:10]
  assign Div_000_io_in = io_in; // @[RandomHardware_1_27.scala 16:25]
endmodule
module ShiftLeft_10(
  input  [11:0] io_in,
  output [12:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_28(
  input  [11:0] io_in,
  output [12:0] io_out
);
  wire [11:0] ShiftLeft_000_io_in; // @[RandomHardware_1_28.scala 14:34]
  wire [12:0] ShiftLeft_000_io_out; // @[RandomHardware_1_28.scala 14:34]
  ShiftLeft_10 ShiftLeft_000 ( // @[RandomHardware_1_28.scala 14:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  assign io_out = ShiftLeft_000_io_out; // @[RandomHardware_1_28.scala 17:10]
  assign ShiftLeft_000_io_in = io_in; // @[RandomHardware_1_28.scala 16:25]
endmodule
module ShiftRegister_3(
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
module RandomHardware_1_29(
  input         clock,
  input  [21:0] io_in,
  output [10:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_29.scala 15:42]
  wire [10:0] ShiftRegister_000_io_in; // @[RandomHardware_1_29.scala 15:42]
  wire [10:0] ShiftRegister_000_io_out; // @[RandomHardware_1_29.scala 15:42]
  wire [21:0] RandomHardware_001_io_in; // @[RandomHardware_1_29.scala 16:42]
  wire [10:0] RandomHardware_001_io_out; // @[RandomHardware_1_29.scala 16:42]
  ShiftRegister_3 ShiftRegister_000 ( // @[RandomHardware_1_29.scala 15:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_29.scala 16:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_29.scala 19:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_29.scala 13:24 RandomHardware_1_29.scala 21:18]
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_29.scala 18:33]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [135:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware.scala 53:34]
  wire [3:0] Accum_000_io_in; // @[RandomHardware.scala 53:34]
  wire [3:0] Accum_000_io_out; // @[RandomHardware.scala 53:34]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 54:42]
  wire [4:0] RandomHardware_001_io_out; // @[RandomHardware.scala 54:42]
  wire [23:0] RandomHardware_002_io_in; // @[RandomHardware.scala 55:42]
  wire [9:0] RandomHardware_002_io_out; // @[RandomHardware.scala 55:42]
  wire [20:0] RandomHardware_003_io_in; // @[RandomHardware.scala 56:42]
  wire [9:0] RandomHardware_003_io_out; // @[RandomHardware.scala 56:42]
  wire [7:0] ShiftRight_004_io_in; // @[RandomHardware.scala 57:34]
  wire [7:0] ShiftRight_004_io_out; // @[RandomHardware.scala 57:34]
  wire [23:0] RandomHardware_005_io_in; // @[RandomHardware.scala 58:42]
  wire [12:0] RandomHardware_005_io_out; // @[RandomHardware.scala 58:42]
  wire [11:0] RandomHardware_006_io_in; // @[RandomHardware.scala 59:42]
  wire [11:0] RandomHardware_006_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_007_clock; // @[RandomHardware.scala 60:42]
  wire [11:0] RandomHardware_007_io_in; // @[RandomHardware.scala 60:42]
  wire [11:0] RandomHardware_007_io_out; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_008_clock; // @[RandomHardware.scala 61:42]
  wire [12:0] RandomHardware_008_io_in; // @[RandomHardware.scala 61:42]
  wire [12:0] RandomHardware_008_io_out; // @[RandomHardware.scala 61:42]
  wire [11:0] RandomHardware_009_io_in; // @[RandomHardware.scala 62:42]
  wire [11:0] RandomHardware_009_io_out; // @[RandomHardware.scala 62:42]
  wire [29:0] RandomHardware_010_io_in; // @[RandomHardware.scala 63:42]
  wire [13:0] RandomHardware_010_io_out; // @[RandomHardware.scala 63:42]
  wire [7:0] SignExtendDouble_011_io_in; // @[RandomHardware.scala 64:42]
  wire [15:0] SignExtendDouble_011_io_out; // @[RandomHardware.scala 64:42]
  wire [11:0] RandomHardware_012_io_in; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_012_io_out; // @[RandomHardware.scala 65:42]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 66:42]
  wire [26:0] RandomHardware_013_io_in; // @[RandomHardware.scala 66:42]
  wire [38:0] RandomHardware_013_io_out; // @[RandomHardware.scala 66:42]
  wire [11:0] RandomHardware_014_io_in; // @[RandomHardware.scala 67:42]
  wire [11:0] RandomHardware_014_io_out; // @[RandomHardware.scala 67:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 68:42]
  wire [19:0] RandomHardware_015_io_in; // @[RandomHardware.scala 68:42]
  wire [18:0] RandomHardware_015_io_out; // @[RandomHardware.scala 68:42]
  wire [18:0] RandomHardware_016_io_in; // @[RandomHardware.scala 69:42]
  wire [22:0] RandomHardware_016_io_out; // @[RandomHardware.scala 69:42]
  wire  Accum_017_clock; // @[RandomHardware.scala 70:34]
  wire [9:0] Accum_017_io_in; // @[RandomHardware.scala 70:34]
  wire [9:0] Accum_017_io_out; // @[RandomHardware.scala 70:34]
  wire [13:0] RandomHardware_018_io_in; // @[RandomHardware.scala 71:42]
  wire [13:0] RandomHardware_018_io_out; // @[RandomHardware.scala 71:42]
  wire [32:0] RandomHardware_019_io_in; // @[RandomHardware.scala 72:42]
  wire [15:0] RandomHardware_019_io_out; // @[RandomHardware.scala 72:42]
  wire  RandomHardware_020_clock; // @[RandomHardware.scala 73:42]
  wire [35:0] RandomHardware_020_io_in; // @[RandomHardware.scala 73:42]
  wire [15:0] RandomHardware_020_io_out; // @[RandomHardware.scala 73:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 74:42]
  wire [22:0] RandomHardware_021_io_in; // @[RandomHardware.scala 74:42]
  wire [21:0] RandomHardware_021_io_out; // @[RandomHardware.scala 74:42]
  wire [31:0] RandomHardware_022_io_in; // @[RandomHardware.scala 75:42]
  wire [31:0] RandomHardware_022_io_out; // @[RandomHardware.scala 75:42]
  wire  ShiftRegister_023_clock; // @[RandomHardware.scala 76:42]
  wire [9:0] ShiftRegister_023_io_in; // @[RandomHardware.scala 76:42]
  wire [9:0] ShiftRegister_023_io_out; // @[RandomHardware.scala 76:42]
  wire  RandomHardware_024_clock; // @[RandomHardware.scala 77:42]
  wire [15:0] RandomHardware_024_io_in; // @[RandomHardware.scala 77:42]
  wire [7:0] RandomHardware_024_io_out; // @[RandomHardware.scala 77:42]
  wire [17:0] RandomHardware_025_io_in; // @[RandomHardware.scala 78:42]
  wire [3:0] RandomHardware_025_io_out; // @[RandomHardware.scala 78:42]
  wire  RandomHardware_026_clock; // @[RandomHardware.scala 79:42]
  wire [27:0] RandomHardware_026_io_in; // @[RandomHardware.scala 79:42]
  wire [11:0] RandomHardware_026_io_out; // @[RandomHardware.scala 79:42]
  wire [15:0] RandomHardware_027_io_in; // @[RandomHardware.scala 80:42]
  wire [7:0] RandomHardware_027_io_out; // @[RandomHardware.scala 80:42]
  wire [11:0] RandomHardware_028_io_in; // @[RandomHardware.scala 81:42]
  wire [12:0] RandomHardware_028_io_out; // @[RandomHardware.scala 81:42]
  wire  RandomHardware_029_clock; // @[RandomHardware.scala 82:42]
  wire [21:0] RandomHardware_029_io_in; // @[RandomHardware.scala 82:42]
  wire [10:0] RandomHardware_029_io_out; // @[RandomHardware.scala 82:42]
  wire [85:0] io_out_lo = {RandomHardware_013_io_out,RandomHardware_014_io_out,Accum_017_io_out,
    RandomHardware_018_io_out,RandomHardware_029_io_out}; // @[Cat.scala 30:58]
  wire [49:0] io_out_hi = {Accum_000_io_out,RandomHardware_001_io_out,RandomHardware_007_io_out,
    RandomHardware_008_io_out,SignExtendDouble_011_io_out}; // @[Cat.scala 30:58]
  wire [12:0] wire_003 = RandomHardware_005_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 97:18]
  wire [7:0] wire_004 = RandomHardware_027_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 142:18]
  wire [11:0] wire_006 = RandomHardware_009_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 105:18]
  wire [11:0] wire_007 = RandomHardware_026_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 140:18]
  wire [7:0] wire_013 = ShiftRight_004_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 95:18]
  wire [8:0] wire_014 = RandomHardware_015_io_out[17:9]; // @[RandomHardware.scala 138:47]
  wire [16:0] RandomHardware_010_io_in_hi = {wire_013,wire_014}; // @[Cat.scala 30:58]
  wire [12:0] wire_015 = RandomHardware_028_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 130:18]
  wire [9:0] wire_024 = RandomHardware_003_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 93:18]
  wire [22:0] wire_025 = RandomHardware_016_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 110:18]
  wire [31:0] wire_026 = RandomHardware_022_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 119:18]
  wire [3:0] wire_027 = RandomHardware_025_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 127:18]
  wire [9:0] wire_028 = RandomHardware_002_io_out; // @[RandomHardware.scala 41:24 RandomHardware.scala 132:18]
  wire [15:0] wire_032 = RandomHardware_019_io_out; // @[RandomHardware.scala 45:24 RandomHardware.scala 112:18]
  wire [33:0] _RandomHardware_022_io_in_T = {wire_028,wire_032,wire_004}; // @[Cat.scala 30:58]
  wire [11:0] wire_036 = RandomHardware_012_io_out; // @[RandomHardware.scala 49:24 RandomHardware.scala 137:18]
  wire [5:0] wire_037 = RandomHardware_026_io_out[5:0]; // @[RandomHardware.scala 141:47]
  wire [7:0] wire_002 = RandomHardware_024_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 123:18]
  wire [23:0] _RandomHardware_007_io_in_T = {wire_006,wire_036}; // @[Cat.scala 30:58]
  wire [15:0] wire_018 = RandomHardware_020_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 115:18]
  wire [25:0] _RandomHardware_013_io_in_T = {wire_024,wire_018}; // @[Cat.scala 30:58]
  wire [11:0] wire_019 = RandomHardware_006_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 101:18]
  wire [24:0] _RandomHardware_014_io_in_T = {wire_019,wire_015}; // @[Cat.scala 30:58]
  Accum Accum_000 ( // @[RandomHardware.scala 53:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 54:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 56:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  ShiftRight ShiftRight_004 ( // @[RandomHardware.scala 57:34]
    .io_in(ShiftRight_004_io_in),
    .io_out(ShiftRight_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 58:42]
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 59:42]
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_007_clock),
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 61:42]
    .clock(RandomHardware_008_clock),
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 62:42]
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 63:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  SignExtendDouble SignExtendDouble_011 ( // @[RandomHardware.scala 64:42]
    .io_in(SignExtendDouble_011_io_in),
    .io_out(SignExtendDouble_011_io_out)
  );
  RandomHardware_1_9 RandomHardware_012 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 66:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_9 RandomHardware_014 ( // @[RandomHardware.scala 67:42]
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 68:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 69:42]
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  Accum_2 Accum_017 ( // @[RandomHardware.scala 70:34]
    .clock(Accum_017_clock),
    .io_in(Accum_017_io_in),
    .io_out(Accum_017_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 71:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 72:42]
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  RandomHardware_1_20 RandomHardware_020 ( // @[RandomHardware.scala 73:42]
    .clock(RandomHardware_020_clock),
    .io_in(RandomHardware_020_io_in),
    .io_out(RandomHardware_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 74:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_22 RandomHardware_022 ( // @[RandomHardware.scala 75:42]
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  ShiftRegister_1 ShiftRegister_023 ( // @[RandomHardware.scala 76:42]
    .clock(ShiftRegister_023_clock),
    .io_in(ShiftRegister_023_io_in),
    .io_out(ShiftRegister_023_io_out)
  );
  RandomHardware_1_24 RandomHardware_024 ( // @[RandomHardware.scala 77:42]
    .clock(RandomHardware_024_clock),
    .io_in(RandomHardware_024_io_in),
    .io_out(RandomHardware_024_io_out)
  );
  RandomHardware_1_25 RandomHardware_025 ( // @[RandomHardware.scala 78:42]
    .io_in(RandomHardware_025_io_in),
    .io_out(RandomHardware_025_io_out)
  );
  RandomHardware_1_26 RandomHardware_026 ( // @[RandomHardware.scala 79:42]
    .clock(RandomHardware_026_clock),
    .io_in(RandomHardware_026_io_in),
    .io_out(RandomHardware_026_io_out)
  );
  RandomHardware_1_27 RandomHardware_027 ( // @[RandomHardware.scala 80:42]
    .io_in(RandomHardware_027_io_in),
    .io_out(RandomHardware_027_io_out)
  );
  RandomHardware_1_28 RandomHardware_028 ( // @[RandomHardware.scala 81:42]
    .io_in(RandomHardware_028_io_in),
    .io_out(RandomHardware_028_io_out)
  );
  RandomHardware_1_29 RandomHardware_029 ( // @[RandomHardware.scala 82:42]
    .clock(RandomHardware_029_clock),
    .io_in(RandomHardware_029_io_in),
    .io_out(RandomHardware_029_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = RandomHardware_025_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 126:18]
  assign RandomHardware_001_io_in = {wire_006,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_002_io_in = io_in[23:0]; // @[RandomHardware.scala 84:41]
  assign RandomHardware_003_io_in = {wire_003,wire_004}; // @[Cat.scala 30:58]
  assign ShiftRight_004_io_in = RandomHardware_024_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 124:18]
  assign RandomHardware_005_io_in = {wire_006,wire_007}; // @[Cat.scala 30:58]
  assign RandomHardware_006_io_in = RandomHardware_012_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 135:18]
  assign RandomHardware_007_clock = clock;
  assign RandomHardware_007_io_in = _RandomHardware_007_io_in_T[11:0]; // @[RandomHardware.scala 147:33]
  assign RandomHardware_008_clock = clock;
  assign RandomHardware_008_io_in = RandomHardware_028_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 129:18]
  assign RandomHardware_009_io_in = RandomHardware_006_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 100:18]
  assign RandomHardware_010_io_in = {RandomHardware_010_io_in_hi,wire_015}; // @[Cat.scala 30:58]
  assign SignExtendDouble_011_io_in = RandomHardware_027_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 143:18]
  assign RandomHardware_012_io_in = io_in[99:88]; // @[RandomHardware.scala 85:41]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = {{1'd0}, _RandomHardware_013_io_in_T}; // @[Cat.scala 30:58]
  assign RandomHardware_014_io_in = _RandomHardware_014_io_in_T[11:0]; // @[RandomHardware.scala 151:33]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = io_in[99:80]; // @[RandomHardware.scala 86:41]
  assign RandomHardware_016_io_in = RandomHardware_015_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 139:18]
  assign Accum_017_clock = clock;
  assign Accum_017_io_in = ShiftRegister_023_io_out; // @[RandomHardware.scala 35:24 RandomHardware.scala 121:18]
  assign RandomHardware_018_io_in = RandomHardware_010_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 108:18]
  assign RandomHardware_019_io_in = {wire_024,wire_025}; // @[Cat.scala 30:58]
  assign RandomHardware_020_clock = clock;
  assign RandomHardware_020_io_in = {wire_026,wire_027}; // @[Cat.scala 30:58]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = {wire_028,wire_003}; // @[Cat.scala 30:58]
  assign RandomHardware_022_io_in = _RandomHardware_022_io_in_T[31:0]; // @[RandomHardware.scala 118:33]
  assign ShiftRegister_023_clock = clock;
  assign ShiftRegister_023_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 47:24 RandomHardware.scala 134:18]
  assign RandomHardware_024_clock = clock;
  assign RandomHardware_024_io_in = RandomHardware_019_io_out; // @[RandomHardware.scala 48:24 RandomHardware.scala 113:18]
  assign RandomHardware_025_io_in = {wire_036,wire_037}; // @[Cat.scala 30:58]
  assign RandomHardware_026_clock = clock;
  assign RandomHardware_026_io_in = io_in[27:0]; // @[RandomHardware.scala 87:41]
  assign RandomHardware_027_io_in = io_in[99:84]; // @[RandomHardware.scala 88:41]
  assign RandomHardware_028_io_in = RandomHardware_006_io_out; // @[RandomHardware.scala 51:24 RandomHardware.scala 102:18]
  assign RandomHardware_029_clock = clock;
  assign RandomHardware_029_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 43:24 RandomHardware.scala 117:18]
endmodule
