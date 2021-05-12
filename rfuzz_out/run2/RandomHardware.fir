;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
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
    
  module Mux2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<16>}
    
    node _sel_T = bits(io.in, 32, 32) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 31, 16) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 15, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<8>}
    
    node in1 = bits(io.in, 15, 8) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 7, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<8>}
    
    wire wire_000 : UInt<16> @[RandomHardware_1_1.scala 13:24]
    inst Mux2_000 of Mux2 @[RandomHardware_1_1.scala 15:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    inst And_001 of And @[RandomHardware_1_1.scala 16:26]
    And_001.clock <= clock
    And_001.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_1.scala 18:25]
    io.out <= And_001.io.out @[RandomHardware_1_1.scala 19:10]
    wire_000 <= Mux2_000.io.out @[RandomHardware_1_1.scala 21:18]
    And_001.io.in <= wire_000 @[RandomHardware_1_1.scala 22:25]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    inst Accum_000 of Accum @[RandomHardware_1_2.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_2.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_2.scala 17:10]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    inst Accum_000 of Accum_1 @[RandomHardware_1_3.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_3.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_3.scala 17:10]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<32>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_3_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Reg_000 of Reg @[RandomHardware_3_0.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<24>}
    
    node _io_out_T = bits(io.in, 11, 11) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<12>("h0fff"), UInt<12>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Mux2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<12>}
    
    node _sel_T = bits(io.in, 24, 24) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 23, 12) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 11, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<36>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<12> @[RandomHardware_2_1.scala 14:24]
    inst RandomHardware_000 of RandomHardware_3_0 @[RandomHardware_2_1.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble @[RandomHardware_2_1.scala 17:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst Mux2_002 of Mux2_1 @[RandomHardware_2_1.scala 18:26]
    Mux2_002.clock <= clock
    Mux2_002.reset <= reset
    Mux2_002.io.in <= io.in @[RandomHardware_2_1.scala 20:25]
    node _io_out_T = cat(RandomHardware_000.io.out, SignExtendDouble_001.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_2_1.scala 21:10]
    wire_000 <= Mux2_002.io.out @[RandomHardware_2_1.scala 23:18]
    wire_001 <= Mux2_002.io.out @[RandomHardware_2_1.scala 24:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_2_1.scala 25:33]
    SignExtendDouble_001.io.in <= wire_001 @[RandomHardware_2_1.scala 26:33]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<14>}
    
    wire wire_000 : UInt<32> @[RandomHardware_1_7.scala 13:24]
    inst ShiftRegister_000 of ShiftRegister_1 @[RandomHardware_1_7.scala 15:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_7.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_1_7.scala 18:33]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_7.scala 19:10]
    wire_000 <= ShiftRegister_000.io.out @[RandomHardware_1_7.scala 21:18]
    RandomHardware_001.io.in <= wire_000 @[RandomHardware_1_7.scala 22:33]
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    node IN1 = bits(io.in, 23, 12) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 14, 6) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 5, 3) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 2, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    inst CompareMux_000 of CompareMux @[RandomHardware_1_8.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_8.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_8.scala 17:10]
    
  module ShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<24>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<24>}
    
    inst ShiftRight_000 of ShiftRight @[RandomHardware_1_10.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_1_10.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_10.scala 17:10]
    
  module CompareMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    node IN1 = bits(io.in, 19, 10) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 14, 10) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 9, 5) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 4, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    inst CompareMux_000 of CompareMux_1 @[RandomHardware_2_0.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<26>}
    
    node _io_out_T = bits(io.in, 12, 12) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<13>("h01fff"), UInt<13>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<26>}
    
    wire wire_000 : UInt<13> @[RandomHardware_1_11.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_11.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_1 @[RandomHardware_1_11.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_11.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_1_11.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_11.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_1_11.scala 22:33]
    
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
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<4>}
    
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_12.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_12.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_12.scala 17:10]
    
  module CompareMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    node IN1 = bits(io.in, 19, 10) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 14, 10) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 9, 5) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 4, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    inst CompareMux_000 of CompareMux_2 @[RandomHardware_2_0.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<39>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_13.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_13.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_13.scala 17:10]
    
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
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<3>, out : UInt<3>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mux2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<8>}
    
    node _sel_T = bits(io.in, 16, 16) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 15, 8) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 7, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<8>}
    
    inst Mux2_000 of Mux2_2 @[RandomHardware_1_18.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_18.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_18.scala 17:10]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<17>}
    
    node IN1 = bits(io.in, 34, 18) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 17, 1) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 0, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module Reg_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_3_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Reg_000 of Reg_3 @[RandomHardware_3_0.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<24>}
    
    node _io_out_T = bits(io.in, 11, 11) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<12>("h0fff"), UInt<12>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Mux2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<12>}
    
    node _sel_T = bits(io.in, 24, 24) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 23, 12) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 11, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<36>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<12> @[RandomHardware_2_1.scala 14:24]
    inst RandomHardware_000 of RandomHardware_3_0_1 @[RandomHardware_2_1.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_2 @[RandomHardware_2_1.scala 17:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst Mux2_002 of Mux2_3 @[RandomHardware_2_1.scala 18:26]
    Mux2_002.clock <= clock
    Mux2_002.reset <= reset
    Mux2_002.io.in <= io.in @[RandomHardware_2_1.scala 20:25]
    node _io_out_T = cat(RandomHardware_000.io.out, SignExtendDouble_001.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_2_1.scala 21:10]
    wire_000 <= Mux2_002.io.out @[RandomHardware_2_1.scala 23:18]
    wire_001 <= Mux2_002.io.out @[RandomHardware_2_1.scala 24:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_2_1.scala 25:33]
    SignExtendDouble_001.io.in <= wire_001 @[RandomHardware_2_1.scala 26:33]
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<17>}
    
    wire wire_000 : UInt<36> @[RandomHardware_1_19.scala 13:24]
    inst ReduceAndMux_000 of ReduceAndMux @[RandomHardware_1_19.scala 15:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_19.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_19.scala 18:33]
    io.out <= ReduceAndMux_000.io.out @[RandomHardware_1_19.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_19.scala 21:18]
    ReduceAndMux_000.io.in <= wire_000 @[RandomHardware_1_19.scala 22:33]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    node in1 = bits(io.in, 15, 8) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 7, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module CompareMux_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<3>}
    
    node IN1 = bits(io.in, 15, 8) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 12, 10) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 9, 5) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 4, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<3>}
    
    wire wire_000 : UInt<16> @[RandomHardware_1_21.scala 13:24]
    inst Mul_000 of Mul @[RandomHardware_1_21.scala 15:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    inst CompareMux_001 of CompareMux_3 @[RandomHardware_1_21.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    Mul_000.io.in <= io.in @[RandomHardware_1_21.scala 18:25]
    io.out <= CompareMux_001.io.out @[RandomHardware_1_21.scala 19:10]
    wire_000 <= Mul_000.io.out @[RandomHardware_1_21.scala 21:18]
    CompareMux_001.io.in <= wire_000 @[RandomHardware_1_21.scala 22:25]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module CompareMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    node IN1 = bits(io.in, 19, 10) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 14, 10) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 9, 5) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 4, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    inst CompareMux_000 of CompareMux_4 @[RandomHardware_2_0.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_23.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_23.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_23.scala 17:10]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<115>}
    
    wire wire_000 : UInt<5> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<12> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<8> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<8> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<8> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<12> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<3> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<8> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<9> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<8> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<23> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<9> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<24> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<24> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<23> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<4> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<8> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<9> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<3> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<9> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<8> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<16> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<9> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<9> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<8> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<8> @[RandomHardware.scala 40:24]
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware.scala 42:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 43:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 44:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 45:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst Accum_004 of Accum_2 @[RandomHardware.scala 46:34]
    Accum_004.clock <= clock
    Accum_004.reset <= reset
    inst Accum_005 of Accum_3 @[RandomHardware.scala 47:34]
    Accum_005.clock <= clock
    Accum_005.reset <= reset
    inst Accum_006 of Accum_4 @[RandomHardware.scala 48:34]
    Accum_006.clock <= clock
    Accum_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 49:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 50:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst ShiftRegister_009 of ShiftRegister_2 @[RandomHardware.scala 51:42]
    ShiftRegister_009.clock <= clock
    ShiftRegister_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 52:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 53:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 54:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 55:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 56:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst Reg_015 of Reg_2 @[RandomHardware.scala 57:26]
    Reg_015.clock <= clock
    Reg_015.reset <= reset
    inst ShiftRegister_016 of ShiftRegister_3 @[RandomHardware.scala 58:42]
    ShiftRegister_016.clock <= clock
    ShiftRegister_016.reset <= reset
    inst ShiftRight_017 of ShiftRight_1 @[RandomHardware.scala 59:34]
    ShiftRight_017.clock <= clock
    ShiftRight_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 60:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 61:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst ShiftRight_020 of ShiftRight_2 @[RandomHardware.scala 62:34]
    ShiftRight_020.clock <= clock
    ShiftRight_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 63:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst Accum_022 of Accum_5 @[RandomHardware.scala 64:34]
    Accum_022.clock <= clock
    Accum_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 65:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    node _Accum_004_io_in_T = bits(io.in, 7, 0) @[RandomHardware.scala 67:33]
    Accum_004.io.in <= _Accum_004_io_in_T @[RandomHardware.scala 67:25]
    node _ShiftRegister_009_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 68:41]
    ShiftRegister_009.io.in <= _ShiftRegister_009_io_in_T @[RandomHardware.scala 68:33]
    node _RandomHardware_010_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 69:41]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 69:33]
    node _RandomHardware_012_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 70:41]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 70:33]
    node _Reg_015_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 71:33]
    Reg_015.io.in <= _Reg_015_io_in_T @[RandomHardware.scala 71:25]
    node _RandomHardware_021_io_in_T = bits(io.in, 99, 84) @[RandomHardware.scala 72:41]
    RandomHardware_021.io.in <= _RandomHardware_021_io_in_T @[RandomHardware.scala 72:33]
    node _RandomHardware_023_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 73:41]
    RandomHardware_023.io.in <= _RandomHardware_023_io_in_T @[RandomHardware.scala 73:33]
    node io_out_lo_hi = cat(ShiftRight_017.io.out, RandomHardware_018.io.out) @[Cat.scala 30:58]
    node io_out_lo = cat(io_out_lo_hi, RandomHardware_019.io.out) @[Cat.scala 30:58]
    node io_out_hi_lo = cat(RandomHardware_011.io.out, RandomHardware_013.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(Accum_006.io.out, RandomHardware_007.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 74:10]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware.scala 76:33]
    wire_001 <= ShiftRegister_000.io.out @[RandomHardware.scala 77:18]
    node RandomHardware_001_io_in_lo = cat(wire_003, wire_004) @[Cat.scala 30:58]
    node RandomHardware_001_io_in_hi = cat(wire_001, wire_002) @[Cat.scala 30:58]
    node _RandomHardware_001_io_in_T = cat(RandomHardware_001_io_in_hi, RandomHardware_001_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 78:33]
    wire_011 <= RandomHardware_001.io.out @[RandomHardware.scala 79:18]
    node RandomHardware_002_io_in_hi = cat(wire_005, wire_006) @[Cat.scala 30:58]
    node _RandomHardware_002_io_in_T = cat(RandomHardware_002_io_in_hi, wire_007) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 80:33]
    wire_012 <= RandomHardware_002.io.out @[RandomHardware.scala 81:18]
    wire_016 <= RandomHardware_002.io.out @[RandomHardware.scala 82:18]
    node _RandomHardware_003_io_in_T = cat(wire_008, wire_009) @[Cat.scala 30:58]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 83:33]
    wire_023 <= RandomHardware_003.io.out @[RandomHardware.scala 84:18]
    Accum_005.io.in <= wire_010 @[RandomHardware.scala 85:25]
    wire_019 <= Accum_005.io.out @[RandomHardware.scala 86:18]
    wire_021 <= Accum_005.io.out @[RandomHardware.scala 87:18]
    RandomHardware_008.io.in <= wire_014 @[RandomHardware.scala 88:33]
    wire_010 <= RandomHardware_008.io.out @[RandomHardware.scala 89:18]
    wire_013 <= RandomHardware_008.io.out @[RandomHardware.scala 90:18]
    wire_024 <= RandomHardware_008.io.out @[RandomHardware.scala 91:18]
    node _RandomHardware_014_io_in_T = cat(wire_017, wire_018) @[Cat.scala 30:58]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 92:33]
    wire_002 <= RandomHardware_014.io.out @[RandomHardware.scala 93:18]
    wire_006 <= RandomHardware_014.io.out @[RandomHardware.scala 94:18]
    ShiftRegister_016.io.in <= wire_019 @[RandomHardware.scala 95:33]
    wire_025 <= ShiftRegister_016.io.out @[RandomHardware.scala 96:18]
    ShiftRight_020.io.in <= wire_026 @[RandomHardware.scala 97:25]
    wire_004 <= ShiftRight_020.io.out @[RandomHardware.scala 98:18]
    wire_027 <= ShiftRight_020.io.out @[RandomHardware.scala 99:18]
    Accum_022.io.in <= wire_027 @[RandomHardware.scala 100:25]
    wire_009 <= Accum_022.io.out @[RandomHardware.scala 101:18]
    wire_018 <= Accum_022.io.out @[RandomHardware.scala 102:18]
    wire_022 <= Accum_022.io.out @[RandomHardware.scala 103:18]
    wire_005 <= Accum_004.io.out @[RandomHardware.scala 104:18]
    wire_026 <= Accum_004.io.out @[RandomHardware.scala 105:18]
    wire_008 <= ShiftRegister_009.io.out @[RandomHardware.scala 106:18]
    wire_014 <= RandomHardware_010.io.out @[RandomHardware.scala 107:18]
    wire_015 <= RandomHardware_010.io.out @[RandomHardware.scala 108:18]
    wire_017 <= RandomHardware_012.io.out @[RandomHardware.scala 109:18]
    wire_003 <= Reg_015.io.out @[RandomHardware.scala 110:18]
    wire_007 <= RandomHardware_021.io.out @[RandomHardware.scala 111:18]
    wire_020 <= RandomHardware_021.io.out @[RandomHardware.scala 112:18]
    wire_000 <= RandomHardware_023.io.out @[RandomHardware.scala 113:18]
    Accum_006.io.in <= wire_011 @[RandomHardware.scala 114:25]
    node _RandomHardware_007_io_in_T = cat(wire_012, wire_013) @[Cat.scala 30:58]
    RandomHardware_007.io.in <= _RandomHardware_007_io_in_T @[RandomHardware.scala 115:33]
    RandomHardware_011.io.in <= wire_015 @[RandomHardware.scala 116:33]
    RandomHardware_013.io.in <= wire_016 @[RandomHardware.scala 117:33]
    ShiftRight_017.io.in <= wire_020 @[RandomHardware.scala 118:25]
    node _RandomHardware_018_io_in_T = cat(wire_021, wire_022) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 119:33]
    node RandomHardware_019_io_in_hi = cat(wire_023, wire_024) @[Cat.scala 30:58]
    node _RandomHardware_019_io_in_T = cat(RandomHardware_019_io_in_hi, wire_025) @[Cat.scala 30:58]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 120:33]
    
