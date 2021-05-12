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
module Mux2(
  input  [32:0] io_in,
  output [15:0] io_out
);
  wire  sel = io_in[32]; // @[Muxes.scala 16:18]
  wire [15:0] in1 = io_in[31:16]; // @[Muxes.scala 17:18]
  wire [15:0] in0 = io_in[15:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module And(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 36:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module RandomHardware_1_1(
  input  [32:0] io_in,
  output [7:0]  io_out
);
  wire [32:0] Mux2_000_io_in; // @[RandomHardware_1_1.scala 15:26]
  wire [15:0] Mux2_000_io_out; // @[RandomHardware_1_1.scala 15:26]
  wire [15:0] And_001_io_in; // @[RandomHardware_1_1.scala 16:26]
  wire [7:0] And_001_io_out; // @[RandomHardware_1_1.scala 16:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_1.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  And And_001 ( // @[RandomHardware_1_1.scala 16:26]
    .io_in(And_001_io_in),
    .io_out(And_001_io_out)
  );
  assign io_out = And_001_io_out; // @[RandomHardware_1_1.scala 19:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_1.scala 18:25]
  assign And_001_io_in = Mux2_000_io_out; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 21:18]
endmodule
module Accum(
  input         clock,
  input  [22:0] io_in,
  output [22:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [22:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[22:0];
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
  input  [22:0] io_in,
  output [22:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_2.scala 14:34]
  wire [22:0] Accum_000_io_in; // @[RandomHardware_1_2.scala 14:34]
  wire [22:0] Accum_000_io_out; // @[RandomHardware_1_2.scala 14:34]
  Accum Accum_000 ( // @[RandomHardware_1_2.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_2.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_2.scala 16:25]
endmodule
module Accum_1(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[15:0];
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
  wire  Accum_000_clock; // @[RandomHardware_1_3.scala 14:34]
  wire [15:0] Accum_000_io_in; // @[RandomHardware_1_3.scala 14:34]
  wire [15:0] Accum_000_io_out; // @[RandomHardware_1_3.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_1_3.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
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
module Accum_3(
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
module ShiftRegister_1(
  input         clock,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] r0; // @[Memory.scala 78:19]
  reg [31:0] r1; // @[Memory.scala 79:19]
  reg [31:0] r2; // @[Memory.scala 80:19]
  reg [31:0] r3; // @[Memory.scala 81:19]
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
module RandomHardware_3_0(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_3_0.scala 14:26]
  wire [11:0] Reg_000_io_in; // @[RandomHardware_3_0.scala 14:26]
  wire [11:0] Reg_000_io_out; // @[RandomHardware_3_0.scala 14:26]
  Reg Reg_000 ( // @[RandomHardware_3_0.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_3_0.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_3_0.scala 16:25]
endmodule
module SignExtendDouble(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] io_out_hi = io_in[11] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
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
module RandomHardware_2_1(
  input         clock,
  input  [24:0] io_in,
  output [35:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_2_1.scala 16:42]
  wire [11:0] RandomHardware_000_io_in; // @[RandomHardware_2_1.scala 16:42]
  wire [11:0] RandomHardware_000_io_out; // @[RandomHardware_2_1.scala 16:42]
  wire [11:0] SignExtendDouble_001_io_in; // @[RandomHardware_2_1.scala 17:42]
  wire [23:0] SignExtendDouble_001_io_out; // @[RandomHardware_2_1.scala 17:42]
  wire [24:0] Mux2_002_io_in; // @[RandomHardware_2_1.scala 18:26]
  wire [11:0] Mux2_002_io_out; // @[RandomHardware_2_1.scala 18:26]
  RandomHardware_3_0 RandomHardware_000 ( // @[RandomHardware_2_1.scala 16:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  SignExtendDouble SignExtendDouble_001 ( // @[RandomHardware_2_1.scala 17:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  Mux2_1 Mux2_002 ( // @[RandomHardware_2_1.scala 18:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  assign io_out = {RandomHardware_000_io_out,SignExtendDouble_001_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = Mux2_002_io_out; // @[RandomHardware_2_1.scala 13:24 RandomHardware_2_1.scala 23:18]
  assign SignExtendDouble_001_io_in = Mux2_002_io_out; // @[RandomHardware_2_1.scala 14:24 RandomHardware_2_1.scala 24:18]
  assign Mux2_002_io_in = io_in; // @[RandomHardware_2_1.scala 20:25]
endmodule
module RandomHardware_1_7(
  input         clock,
  input  [31:0] io_in,
  output [13:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_7.scala 15:42]
  wire [31:0] ShiftRegister_000_io_in; // @[RandomHardware_1_7.scala 15:42]
  wire [31:0] ShiftRegister_000_io_out; // @[RandomHardware_1_7.scala 15:42]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_7.scala 16:42]
  wire [24:0] RandomHardware_001_io_in; // @[RandomHardware_1_7.scala 16:42]
  wire [35:0] RandomHardware_001_io_out; // @[RandomHardware_1_7.scala 16:42]
  wire [31:0] wire_000 = ShiftRegister_000_io_out; // @[RandomHardware_1_7.scala 13:24 RandomHardware_1_7.scala 21:18]
  ShiftRegister_1 ShiftRegister_000 ( // @[RandomHardware_1_7.scala 15:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_7.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = RandomHardware_001_io_out[13:0]; // @[RandomHardware_1_7.scala 19:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_7.scala 18:33]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = wire_000[24:0]; // @[RandomHardware_1_7.scala 22:33]
endmodule
module CompareMux(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [11:0] IN1 = io_in[23:12]; // @[Muxes.scala 134:27]
  wire [8:0] IN2 = io_in[14:6]; // @[Muxes.scala 135:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 136:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 137:27]
  wire [11:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[8:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_8(
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire [23:0] CompareMux_000_io_in; // @[RandomHardware_1_8.scala 14:34]
  wire [8:0] CompareMux_000_io_out; // @[RandomHardware_1_8.scala 14:34]
  CompareMux CompareMux_000 ( // @[RandomHardware_1_8.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_1_8.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_1_8.scala 16:25]
endmodule
module ShiftRegister_2(
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
module ShiftRight(
  input  [23:0] io_in,
  output [23:0] io_out
);
  assign io_out = {{2'd0}, io_in[23:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_10(
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire [23:0] ShiftRight_000_io_in; // @[RandomHardware_1_10.scala 14:34]
  wire [23:0] ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 14:34]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_10.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_10.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_10.scala 16:25]
endmodule
module CompareMux_1(
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
module RandomHardware_2_0(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [19:0] CompareMux_000_io_in; // @[RandomHardware_2_0.scala 14:34]
  wire [4:0] CompareMux_000_io_out; // @[RandomHardware_2_0.scala 14:34]
  CompareMux_1 CompareMux_000 ( // @[RandomHardware_2_0.scala 14:34]
    .io_in(CompareMux_000_io_in),
    .io_out(CompareMux_000_io_out)
  );
  assign io_out = CompareMux_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign CompareMux_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:25]
endmodule
module SignExtendDouble_1(
  input  [12:0] io_in,
  output [25:0] io_out
);
  wire [12:0] io_out_hi = io_in[12] ? 13'h1fff : 13'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_11(
  input  [23:0] io_in,
  output [25:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_11.scala 15:42]
  wire [4:0] RandomHardware_000_io_out; // @[RandomHardware_1_11.scala 15:42]
  wire [12:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_11.scala 16:42]
  wire [25:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_11.scala 16:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_11.scala 15:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_001 ( // @[RandomHardware_1_11.scala 16:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  assign io_out = SignExtendDouble_001_io_out; // @[RandomHardware_1_11.scala 19:10]
  assign RandomHardware_000_io_in = io_in[19:0]; // @[RandomHardware_1_11.scala 18:33]
  assign SignExtendDouble_001_io_in = {{8'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 21:18]
endmodule
module ReduceOrMux(
  input  [15:0] io_in,
  output [3:0]  io_out
);
  wire [3:0] IN1 = io_in[15:12]; // @[Muxes.scala 110:27]
  wire [3:0] IN2 = io_in[11:8]; // @[Muxes.scala 111:27]
  wire [7:0] SEL = io_in[7:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_12(
  input  [15:0] io_in,
  output [3:0]  io_out
);
  wire [15:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_12.scala 14:34]
  wire [3:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_12.scala 14:34]
  ReduceOrMux ReduceOrMux_000 ( // @[RandomHardware_1_12.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_12.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_12.scala 16:33]
endmodule
module RandomHardware_1_13(
  input  [22:0] io_in,
  output [38:0] io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 14:42]
  wire [4:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{34'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_13.scala 17:10]
  assign RandomHardware_000_io_in = io_in[19:0]; // @[RandomHardware_1_13.scala 16:33]
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
module ShiftRegister_3(
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
module Mux2_2(
  input  [16:0] io_in,
  output [7:0]  io_out
);
  wire  sel = io_in[16]; // @[Muxes.scala 16:18]
  wire [7:0] in1 = io_in[15:8]; // @[Muxes.scala 17:18]
  wire [7:0] in0 = io_in[7:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_18(
  input  [16:0] io_in,
  output [7:0]  io_out
);
  wire [16:0] Mux2_000_io_in; // @[RandomHardware_1_18.scala 14:26]
  wire [7:0] Mux2_000_io_out; // @[RandomHardware_1_18.scala 14:26]
  Mux2_2 Mux2_000 ( // @[RandomHardware_1_18.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_18.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_18.scala 16:25]
endmodule
module ReduceAndMux(
  input  [35:0] io_in,
  output [16:0] io_out
);
  wire [16:0] IN1 = io_in[34:18]; // @[Muxes.scala 98:27]
  wire [16:0] IN2 = io_in[17:1]; // @[Muxes.scala 99:27]
  wire  SEL = io_in[0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module RandomHardware_1_19(
  input         clock,
  input  [24:0] io_in,
  output [16:0] io_out
);
  wire [35:0] ReduceAndMux_000_io_in; // @[RandomHardware_1_19.scala 15:34]
  wire [16:0] ReduceAndMux_000_io_out; // @[RandomHardware_1_19.scala 15:34]
  wire  RandomHardware_001_clock; // @[RandomHardware_1_19.scala 16:42]
  wire [24:0] RandomHardware_001_io_in; // @[RandomHardware_1_19.scala 16:42]
  wire [35:0] RandomHardware_001_io_out; // @[RandomHardware_1_19.scala 16:42]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_1_19.scala 15:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  RandomHardware_2_1 RandomHardware_001 ( // @[RandomHardware_1_19.scala 16:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  assign io_out = ReduceAndMux_000_io_out; // @[RandomHardware_1_19.scala 19:10]
  assign ReduceAndMux_000_io_in = RandomHardware_001_io_out; // @[RandomHardware_1_19.scala 13:24 RandomHardware_1_19.scala 21:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = io_in; // @[RandomHardware_1_19.scala 18:33]
endmodule
module ShiftRight_2(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{3'd0}, io_in[7:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Mul(
  input  [15:0] io_in,
  output [15:0] io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 47:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 48:20]
  assign io_out = in1 * in2; // @[ArithmeticLogical.scala 49:19]
endmodule
module CompareMux_3(
  input  [15:0] io_in,
  output [2:0]  io_out
);
  wire [7:0] IN1 = io_in[15:8]; // @[Muxes.scala 134:27]
  wire [2:0] IN2 = io_in[12:10]; // @[Muxes.scala 135:27]
  wire [4:0] SEL1 = io_in[9:5]; // @[Muxes.scala 136:27]
  wire [4:0] SEL2 = io_in[4:0]; // @[Muxes.scala 137:27]
  wire [7:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{5'd0}, IN2}; // @[Muxes.scala 139:18]
  assign io_out = _io_out_T_1[2:0]; // @[Muxes.scala 139:12]
endmodule
module RandomHardware_1_21(
  input  [15:0] io_in,
  output [2:0]  io_out
);
  wire [15:0] Mul_000_io_in; // @[RandomHardware_1_21.scala 15:26]
  wire [15:0] Mul_000_io_out; // @[RandomHardware_1_21.scala 15:26]
  wire [15:0] CompareMux_001_io_in; // @[RandomHardware_1_21.scala 16:34]
  wire [2:0] CompareMux_001_io_out; // @[RandomHardware_1_21.scala 16:34]
  Mul Mul_000 ( // @[RandomHardware_1_21.scala 15:26]
    .io_in(Mul_000_io_in),
    .io_out(Mul_000_io_out)
  );
  CompareMux_3 CompareMux_001 ( // @[RandomHardware_1_21.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = CompareMux_001_io_out; // @[RandomHardware_1_21.scala 19:10]
  assign Mul_000_io_in = io_in; // @[RandomHardware_1_21.scala 18:25]
  assign CompareMux_001_io_in = Mul_000_io_out; // @[RandomHardware_1_21.scala 13:24 RandomHardware_1_21.scala 21:18]
endmodule
module RandomHardware_1_23(
  input  [19:0] io_in,
  output [4:0]  io_out
);
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_23.scala 14:42]
  wire [4:0] RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_23.scala 14:42]
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:33]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [114:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware.scala 42:42]
  wire [4:0] ShiftRegister_000_io_in; // @[RandomHardware.scala 42:42]
  wire [4:0] ShiftRegister_000_io_out; // @[RandomHardware.scala 42:42]
  wire [32:0] RandomHardware_001_io_in; // @[RandomHardware.scala 43:42]
  wire [7:0] RandomHardware_001_io_out; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 44:42]
  wire [22:0] RandomHardware_002_io_in; // @[RandomHardware.scala 44:42]
  wire [22:0] RandomHardware_002_io_out; // @[RandomHardware.scala 44:42]
  wire  RandomHardware_003_clock; // @[RandomHardware.scala 45:42]
  wire [15:0] RandomHardware_003_io_in; // @[RandomHardware.scala 45:42]
  wire [15:0] RandomHardware_003_io_out; // @[RandomHardware.scala 45:42]
  wire  Accum_004_clock; // @[RandomHardware.scala 46:34]
  wire [7:0] Accum_004_io_in; // @[RandomHardware.scala 46:34]
  wire [7:0] Accum_004_io_out; // @[RandomHardware.scala 46:34]
  wire  Accum_005_clock; // @[RandomHardware.scala 47:34]
  wire [8:0] Accum_005_io_in; // @[RandomHardware.scala 47:34]
  wire [8:0] Accum_005_io_out; // @[RandomHardware.scala 47:34]
  wire  Accum_006_clock; // @[RandomHardware.scala 48:34]
  wire [7:0] Accum_006_io_in; // @[RandomHardware.scala 48:34]
  wire [7:0] Accum_006_io_out; // @[RandomHardware.scala 48:34]
  wire  RandomHardware_007_clock; // @[RandomHardware.scala 49:42]
  wire [31:0] RandomHardware_007_io_in; // @[RandomHardware.scala 49:42]
  wire [13:0] RandomHardware_007_io_out; // @[RandomHardware.scala 49:42]
  wire [23:0] RandomHardware_008_io_in; // @[RandomHardware.scala 50:42]
  wire [8:0] RandomHardware_008_io_out; // @[RandomHardware.scala 50:42]
  wire  ShiftRegister_009_clock; // @[RandomHardware.scala 51:42]
  wire [7:0] ShiftRegister_009_io_in; // @[RandomHardware.scala 51:42]
  wire [7:0] ShiftRegister_009_io_out; // @[RandomHardware.scala 51:42]
  wire [23:0] RandomHardware_010_io_in; // @[RandomHardware.scala 52:42]
  wire [23:0] RandomHardware_010_io_out; // @[RandomHardware.scala 52:42]
  wire [23:0] RandomHardware_011_io_in; // @[RandomHardware.scala 53:42]
  wire [25:0] RandomHardware_011_io_out; // @[RandomHardware.scala 53:42]
  wire [15:0] RandomHardware_012_io_in; // @[RandomHardware.scala 54:42]
  wire [3:0] RandomHardware_012_io_out; // @[RandomHardware.scala 54:42]
  wire [22:0] RandomHardware_013_io_in; // @[RandomHardware.scala 55:42]
  wire [38:0] RandomHardware_013_io_out; // @[RandomHardware.scala 55:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 56:42]
  wire [11:0] RandomHardware_014_io_in; // @[RandomHardware.scala 56:42]
  wire [11:0] RandomHardware_014_io_out; // @[RandomHardware.scala 56:42]
  wire  Reg_015_clock; // @[RandomHardware.scala 57:26]
  wire [7:0] Reg_015_io_in; // @[RandomHardware.scala 57:26]
  wire [7:0] Reg_015_io_out; // @[RandomHardware.scala 57:26]
  wire  ShiftRegister_016_clock; // @[RandomHardware.scala 58:42]
  wire [8:0] ShiftRegister_016_io_in; // @[RandomHardware.scala 58:42]
  wire [8:0] ShiftRegister_016_io_out; // @[RandomHardware.scala 58:42]
  wire [16:0] RandomHardware_018_io_in; // @[RandomHardware.scala 60:42]
  wire [7:0] RandomHardware_018_io_out; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_019_clock; // @[RandomHardware.scala 61:42]
  wire [24:0] RandomHardware_019_io_in; // @[RandomHardware.scala 61:42]
  wire [16:0] RandomHardware_019_io_out; // @[RandomHardware.scala 61:42]
  wire [7:0] ShiftRight_020_io_in; // @[RandomHardware.scala 62:34]
  wire [7:0] ShiftRight_020_io_out; // @[RandomHardware.scala 62:34]
  wire [15:0] RandomHardware_021_io_in; // @[RandomHardware.scala 63:42]
  wire [2:0] RandomHardware_021_io_out; // @[RandomHardware.scala 63:42]
  wire  Accum_022_clock; // @[RandomHardware.scala 64:34]
  wire [7:0] Accum_022_io_in; // @[RandomHardware.scala 64:34]
  wire [7:0] Accum_022_io_out; // @[RandomHardware.scala 64:34]
  wire [19:0] RandomHardware_023_io_in; // @[RandomHardware.scala 65:42]
  wire [4:0] RandomHardware_023_io_out; // @[RandomHardware.scala 65:42]
  wire [27:0] io_out_lo = {3'h0,RandomHardware_018_io_out,RandomHardware_019_io_out}; // @[Cat.scala 30:58]
  wire [86:0] io_out_hi = {Accum_006_io_out,RandomHardware_007_io_out,RandomHardware_011_io_out,
    RandomHardware_013_io_out}; // @[Cat.scala 30:58]
  wire [7:0] wire_003 = Reg_015_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 110:18]
  wire [7:0] wire_004 = ShiftRight_020_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 98:18]
  wire [15:0] RandomHardware_001_io_in_lo = {wire_003,wire_004}; // @[Cat.scala 30:58]
  wire [4:0] wire_001 = ShiftRegister_000_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 77:18]
  wire [11:0] wire_002 = RandomHardware_014_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 93:18]
  wire [16:0] RandomHardware_001_io_in_hi = {wire_001,wire_002}; // @[Cat.scala 30:58]
  wire [7:0] wire_005 = Accum_004_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 104:18]
  wire [19:0] RandomHardware_002_io_in_hi = {wire_005,wire_002}; // @[Cat.scala 30:58]
  wire [2:0] wire_007 = RandomHardware_021_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 111:18]
  wire [7:0] wire_008 = ShiftRegister_009_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 106:18]
  wire [7:0] wire_009 = Accum_022_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 101:18]
  wire [3:0] wire_017 = RandomHardware_012_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 109:18]
  wire [22:0] wire_012 = RandomHardware_002_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 81:18]
  wire [8:0] wire_013 = RandomHardware_008_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 90:18]
  wire [8:0] wire_021 = Accum_005_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 87:18]
  wire [15:0] wire_023 = RandomHardware_003_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 84:18]
  wire [8:0] wire_025 = ShiftRegister_016_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 96:18]
  wire [33:0] _RandomHardware_019_io_in_T = {wire_023,wire_013,wire_025}; // @[Cat.scala 30:58]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware.scala 42:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 43:42]
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 44:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 45:42]
    .clock(RandomHardware_003_clock),
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  Accum_2 Accum_004 ( // @[RandomHardware.scala 46:34]
    .clock(Accum_004_clock),
    .io_in(Accum_004_io_in),
    .io_out(Accum_004_io_out)
  );
  Accum_3 Accum_005 ( // @[RandomHardware.scala 47:34]
    .clock(Accum_005_clock),
    .io_in(Accum_005_io_in),
    .io_out(Accum_005_io_out)
  );
  Accum_2 Accum_006 ( // @[RandomHardware.scala 48:34]
    .clock(Accum_006_clock),
    .io_in(Accum_006_io_in),
    .io_out(Accum_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 49:42]
    .clock(RandomHardware_007_clock),
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 50:42]
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  ShiftRegister_2 ShiftRegister_009 ( // @[RandomHardware.scala 51:42]
    .clock(ShiftRegister_009_clock),
    .io_in(ShiftRegister_009_io_in),
    .io_out(ShiftRegister_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 52:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 54:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_3_0 RandomHardware_014 ( // @[RandomHardware.scala 56:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  Reg_2 Reg_015 ( // @[RandomHardware.scala 57:26]
    .clock(Reg_015_clock),
    .io_in(Reg_015_io_in),
    .io_out(Reg_015_io_out)
  );
  ShiftRegister_3 ShiftRegister_016 ( // @[RandomHardware.scala 58:42]
    .clock(ShiftRegister_016_clock),
    .io_in(ShiftRegister_016_io_in),
    .io_out(ShiftRegister_016_io_out)
  );
  RandomHardware_1_18 RandomHardware_018 ( // @[RandomHardware.scala 60:42]
    .io_in(RandomHardware_018_io_in),
    .io_out(RandomHardware_018_io_out)
  );
  RandomHardware_1_19 RandomHardware_019 ( // @[RandomHardware.scala 61:42]
    .clock(RandomHardware_019_clock),
    .io_in(RandomHardware_019_io_in),
    .io_out(RandomHardware_019_io_out)
  );
  ShiftRight_2 ShiftRight_020 ( // @[RandomHardware.scala 62:34]
    .io_in(ShiftRight_020_io_in),
    .io_out(ShiftRight_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 63:42]
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  Accum_2 Accum_022 ( // @[RandomHardware.scala 64:34]
    .clock(Accum_022_clock),
    .io_in(Accum_022_io_in),
    .io_out(Accum_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 65:42]
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = RandomHardware_023_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 113:18]
  assign RandomHardware_001_io_in = {RandomHardware_001_io_in_hi,RandomHardware_001_io_in_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = {RandomHardware_002_io_in_hi,wire_007}; // @[Cat.scala 30:58]
  assign RandomHardware_003_clock = clock;
  assign RandomHardware_003_io_in = {wire_008,wire_009}; // @[Cat.scala 30:58]
  assign Accum_004_clock = clock;
  assign Accum_004_io_in = io_in[7:0]; // @[RandomHardware.scala 67:33]
  assign Accum_005_clock = clock;
  assign Accum_005_io_in = RandomHardware_008_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 89:18]
  assign Accum_006_clock = clock;
  assign Accum_006_io_in = RandomHardware_001_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 79:18]
  assign RandomHardware_007_clock = clock;
  assign RandomHardware_007_io_in = {wire_012,wire_013}; // @[Cat.scala 30:58]
  assign RandomHardware_008_io_in = RandomHardware_010_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 107:18]
  assign ShiftRegister_009_clock = clock;
  assign ShiftRegister_009_io_in = io_in[99:92]; // @[RandomHardware.scala 68:41]
  assign RandomHardware_010_io_in = io_in[99:76]; // @[RandomHardware.scala 69:41]
  assign RandomHardware_011_io_in = RandomHardware_010_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 108:18]
  assign RandomHardware_012_io_in = io_in[15:0]; // @[RandomHardware.scala 70:41]
  assign RandomHardware_013_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 82:18]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = {wire_017,wire_009}; // @[Cat.scala 30:58]
  assign Reg_015_clock = clock;
  assign Reg_015_io_in = io_in[99:92]; // @[RandomHardware.scala 71:33]
  assign ShiftRegister_016_clock = clock;
  assign ShiftRegister_016_io_in = Accum_005_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 86:18]
  assign RandomHardware_018_io_in = {wire_021,wire_009}; // @[Cat.scala 30:58]
  assign RandomHardware_019_clock = clock;
  assign RandomHardware_019_io_in = _RandomHardware_019_io_in_T[24:0]; // @[RandomHardware.scala 120:33]
  assign ShiftRight_020_io_in = Accum_004_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 105:18]
  assign RandomHardware_021_io_in = io_in[99:84]; // @[RandomHardware.scala 72:41]
  assign Accum_022_clock = clock;
  assign Accum_022_io_in = ShiftRight_020_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 99:18]
  assign RandomHardware_023_io_in = io_in[99:80]; // @[RandomHardware.scala 73:41]
endmodule
