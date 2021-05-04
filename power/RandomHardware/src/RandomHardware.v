module Reg(
  input         clock,
  input  [35:0] io_in,
  output [35:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [35:0] io_out_REG; // @[Registers.scala 10:22]
  assign io_out = io_out_REG; // @[Registers.scala 10:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Registers.scala 10:22]
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
  io_out_REG = _RAND_0[35:0];
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
  input  [27:0] io_in,
  output [26:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [26:0] data = io_in[27:1]; // @[Registers.scala 18:21]
  wire  en = io_in[0]; // @[Registers.scala 19:19]
  reg [25:0] reg_; // @[Registers.scala 20:18]
  wire [26:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Registers.scala 21:14 Registers.scala 21:20 Registers.scala 20:18]
  assign io_out = {{1'd0}, reg_}; // @[Registers.scala 22:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[25:0];
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
  reg_ = _RAND_0[25:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegE_1(
  input         clock,
  input  [10:0] io_in,
  output [9:0]  io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [9:0] data = io_in[10:1]; // @[Registers.scala 18:21]
  wire  en = io_in[0]; // @[Registers.scala 19:19]
  reg [8:0] reg_; // @[Registers.scala 20:18]
  wire [9:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Registers.scala 21:14 Registers.scala 21:20 Registers.scala 20:18]
  assign io_out = {{1'd0}, reg_}; // @[Registers.scala 22:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[8:0];
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
  reg_ = _RAND_0[8:0];
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
  input  [49:0] io_in,
  output [49:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [49:0] sum; // @[Arithmetics.scala 69:18]
  assign io_out = sum; // @[Arithmetics.scala 71:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[Arithmetics.scala 70:16]
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
  sum = _RAND_0[49:0];
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
  input  [34:0] io_in,
  output [33:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [33:0] data = io_in[34:1]; // @[Registers.scala 18:21]
  wire  en = io_in[0]; // @[Registers.scala 19:19]
  reg [32:0] reg_; // @[Registers.scala 20:18]
  wire [33:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Registers.scala 21:14 Registers.scala 21:20 Registers.scala 20:18]
  assign io_out = {{1'd0}, reg_}; // @[Registers.scala 22:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[32:0];
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
  reg_ = _RAND_0[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mul(
  input  [33:0] io_in,
  output [33:0] io_out
);
  wire [16:0] in1 = io_in[33:17]; // @[Arithmetics.scala 34:20]
  wire [16:0] in2 = io_in[16:0]; // @[Arithmetics.scala 35:20]
  assign io_out = in1 * in2; // @[Arithmetics.scala 36:19]
endmodule
module Add(
  input  [27:0] io_in,
  output [14:0] io_out
);
  wire [13:0] in1 = io_in[27:14]; // @[Arithmetics.scala 12:20]
  wire [13:0] in2 = io_in[13:0]; // @[Arithmetics.scala 13:20]
  wire [13:0] _io_out_T_1 = in1 + in2; // @[Arithmetics.scala 14:19]
  assign io_out = {{1'd0}, _io_out_T_1}; // @[Arithmetics.scala 14:19]
endmodule
module Accum_1(
  input         clock,
  input  [23:0] io_in,
  output [23:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] sum; // @[Arithmetics.scala 69:18]
  assign io_out = sum; // @[Arithmetics.scala 71:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[Arithmetics.scala 70:16]
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
  sum = _RAND_0[23:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mul_1(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [3:0] in1 = io_in[7:4]; // @[Arithmetics.scala 34:20]
  wire [3:0] in2 = io_in[3:0]; // @[Arithmetics.scala 35:20]
  assign io_out = in1 * in2; // @[Arithmetics.scala 36:19]
endmodule
module And(
  input  [35:0] io_in,
  output [17:0] io_out
);
  wire [17:0] in1 = io_in[35:18]; // @[Arithmetics.scala 23:20]
  wire [17:0] in2 = io_in[17:0]; // @[Arithmetics.scala 24:20]
  assign io_out = in1 & in2; // @[Arithmetics.scala 25:19]
endmodule
module RegE_3(
  input         clock,
  input  [15:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [14:0] data = io_in[15:1]; // @[Registers.scala 18:21]
  wire  en = io_in[0]; // @[Registers.scala 19:19]
  reg [13:0] reg_; // @[Registers.scala 20:18]
  wire [14:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Registers.scala 21:14 Registers.scala 21:20 Registers.scala 20:18]
  assign io_out = {{1'd0}, reg_}; // @[Registers.scala 22:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[13:0];
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
  reg_ = _RAND_0[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_1(
  input        clock,
  input  [2:0] io_in,
  output [2:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] io_out_REG; // @[Registers.scala 10:22]
  assign io_out = io_out_REG; // @[Registers.scala 10:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Registers.scala 10:22]
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
module Mux2(
  input  [20:0] io_in,
  output [9:0]  io_out
);
  wire  sel = io_in[20]; // @[Muxes.scala 13:18]
  wire [9:0] in1 = io_in[19:10]; // @[Muxes.scala 14:18]
  wire [9:0] in2 = io_in[9:0]; // @[Muxes.scala 15:18]
  assign io_out = sel ? in1 : in2; // @[Muxes.scala 16:15 Muxes.scala 16:24 Muxes.scala 17:24]
endmodule
module Reg_2(
  input         clock,
  input  [48:0] io_in,
  output [48:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [48:0] io_out_REG; // @[Registers.scala 10:22]
  assign io_out = io_out_REG; // @[Registers.scala 10:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Registers.scala 10:22]
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
  io_out_REG = _RAND_0[48:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module And_1(
  input  [27:0] io_in,
  output [13:0] io_out
);
  wire [13:0] in1 = io_in[27:14]; // @[Arithmetics.scala 23:20]
  wire [13:0] in2 = io_in[13:0]; // @[Arithmetics.scala 24:20]
  assign io_out = in1 & in2; // @[Arithmetics.scala 25:19]
endmodule
module RegFile2R1W(
  input         clock,
  input  [39:0] io_in,
  output [75:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  R1_SEL = io_in[39]; // @[RegFile2R1W.scala 17:28]
  wire  R2_SEL = io_in[38]; // @[RegFile2R1W.scala 18:28]
  wire [37:0] W_DATA = io_in[37:0]; // @[RegFile2R1W.scala 19:28]
  reg [37:0] registers_0; // @[RegFile2R1W.scala 21:22]
  reg [37:0] registers_1; // @[RegFile2R1W.scala 21:22]
  wire [37:0] _GEN_3 = R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [37:0] _GEN_5 = R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  assign io_out = {_GEN_3,_GEN_5}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (~R1_SEL) begin // @[RegFile2R1W.scala 24:21]
      registers_0 <= W_DATA; // @[RegFile2R1W.scala 24:21]
    end
    if (R1_SEL) begin // @[RegFile2R1W.scala 24:21]
      registers_1 <= W_DATA; // @[RegFile2R1W.scala 24:21]
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
  _RAND_0 = {2{`RANDOM}};
  registers_0 = _RAND_0[37:0];
  _RAND_1 = {2{`RANDOM}};
  registers_1 = _RAND_1[37:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Accum_2(
  input         clock,
  input  [81:0] io_in,
  output [81:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [81:0] sum; // @[Arithmetics.scala 69:18]
  assign io_out = sum; // @[Arithmetics.scala 71:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[Arithmetics.scala 70:16]
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
  _RAND_0 = {3{`RANDOM}};
  sum = _RAND_0[81:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_4(
  input         clock,
  input  [24:0] io_in,
  output [24:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [24:0] io_out_REG; // @[Registers.scala 10:22]
  assign io_out = io_out_REG; // @[Registers.scala 10:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Registers.scala 10:22]
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
  io_out_REG = _RAND_0[24:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_5(
  input        clock,
  input  [5:0] io_in,
  output [5:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] io_out_REG; // @[Registers.scala 10:22]
  assign io_out = io_out_REG; // @[Registers.scala 10:12]
  always @(posedge clock) begin
    io_out_REG <= io_in; // @[Registers.scala 10:22]
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
module Mux2_2(
  input  [12:0] io_in,
  output [5:0]  io_out
);
  wire  sel = io_in[12]; // @[Muxes.scala 13:18]
  wire [5:0] in1 = io_in[11:6]; // @[Muxes.scala 14:18]
  wire [5:0] in2 = io_in[5:0]; // @[Muxes.scala 15:18]
  assign io_out = sel ? in1 : in2; // @[Muxes.scala 16:15 Muxes.scala 16:24 Muxes.scala 17:24]
endmodule
module And_2(
  input  [3:0] io_in,
  output [1:0] io_out
);
  wire [1:0] in1 = io_in[3:2]; // @[Arithmetics.scala 23:20]
  wire [1:0] in2 = io_in[1:0]; // @[Arithmetics.scala 24:20]
  assign io_out = in1 & in2; // @[Arithmetics.scala 25:19]
endmodule
module RegE_4(
  input         clock,
  input  [35:0] io_in,
  output [34:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [34:0] data = io_in[35:1]; // @[Registers.scala 18:21]
  wire  en = io_in[0]; // @[Registers.scala 19:19]
  reg [33:0] reg_; // @[Registers.scala 20:18]
  wire [34:0] _GEN_0 = en ? data : {{1'd0}, reg_}; // @[Registers.scala 21:14 Registers.scala 21:20 Registers.scala 20:18]
  assign io_out = {{1'd0}, reg_}; // @[Registers.scala 22:12]
  always @(posedge clock) begin
    reg_ <= _GEN_0[33:0];
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
  reg_ = _RAND_0[33:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [247:0] io_in,
  output [195:0] io_out
);
  wire  Reg_000_clock; // @[RandomHardware.scala 45:26]
  wire [35:0] Reg_000_io_in; // @[RandomHardware.scala 45:26]
  wire [35:0] Reg_000_io_out; // @[RandomHardware.scala 45:26]
  wire  RegE_001_clock; // @[RandomHardware.scala 46:26]
  wire [27:0] RegE_001_io_in; // @[RandomHardware.scala 46:26]
  wire [26:0] RegE_001_io_out; // @[RandomHardware.scala 46:26]
  wire  RegE_002_clock; // @[RandomHardware.scala 47:26]
  wire [10:0] RegE_002_io_in; // @[RandomHardware.scala 47:26]
  wire [9:0] RegE_002_io_out; // @[RandomHardware.scala 47:26]
  wire  Accum_003_clock; // @[RandomHardware.scala 48:34]
  wire [49:0] Accum_003_io_in; // @[RandomHardware.scala 48:34]
  wire [49:0] Accum_003_io_out; // @[RandomHardware.scala 48:34]
  wire  RegE_004_clock; // @[RandomHardware.scala 49:26]
  wire [34:0] RegE_004_io_in; // @[RandomHardware.scala 49:26]
  wire [33:0] RegE_004_io_out; // @[RandomHardware.scala 49:26]
  wire [33:0] Mul_005_io_in; // @[RandomHardware.scala 50:26]
  wire [33:0] Mul_005_io_out; // @[RandomHardware.scala 50:26]
  wire [27:0] Add_006_io_in; // @[RandomHardware.scala 51:26]
  wire [14:0] Add_006_io_out; // @[RandomHardware.scala 51:26]
  wire  Accum_007_clock; // @[RandomHardware.scala 52:34]
  wire [23:0] Accum_007_io_in; // @[RandomHardware.scala 52:34]
  wire [23:0] Accum_007_io_out; // @[RandomHardware.scala 52:34]
  wire [27:0] Add_008_io_in; // @[RandomHardware.scala 53:26]
  wire [14:0] Add_008_io_out; // @[RandomHardware.scala 53:26]
  wire [7:0] Mul_009_io_in; // @[RandomHardware.scala 54:26]
  wire [7:0] Mul_009_io_out; // @[RandomHardware.scala 54:26]
  wire [35:0] And_010_io_in; // @[RandomHardware.scala 55:26]
  wire [17:0] And_010_io_out; // @[RandomHardware.scala 55:26]
  wire  RegE_011_clock; // @[RandomHardware.scala 56:26]
  wire [15:0] RegE_011_io_in; // @[RandomHardware.scala 56:26]
  wire [14:0] RegE_011_io_out; // @[RandomHardware.scala 56:26]
  wire  Reg_012_clock; // @[RandomHardware.scala 57:26]
  wire [2:0] Reg_012_io_in; // @[RandomHardware.scala 57:26]
  wire [2:0] Reg_012_io_out; // @[RandomHardware.scala 57:26]
  wire [20:0] Mux2_013_io_in; // @[RandomHardware.scala 58:26]
  wire [9:0] Mux2_013_io_out; // @[RandomHardware.scala 58:26]
  wire  Reg_014_clock; // @[RandomHardware.scala 59:26]
  wire [48:0] Reg_014_io_in; // @[RandomHardware.scala 59:26]
  wire [48:0] Reg_014_io_out; // @[RandomHardware.scala 59:26]
  wire [27:0] And_015_io_in; // @[RandomHardware.scala 60:26]
  wire [13:0] And_015_io_out; // @[RandomHardware.scala 60:26]
  wire  Reg_016_clock; // @[RandomHardware.scala 61:26]
  wire [48:0] Reg_016_io_in; // @[RandomHardware.scala 61:26]
  wire [48:0] Reg_016_io_out; // @[RandomHardware.scala 61:26]
  wire  RegFile2R1W_017_clock; // @[RandomHardware.scala 62:34]
  wire [39:0] RegFile2R1W_017_io_in; // @[RandomHardware.scala 62:34]
  wire [75:0] RegFile2R1W_017_io_out; // @[RandomHardware.scala 62:34]
  wire  Accum_018_clock; // @[RandomHardware.scala 63:34]
  wire [81:0] Accum_018_io_in; // @[RandomHardware.scala 63:34]
  wire [81:0] Accum_018_io_out; // @[RandomHardware.scala 63:34]
  wire  Reg_019_clock; // @[RandomHardware.scala 64:26]
  wire [24:0] Reg_019_io_in; // @[RandomHardware.scala 64:26]
  wire [24:0] Reg_019_io_out; // @[RandomHardware.scala 64:26]
  wire  Reg_020_clock; // @[RandomHardware.scala 65:26]
  wire [5:0] Reg_020_io_in; // @[RandomHardware.scala 65:26]
  wire [5:0] Reg_020_io_out; // @[RandomHardware.scala 65:26]
  wire [20:0] Mux2_021_io_in; // @[RandomHardware.scala 66:26]
  wire [9:0] Mux2_021_io_out; // @[RandomHardware.scala 66:26]
  wire [12:0] Mux2_022_io_in; // @[RandomHardware.scala 67:26]
  wire [5:0] Mux2_022_io_out; // @[RandomHardware.scala 67:26]
  wire [3:0] And_023_io_in; // @[RandomHardware.scala 68:26]
  wire [1:0] And_023_io_out; // @[RandomHardware.scala 68:26]
  wire  RegE_024_clock; // @[RandomHardware.scala 69:26]
  wire [35:0] RegE_024_io_in; // @[RandomHardware.scala 69:26]
  wire [34:0] RegE_024_io_out; // @[RandomHardware.scala 69:26]
  wire [112:0] top_out_lo = {Accum_018_io_out,Reg_019_io_out,Mux2_022_io_out}; // @[Cat.scala 30:58]
  wire [82:0] top_out_hi = {RegE_002_io_out,Accum_003_io_out,Mul_009_io_out,RegE_011_io_out}; // @[Cat.scala 30:58]
  wire [33:0] wire_015 = Mul_005_io_out; // @[RandomHardware.scala 84:36]
  wire [17:0] wire_022 = And_010_io_out; // @[RandomHardware.scala 86:36]
  wire  wire_002 = Reg_012_io_out[0]; // @[RandomHardware.scala 88:36]
  wire [1:0] wire_006 = Reg_012_io_out[2:1]; // @[RandomHardware.scala 89:36]
  wire [13:0] wire_012 = RegE_001_io_out[26:13]; // @[RandomHardware.scala 107:37]
  wire [6:0] wire_013 = And_015_io_out[6:0]; // @[RandomHardware.scala 114:36]
  wire [9:0] wire_020 = Mux2_013_io_out; // @[RandomHardware.scala 91:37]
  wire [48:0] wire_003 = Reg_014_io_out; // @[RandomHardware.scala 93:36]
  wire [14:0] wire_016 = Add_006_io_out; // @[RandomHardware.scala 108:36]
  wire [2:0] wire_023 = Reg_020_io_out[5:3]; // @[RandomHardware.scala 98:36]
  wire [2:0] wire_001 = Mux2_021_io_out[2:0]; // @[RandomHardware.scala 100:37]
  wire [2:0] wire_010 = Mux2_021_io_out[5:3]; // @[RandomHardware.scala 101:37]
  wire [1:0] wire_007 = And_023_io_out; // @[RandomHardware.scala 104:36]
  wire [12:0] wire_009 = RegE_001_io_out[12:0]; // @[RandomHardware.scala 106:37]
  wire [5:0] wire_000 = Accum_007_io_out[5:0]; // @[RandomHardware.scala 109:38]
  wire [5:0] wire_017 = Accum_007_io_out[11:6]; // @[RandomHardware.scala 110:38]
  wire [5:0] wire_024 = Accum_007_io_out[23:18]; // @[RandomHardware.scala 112:38]
  wire [14:0] wire_019 = Add_008_io_out; // @[RandomHardware.scala 113:36]
  wire [6:0] wire_025 = And_015_io_out[13:7]; // @[RandomHardware.scala 115:36]
  wire [75:0] wire_018 = RegFile2R1W_017_io_out; // @[RandomHardware.scala 116:44]
  wire [8:0] _RegE_002_io_in_T = {wire_000,wire_001}; // @[Cat.scala 30:58]
  wire [3:0] _Mul_009_io_in_T = {wire_006,wire_007}; // @[Cat.scala 30:58]
  Reg Reg_000 ( // @[RandomHardware.scala 45:26]
    .clock(Reg_000_clock),
    .io_in(Reg_000_io_in),
    .io_out(Reg_000_io_out)
  );
  RegE RegE_001 ( // @[RandomHardware.scala 46:26]
    .clock(RegE_001_clock),
    .io_in(RegE_001_io_in),
    .io_out(RegE_001_io_out)
  );
  RegE_1 RegE_002 ( // @[RandomHardware.scala 47:26]
    .clock(RegE_002_clock),
    .io_in(RegE_002_io_in),
    .io_out(RegE_002_io_out)
  );
  Accum Accum_003 ( // @[RandomHardware.scala 48:34]
    .clock(Accum_003_clock),
    .io_in(Accum_003_io_in),
    .io_out(Accum_003_io_out)
  );
  RegE_2 RegE_004 ( // @[RandomHardware.scala 49:26]
    .clock(RegE_004_clock),
    .io_in(RegE_004_io_in),
    .io_out(RegE_004_io_out)
  );
  Mul Mul_005 ( // @[RandomHardware.scala 50:26]
    .io_in(Mul_005_io_in),
    .io_out(Mul_005_io_out)
  );
  Add Add_006 ( // @[RandomHardware.scala 51:26]
    .io_in(Add_006_io_in),
    .io_out(Add_006_io_out)
  );
  Accum_1 Accum_007 ( // @[RandomHardware.scala 52:34]
    .clock(Accum_007_clock),
    .io_in(Accum_007_io_in),
    .io_out(Accum_007_io_out)
  );
  Add Add_008 ( // @[RandomHardware.scala 53:26]
    .io_in(Add_008_io_in),
    .io_out(Add_008_io_out)
  );
  Mul_1 Mul_009 ( // @[RandomHardware.scala 54:26]
    .io_in(Mul_009_io_in),
    .io_out(Mul_009_io_out)
  );
  And And_010 ( // @[RandomHardware.scala 55:26]
    .io_in(And_010_io_in),
    .io_out(And_010_io_out)
  );
  RegE_3 RegE_011 ( // @[RandomHardware.scala 56:26]
    .clock(RegE_011_clock),
    .io_in(RegE_011_io_in),
    .io_out(RegE_011_io_out)
  );
  Reg_1 Reg_012 ( // @[RandomHardware.scala 57:26]
    .clock(Reg_012_clock),
    .io_in(Reg_012_io_in),
    .io_out(Reg_012_io_out)
  );
  Mux2 Mux2_013 ( // @[RandomHardware.scala 58:26]
    .io_in(Mux2_013_io_in),
    .io_out(Mux2_013_io_out)
  );
  Reg_2 Reg_014 ( // @[RandomHardware.scala 59:26]
    .clock(Reg_014_clock),
    .io_in(Reg_014_io_in),
    .io_out(Reg_014_io_out)
  );
  And_1 And_015 ( // @[RandomHardware.scala 60:26]
    .io_in(And_015_io_in),
    .io_out(And_015_io_out)
  );
  Reg_2 Reg_016 ( // @[RandomHardware.scala 61:26]
    .clock(Reg_016_clock),
    .io_in(Reg_016_io_in),
    .io_out(Reg_016_io_out)
  );
  RegFile2R1W RegFile2R1W_017 ( // @[RandomHardware.scala 62:34]
    .clock(RegFile2R1W_017_clock),
    .io_in(RegFile2R1W_017_io_in),
    .io_out(RegFile2R1W_017_io_out)
  );
  Accum_2 Accum_018 ( // @[RandomHardware.scala 63:34]
    .clock(Accum_018_clock),
    .io_in(Accum_018_io_in),
    .io_out(Accum_018_io_out)
  );
  Reg_4 Reg_019 ( // @[RandomHardware.scala 64:26]
    .clock(Reg_019_clock),
    .io_in(Reg_019_io_in),
    .io_out(Reg_019_io_out)
  );
  Reg_5 Reg_020 ( // @[RandomHardware.scala 65:26]
    .clock(Reg_020_clock),
    .io_in(Reg_020_io_in),
    .io_out(Reg_020_io_out)
  );
  Mux2 Mux2_021 ( // @[RandomHardware.scala 66:26]
    .io_in(Mux2_021_io_in),
    .io_out(Mux2_021_io_out)
  );
  Mux2_2 Mux2_022 ( // @[RandomHardware.scala 67:26]
    .io_in(Mux2_022_io_in),
    .io_out(Mux2_022_io_out)
  );
  And_2 And_023 ( // @[RandomHardware.scala 68:26]
    .io_in(And_023_io_in),
    .io_out(And_023_io_out)
  );
  RegE_4 RegE_024 ( // @[RandomHardware.scala 69:26]
    .clock(RegE_024_clock),
    .io_in(RegE_024_io_in),
    .io_out(RegE_024_io_out)
  );
  assign io_out = {top_out_hi,top_out_lo}; // @[Cat.scala 30:58]
  assign Reg_000_clock = clock;
  assign Reg_000_io_in = io_in[35:0]; // @[RandomHardware.scala 71:34]
  assign RegE_001_clock = clock;
  assign RegE_001_io_in = io_in[63:36]; // @[RandomHardware.scala 72:34]
  assign RegE_002_clock = clock;
  assign RegE_002_io_in = {{2'd0}, _RegE_002_io_in_T}; // @[Cat.scala 30:58]
  assign Accum_003_clock = clock;
  assign Accum_003_io_in = {wire_002,wire_003}; // @[Cat.scala 30:58]
  assign RegE_004_clock = clock;
  assign RegE_004_io_in = RegE_024_io_out; // @[RandomHardware.scala 117:37]
  assign Mul_005_io_in = RegE_004_io_out; // @[RandomHardware.scala 82:37]
  assign Add_006_io_in = io_in[91:64]; // @[RandomHardware.scala 73:34]
  assign Accum_007_clock = clock;
  assign Accum_007_io_in = io_in[115:92]; // @[RandomHardware.scala 74:34]
  assign Add_008_io_in = io_in[143:116]; // @[RandomHardware.scala 75:34]
  assign Mul_009_io_in = {{4'd0}, _Mul_009_io_in_T}; // @[Cat.scala 30:58]
  assign And_010_io_in = Reg_000_io_out; // @[RandomHardware.scala 105:36]
  assign RegE_011_clock = clock;
  assign RegE_011_io_in = {wire_009,wire_010}; // @[Cat.scala 30:58]
  assign Reg_012_clock = clock;
  assign Reg_012_io_in = Reg_020_io_out[2:0]; // @[RandomHardware.scala 97:36]
  assign Mux2_013_io_in = {wire_012,wire_013}; // @[Cat.scala 30:58]
  assign Reg_014_clock = clock;
  assign Reg_014_io_in = Reg_016_io_out; // @[RandomHardware.scala 95:36]
  assign And_015_io_in = io_in[171:144]; // @[RandomHardware.scala 76:34]
  assign Reg_016_clock = clock;
  assign Reg_016_io_in = {wire_015,wire_016}; // @[Cat.scala 30:58]
  assign RegFile2R1W_017_clock = clock;
  assign RegFile2R1W_017_io_in = io_in[211:172]; // @[RandomHardware.scala 77:42]
  assign Accum_018_clock = clock;
  assign Accum_018_io_in = {wire_017,wire_018}; // @[Cat.scala 30:58]
  assign Reg_019_clock = clock;
  assign Reg_019_io_in = {wire_019,wire_020}; // @[Cat.scala 30:58]
  assign Reg_020_clock = clock;
  assign Reg_020_io_in = Accum_007_io_out[17:12]; // @[RandomHardware.scala 111:38]
  assign Mux2_021_io_in = {wire_022,wire_023}; // @[Cat.scala 30:58]
  assign Mux2_022_io_in = {wire_024,wire_025}; // @[Cat.scala 30:58]
  assign And_023_io_in = Mux2_021_io_out[9:6]; // @[RandomHardware.scala 102:37]
  assign RegE_024_clock = clock;
  assign RegE_024_io_in = io_in[247:212]; // @[RandomHardware.scala 78:34]
endmodule
