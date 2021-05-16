;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRight_000 of ShiftRight_1 @[RandomHardware_1_1.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_1_1.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_2_0.scala 13:24]
    inst Accum_000 of Accum_1 @[RandomHardware_2_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux @[RandomHardware_2_0.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module RegE : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node data = bits(io.in, 19, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<18>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    inst RegE_000 of RegE @[RandomHardware_2_1.scala 14:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= RegE_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<18>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_3.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_3.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_3.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_3.scala 18:33]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_3.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_3.scala 21:18]
    RandomHardware_001.io.in <= wire_000 @[RandomHardware_1_3.scala 22:33]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<30>}
    
    node _io_out_T = bits(io.in, 14, 14) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<15>("h07fff"), UInt<15>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RegE_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node data = bits(io.in, 19, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<18>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    inst RegE_000 of RegE_1 @[RandomHardware_2_1.scala 14:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= RegE_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<37>, out : UInt<37>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<37>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_4.scala 13:24]
    wire wire_001 : UInt<37> @[RandomHardware_1_4.scala 14:24]
    inst SignExtendDouble_000 of SignExtendDouble @[RandomHardware_1_4.scala 16:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_4.scala 17:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst Reg_002 of Reg @[RandomHardware_1_4.scala 18:26]
    Reg_002.clock <= clock
    Reg_002.reset <= reset
    Reg_002.io.in <= io.in @[RandomHardware_1_4.scala 20:25]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_1_4.scala 21:10]
    RandomHardware_001.io.in <= wire_001 @[RandomHardware_1_4.scala 23:33]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_4.scala 24:18]
    wire_001 <= Reg_002.io.out @[RandomHardware_1_4.scala 25:18]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_4.scala 26:33]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<20>}
    
    node _io_out_T = bits(io.in, 9, 9) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<10>("h03ff"), UInt<10>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RegE_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node data = bits(io.in, 19, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<18>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module RandomHardware_2_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    inst RegE_000 of RegE_2 @[RandomHardware_2_1.scala 14:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= RegE_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module Mux2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<10>}
    
    node _sel_T = bits(io.in, 20, 20) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 19, 10) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 9, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<10>}
    
    inst Mux2_000 of Mux2 @[RandomHardware_2_2.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_2_2.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_2_2.scala 17:10]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<23>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<23>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_7.scala 13:24]
    wire wire_001 : UInt<20> @[RandomHardware_1_7.scala 14:24]
    wire wire_002 : UInt<19> @[RandomHardware_1_7.scala 15:24]
    inst SignExtendDouble_000 of SignExtendDouble_1 @[RandomHardware_1_7.scala 17:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_2 @[RandomHardware_1_7.scala 18:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_7.scala 19:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst ShiftLeft_003 of ShiftLeft @[RandomHardware_1_7.scala 20:34]
    ShiftLeft_003.clock <= clock
    ShiftLeft_003.reset <= reset
    RandomHardware_002.io.in <= io.in @[RandomHardware_1_7.scala 22:33]
    io.out <= ShiftLeft_003.io.out @[RandomHardware_1_7.scala 23:10]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_7.scala 25:33]
    wire_001 <= SignExtendDouble_000.io.out @[RandomHardware_1_7.scala 26:18]
    RandomHardware_001.io.in <= wire_001 @[RandomHardware_1_7.scala 27:33]
    wire_002 <= RandomHardware_001.io.out @[RandomHardware_1_7.scala 28:18]
    wire_000 <= RandomHardware_002.io.out @[RandomHardware_1_7.scala 29:18]
    ShiftLeft_003.io.in <= wire_002 @[RandomHardware_1_7.scala 30:25]
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    node IN1 = bits(io.in, 15, 8) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 10, 6) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 5, 3) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 2, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    inst CompareMux_000 of CompareMux @[RandomHardware_1_8.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_8.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_8.scala 17:10]
    
  module ShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_2_0.scala 13:24]
    inst Accum_000 of Accum_3 @[RandomHardware_2_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_1 @[RandomHardware_2_0.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<4>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_11.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_11.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_11.scala 17:10]
    
  module Accum_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceXorMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_2_0.scala 13:24]
    inst Accum_000 of Accum_4 @[RandomHardware_2_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_2 @[RandomHardware_2_0.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_12.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_12.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_12.scala 17:10]
    
  module Mux2_1 : 
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
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<9>}
    
    inst Mux2_000 of Mux2_1 @[RandomHardware_1_13.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_13.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    node in1 = bits(io.in, 5, 3) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 2, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RegE_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<18>}
    
    node data = bits(io.in, 18, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<17>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<18>}
    
    inst RegE_000 of RegE_3 @[RandomHardware_1_16.scala 14:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_1_16.scala 16:25]
    io.out <= RegE_000.io.out @[RandomHardware_1_16.scala 17:10]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<6>}
    
    node IN1 = bits(io.in, 15, 10) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 9, 4) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<6>}
    
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_17.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_17.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_17.scala 17:10]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceXorMux_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_2_0.scala 13:24]
    inst Accum_000 of Accum_5 @[RandomHardware_2_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_3 @[RandomHardware_2_0.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module ReduceXorMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<15>}
    
    node IN1 = bits(io.in, 39, 25) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 24, 10) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<15>}
    
    wire wire_000 : UInt<40> @[RandomHardware_1_18.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_3 @[RandomHardware_1_18.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_4 @[RandomHardware_1_18.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_18.scala 18:33]
    io.out <= ReduceXorMux_001.io.out @[RandomHardware_1_18.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_18.scala 21:18]
    ReduceXorMux_001.io.in <= wire_000 @[RandomHardware_1_18.scala 22:33]
    
  module Accum_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceXorMux_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_2_0.scala 13:24]
    inst Accum_000 of Accum_6 @[RandomHardware_2_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_5 @[RandomHardware_2_0.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    inst RandomHardware_000 of RandomHardware_2_0_4 @[RandomHardware_1_19.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_19.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_19.scala 17:10]
    
  module ReduceXorMux_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_20 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    inst ReduceXorMux_000 of ReduceXorMux_6 @[RandomHardware_1_20.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_20.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_20.scala 17:10]
    
  module ShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<12>}
    
    node _io_out_T = bits(io.in, 5, 5) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<6>("h03f"), UInt<6>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<8>}
    
    node _io_out_T = bits(io.in, 3, 3) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<4>("h0f"), UInt<4>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Accum_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<80>}
    
    wire wire_000 : UInt<5> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<8> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<8> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<4> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<12> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<23> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<6> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<5> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<8> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<9> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<12> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<4> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<6> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<8> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<5> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<6> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<6> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<4> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<4> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<15> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<18> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<5> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<6> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<4> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<6> @[RandomHardware.scala 39:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware.scala 41:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 42:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst Accum_002 of Accum @[RandomHardware.scala 43:34]
    Accum_002.clock <= clock
    Accum_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 44:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 45:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst ShiftRegister_005 of ShiftRegister @[RandomHardware.scala 46:42]
    ShiftRegister_005.clock <= clock
    ShiftRegister_005.reset <= reset
    inst Reg_006 of Reg_1 @[RandomHardware.scala 47:26]
    Reg_006.clock <= clock
    Reg_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 48:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 49:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst ShiftRegister_009 of ShiftRegister_1 @[RandomHardware.scala 50:42]
    ShiftRegister_009.clock <= clock
    ShiftRegister_009.reset <= reset
    inst Accum_010 of Accum_2 @[RandomHardware.scala 51:34]
    Accum_010.clock <= clock
    Accum_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 52:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 53:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 54:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst Mul_014 of Mul @[RandomHardware.scala 55:26]
    Mul_014.clock <= clock
    Mul_014.reset <= reset
    inst Reg_015 of Reg_2 @[RandomHardware.scala 56:26]
    Reg_015.clock <= clock
    Reg_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 57:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 58:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 59:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 60:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst RandomHardware_020 of RandomHardware_1_20 @[RandomHardware.scala 61:42]
    RandomHardware_020.clock <= clock
    RandomHardware_020.reset <= reset
    inst ShiftRegister_021 of ShiftRegister_2 @[RandomHardware.scala 62:42]
    ShiftRegister_021.clock <= clock
    ShiftRegister_021.reset <= reset
    inst SignExtendDouble_022 of SignExtendDouble_2 @[RandomHardware.scala 63:42]
    SignExtendDouble_022.clock <= clock
    SignExtendDouble_022.reset <= reset
    inst SignExtendDouble_023 of SignExtendDouble_3 @[RandomHardware.scala 64:42]
    SignExtendDouble_023.clock <= clock
    SignExtendDouble_023.reset <= reset
    inst Accum_024 of Accum_7 @[RandomHardware.scala 65:34]
    Accum_024.clock <= clock
    Accum_024.reset <= reset
    node _RandomHardware_008_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 67:41]
    RandomHardware_008.io.in <= _RandomHardware_008_io_in_T @[RandomHardware.scala 67:33]
    node _RandomHardware_011_io_in_T = bits(io.in, 99, 84) @[RandomHardware.scala 68:41]
    RandomHardware_011.io.in <= _RandomHardware_011_io_in_T @[RandomHardware.scala 68:33]
    node _RandomHardware_012_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 69:41]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 69:33]
    node _RandomHardware_017_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 70:41]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 70:33]
    node _RandomHardware_019_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 71:41]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 71:33]
    node _RandomHardware_020_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 72:41]
    RandomHardware_020.io.in <= _RandomHardware_020_io_in_T @[RandomHardware.scala 72:33]
    node io_out_lo_hi = cat(Reg_006.io.out, Mul_014.io.out) @[Cat.scala 30:58]
    node io_out_lo = cat(io_out_lo_hi, RandomHardware_016.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(ShiftRight_000.io.out, RandomHardware_001.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, RandomHardware_004.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 73:10]
    Accum_002.io.in <= wire_003 @[RandomHardware.scala 75:25]
    wire_010 <= Accum_002.io.out @[RandomHardware.scala 76:18]
    wire_015 <= Accum_002.io.out @[RandomHardware.scala 77:18]
    node _RandomHardware_003_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 78:33]
    wire_022 <= RandomHardware_003.io.out @[RandomHardware.scala 79:18]
    ShiftRegister_005.io.in <= wire_009 @[RandomHardware.scala 80:33]
    wire_000 <= ShiftRegister_005.io.out @[RandomHardware.scala 81:18]
    wire_023 <= ShiftRegister_005.io.out @[RandomHardware.scala 82:18]
    node _RandomHardware_007_io_in_T = cat(wire_011, wire_012) @[Cat.scala 30:58]
    RandomHardware_007.io.in <= _RandomHardware_007_io_in_T @[RandomHardware.scala 83:33]
    wire_006 <= RandomHardware_007.io.out @[RandomHardware.scala 84:18]
    ShiftRegister_009.io.in <= wire_013 @[RandomHardware.scala 85:33]
    wire_025 <= ShiftRegister_009.io.out @[RandomHardware.scala 86:18]
    Accum_010.io.in <= wire_014 @[RandomHardware.scala 87:25]
    wire_007 <= Accum_010.io.out @[RandomHardware.scala 88:18]
    wire_018 <= Accum_010.io.out @[RandomHardware.scala 89:18]
    wire_024 <= Accum_010.io.out @[RandomHardware.scala 90:18]
    wire_026 <= Accum_010.io.out @[RandomHardware.scala 91:18]
    node RandomHardware_013_io_in_hi = cat(wire_015, wire_016) @[Cat.scala 30:58]
    node _RandomHardware_013_io_in_T = cat(RandomHardware_013_io_in_hi, wire_017) @[Cat.scala 30:58]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 92:33]
    wire_011 <= RandomHardware_013.io.out @[RandomHardware.scala 93:18]
    Reg_015.io.in <= wire_019 @[RandomHardware.scala 94:25]
    wire_013 <= Reg_015.io.out @[RandomHardware.scala 95:18]
    RandomHardware_018.io.in <= wire_022 @[RandomHardware.scala 96:33]
    wire_021 <= RandomHardware_018.io.out @[RandomHardware.scala 97:18]
    ShiftRegister_021.io.in <= wire_023 @[RandomHardware.scala 98:33]
    wire_001 <= ShiftRegister_021.io.out @[RandomHardware.scala 99:18]
    wire_016 <= ShiftRegister_021.io.out @[RandomHardware.scala 100:18]
    SignExtendDouble_022.io.in <= wire_024 @[RandomHardware.scala 101:33]
    wire_012 <= SignExtendDouble_022.io.out @[RandomHardware.scala 102:18]
    SignExtendDouble_023.io.in <= wire_025 @[RandomHardware.scala 103:33]
    wire_002 <= SignExtendDouble_023.io.out @[RandomHardware.scala 104:18]
    Accum_024.io.in <= wire_026 @[RandomHardware.scala 105:25]
    wire_017 <= Accum_024.io.out @[RandomHardware.scala 106:18]
    wire_009 <= RandomHardware_008.io.out @[RandomHardware.scala 107:18]
    wire_004 <= RandomHardware_011.io.out @[RandomHardware.scala 108:18]
    wire_019 <= RandomHardware_011.io.out @[RandomHardware.scala 109:18]
    wire_020 <= RandomHardware_011.io.out @[RandomHardware.scala 110:18]
    wire_005 <= RandomHardware_012.io.out @[RandomHardware.scala 111:18]
    wire_014 <= RandomHardware_017.io.out @[RandomHardware.scala 112:18]
    wire_008 <= RandomHardware_019.io.out @[RandomHardware.scala 113:18]
    wire_003 <= RandomHardware_020.io.out @[RandomHardware.scala 114:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware.scala 115:25]
    node _RandomHardware_001_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 116:33]
    node RandomHardware_004_io_in_hi = cat(wire_006, wire_007) @[Cat.scala 30:58]
    node _RandomHardware_004_io_in_T = cat(RandomHardware_004_io_in_hi, wire_008) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 117:33]
    Reg_006.io.in <= wire_010 @[RandomHardware.scala 118:25]
    Mul_014.io.in <= wire_018 @[RandomHardware.scala 119:25]
    node _RandomHardware_016_io_in_T = cat(wire_020, wire_021) @[Cat.scala 30:58]
    RandomHardware_016.io.in <= _RandomHardware_016_io_in_T @[RandomHardware.scala 120:33]
    
