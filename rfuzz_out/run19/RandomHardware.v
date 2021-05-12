module ShiftRegister(
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
module Accum(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] sum; // @[ArithmeticLogical.scala 82:18]
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
  sum = _RAND_0[14:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceOrMux(
  input  [31:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[31:17]; // @[Muxes.scala 110:27]
  wire [14:0] IN2 = io_in[16:2]; // @[Muxes.scala 111:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module Reg(
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
module ShiftRegister_1(
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
module RandomHardware_1_1(
  input         clock,
  input  [31:0] io_in,
  output [14:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_1.scala 17:34]
  wire [14:0] Accum_000_io_in; // @[RandomHardware_1_1.scala 17:34]
  wire [14:0] Accum_000_io_out; // @[RandomHardware_1_1.scala 17:34]
  wire [31:0] ReduceOrMux_001_io_in; // @[RandomHardware_1_1.scala 18:34]
  wire [14:0] ReduceOrMux_001_io_out; // @[RandomHardware_1_1.scala 18:34]
  wire  Reg_002_clock; // @[RandomHardware_1_1.scala 19:26]
  wire [31:0] Reg_002_io_in; // @[RandomHardware_1_1.scala 19:26]
  wire [31:0] Reg_002_io_out; // @[RandomHardware_1_1.scala 19:26]
  wire  ShiftRegister_003_clock; // @[RandomHardware_1_1.scala 20:42]
  wire [14:0] ShiftRegister_003_io_in; // @[RandomHardware_1_1.scala 20:42]
  wire [14:0] ShiftRegister_003_io_out; // @[RandomHardware_1_1.scala 20:42]
  Accum Accum_000 ( // @[RandomHardware_1_1.scala 17:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  ReduceOrMux ReduceOrMux_001 ( // @[RandomHardware_1_1.scala 18:34]
    .io_in(ReduceOrMux_001_io_in),
    .io_out(ReduceOrMux_001_io_out)
  );
  Reg Reg_002 ( // @[RandomHardware_1_1.scala 19:26]
    .clock(Reg_002_clock),
    .io_in(Reg_002_io_in),
    .io_out(Reg_002_io_out)
  );
  ShiftRegister_1 ShiftRegister_003 ( // @[RandomHardware_1_1.scala 20:42]
    .clock(ShiftRegister_003_clock),
    .io_in(ShiftRegister_003_io_in),
    .io_out(ShiftRegister_003_io_out)
  );
  assign io_out = ShiftRegister_003_io_out; // @[RandomHardware_1_1.scala 23:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = ReduceOrMux_001_io_out; // @[RandomHardware_1_1.scala 14:24 RandomHardware_1_1.scala 28:18]
  assign ReduceOrMux_001_io_in = Reg_002_io_out; // @[RandomHardware_1_1.scala 15:24 RandomHardware_1_1.scala 29:18]
  assign Reg_002_clock = clock;
  assign Reg_002_io_in = io_in; // @[RandomHardware_1_1.scala 22:25]
  assign ShiftRegister_003_clock = clock;
  assign ShiftRegister_003_io_in = Accum_000_io_out; // @[RandomHardware_1_1.scala 13:24 RandomHardware_1_1.scala 26:18]
endmodule
module Accum_1(
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
module RandomHardware_1_2(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
  wire  Accum_000_clock; // @[RandomHardware_1_2.scala 14:34]
  wire [18:0] Accum_000_io_in; // @[RandomHardware_1_2.scala 14:34]
  wire [18:0] Accum_000_io_out; // @[RandomHardware_1_2.scala 14:34]
  Accum_1 Accum_000 ( // @[RandomHardware_1_2.scala 14:34]
    .clock(Accum_000_clock),
    .io_in(Accum_000_io_in),
    .io_out(Accum_000_io_out)
  );
  assign io_out = Accum_000_io_out; // @[RandomHardware_1_2.scala 17:10]
  assign Accum_000_clock = clock;
  assign Accum_000_io_in = io_in; // @[RandomHardware_1_2.scala 16:25]
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
module Mux2_1(
  input  [34:0] io_in,
  output [16:0] io_out
);
  wire  sel = io_in[34]; // @[Muxes.scala 16:18]
  wire [16:0] in1 = io_in[33:17]; // @[Muxes.scala 17:18]
  wire [16:0] in0 = io_in[16:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_3(
  input  [34:0] io_in,
  output [7:0]  io_out
);
  wire [16:0] Mux2_000_io_in; // @[RandomHardware_1_3.scala 15:26]
  wire [7:0] Mux2_000_io_out; // @[RandomHardware_1_3.scala 15:26]
  wire [34:0] Mux2_001_io_in; // @[RandomHardware_1_3.scala 16:26]
  wire [16:0] Mux2_001_io_out; // @[RandomHardware_1_3.scala 16:26]
  Mux2 Mux2_000 ( // @[RandomHardware_1_3.scala 15:26]
    .io_in(Mux2_000_io_in),
    .io_out(Mux2_000_io_out)
  );
  Mux2_1 Mux2_001 ( // @[RandomHardware_1_3.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = Mux2_000_io_out; // @[RandomHardware_1_3.scala 19:10]
  assign Mux2_000_io_in = Mux2_001_io_out; // @[RandomHardware_1_3.scala 13:24 RandomHardware_1_3.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_1_3.scala 18:25]
endmodule
module SignExtendDouble(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] io_out_hi = io_in[11] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module RandomHardware_1_4(
  input  [11:0] io_in,
  output [23:0] io_out
);
  wire [11:0] SignExtendDouble_000_io_in; // @[RandomHardware_1_4.scala 14:42]
  wire [23:0] SignExtendDouble_000_io_out; // @[RandomHardware_1_4.scala 14:42]
  SignExtendDouble SignExtendDouble_000 ( // @[RandomHardware_1_4.scala 14:42]
    .io_in(SignExtendDouble_000_io_in),
    .io_out(SignExtendDouble_000_io_out)
  );
  assign io_out = SignExtendDouble_000_io_out; // @[RandomHardware_1_4.scala 17:10]
  assign SignExtendDouble_000_io_in = io_in; // @[RandomHardware_1_4.scala 16:33]
endmodule
module Reg_1(
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
module RandomHardware_1_5(
  input         clock,
  input  [15:0] io_in,
  output [15:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware_1_5.scala 14:26]
  wire [15:0] Reg_000_io_in; // @[RandomHardware_1_5.scala 14:26]
  wire [15:0] Reg_000_io_out; // @[RandomHardware_1_5.scala 14:26]
  Reg_1 Reg_000 ( // @[RandomHardware_1_5.scala 14:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  assign io_out = Reg_000_io_out; // @[RandomHardware_1_5.scala 17:10]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in; // @[RandomHardware_1_5.scala 16:25]
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
module RandomHardware_2_0(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_2_0.scala 14:26]
  wire [19:0] RegE_000_io_in; // @[RandomHardware_2_0.scala 14:26]
  wire [18:0] RegE_000_io_out; // @[RandomHardware_2_0.scala 14:26]
  RegE RegE_000 ( // @[RandomHardware_2_0.scala 14:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  assign io_out = RegE_000_io_out; // @[RandomHardware_2_0.scala 17:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = io_in; // @[RandomHardware_2_0.scala 16:25]
endmodule
module RandomHardware_1_6(
  input         clock,
  input  [15:0] io_in,
  output [7:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_6.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_6.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_6.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_6.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[7:0]; // @[RandomHardware_1_6.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{4'd0}, io_in}; // @[RandomHardware_1_6.scala 16:33]
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
module ShiftRight(
  input  [18:0] io_in,
  output [18:0] io_out
);
  assign io_out = {{5'd0}, io_in[18:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_8(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire [18:0] ShiftRight_000_io_in; // @[RandomHardware_1_8.scala 15:34]
  wire [18:0] ShiftRight_000_io_out; // @[RandomHardware_1_8.scala 15:34]
  wire  RegE_001_clock; // @[RandomHardware_1_8.scala 16:26]
  wire [19:0] RegE_001_io_in; // @[RandomHardware_1_8.scala 16:26]
  wire [18:0] RegE_001_io_out; // @[RandomHardware_1_8.scala 16:26]
  ShiftRight ShiftRight_000 ( // @[RandomHardware_1_8.scala 15:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  RegE RegE_001 ( // @[RandomHardware_1_8.scala 16:26]
    .clock(RegE_001_clock),
    .io_in(RegE_001_io_in),
    .io_out(RegE_001_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_8.scala 19:10]
  assign ShiftRight_000_io_in = RegE_001_io_out; // @[RandomHardware_1_8.scala 13:24 RandomHardware_1_8.scala 21:18]
  assign RegE_001_clock = clock;
  assign RegE_001_io_in = io_in; // @[RandomHardware_1_8.scala 18:25]
endmodule
module RandomHardware_1_9(
  input         clock,
  input  [19:0] io_in,
  output [1:0]  io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_9.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_9.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_9.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_9.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[1:0]; // @[RandomHardware_1_9.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_9.scala 16:33]
endmodule
module ReduceOrMux_1(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [6:0] IN1 = io_in[19:13]; // @[Muxes.scala 110:27]
  wire [6:0] IN2 = io_in[12:6]; // @[Muxes.scala 111:27]
  wire [5:0] SEL = io_in[5:0]; // @[Muxes.scala 112:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 114:18]
endmodule
module RandomHardware_1_10(
  input  [19:0] io_in,
  output [6:0]  io_out
);
  wire [19:0] ReduceOrMux_000_io_in; // @[RandomHardware_1_10.scala 14:34]
  wire [6:0] ReduceOrMux_000_io_out; // @[RandomHardware_1_10.scala 14:34]
  ReduceOrMux_1 ReduceOrMux_000 ( // @[RandomHardware_1_10.scala 14:34]
    .io_in(ReduceOrMux_000_io_in),
    .io_out(ReduceOrMux_000_io_out)
  );
  assign io_out = ReduceOrMux_000_io_out; // @[RandomHardware_1_10.scala 17:10]
  assign ReduceOrMux_000_io_in = io_in; // @[RandomHardware_1_10.scala 16:33]
endmodule
module ShiftRight_1(
  input  [14:0] io_in,
  output [14:0] io_out
);
  assign io_out = {{4'd0}, io_in[14:4]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module Reg_2(
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
module Mux2_2(
  input  [30:0] io_in,
  output [14:0] io_out
);
  wire  sel = io_in[30]; // @[Muxes.scala 16:18]
  wire [14:0] in1 = io_in[29:15]; // @[Muxes.scala 17:18]
  wire [14:0] in0 = io_in[14:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_11(
  input         clock,
  input  [30:0] io_in,
  output [14:0] io_out
);
  wire [14:0] ShiftRight_000_io_in; // @[RandomHardware_1_11.scala 16:34]
  wire [14:0] ShiftRight_000_io_out; // @[RandomHardware_1_11.scala 16:34]
  wire  Reg_001_clock; // @[RandomHardware_1_11.scala 17:26]
  wire [14:0] Reg_001_io_in; // @[RandomHardware_1_11.scala 17:26]
  wire [14:0] Reg_001_io_out; // @[RandomHardware_1_11.scala 17:26]
  wire [30:0] Mux2_002_io_in; // @[RandomHardware_1_11.scala 18:26]
  wire [14:0] Mux2_002_io_out; // @[RandomHardware_1_11.scala 18:26]
  ShiftRight_1 ShiftRight_000 ( // @[RandomHardware_1_11.scala 16:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  Reg_2 Reg_001 ( // @[RandomHardware_1_11.scala 17:26]
    .clock(Reg_001_clock),
    .io_in(Reg_001_io_in),
    .io_out(Reg_001_io_out)
  );
  Mux2_2 Mux2_002 ( // @[RandomHardware_1_11.scala 18:26]
    .io_in(Mux2_002_io_in),
    .io_out(Mux2_002_io_out)
  );
  assign io_out = Reg_001_io_out; // @[RandomHardware_1_11.scala 21:10]
  assign ShiftRight_000_io_in = Mux2_002_io_out; // @[RandomHardware_1_11.scala 14:24 RandomHardware_1_11.scala 25:18]
  assign Reg_001_clock = clock;
  assign Reg_001_io_in = ShiftRight_000_io_out; // @[RandomHardware_1_11.scala 13:24 RandomHardware_1_11.scala 24:18]
  assign Mux2_002_io_in = io_in; // @[RandomHardware_1_11.scala 20:25]
endmodule
module ShiftRight_2(
  input  [19:0] io_in,
  output [19:0] io_out
);
  assign io_out = {{2'd0}, io_in[19:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_12(
  input  [19:0] io_in,
  output [19:0] io_out
);
  wire [19:0] ShiftRight_000_io_in; // @[RandomHardware_1_12.scala 14:34]
  wire [19:0] ShiftRight_000_io_out; // @[RandomHardware_1_12.scala 14:34]
  ShiftRight_2 ShiftRight_000 ( // @[RandomHardware_1_12.scala 14:34]
    .io_in(ShiftRight_000_io_in),
    .io_out(ShiftRight_000_io_out)
  );
  assign io_out = ShiftRight_000_io_out; // @[RandomHardware_1_12.scala 17:10]
  assign ShiftRight_000_io_in = io_in; // @[RandomHardware_1_12.scala 16:25]
endmodule
module RandomHardware_1_13(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_13.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_13.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_13.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_13.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[11:0]; // @[RandomHardware_1_13.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{8'd0}, io_in}; // @[RandomHardware_1_13.scala 16:33]
endmodule
module RandomHardware_1_14(
  input         clock,
  input  [16:0] io_in,
  output [15:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_14.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_14.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_14.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_14.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out[15:0]; // @[RandomHardware_1_14.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{3'd0}, io_in}; // @[RandomHardware_1_14.scala 16:33]
endmodule
module SignExtendDouble_1(
  input  [7:0]  io_in,
  output [15:0] io_out
);
  wire [7:0] io_out_hi = io_in[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ShiftRight_3(
  input  [7:0] io_in,
  output [7:0] io_out
);
  assign io_out = {{1'd0}, io_in[7:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_1_15(
  input         clock,
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_15.scala 16:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_15.scala 16:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_15.scala 16:42]
  wire [7:0] SignExtendDouble_001_io_in; // @[RandomHardware_1_15.scala 17:42]
  wire [15:0] SignExtendDouble_001_io_out; // @[RandomHardware_1_15.scala 17:42]
  wire [7:0] ShiftRight_002_io_in; // @[RandomHardware_1_15.scala 18:34]
  wire [7:0] ShiftRight_002_io_out; // @[RandomHardware_1_15.scala 18:34]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_15.scala 16:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_001 ( // @[RandomHardware_1_15.scala 17:42]
    .io_in(SignExtendDouble_001_io_in),
    .io_out(SignExtendDouble_001_io_out)
  );
  ShiftRight_3 ShiftRight_002 ( // @[RandomHardware_1_15.scala 18:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  assign io_out = {SignExtendDouble_001_io_out,ShiftRight_002_io_out}; // @[Cat.scala 30:58]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in[19:0]; // @[RandomHardware_1_15.scala 20:33]
  assign SignExtendDouble_001_io_in = RandomHardware_000_io_out[7:0]; // @[RandomHardware_1_15.scala 14:24 RandomHardware_1_15.scala 23:18]
  assign ShiftRight_002_io_in = RandomHardware_000_io_out[7:0]; // @[RandomHardware_1_15.scala 13:24 RandomHardware_1_15.scala 24:18]
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
module RandomHardware_1_16(
  input  [18:0] io_in,
  output [1:0]  io_out
);
  wire [18:0] Mux8_000_io_in; // @[RandomHardware_1_16.scala 14:26]
  wire [1:0] Mux8_000_io_out; // @[RandomHardware_1_16.scala 14:26]
  Mux8 Mux8_000 ( // @[RandomHardware_1_16.scala 14:26]
    .io_in(Mux8_000_io_in),
    .io_out(Mux8_000_io_out)
  );
  assign io_out = Mux8_000_io_out; // @[RandomHardware_1_16.scala 17:10]
  assign Mux8_000_io_in = io_in; // @[RandomHardware_1_16.scala 16:25]
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
module ReduceAndMux(
  input  [33:0] io_in,
  output [14:0] io_out
);
  wire [14:0] IN1 = io_in[31:17]; // @[Muxes.scala 98:27]
  wire [14:0] IN2 = io_in[16:2]; // @[Muxes.scala 99:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 100:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 102:18]
endmodule
module ShiftRight_5(
  input  [14:0] io_in,
  output [14:0] io_out
);
  assign io_out = {{1'd0}, io_in[14:1]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware_2_2(
  input  [33:0] io_in,
  output [29:0] io_out
);
  wire [33:0] ReduceAndMux_000_io_in; // @[RandomHardware_2_2.scala 16:34]
  wire [14:0] ReduceAndMux_000_io_out; // @[RandomHardware_2_2.scala 16:34]
  wire [14:0] ShiftRight_001_io_in; // @[RandomHardware_2_2.scala 17:34]
  wire [14:0] ShiftRight_001_io_out; // @[RandomHardware_2_2.scala 17:34]
  wire [14:0] ShiftRight_002_io_in; // @[RandomHardware_2_2.scala 18:34]
  wire [14:0] ShiftRight_002_io_out; // @[RandomHardware_2_2.scala 18:34]
  ReduceAndMux ReduceAndMux_000 ( // @[RandomHardware_2_2.scala 16:34]
    .io_in(ReduceAndMux_000_io_in),
    .io_out(ReduceAndMux_000_io_out)
  );
  ShiftRight_1 ShiftRight_001 ( // @[RandomHardware_2_2.scala 17:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  ShiftRight_5 ShiftRight_002 ( // @[RandomHardware_2_2.scala 18:34]
    .io_in(ShiftRight_002_io_in),
    .io_out(ShiftRight_002_io_out)
  );
  assign io_out = {ShiftRight_001_io_out,ShiftRight_002_io_out}; // @[Cat.scala 30:58]
  assign ReduceAndMux_000_io_in = io_in; // @[RandomHardware_2_2.scala 20:33]
  assign ShiftRight_001_io_in = ReduceAndMux_000_io_out; // @[RandomHardware_2_2.scala 13:24 RandomHardware_2_2.scala 23:18]
  assign ShiftRight_002_io_in = ReduceAndMux_000_io_out; // @[RandomHardware_2_2.scala 14:24 RandomHardware_2_2.scala 24:18]
endmodule
module ShiftLeft(
  input  [13:0] io_in,
  output [18:0] io_out
);
  assign io_out = {io_in, 5'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RandomHardware_1_17(
  input         clock,
  input         reset,
  input  [29:0] io_in,
  output [44:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_17.scala 17:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_17.scala 17:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_17.scala 17:42]
  wire  ResetShiftRegister_001_clock; // @[RandomHardware_1_17.scala 18:42]
  wire  ResetShiftRegister_001_reset; // @[RandomHardware_1_17.scala 18:42]
  wire [15:0] ResetShiftRegister_001_io_in; // @[RandomHardware_1_17.scala 18:42]
  wire [14:0] ResetShiftRegister_001_io_out; // @[RandomHardware_1_17.scala 18:42]
  wire [33:0] RandomHardware_002_io_in; // @[RandomHardware_1_17.scala 19:42]
  wire [29:0] RandomHardware_002_io_out; // @[RandomHardware_1_17.scala 19:42]
  wire [13:0] ShiftLeft_003_io_in; // @[RandomHardware_1_17.scala 20:34]
  wire [18:0] ShiftLeft_003_io_out; // @[RandomHardware_1_17.scala 20:34]
  wire [48:0] _io_out_T = {RandomHardware_000_io_out,RandomHardware_002_io_out}; // @[Cat.scala 30:58]
  wire [14:0] wire_001 = ResetShiftRegister_001_io_out; // @[RandomHardware_1_17.scala 14:24 RandomHardware_1_17.scala 27:18]
  wire [18:0] wire_002 = ShiftLeft_003_io_out; // @[RandomHardware_1_17.scala 15:24 RandomHardware_1_17.scala 28:18]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_17.scala 17:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  ResetShiftRegister ResetShiftRegister_001 ( // @[RandomHardware_1_17.scala 18:42]
    .clock(ResetShiftRegister_001_clock),
    .reset(ResetShiftRegister_001_reset),
    .io_in(ResetShiftRegister_001_io_in),
    .io_out(ResetShiftRegister_001_io_out)
  );
  RandomHardware_2_2 RandomHardware_002 ( // @[RandomHardware_1_17.scala 19:42]
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  ShiftLeft ShiftLeft_003 ( // @[RandomHardware_1_17.scala 20:34]
    .io_in(ShiftLeft_003_io_in),
    .io_out(ShiftLeft_003_io_out)
  );
  assign io_out = _io_out_T[44:0]; // @[RandomHardware_1_17.scala 24:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = {{5'd0}, ResetShiftRegister_001_io_out}; // @[RandomHardware_1_17.scala 13:24 RandomHardware_1_17.scala 26:18]
  assign ResetShiftRegister_001_clock = clock;
  assign ResetShiftRegister_001_reset = reset;
  assign ResetShiftRegister_001_io_in = io_in[29:14]; // @[RandomHardware_1_17.scala 22:41]
  assign RandomHardware_002_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign ShiftLeft_003_io_in = io_in[29:16]; // @[RandomHardware_1_17.scala 23:33]
endmodule
module Accum_2(
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
module RegE_7(
  input         clock,
  input  [20:0] io_in,
  output [19:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [19:0] data = io_in[20:1]; // @[Memory.scala 20:21]
  wire  en = io_in[0]; // @[Memory.scala 21:19]
  reg [18:0] reg_; // @[Memory.scala 22:18]
  wire [19:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Memory.scala 23:14 Memory.scala 23:20 Memory.scala 22:18]
  assign io_out = {{1'd0}, reg_}; // @[Memory.scala 24:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[18:0];
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
  reg_ = _RAND_0[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2_3(
  input  [42:0] io_in,
  output [20:0] io_out
);
  wire  sel = io_in[42]; // @[Muxes.scala 16:18]
  wire [20:0] in1 = io_in[41:21]; // @[Muxes.scala 17:18]
  wire [20:0] in0 = io_in[20:0]; // @[Muxes.scala 18:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 19:15 Muxes.scala 19:24 Muxes.scala 20:24]
endmodule
module RandomHardware_1_20(
  input         clock,
  input  [42:0] io_in,
  output [19:0] io_out
);
  wire  RegE_000_clock; // @[RandomHardware_1_20.scala 15:26]
  wire [20:0] RegE_000_io_in; // @[RandomHardware_1_20.scala 15:26]
  wire [19:0] RegE_000_io_out; // @[RandomHardware_1_20.scala 15:26]
  wire [42:0] Mux2_001_io_in; // @[RandomHardware_1_20.scala 16:26]
  wire [20:0] Mux2_001_io_out; // @[RandomHardware_1_20.scala 16:26]
  RegE_7 RegE_000 ( // @[RandomHardware_1_20.scala 15:26]
    .clock(RegE_000_clock),
    .io_in(RegE_000_io_in),
    .io_out(RegE_000_io_out)
  );
  Mux2_3 Mux2_001 ( // @[RandomHardware_1_20.scala 16:26]
    .io_in(Mux2_001_io_in),
    .io_out(Mux2_001_io_out)
  );
  assign io_out = RegE_000_io_out; // @[RandomHardware_1_20.scala 19:10]
  assign RegE_000_clock = clock;
  assign RegE_000_io_in = Mux2_001_io_out; // @[RandomHardware_1_20.scala 13:24 RandomHardware_1_20.scala 21:18]
  assign Mux2_001_io_in = io_in; // @[RandomHardware_1_20.scala 18:25]
endmodule
module ShiftRegister_4(
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
module RandomHardware_1_21(
  input         clock,
  input  [11:0] io_in,
  output [11:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware_1_21.scala 14:42]
  wire [11:0] ShiftRegister_000_io_in; // @[RandomHardware_1_21.scala 14:42]
  wire [11:0] ShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 14:42]
  ShiftRegister_4 ShiftRegister_000 ( // @[RandomHardware_1_21.scala 14:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  assign io_out = ShiftRegister_000_io_out; // @[RandomHardware_1_21.scala 17:10]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = io_in; // @[RandomHardware_1_21.scala 16:33]
endmodule
module RandomHardware_1_23(
  input         clock,
  input  [19:0] io_in,
  output [18:0] io_out
);
  wire  RandomHardware_000_clock; // @[RandomHardware_1_23.scala 14:42]
  wire [19:0] RandomHardware_000_io_in; // @[RandomHardware_1_23.scala 14:42]
  wire [18:0] RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 14:42]
  RandomHardware_2_0 RandomHardware_000 ( // @[RandomHardware_1_23.scala 14:42]
    .clock(RandomHardware_000_clock),
    .io_in(RandomHardware_000_io_in),
    .io_out(RandomHardware_000_io_out)
  );
  assign io_out = RandomHardware_000_io_out; // @[RandomHardware_1_23.scala 17:10]
  assign RandomHardware_000_clock = clock;
  assign RandomHardware_000_io_in = io_in; // @[RandomHardware_1_23.scala 16:33]
endmodule
module RandomHardware(
  input         clock,
  input         reset,
  input  [99:0] io_in,
  output [78:0] io_out
);
  wire  ShiftRegister_000_clock; // @[RandomHardware.scala 43:42]
  wire [6:0] ShiftRegister_000_io_in; // @[RandomHardware.scala 43:42]
  wire [6:0] ShiftRegister_000_io_out; // @[RandomHardware.scala 43:42]
  wire  RandomHardware_001_clock; // @[RandomHardware.scala 44:42]
  wire [31:0] RandomHardware_001_io_in; // @[RandomHardware.scala 44:42]
  wire [14:0] RandomHardware_001_io_out; // @[RandomHardware.scala 44:42]
  wire  RandomHardware_002_clock; // @[RandomHardware.scala 45:42]
  wire [18:0] RandomHardware_002_io_in; // @[RandomHardware.scala 45:42]
  wire [18:0] RandomHardware_002_io_out; // @[RandomHardware.scala 45:42]
  wire [34:0] RandomHardware_003_io_in; // @[RandomHardware.scala 46:42]
  wire [7:0] RandomHardware_003_io_out; // @[RandomHardware.scala 46:42]
  wire [11:0] RandomHardware_004_io_in; // @[RandomHardware.scala 47:42]
  wire [23:0] RandomHardware_004_io_out; // @[RandomHardware.scala 47:42]
  wire  RandomHardware_005_clock; // @[RandomHardware.scala 48:42]
  wire [15:0] RandomHardware_005_io_in; // @[RandomHardware.scala 48:42]
  wire [15:0] RandomHardware_005_io_out; // @[RandomHardware.scala 48:42]
  wire  RandomHardware_006_clock; // @[RandomHardware.scala 49:42]
  wire [15:0] RandomHardware_006_io_in; // @[RandomHardware.scala 49:42]
  wire [7:0] RandomHardware_006_io_out; // @[RandomHardware.scala 49:42]
  wire  ShiftRegister_007_clock; // @[RandomHardware.scala 50:42]
  wire [4:0] ShiftRegister_007_io_in; // @[RandomHardware.scala 50:42]
  wire [4:0] ShiftRegister_007_io_out; // @[RandomHardware.scala 50:42]
  wire  RandomHardware_008_clock; // @[RandomHardware.scala 51:42]
  wire [19:0] RandomHardware_008_io_in; // @[RandomHardware.scala 51:42]
  wire [18:0] RandomHardware_008_io_out; // @[RandomHardware.scala 51:42]
  wire  RandomHardware_009_clock; // @[RandomHardware.scala 52:42]
  wire [19:0] RandomHardware_009_io_in; // @[RandomHardware.scala 52:42]
  wire [1:0] RandomHardware_009_io_out; // @[RandomHardware.scala 52:42]
  wire [19:0] RandomHardware_010_io_in; // @[RandomHardware.scala 53:42]
  wire [6:0] RandomHardware_010_io_out; // @[RandomHardware.scala 53:42]
  wire  RandomHardware_011_clock; // @[RandomHardware.scala 54:42]
  wire [30:0] RandomHardware_011_io_in; // @[RandomHardware.scala 54:42]
  wire [14:0] RandomHardware_011_io_out; // @[RandomHardware.scala 54:42]
  wire [19:0] RandomHardware_012_io_in; // @[RandomHardware.scala 55:42]
  wire [19:0] RandomHardware_012_io_out; // @[RandomHardware.scala 55:42]
  wire  RandomHardware_013_clock; // @[RandomHardware.scala 56:42]
  wire [11:0] RandomHardware_013_io_in; // @[RandomHardware.scala 56:42]
  wire [11:0] RandomHardware_013_io_out; // @[RandomHardware.scala 56:42]
  wire  RandomHardware_014_clock; // @[RandomHardware.scala 57:42]
  wire [16:0] RandomHardware_014_io_in; // @[RandomHardware.scala 57:42]
  wire [15:0] RandomHardware_014_io_out; // @[RandomHardware.scala 57:42]
  wire  RandomHardware_015_clock; // @[RandomHardware.scala 58:42]
  wire [23:0] RandomHardware_015_io_in; // @[RandomHardware.scala 58:42]
  wire [23:0] RandomHardware_015_io_out; // @[RandomHardware.scala 58:42]
  wire [18:0] RandomHardware_016_io_in; // @[RandomHardware.scala 59:42]
  wire [1:0] RandomHardware_016_io_out; // @[RandomHardware.scala 59:42]
  wire  RandomHardware_017_clock; // @[RandomHardware.scala 60:42]
  wire  RandomHardware_017_reset; // @[RandomHardware.scala 60:42]
  wire [29:0] RandomHardware_017_io_in; // @[RandomHardware.scala 60:42]
  wire [44:0] RandomHardware_017_io_out; // @[RandomHardware.scala 60:42]
  wire  Accum_018_clock; // @[RandomHardware.scala 61:34]
  wire [10:0] Accum_018_io_in; // @[RandomHardware.scala 61:34]
  wire [10:0] Accum_018_io_out; // @[RandomHardware.scala 61:34]
  wire  ShiftRegister_019_clock; // @[RandomHardware.scala 62:42]
  wire [6:0] ShiftRegister_019_io_in; // @[RandomHardware.scala 62:42]
  wire [6:0] ShiftRegister_019_io_out; // @[RandomHardware.scala 62:42]
  wire  RandomHardware_020_clock; // @[RandomHardware.scala 63:42]
  wire [42:0] RandomHardware_020_io_in; // @[RandomHardware.scala 63:42]
  wire [19:0] RandomHardware_020_io_out; // @[RandomHardware.scala 63:42]
  wire  RandomHardware_021_clock; // @[RandomHardware.scala 64:42]
  wire [11:0] RandomHardware_021_io_in; // @[RandomHardware.scala 64:42]
  wire [11:0] RandomHardware_021_io_out; // @[RandomHardware.scala 64:42]
  wire  RandomHardware_022_clock; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_022_io_in; // @[RandomHardware.scala 65:42]
  wire [11:0] RandomHardware_022_io_out; // @[RandomHardware.scala 65:42]
  wire  RandomHardware_023_clock; // @[RandomHardware.scala 66:42]
  wire [19:0] RandomHardware_023_io_in; // @[RandomHardware.scala 66:42]
  wire [18:0] RandomHardware_023_io_out; // @[RandomHardware.scala 66:42]
  wire [55:0] io_out_lo = {RandomHardware_017_io_out,Accum_018_io_out}; // @[Cat.scala 30:58]
  wire [22:0] io_out_hi = {RandomHardware_001_io_out,RandomHardware_003_io_out}; // @[Cat.scala 30:58]
  wire [4:0] wire_028 = RandomHardware_005_io_out[12:8]; // @[RandomHardware.scala 84:47]
  wire [15:0] wire_009 = RandomHardware_005_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 83:18]
  wire [1:0] wire_010 = RandomHardware_009_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 115:18]
  wire [17:0] RandomHardware_010_io_in_hi = {wire_009,wire_010}; // @[Cat.scala 30:58]
  wire [1:0] wire_011 = RandomHardware_016_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 98:18]
  wire [11:0] wire_012 = RandomHardware_021_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 117:18]
  wire [18:0] wire_013 = RandomHardware_023_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 108:18]
  wire [7:0] wire_015 = RandomHardware_006_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 112:18]
  wire [8:0] wire_016 = RandomHardware_008_io_out[17:9]; // @[RandomHardware.scala 114:47]
  wire [18:0] wire_024 = RandomHardware_002_io_out; // @[RandomHardware.scala 37:24 RandomHardware.scala 80:18]
  wire [23:0] wire_025 = RandomHardware_015_io_out; // @[RandomHardware.scala 38:24 RandomHardware.scala 96:18]
  wire [6:0] wire_027 = ShiftRegister_000_io_out; // @[RandomHardware.scala 40:24 RandomHardware.scala 77:18]
  wire [5:0] wire_022 = RandomHardware_022_io_out[5:0]; // @[RandomHardware.scala 106:47]
  wire [19:0] wire_001 = RandomHardware_012_io_out; // @[RandomHardware.scala 14:24 RandomHardware.scala 116:18]
  wire [11:0] wire_002 = RandomHardware_013_io_out; // @[RandomHardware.scala 15:24 RandomHardware.scala 92:18]
  wire [14:0] wire_005 = RandomHardware_011_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 90:18]
  wire [22:0] RandomHardware_003_io_in_hi = {wire_015,wire_005}; // @[Cat.scala 30:58]
  wire [11:0] wire_006 = RandomHardware_022_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 105:18]
  wire [19:0] wire_020 = RandomHardware_020_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 102:18]
  wire [38:0] _RandomHardware_017_io_in_T = {wire_024,wire_020}; // @[Cat.scala 30:58]
  wire [4:0] wire_021 = ShiftRegister_007_io_out; // @[RandomHardware.scala 34:24 RandomHardware.scala 86:18]
  ShiftRegister ShiftRegister_000 ( // @[RandomHardware.scala 43:42]
    .clock(ShiftRegister_000_clock),
    .io_in(ShiftRegister_000_io_in),
    .io_out(ShiftRegister_000_io_out)
  );
  RandomHardware_1_1 RandomHardware_001 ( // @[RandomHardware.scala 44:42]
    .clock(RandomHardware_001_clock),
    .io_in(RandomHardware_001_io_in),
    .io_out(RandomHardware_001_io_out)
  );
  RandomHardware_1_2 RandomHardware_002 ( // @[RandomHardware.scala 45:42]
    .clock(RandomHardware_002_clock),
    .io_in(RandomHardware_002_io_in),
    .io_out(RandomHardware_002_io_out)
  );
  RandomHardware_1_3 RandomHardware_003 ( // @[RandomHardware.scala 46:42]
    .io_in(RandomHardware_003_io_in),
    .io_out(RandomHardware_003_io_out)
  );
  RandomHardware_1_4 RandomHardware_004 ( // @[RandomHardware.scala 47:42]
    .io_in(RandomHardware_004_io_in),
    .io_out(RandomHardware_004_io_out)
  );
  RandomHardware_1_5 RandomHardware_005 ( // @[RandomHardware.scala 48:42]
    .clock(RandomHardware_005_clock),
    .io_in(RandomHardware_005_io_in),
    .io_out(RandomHardware_005_io_out)
  );
  RandomHardware_1_6 RandomHardware_006 ( // @[RandomHardware.scala 49:42]
    .clock(RandomHardware_006_clock),
    .io_in(RandomHardware_006_io_in),
    .io_out(RandomHardware_006_io_out)
  );
  ShiftRegister_2 ShiftRegister_007 ( // @[RandomHardware.scala 50:42]
    .clock(ShiftRegister_007_clock),
    .io_in(ShiftRegister_007_io_in),
    .io_out(ShiftRegister_007_io_out)
  );
  RandomHardware_1_8 RandomHardware_008 ( // @[RandomHardware.scala 51:42]
    .clock(RandomHardware_008_clock),
    .io_in(RandomHardware_008_io_in),
    .io_out(RandomHardware_008_io_out)
  );
  RandomHardware_1_9 RandomHardware_009 ( // @[RandomHardware.scala 52:42]
    .clock(RandomHardware_009_clock),
    .io_in(RandomHardware_009_io_in),
    .io_out(RandomHardware_009_io_out)
  );
  RandomHardware_1_10 RandomHardware_010 ( // @[RandomHardware.scala 53:42]
    .io_in(RandomHardware_010_io_in),
    .io_out(RandomHardware_010_io_out)
  );
  RandomHardware_1_11 RandomHardware_011 ( // @[RandomHardware.scala 54:42]
    .clock(RandomHardware_011_clock),
    .io_in(RandomHardware_011_io_in),
    .io_out(RandomHardware_011_io_out)
  );
  RandomHardware_1_12 RandomHardware_012 ( // @[RandomHardware.scala 55:42]
    .io_in(RandomHardware_012_io_in),
    .io_out(RandomHardware_012_io_out)
  );
  RandomHardware_1_13 RandomHardware_013 ( // @[RandomHardware.scala 56:42]
    .clock(RandomHardware_013_clock),
    .io_in(RandomHardware_013_io_in),
    .io_out(RandomHardware_013_io_out)
  );
  RandomHardware_1_14 RandomHardware_014 ( // @[RandomHardware.scala 57:42]
    .clock(RandomHardware_014_clock),
    .io_in(RandomHardware_014_io_in),
    .io_out(RandomHardware_014_io_out)
  );
  RandomHardware_1_15 RandomHardware_015 ( // @[RandomHardware.scala 58:42]
    .clock(RandomHardware_015_clock),
    .io_in(RandomHardware_015_io_in),
    .io_out(RandomHardware_015_io_out)
  );
  RandomHardware_1_16 RandomHardware_016 ( // @[RandomHardware.scala 59:42]
    .io_in(RandomHardware_016_io_in),
    .io_out(RandomHardware_016_io_out)
  );
  RandomHardware_1_17 RandomHardware_017 ( // @[RandomHardware.scala 60:42]
    .clock(RandomHardware_017_clock),
    .reset(RandomHardware_017_reset),
    .io_in(RandomHardware_017_io_in),
    .io_out(RandomHardware_017_io_out)
  );
  Accum_2 Accum_018 ( // @[RandomHardware.scala 61:34]
    .clock(Accum_018_clock),
    .io_in(Accum_018_io_in),
    .io_out(Accum_018_io_out)
  );
  ShiftRegister ShiftRegister_019 ( // @[RandomHardware.scala 62:42]
    .clock(ShiftRegister_019_clock),
    .io_in(ShiftRegister_019_io_in),
    .io_out(ShiftRegister_019_io_out)
  );
  RandomHardware_1_20 RandomHardware_020 ( // @[RandomHardware.scala 63:42]
    .clock(RandomHardware_020_clock),
    .io_in(RandomHardware_020_io_in),
    .io_out(RandomHardware_020_io_out)
  );
  RandomHardware_1_21 RandomHardware_021 ( // @[RandomHardware.scala 64:42]
    .clock(RandomHardware_021_clock),
    .io_in(RandomHardware_021_io_in),
    .io_out(RandomHardware_021_io_out)
  );
  RandomHardware_1_13 RandomHardware_022 ( // @[RandomHardware.scala 65:42]
    .clock(RandomHardware_022_clock),
    .io_in(RandomHardware_022_io_in),
    .io_out(RandomHardware_022_io_out)
  );
  RandomHardware_1_23 RandomHardware_023 ( // @[RandomHardware.scala 66:42]
    .clock(RandomHardware_023_clock),
    .io_in(RandomHardware_023_io_in),
    .io_out(RandomHardware_023_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign ShiftRegister_000_clock = clock;
  assign ShiftRegister_000_io_in = ShiftRegister_019_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 100:18]
  assign RandomHardware_001_clock = clock;
  assign RandomHardware_001_io_in = {wire_001,wire_002}; // @[Cat.scala 30:58]
  assign RandomHardware_002_clock = clock;
  assign RandomHardware_002_io_in = RandomHardware_008_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 113:18]
  assign RandomHardware_003_io_in = {RandomHardware_003_io_in_hi,wire_006}; // @[Cat.scala 30:58]
  assign RandomHardware_004_io_in = io_in[99:88]; // @[RandomHardware.scala 68:41]
  assign RandomHardware_005_clock = clock;
  assign RandomHardware_005_io_in = RandomHardware_014_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 94:18]
  assign RandomHardware_006_clock = clock;
  assign RandomHardware_006_io_in = io_in[15:0]; // @[RandomHardware.scala 69:41]
  assign ShiftRegister_007_clock = clock;
  assign ShiftRegister_007_io_in = RandomHardware_005_io_out[4:0]; // @[RandomHardware.scala 82:47]
  assign RandomHardware_008_clock = clock;
  assign RandomHardware_008_io_in = io_in[19:0]; // @[RandomHardware.scala 70:41]
  assign RandomHardware_009_clock = clock;
  assign RandomHardware_009_io_in = io_in[19:0]; // @[RandomHardware.scala 71:41]
  assign RandomHardware_010_io_in = {RandomHardware_010_io_in_hi,wire_011}; // @[Cat.scala 30:58]
  assign RandomHardware_011_clock = clock;
  assign RandomHardware_011_io_in = {wire_012,wire_013}; // @[Cat.scala 30:58]
  assign RandomHardware_012_io_in = io_in[99:80]; // @[RandomHardware.scala 72:41]
  assign RandomHardware_013_clock = clock;
  assign RandomHardware_013_io_in = RandomHardware_021_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 118:18]
  assign RandomHardware_014_clock = clock;
  assign RandomHardware_014_io_in = {wire_015,wire_016}; // @[Cat.scala 30:58]
  assign RandomHardware_015_clock = clock;
  assign RandomHardware_015_io_in = RandomHardware_004_io_out; // @[RandomHardware.scala 30:24 RandomHardware.scala 110:18]
  assign RandomHardware_016_io_in = RandomHardware_023_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 109:18]
  assign RandomHardware_017_clock = clock;
  assign RandomHardware_017_reset = reset;
  assign RandomHardware_017_io_in = _RandomHardware_017_io_in_T[29:0]; // @[RandomHardware.scala 121:33]
  assign Accum_018_clock = clock;
  assign Accum_018_io_in = {wire_021,wire_022}; // @[Cat.scala 30:58]
  assign ShiftRegister_019_clock = clock;
  assign ShiftRegister_019_io_in = RandomHardware_010_io_out; // @[RandomHardware.scala 36:24 RandomHardware.scala 88:18]
  assign RandomHardware_020_clock = clock;
  assign RandomHardware_020_io_in = {wire_024,wire_025}; // @[Cat.scala 30:58]
  assign RandomHardware_021_clock = clock;
  assign RandomHardware_021_io_in = io_in[11:0]; // @[RandomHardware.scala 73:41]
  assign RandomHardware_022_clock = clock;
  assign RandomHardware_022_io_in = {wire_027,wire_028}; // @[Cat.scala 30:58]
  assign RandomHardware_023_clock = clock;
  assign RandomHardware_023_io_in = RandomHardware_020_io_out; // @[RandomHardware.scala 39:24 RandomHardware.scala 103:18]
endmodule
