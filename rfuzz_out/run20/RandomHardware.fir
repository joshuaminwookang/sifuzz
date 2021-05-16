;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<17>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mux2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<17>}
    
    node _sel_T = bits(io.in, 34, 34) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 33, 17) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 16, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<17>}
    
    wire wire_000 : UInt<17> @[RandomHardware_1_0.scala 13:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_1_0.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst Mux2_001 of Mux2 @[RandomHardware_1_0.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    Mux2_001.io.in <= io.in @[RandomHardware_1_0.scala 18:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_0.scala 19:10]
    wire_000 <= Mux2_001.io.out @[RandomHardware_1_0.scala 21:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_1_0.scala 22:25]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<7>}
    
    node IN1 = bits(io.in, 18, 12) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 11, 5) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 4, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<7>}
    
    inst ReduceAndMux_000 of ReduceAndMux @[RandomHardware_1_1.scala 14:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    ReduceAndMux_000.io.in <= io.in @[RandomHardware_1_1.scala 16:33]
    io.out <= ReduceAndMux_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum @[RandomHardware_1_3.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_3.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_3.scala 17:10]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<10>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<13>}
    
    node IN1 = bits(io.in, 27, 15) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 14, 2) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module Mux2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<11>}
    
    node _sel_T = bits(io.in, 22, 22) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 21, 11) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 10, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module Mux2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<9>}
    
    node _sel_T = bits(io.in, 18, 18) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 17, 9) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 8, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<9>}
    
    inst Mux2_000 of Mux2_2 @[RandomHardware_2_3.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_2_3.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_2_3.scala 17:10]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<47>, out : UInt<20>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_4.scala 13:24]
    wire wire_001 : UInt<10> @[RandomHardware_1_4.scala 14:24]
    wire wire_002 : UInt<13> @[RandomHardware_1_4.scala 15:24]
    wire wire_003 : UInt<9> @[RandomHardware_1_4.scala 16:24]
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_4.scala 18:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux @[RandomHardware_1_4.scala 19:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    inst Mux2_002 of Mux2_1 @[RandomHardware_1_4.scala 20:26]
    Mux2_002.clock <= clock
    Mux2_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_2_3 @[RandomHardware_1_4.scala 21:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst ShiftRight_004 of ShiftRight_2 @[RandomHardware_1_4.scala 22:34]
    ShiftRight_004.clock <= clock
    ShiftRight_004.reset <= reset
    node _ReduceXorMux_001_io_in_T = bits(io.in, 27, 0) @[RandomHardware_1_4.scala 24:41]
    ReduceXorMux_001.io.in <= _ReduceXorMux_001_io_in_T @[RandomHardware_1_4.scala 24:33]
    node _RandomHardware_003_io_in_T = bits(io.in, 18, 0) @[RandomHardware_1_4.scala 25:41]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware_1_4.scala 25:33]
    node _io_out_T = cat(Mux2_002.io.out, ShiftRight_004.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_4.scala 26:10]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_4.scala 28:25]
    wire_001 <= ShiftLeft_000.io.out @[RandomHardware_1_4.scala 29:18]
    wire_002 <= ReduceXorMux_001.io.out @[RandomHardware_1_4.scala 30:18]
    wire_000 <= RandomHardware_003.io.out @[RandomHardware_1_4.scala 31:18]
    wire_003 <= RandomHardware_003.io.out @[RandomHardware_1_4.scala 32:18]
    node _Mux2_002_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    Mux2_002.io.in <= _Mux2_002_io_in_T @[RandomHardware_1_4.scala 33:25]
    ShiftRight_004.io.in <= wire_003 @[RandomHardware_1_4.scala 34:25]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node in1 = bits(io.in, 7, 4) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 3, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<7>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Mul_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    node in1 = bits(io.in, 5, 3) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 2, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module Mul_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    node in1 = bits(io.in, 3, 2) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 1, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module Sub : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<16>}
    
    node _in1_T = bits(io.in, 29, 15) @[ArithmeticLogical.scala 24:20]
    node in1 = asSInt(_in1_T) @[ArithmeticLogical.scala 24:30]
    node _in2_T = bits(io.in, 14, 0) @[ArithmeticLogical.scala 25:20]
    node in2 = asSInt(_in2_T) @[ArithmeticLogical.scala 25:28]
    node _sub_T = sub(in1, in2) @[ArithmeticLogical.scala 26:19]
    node _sub_T_1 = tail(_sub_T, 1) @[ArithmeticLogical.scala 26:19]
    node sub = asSInt(_sub_T_1) @[ArithmeticLogical.scala 26:19]
    node _io_out_T = asUInt(sub) @[ArithmeticLogical.scala 27:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 27:12]
    
  module Mul_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    node in1 = bits(io.in, 3, 2) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 1, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<4>}
    
    node IN1 = bits(io.in, 15, 12) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 11, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<4>}
    
    wire wire_000 : UInt<4> @[RandomHardware_1_9.scala 13:24]
    wire wire_001 : UInt<16> @[RandomHardware_1_9.scala 14:24]
    wire wire_002 : UInt<4> @[RandomHardware_1_9.scala 15:24]
    inst Mul_000 of Mul_2 @[RandomHardware_1_9.scala 17:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    inst Sub_001 of Sub @[RandomHardware_1_9.scala 18:26]
    Sub_001.clock <= clock
    Sub_001.reset <= reset
    inst Mul_002 of Mul_3 @[RandomHardware_1_9.scala 19:26]
    Mul_002.clock <= clock
    Mul_002.reset <= reset
    inst ReduceOrMux_003 of ReduceOrMux @[RandomHardware_1_9.scala 20:34]
    ReduceOrMux_003.clock <= clock
    ReduceOrMux_003.reset <= reset
    Sub_001.io.in <= io.in @[RandomHardware_1_9.scala 22:25]
    io.out <= Mul_000.io.out @[RandomHardware_1_9.scala 23:10]
    Mul_002.io.in <= wire_002 @[RandomHardware_1_9.scala 25:25]
    wire_000 <= Mul_002.io.out @[RandomHardware_1_9.scala 26:18]
    ReduceOrMux_003.io.in <= wire_001 @[RandomHardware_1_9.scala 27:33]
    wire_002 <= ReduceOrMux_003.io.out @[RandomHardware_1_9.scala 28:18]
    wire_001 <= Sub_001.io.out @[RandomHardware_1_9.scala 29:18]
    Mul_000.io.in <= wire_000 @[RandomHardware_1_9.scala 30:25]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_1 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module ReduceAndMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<38>, out : UInt<15>}
    
    node IN1 = bits(io.in, 33, 19) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 18, 4) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<15>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_10.scala 13:24]
    wire wire_001 : UInt<23> @[RandomHardware_1_10.scala 14:24]
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_10.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ReduceAndMux_001 of ReduceAndMux_1 @[RandomHardware_1_10.scala 17:34]
    ReduceAndMux_001.clock <= clock
    ReduceAndMux_001.reset <= reset
    inst Accum_002 of Accum_2 @[RandomHardware_1_10.scala 18:34]
    Accum_002.clock <= clock
    Accum_002.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 34, 23) @[RandomHardware_1_10.scala 20:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware_1_10.scala 20:33]
    node _Accum_002_io_in_T = bits(io.in, 34, 12) @[RandomHardware_1_10.scala 21:33]
    Accum_002.io.in <= _Accum_002_io_in_T @[RandomHardware_1_10.scala 21:25]
    io.out <= ReduceAndMux_001.io.out @[RandomHardware_1_10.scala 22:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_10.scala 24:18]
    wire_001 <= Accum_002.io.out @[RandomHardware_1_10.scala 25:18]
    node _ReduceAndMux_001_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ReduceAndMux_001.io.in <= _ReduceAndMux_001_io_in_T @[RandomHardware_1_10.scala 26:33]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<4>}
    
    node IN1 = bits(io.in, 17, 14) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 13, 10) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<4>}
    
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_1_11.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_11.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_11.scala 17:10]
    
  module Mux2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<37>, out : UInt<18>}
    
    node _sel_T = bits(io.in, 36, 36) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 35, 18) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 17, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<37>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<18>}
    
    wire wire_000 : UInt<37> @[RandomHardware_1_12.scala 13:24]
    inst Mux2_000 of Mux2_3 @[RandomHardware_1_12.scala 15:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft_1 @[RandomHardware_1_12.scala 16:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    ShiftLeft_001.io.in <= io.in @[RandomHardware_1_12.scala 18:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_12.scala 19:10]
    wire_000 <= ShiftLeft_001.io.out @[RandomHardware_1_12.scala 21:18]
    Mux2_000.io.in <= wire_000 @[RandomHardware_1_12.scala 22:25]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_3 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0_1 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module ShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_13.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_13.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_1 @[RandomHardware_1_13.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_13.scala 18:33]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_13.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_13.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_13.scala 22:33]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Reg_000 of Reg_1 @[RandomHardware_1_14.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_14.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_14.scala 17:10]
    
  module Accum_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    wire wire_000 : UInt<23> @[RandomHardware_1_15.scala 13:24]
    inst Accum_000 of Accum_4 @[RandomHardware_1_15.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst Accum_001 of Accum_5 @[RandomHardware_1_15.scala 16:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    Accum_001.io.in <= io.in @[RandomHardware_1_15.scala 18:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_15.scala 19:10]
    wire_000 <= Accum_001.io.out @[RandomHardware_1_15.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_1_15.scala 22:25]
    
  module Accum_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_7 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0_2 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_17.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_17.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_17.scala 17:10]
    
  module Accum_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_8 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0_3 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<8>}
    
    inst RandomHardware_000 of RandomHardware_2_0_3 @[RandomHardware_1_18.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_18.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_18.scala 17:10]
    
  module Accum_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_9 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0_4 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module Mul_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    node in1 = bits(io.in, 9, 5) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 4, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<31>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_19.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_4 @[RandomHardware_1_19.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst Mul_001 of Mul_4 @[RandomHardware_1_19.scala 16:26]
    Mul_001.clock <= clock
    Mul_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_19.scala 18:33]
    io.out <= Mul_001.io.out @[RandomHardware_1_19.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_19.scala 21:18]
    Mul_001.io.in <= wire_000 @[RandomHardware_1_19.scala 22:25]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<20>}
    
    node _io_out_T = bits(io.in, 9, 9) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<10>("h03ff"), UInt<10>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftRight_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mux2_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<27>, out : UInt<13>}
    
    node _sel_T = bits(io.in, 26, 26) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 25, 13) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 12, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_1_22 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<27>, out : UInt<13>}
    
    inst Mux2_000 of Mux2_4 @[RandomHardware_1_22.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_22.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_22.scala 17:10]
    
  module Mul_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node in1 = bits(io.in, 11, 6) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 5, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Mul_000 of Mul_5 @[RandomHardware_1_23.scala 14:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    Mul_000.io.in <= io.in @[RandomHardware_1_23.scala 16:25]
    io.out <= Mul_000.io.out @[RandomHardware_1_23.scala 17:10]
    
  module ReduceAndMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    node IN1 = bits(io.in, 12, 8) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 7, 3) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 2, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_1_24 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    inst ReduceAndMux_000 of ReduceAndMux_2 @[RandomHardware_1_24.scala 14:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    ReduceAndMux_000.io.in <= io.in @[RandomHardware_1_24.scala 16:33]
    io.out <= ReduceAndMux_000.io.out @[RandomHardware_1_24.scala 17:10]
    
  module ShiftRight_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_25 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst ShiftRight_000 of ShiftRight_4 @[RandomHardware_1_25.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_1_25.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_25.scala 17:10]
    
  module Accum_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_3_0_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_10 @[RandomHardware_3_0.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_3_0_5 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_26 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0_5 @[RandomHardware_1_26.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_26.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_26.scala 17:10]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_27 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    wire wire_000 : UInt<20> @[RandomHardware_1_27.scala 13:24]
    inst Reg_000 of Reg_2 @[RandomHardware_1_27.scala 15:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister @[RandomHardware_1_27.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_27.scala 18:25]
    io.out <= ResetShiftRegister_001.io.out @[RandomHardware_1_27.scala 19:10]
    wire_000 <= Reg_000.io.out @[RandomHardware_1_27.scala 21:18]
    ResetShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_27.scala 22:33]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<44>}
    
    wire wire_000 : UInt<15> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<20> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<12> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<12> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<15> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<4> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<9> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<19> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<10> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<7> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<6> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<20> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<10> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<7> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<10> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<6> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<12> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<8> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<10> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<7> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<8> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<10> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<13> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<17> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<10> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<10> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<6> @[RandomHardware.scala 40:24]
    wire wire_028 : UInt<4> @[RandomHardware.scala 41:24]
    wire wire_029 : UInt<12> @[RandomHardware.scala 42:24]
    wire wire_030 : UInt<12> @[RandomHardware.scala 43:24]
    wire wire_031 : UInt<6> @[RandomHardware.scala 44:24]
    wire wire_032 : UInt<15> @[RandomHardware.scala 45:24]
    wire wire_033 : UInt<10> @[RandomHardware.scala 46:24]
    wire wire_034 : UInt<10> @[RandomHardware.scala 47:24]
    wire wire_035 : UInt<10> @[RandomHardware.scala 48:24]
    wire wire_036 : UInt<7> @[RandomHardware.scala 49:24]
    wire wire_037 : UInt<8> @[RandomHardware.scala 50:24]
    wire wire_038 : UInt<12> @[RandomHardware.scala 51:24]
    wire wire_039 : UInt<12> @[RandomHardware.scala 52:24]
    wire wire_040 : UInt<7> @[RandomHardware.scala 53:24]
    wire wire_041 : UInt<9> @[RandomHardware.scala 54:24]
    wire wire_042 : UInt<12> @[RandomHardware.scala 55:24]
    wire wire_043 : UInt<12> @[RandomHardware.scala 56:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 58:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 59:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst ShiftRight_002 of ShiftRight_1 @[RandomHardware.scala 60:34]
    ShiftRight_002.clock <= clock
    ShiftRight_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 61:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 62:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst Mul_005 of Mul @[RandomHardware.scala 63:26]
    Mul_005.clock <= clock
    Mul_005.reset <= reset
    inst Reg_006 of Reg @[RandomHardware.scala 64:26]
    Reg_006.clock <= clock
    Reg_006.reset <= reset
    inst ShiftRegister_007 of ShiftRegister @[RandomHardware.scala 65:42]
    ShiftRegister_007.clock <= clock
    ShiftRegister_007.reset <= reset
    inst Mul_008 of Mul_1 @[RandomHardware.scala 66:26]
    Mul_008.clock <= clock
    Mul_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 67:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 68:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 69:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 70:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 71:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 72:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 73:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst Accum_016 of Accum_6 @[RandomHardware.scala 74:34]
    Accum_016.clock <= clock
    Accum_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 75:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 76:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 77:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst SignExtendDouble_020 of SignExtendDouble @[RandomHardware.scala 78:42]
    SignExtendDouble_020.clock <= clock
    SignExtendDouble_020.reset <= reset
    inst ShiftRight_021 of ShiftRight_3 @[RandomHardware.scala 79:34]
    ShiftRight_021.clock <= clock
    ShiftRight_021.reset <= reset
    inst RandomHardware_022 of RandomHardware_1_22 @[RandomHardware.scala 80:42]
    RandomHardware_022.clock <= clock
    RandomHardware_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 81:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    inst RandomHardware_024 of RandomHardware_1_24 @[RandomHardware.scala 82:42]
    RandomHardware_024.clock <= clock
    RandomHardware_024.reset <= reset
    inst RandomHardware_025 of RandomHardware_1_25 @[RandomHardware.scala 83:42]
    RandomHardware_025.clock <= clock
    RandomHardware_025.reset <= reset
    inst RandomHardware_026 of RandomHardware_1_26 @[RandomHardware.scala 84:42]
    RandomHardware_026.clock <= clock
    RandomHardware_026.reset <= reset
    inst RandomHardware_027 of RandomHardware_1_27 @[RandomHardware.scala 85:42]
    RandomHardware_027.clock <= clock
    RandomHardware_027.reset <= reset
    node _RandomHardware_001_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 87:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 87:33]
    node _ShiftRight_002_io_in_T = bits(io.in, 7, 0) @[RandomHardware.scala 88:33]
    ShiftRight_002.io.in <= _ShiftRight_002_io_in_T @[RandomHardware.scala 88:25]
    node _RandomHardware_013_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 89:41]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 89:33]
    node _RandomHardware_014_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 90:41]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 90:33]
    node _RandomHardware_017_io_in_T = bits(io.in, 11, 0) @[RandomHardware.scala 91:41]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 91:33]
    node _RandomHardware_027_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 92:41]
    RandomHardware_027.io.in <= _RandomHardware_027_io_in_T @[RandomHardware.scala 92:33]
    node io_out_lo = cat(RandomHardware_015.io.out, RandomHardware_024.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(RandomHardware_003.io.out, RandomHardware_009.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 93:10]
    node RandomHardware_000_io_in_hi = cat(wire_000, wire_001) @[Cat.scala 30:58]
    node _RandomHardware_000_io_in_T = cat(RandomHardware_000_io_in_hi, wire_002) @[Cat.scala 30:58]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 95:33]
    wire_024 <= RandomHardware_000.io.out @[RandomHardware.scala 96:18]
    node RandomHardware_004_io_in_lo = cat(wire_006, wire_007) @[Cat.scala 30:58]
    node RandomHardware_004_io_in_hi = cat(wire_004, wire_005) @[Cat.scala 30:58]
    node _RandomHardware_004_io_in_T = cat(RandomHardware_004_io_in_hi, RandomHardware_004_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 97:33]
    wire_012 <= RandomHardware_004.io.out @[RandomHardware.scala 98:18]
    Mul_005.io.in <= wire_008 @[RandomHardware.scala 99:25]
    wire_021 <= Mul_005.io.out @[RandomHardware.scala 100:18]
    Reg_006.io.in <= wire_009 @[RandomHardware.scala 101:25]
    wire_022 <= Reg_006.io.out @[RandomHardware.scala 102:18]
    ShiftRegister_007.io.in <= wire_010 @[RandomHardware.scala 103:33]
    wire_040 <= ShiftRegister_007.io.out @[RandomHardware.scala 104:18]
    Mul_008.io.in <= wire_011 @[RandomHardware.scala 105:25]
    wire_027 <= Mul_008.io.out @[RandomHardware.scala 106:18]
    wire_031 <= Mul_008.io.out @[RandomHardware.scala 107:18]
    node RandomHardware_010_io_in_lo = cat(wire_016, wire_017) @[Cat.scala 30:58]
    node RandomHardware_010_io_in_hi = cat(wire_014, wire_015) @[Cat.scala 30:58]
    node _RandomHardware_010_io_in_T = cat(RandomHardware_010_io_in_hi, RandomHardware_010_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 108:33]
    wire_000 <= RandomHardware_010.io.out @[RandomHardware.scala 109:18]
    wire_004 <= RandomHardware_010.io.out @[RandomHardware.scala 110:18]
    wire_032 <= RandomHardware_010.io.out @[RandomHardware.scala 111:18]
    node _RandomHardware_011_io_in_T = cat(wire_018, wire_019) @[Cat.scala 30:58]
    RandomHardware_011.io.in <= _RandomHardware_011_io_in_T @[RandomHardware.scala 112:33]
    wire_005 <= RandomHardware_011.io.out @[RandomHardware.scala 113:18]
    wire_028 <= RandomHardware_011.io.out @[RandomHardware.scala 114:18]
    node RandomHardware_012_io_in_lo = cat(wire_022, wire_023) @[Cat.scala 30:58]
    node RandomHardware_012_io_in_hi = cat(wire_020, wire_021) @[Cat.scala 30:58]
    node _RandomHardware_012_io_in_T = cat(RandomHardware_012_io_in_hi, RandomHardware_012_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 115:33]
    node _hi_T = bits(RandomHardware_012.io.out, 17, 9) @[RandomHardware.scala 116:47]
    wire_006 <= _hi_T @[RandomHardware.scala 116:18]
    node _wire_041_T = bits(RandomHardware_012.io.out, 17, 9) @[RandomHardware.scala 117:47]
    wire_041 <= _wire_041_T @[RandomHardware.scala 117:18]
    Accum_016.io.in <= wire_026 @[RandomHardware.scala 118:25]
    wire_035 <= Accum_016.io.out @[RandomHardware.scala 119:18]
    node RandomHardware_018_io_in_lo = cat(wire_029, wire_030) @[Cat.scala 30:58]
    node RandomHardware_018_io_in_hi = cat(wire_027, wire_028) @[Cat.scala 30:58]
    node _RandomHardware_018_io_in_T = cat(RandomHardware_018_io_in_hi, RandomHardware_018_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 120:33]
    wire_008 <= RandomHardware_018.io.out @[RandomHardware.scala 121:18]
    node RandomHardware_019_io_in_hi = cat(wire_031, wire_032) @[Cat.scala 30:58]
    node _RandomHardware_019_io_in_T = cat(RandomHardware_019_io_in_hi, wire_033) @[Cat.scala 30:58]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 122:33]
    wire_013 <= RandomHardware_019.io.out @[RandomHardware.scala 123:18]
    wire_019 <= RandomHardware_019.io.out @[RandomHardware.scala 124:18]
    wire_026 <= RandomHardware_019.io.out @[RandomHardware.scala 125:18]
    SignExtendDouble_020.io.in <= wire_034 @[RandomHardware.scala 126:33]
    wire_001 <= SignExtendDouble_020.io.out @[RandomHardware.scala 127:18]
    ShiftRight_021.io.in <= wire_035 @[RandomHardware.scala 128:25]
    wire_009 <= ShiftRight_021.io.out @[RandomHardware.scala 129:18]
    wire_025 <= ShiftRight_021.io.out @[RandomHardware.scala 130:18]
    node RandomHardware_022_io_in_hi = cat(wire_036, wire_037) @[Cat.scala 30:58]
    node _RandomHardware_022_io_in_T = cat(RandomHardware_022_io_in_hi, wire_038) @[Cat.scala 30:58]
    RandomHardware_022.io.in <= _RandomHardware_022_io_in_T @[RandomHardware.scala 131:33]
    wire_023 <= RandomHardware_022.io.out @[RandomHardware.scala 132:18]
    RandomHardware_023.io.in <= wire_039 @[RandomHardware.scala 133:33]
    wire_002 <= RandomHardware_023.io.out @[RandomHardware.scala 134:18]
    wire_029 <= RandomHardware_023.io.out @[RandomHardware.scala 135:18]
    RandomHardware_025.io.in <= wire_042 @[RandomHardware.scala 136:33]
    wire_043 <= RandomHardware_025.io.out @[RandomHardware.scala 137:18]
    RandomHardware_026.io.in <= wire_043 @[RandomHardware.scala 138:33]
    wire_030 <= RandomHardware_026.io.out @[RandomHardware.scala 139:18]
    wire_038 <= RandomHardware_026.io.out @[RandomHardware.scala 140:18]
    wire_039 <= RandomHardware_026.io.out @[RandomHardware.scala 141:18]
    wire_010 <= RandomHardware_001.io.out @[RandomHardware.scala 142:18]
    wire_014 <= RandomHardware_001.io.out @[RandomHardware.scala 143:18]
    wire_020 <= RandomHardware_001.io.out @[RandomHardware.scala 144:18]
    wire_036 <= RandomHardware_001.io.out @[RandomHardware.scala 145:18]
    wire_018 <= ShiftRight_002.io.out @[RandomHardware.scala 146:18]
    wire_037 <= ShiftRight_002.io.out @[RandomHardware.scala 147:18]
    wire_015 <= RandomHardware_013.io.out @[RandomHardware.scala 148:18]
    wire_033 <= RandomHardware_013.io.out @[RandomHardware.scala 149:18]
    wire_034 <= RandomHardware_013.io.out @[RandomHardware.scala 150:18]
    node _wire_011_T = bits(RandomHardware_014.io.out, 5, 0) @[RandomHardware.scala 151:47]
    wire_011 <= _wire_011_T @[RandomHardware.scala 151:18]
    node _hi_T_1 = bits(RandomHardware_014.io.out, 5, 0) @[RandomHardware.scala 152:47]
    wire_016 <= _hi_T_1 @[RandomHardware.scala 152:18]
    wire_003 <= RandomHardware_017.io.out @[RandomHardware.scala 153:18]
    wire_017 <= RandomHardware_017.io.out @[RandomHardware.scala 154:18]
    wire_042 <= RandomHardware_017.io.out @[RandomHardware.scala 155:18]
    wire_007 <= RandomHardware_027.io.out @[RandomHardware.scala 156:18]
    RandomHardware_003.io.in <= wire_003 @[RandomHardware.scala 157:33]
    node _RandomHardware_009_io_in_T = cat(wire_012, wire_013) @[Cat.scala 30:58]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 158:33]
    node _RandomHardware_015_io_in_T = cat(wire_024, wire_025) @[Cat.scala 30:58]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 159:33]
    node _RandomHardware_024_io_in_T = cat(wire_040, wire_041) @[Cat.scala 30:58]
    RandomHardware_024.io.in <= _RandomHardware_024_io_in_T @[RandomHardware.scala 160:33]
    
