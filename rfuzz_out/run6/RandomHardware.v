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
module RandomHardware_2_0(
  input         clock,
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_2_0.scala 15:42]
  wire [8:0] ShiftRegister_000_io_in; // @[RandomHardware_2_0.scala 15:42]
  wire [8:0] ShiftRegister_000_io_out; // @[RandomHardware_2_0.scala 15:42]
  wire [23:0] CompareMux_001_io_in; // @[RandomHardware_2_0.scala 16:34]
  wire [8:0] CompareMux_001_io_out; // @[RandomHardware_2_0.scala 16:34]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware_2_0.scala 15:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  CompareMux CompareMux_001 ( // @[RandomHardware_2_0.scala 16:34]
    .io_in(CompareMux_001_io_in),
    .io_out(CompareMux_001_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_2_0.scala 19:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = CompareMux_001_io_out; // @[RandomHardware_2_0.scala 13:24 RandomHardware_2_0.scala 21:18]
  assign CompareMux_001_io_in = io_in; // @[RandomHardware_2_0.scala 18:25]
endmodule
module RandomHardware_1_0(
  input         clock,
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_0.scala 14:42]
  wire [23:0] RandomHardware_000_io_in; // @[RandomHardware_1_0.scala 14:42]
  wire [8:0] RandomHardware_000_io_out; // @[RandomHardware_1_0.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_0.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = {{11'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_0.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{4'd0}, io_in}; // @[RandomHardware_1_0.scala 16:33]
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
module RandomHardware_1_1(
  input         clock,
  input  [19:0] io_in,
  output [8:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_1.scala 15:42]
  wire [23:0] RandomHardware_000_io_in; // @[RandomHardware_1_1.scala 15:42]
  wire [8:0] RandomHardware_000_io_out; // @[RandomHardware_1_1.scala 15:42]
  wire [18:0] Mux2_001_io_in; // @[RandomHardware_1_1.scala 16:26]
  wire [8:0] Mux2_001_io_out; // @[RandomHardware_1_1.scala 16:26]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_1.scala 15:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  Mux2 Mux2_001 ( // @[RandomHardware_1_1.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Mux2_001_io_out; // @[RandomHardware_1_1.scala 19:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{4'd0}, io_in}; // @[RandomHardware_1_1.scala 18:33]
  assign Mux2_001_io_in = {{10'd0}, RandomHardware_000_io_out}; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 21:18]
endmodule
module Mod(
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [9:0] in1 = io_in[19:10]; // @[ArithmeticLogical.scala 71:20]
  wire [9:0] in2 = io_in[9:0]; // @[ArithmeticLogical.scala 72:20]
  wire [9:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[9:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module Reg(
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
module RandomHardware_1_2(
  input         clock,
  input  [19:0] io_in,
  output [9:0]  io_out
);
  wire [19:0] Mod_000_io_in; // @[RandomHardware_1_2.scala 15:26]
  wire [9:0] Mod_000_io_out; // @[RandomHardware_1_2.scala 15:26]
  wire  Reg_001_clock; // @[RandomHardware_1_2.scala 16:26]
  wire [9:0] Reg_001_io_in; // @[RandomHardware_1_2.scala 16:26]
  wire [9:0] Reg_001_io_out; // @[RandomHardware_1_2.scala 16:26]
  Mod Mod_000 ( // @[RandomHardware_1_2.scala 15:26]
    .io_in(Mod_000_io_in),
    .io_out(Mod_000_io_out)
  );
  Reg Reg_001 ( // @[RandomHardware_1_2.scala 16:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_2.scala 19:10]
  assign Mod_000_io_in = io_in; // @[RandomHardware_1_2.scala 18:25]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = Mod_000_io_out; // @[RandomHardware_1_2.scala 13:24 RandomHardware_1_2.scala 21:18]
endmodule
module Mod_1(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [7:0] in1 = io_in[15:8]; // @[ArithmeticLogical.scala 71:20]
  wire [7:0] in2 = io_in[7:0]; // @[ArithmeticLogical.scala 72:20]
  wire [7:0] _GEN_0 = in1 % in2; // @[ArithmeticLogical.scala 73:19]
  assign io_out = _GEN_0[7:0]; // @[ArithmeticLogical.scala 73:19]
endmodule
module RandomHardware_1_3(
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire [15:0] Mod_000_io_in; // @[RandomHardware_1_3.scala 14:26]
  wire [7:0] Mod_000_io_out; // @[RandomHardware_1_3.scala 14:26]
  Mod_1 Mod_000 ( // @[RandomHardware_1_3.scala 14:26]
    .io_in(Mod_000_io_in),
    .io_out(Mod_000_io_out)
  );
  assign io_out = Mod_000_io_out; // @[RandomHardware_1_3.scala 17:10]
  assign Mod_000_io_in = io_in; // @[RandomHardware_1_3.scala 16:25]
endmodule
module SignExtendDouble(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftRegister_2(
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
module RegFile2R1W(
  input        clock,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  R1_SEL = io_in[3]; // @[Memory.scala 37:28]
  wire  R2_SEL = io_in[2]; // @[Memory.scala 38:28]
  wire [1:0] W_DATA = io_in[1:0]; // @[Memory.scala 39:28]
  reg [1:0] registers_0; // @[Memory.scala 41:22]
  reg [1:0] registers_1; // @[Memory.scala 41:22]
  wire [1:0] _GEN_3 = R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [1:0] _GEN_5 = R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  assign io_out = {_GEN_3,_GEN_5}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (~R1_SEL) begin // @[Memory.scala 44:21]
      registers_0 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (R1_SEL) begin // @[Memory.scala 44:21]
      registers_1 <= W_DATA; // @[Memory.scala 44:21]
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
  registers_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2_1(
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire  sel = io_in[22]; // @[Muxes.scala 16:18]
  wire [10:0] in1 = io_in[21:11]; // @[Muxes.scala 17:18]
  wire [10:0] in0 = io_in[10:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_7(
  input  [22:0] io_in,
  output [10:0] io_out
);
  wire [22:0] Mux2_000_io_in; // @[RandomHardware_1_7.scala 14:26]
  wire [10:0] Mux2_000_io_out; // @[RandomHardware_1_7.scala 14:26]
  Mux2_1 Mux2_000 ( // @[RandomHardware_1_7.scala 14:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_7.scala 17:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_7.scala 16:25]
endmodule
module ShiftRegister_3(
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
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [22:0] io_in,
  output [21:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [21:0] r0; // @[Memory.scala 60:19]
  reg [21:0] r1; // @[Memory.scala 61:19]
  reg [21:0] r2; // @[Memory.scala 62:19]
  reg [21:0] r3; // @[Memory.scala 63:19]
  wire [22:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 22'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[21:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 22'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 22'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 22'h0; // @[Memory.scala 63:19]
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
  r0 = _RAND_0[21:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[21:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[21:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[21:0];
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
module RandomHardware_1_9(
  input         clock,
  input         reset,
  input  [22:0] io_in,
  output [11:0] io_out
);
  wire  ResetShiftRegister_000_clock; // @[RandomHardware_1_9.scala 15:42]
  wire  ResetShiftRegister_000_reset; // @[RandomHardware_1_9.scala 15:42]
  wire [22:0] ResetShiftRegister_000_io_in; // @[RandomHardware_1_9.scala 15:42]
  wire [21:0] ResetShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 15:42]
  wire [21:0] Add_001_io_in; // @[RandomHardware_1_9.scala 16:26]
  wire [11:0] Add_001_io_out; // @[RandomHardware_1_9.scala 16:26]
  ResetShiftRegister ResetShiftRegister_000 ( // @[RandomHardware_1_9.scala 15:42]
    .clock(ResetShiftRegister_000_clock),
    .reset(ResetShiftRegister_000_reset),
    .io_in(ResetShiftRegister_000_io_in),
    .io_out(ResetShiftRegister_000_io_out)
  );
  Add Add_001 ( // @[RandomHardware_1_9.scala 16:26]
    .io_in(Add_001_io_in),
    .io_out(Add_001_io_out)
  );
  assign io_out = Add_001_io_out; // @[RandomHardware_1_9.scala 19:10]
  assign ResetShiftRegister_000_clock = clock;
  assign ResetShiftRegister_000_reset = reset;
  assign ResetShiftRegister_000_io_in = io_in; // @[RandomHardware_1_9.scala 18:33]
  assign Add_001_io_in = ResetShiftRegister_000_io_out; // @[RandomHardware_1_9.scala 13:24 RandomHardware_1_9.scala 21:18]
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
module ShiftLeft(
  input  [3:0] io_in,
  output [6:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_1(
  input  [9:0]  io_in,
  output [14:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_13(
  input         clock,
  input  [23:0] io_in,
  output [8:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_13.scala 14:42]
  wire [23:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 14:42]
  wire [8:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_13.scala 16:33]
endmodule
module ShiftRegister_5(
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
module RandomHardware_1_14(
  input         clock,
  input  [35:0] io_in,
  output [35:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_14.scala 14:42]
  wire [35:0] ShiftRegister_000_io_in; // @[RandomHardware_1_14.scala 14:42]
  wire [35:0] ShiftRegister_000_io_out; // @[RandomHardware_1_14.scala 14:42]
  ShiftRegister_5 ShiftRegister_000 ( // @[RandomHardware_1_14.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_14.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_14.scala 16:33]
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
module RegFile2R1W_1(
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
module RandomHardware_1_15(
  input         clock,
  input  [16:0] io_in,
  output [7:0]  io_out
);
  wire [16:0] Mux2_000_io_in; // @[RandomHardware_1_15.scala 15:26]
  wire [7:0] Mux2_000_io_out; // @[RandomHardware_1_15.scala 15:26]
  wire  RegFile2R1W_001_clock; // @[RandomHardware_1_15.scala 16:34]
  wire [7:0] RegFile2R1W_001_io_in; // @[RandomHardware_1_15.scala 16:34]
  wire [7:0] RegFile2R1W_001_io_out; // @[RandomHardware_1_15.scala 16:34]
  Mux2_2 Mux2_000 ( // @[RandomHardware_1_15.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  RegFile2R1W_1 RegFile2R1W_001 ( // @[RandomHardware_1_15.scala 16:34]
    .clock(RegFile2R1W_001_clock),
    .io_in(RegFile2R1W_001_io_in),
    .io_out(RegFile2R1W_001_io_out)
  );
  assign io_out = RegFile2R1W_001_io_out; // @[RandomHardware_1_15.scala 19:10]
  assign Mux2_000_io_in = io_in; // @[RandomHardware_1_15.scala 18:25]
  assign RegFile2R1W_001_clock = clock;
  assign RegFile2R1W_001_io_in = Mux2_000_io_out; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 21:18]
endmodule
module ShiftRight(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{5'd0}, io_in[7:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Reg_1(
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
module SignExtendDouble_1(
  input  [3:0] io_in,
  output [7:0] io_out
);
  wire [3:0] io_out_hi = io_in[3] ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [68:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware.scala 32:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware.scala 32:42]
  wire [19:0] RandomHardware_000_io_out; // @[RandomHardware.scala 32:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 33:42]
  wire [19:0] RandomHardware_001_io_in; // @[RandomHardware.scala 33:42]
  wire [8:0] RandomHardware_001_io_out; // @[RandomHardware.scala 33:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 34:42]
  wire [19:0] RandomHardware_002_io_in; // @[RandomHardware.scala 34:42]
  wire [9:0] RandomHardware_002_io_out; // @[RandomHardware.scala 34:42]
  wire [15:0] RandomHardware_003_io_in; // @[RandomHardware.scala 35:42]
  wire [7:0] RandomHardware_003_io_out; // @[RandomHardware.scala 35:42]
  wire [7:0] SignExtendDouble_004_io_in; // @[RandomHardware.scala 36:42]
  wire [15:0] SignExtendDouble_004_io_out; // @[RandomHardware.scala 36:42]
  wire  ShiftRegister_005_clock; // @[RandomHardware.scala 37:42]
  wire [4:0] ShiftRegister_005_io_in; // @[RandomHardware.scala 37:42]
  wire [4:0] ShiftRegister_005_io_out; // @[RandomHardware.scala 37:42]
  wire  RegFile2R1W_006_clock; // @[RandomHardware.scala 38:34]
  wire [3:0] RegFile2R1W_006_io_in; // @[RandomHardware.scala 38:34]
  wire [3:0] RegFile2R1W_006_io_out; // @[RandomHardware.scala 38:34]
  wire [22:0] RandomHardware_007_io_in; // @[RandomHardware.scala 39:42]
  wire [10:0] RandomHardware_007_io_out; // @[RandomHardware.scala 39:42]
  wire  ShiftRegister_008_clock; // @[RandomHardware.scala 40:42]
  wire [7:0] ShiftRegister_008_io_in; // @[RandomHardware.scala 40:42]
  wire [7:0] ShiftRegister_008_io_out; // @[RandomHardware.scala 40:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 41:42]
  wire  RandomHardware_009_reset; // @[RandomHardware.scala 41:42]
  wire [22:0] RandomHardware_009_io_in; // @[RandomHardware.scala 41:42]
  wire [11:0] RandomHardware_009_io_out; // @[RandomHardware.scala 41:42]
  wire  Accum_010_clock; // @[RandomHardware.scala 42:34]
  wire [4:0] Accum_010_io_in; // @[RandomHardware.scala 42:34]
  wire [4:0] Accum_010_io_out; // @[RandomHardware.scala 42:34]
  wire [3:0] ShiftLeft_011_io_in; // @[RandomHardware.scala 43:34]
  wire [6:0] ShiftLeft_011_io_out; // @[RandomHardware.scala 43:34]
  wire [9:0] ShiftLeft_012_io_in; // @[RandomHardware.scala 44:34]
  wire [14:0] ShiftLeft_012_io_out; // @[RandomHardware.scala 44:34]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 45:42]
  wire [23:0] RandomHardware_013_io_in; // @[RandomHardware.scala 45:42]
  wire [8:0] RandomHardware_013_io_out; // @[RandomHardware.scala 45:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 46:42]
  wire [35:0] RandomHardware_014_io_in; // @[RandomHardware.scala 46:42]
  wire [35:0] RandomHardware_014_io_out; // @[RandomHardware.scala 46:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 47:42]
  wire [16:0] RandomHardware_015_io_in; // @[RandomHardware.scala 47:42]
  wire [7:0] RandomHardware_015_io_out; // @[RandomHardware.scala 47:42]
  wire [7:0] ShiftRight_016_io_in; // @[RandomHardware.scala 48:34]
  wire [7:0] ShiftRight_016_io_out; // @[RandomHardware.scala 48:34]
  wire  Reg_017_clock; // @[RandomHardware.scala 49:26]
  wire [4:0] Reg_017_io_in; // @[RandomHardware.scala 49:26]
  wire [4:0] Reg_017_io_out; // @[RandomHardware.scala 49:26]
  wire [3:0] SignExtendDouble_018_io_in; // @[RandomHardware.scala 50:42]
  wire [7:0] SignExtendDouble_018_io_out; // @[RandomHardware.scala 50:42]
  wire [12:0] io_out_lo = {Reg_017_io_out,SignExtendDouble_018_io_out}; // @[Cat.scala 30:58]
  wire [55:0] io_out_hi = {RandomHardware_001_io_out,RandomHardware_007_io_out,RandomHardware_014_io_out}; // @[Cat.scala 30:58]
  wire [14:0] wire_007 = ShiftLeft_012_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 72:18]
  wire [7:0] wire_008 = RandomHardware_015_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 74:18]
  wire [7:0] wire_015 = RandomHardware_003_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 79:18]
  wire [8:0] wire_016 = RandomHardware_013_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 84:18]
  wire [7:0] wire_000 = ShiftRegister_008_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 82:18]
  wire [11:0] wire_001 = RandomHardware_009_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 66:18]
  wire [15:0] wire_005 = SignExtendDouble_004_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 62:18]
  wire [6:0] wire_006 = ShiftLeft_011_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 70:18]
  wire [19:0] wire_012 = RandomHardware_000_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 75:18]
  wire [27:0] RandomHardware_014_io_in_hi = {wire_012,wire_000}; // @[Cat.scala 30:58]
  wire [7:0] wire_014 = ShiftRight_016_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 85:18]
  RandomHardware_1_0 RandomHardware_000 ( // @[RandomHardware.scala 32:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 33:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 34:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 35:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  SignExtendDouble SignExtendDouble_004 ( // @[RandomHardware.scala 36:42]
    .io_in(SignExtendDouble_004_io_in),
    .io_out(SignExtendDouble_004_io_out)
  );
  ShiftRegister_2 ShiftRegister_005 ( // @[RandomHardware.scala 37:42]
    .clock(ShiftRegister_005_clock),
    .io_in(ShiftRegister_005_io_in),
    .io_out(ShiftRegister_005_io_out)
  );
  RegFile2R1W RegFile2R1W_006 ( // @[RandomHardware.scala 38:34]
    .clock(RegFile2R1W_006_clock),
    .io_in(RegFile2R1W_006_io_in),
    .io_out(RegFile2R1W_006_io_out)
  );
  RandomHardware_1_7 RandomHardware_007 ( // @[RandomHardware.scala 39:42]
    .io_in(RandomHardware_007_io_in),
    .io_out(RandomHardware_007_io_out)
  );
  ShiftRegister_3 ShiftRegister_008 ( // @[RandomHardware.scala 40:42]
    .clock(ShiftRegister_008_clock),
    .io_in(ShiftRegister_008_io_in),
    .io_out(ShiftRegister_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 41:42]
    .clock(RandomHardware_009_clock),
    .reset(RandomHardware_009_reset),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  Accum Accum_010 ( // @[RandomHardware.scala 42:34]
    .clock(Accum_010_clock),
    .io_in(Accum_010_io_in),
    .io_out(Accum_010_io_out)
  );
  ShiftLeft ShiftLeft_011 ( // @[RandomHardware.scala 43:34]
    .io_in(ShiftLeft_011_io_in),
    .io_out(ShiftLeft_011_io_out)
  );
  ShiftLeft_1 ShiftLeft_012 ( // @[RandomHardware.scala 44:34]
    .io_in(ShiftLeft_012_io_in),
    .io_out(ShiftLeft_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 45:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 46:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 47:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  ShiftRight ShiftRight_016 ( // @[RandomHardware.scala 48:34]
    .io_in(ShiftRight_016_io_in),
    .io_out(ShiftRight_016_io_out)
  );
  Reg_1 Reg_017 ( // @[RandomHardware.scala 49:26]
    .clock(Reg_017_clock),
    .io_in(Reg_017_io_in),
    .io_out(Reg_017_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_018 ( // @[RandomHardware.scala 50:42]
    .io_in(SignExtendDouble_018_io_in),
    .io_out(SignExtendDouble_018_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[99:80]; // @[RandomHardware.scala 52:41]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = {wire_000,wire_001}; // @[Cat.scala 30:58]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = io_in[99:80]; // @[RandomHardware.scala 53:41]
  assign RandomHardware_003_io_in = io_in[15:0]; // @[RandomHardware.scala 54:41]
  assign SignExtendDouble_004_io_in = RandomHardware_003_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 78:18]
  assign ShiftRegister_005_clock = clock;
  assign ShiftRegister_005_io_in = RandomHardware_002_io_out[9:5]; // @[RandomHardware.scala 76:47]
  assign RegFile2R1W_006_clock = clock;
  assign RegFile2R1W_006_io_in = io_in[3:0]; // @[RandomHardware.scala 55:41]
  assign RandomHardware_007_io_in = {wire_005,wire_006}; // @[Cat.scala 30:58]
  assign ShiftRegister_008_clock = clock;
  assign ShiftRegister_008_io_in = io_in[7:0]; // @[RandomHardware.scala 56:41]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_reset = reset;
  assign RandomHardware_009_io_in = {wire_007,wire_008}; // @[Cat.scala 30:58]
  assign Accum_010_clock = clock;
  assign Accum_010_io_in = ShiftRegister_005_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 64:18]
  assign ShiftLeft_011_io_in = RegFile2R1W_006_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 80:18]
  assign ShiftLeft_012_io_in = RandomHardware_002_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 77:18]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = io_in[99:76]; // @[RandomHardware.scala 57:41]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = {RandomHardware_014_io_in_hi,wire_014}; // @[Cat.scala 30:58]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = {wire_015,wire_016}; // @[Cat.scala 30:58]
  assign ShiftRight_016_io_in = io_in[99:92]; // @[RandomHardware.scala 58:33]
  assign Reg_017_clock = clock;
  assign Reg_017_io_in = Accum_010_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 68:18]
  assign SignExtendDouble_018_io_in = RegFile2R1W_006_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 81:18]
endmodule
