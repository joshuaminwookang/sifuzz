;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<8>}
    
    node in1 = bits(io.in, 15, 8) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 7, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<8>}
    
    inst And_000 of And @[RandomHardware_1_0.scala 14:26]
    And_000.clock <= clock
    And_000.reset <= reset
    And_000.io.in <= io.in @[RandomHardware_1_0.scala 16:25]
    io.out <= And_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    inst Reg_000 of Reg @[RandomHardware_1_1.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_1.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<10>}
    
    node _io_out_T = bits(io.in, 4, 4) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<5>("h01f"), UInt<5>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node in1 = bits(io.in, 7, 4) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 3, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<12>}
    
    node IN1 = bits(io.in, 27, 16) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 15, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<16>}
    
    node _io_out_T = bits(io.in, 7, 7) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<12>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<16> @[RandomHardware_2_1.scala 14:24]
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister @[RandomHardware_2_1.scala 17:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble_1 @[RandomHardware_2_1.scala 18:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    node _ShiftRegister_001_io_in_T = bits(io.in, 19, 8) @[RandomHardware_2_1.scala 20:41]
    ShiftRegister_001.io.in <= _ShiftRegister_001_io_in_T @[RandomHardware_2_1.scala 20:33]
    node _SignExtendDouble_002_io_in_T = bits(io.in, 7, 0) @[RandomHardware_2_1.scala 21:41]
    SignExtendDouble_002.io.in <= _SignExtendDouble_002_io_in_T @[RandomHardware_2_1.scala 21:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_2_1.scala 22:10]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 24:18]
    wire_001 <= SignExtendDouble_002.io.out @[RandomHardware_2_1.scala 25:18]
    node _ReduceXorMux_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ReduceXorMux_000.io.in <= _ReduceXorMux_000_io_in_T @[RandomHardware_2_1.scala 26:33]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_3.scala 13:24]
    inst Mul_000 of Mul @[RandomHardware_1_3.scala 15:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_3.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_3.scala 18:33]
    io.out <= Mul_000.io.out @[RandomHardware_1_3.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_3.scala 21:18]
    Mul_000.io.in <= wire_000 @[RandomHardware_1_3.scala 22:25]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<9>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftRegister_1 : 
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
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<9>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
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
    output io : {flip in : UInt<5>, out : UInt<10>}
    
    node _io_out_T = bits(io.in, 4, 4) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<5>("h01f"), UInt<5>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<7>}
    
    node IN1 = bits(io.in, 19, 10) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 12, 6) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 5, 3) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 2, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<7> @[RandomHardware_1_9.scala 13:24]
    inst SignExtendDouble_000 of SignExtendDouble_3 @[RandomHardware_1_9.scala 15:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst CompareMux_001 of CompareMux @[RandomHardware_1_9.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_1_9.scala 18:25]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_1_9.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_1_9.scala 21:18]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_9.scala 22:33]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<6>}
    
    node IN1 = bits(io.in, 13, 8) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 7, 2) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<6>}
    
    wire wire_000 : UInt<6> @[RandomHardware_1_10.scala 13:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_1_10.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceAndMux_001 of ReduceAndMux @[RandomHardware_1_10.scala 16:34]
    ReduceAndMux_001.clock <= clock
    ReduceAndMux_001.reset <= reset
    ReduceAndMux_001.io.in <= io.in @[RandomHardware_1_10.scala 18:33]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_10.scala 19:10]
    wire_000 <= ReduceAndMux_001.io.out @[RandomHardware_1_10.scala 21:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_1_10.scala 22:25]
    
  module RegFile2R1W : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<14>}
    
    node R1_SEL = bits(io.in, 12, 10) @[Memory.scala 37:28]
    node R2_SEL = bits(io.in, 9, 7) @[Memory.scala 38:28]
    node W_DATA = bits(io.in, 6, 0) @[Memory.scala 39:28]
    reg registers : UInt<7>[8], clock @[Memory.scala 41:22]
    registers[R1_SEL] <= W_DATA @[Memory.scala 44:21]
    node _io_out_T = cat(registers[R1_SEL], registers[R2_SEL]) @[Cat.scala 30:58]
    io.out <= _io_out_T @[Memory.scala 50:10]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<14>}
    
    inst RegFile2R1W_000 of RegFile2R1W @[RandomHardware_1_11.scala 14:34]
    RegFile2R1W_000.clock <= clock
    RegFile2R1W_000.reset <= reset
    RegFile2R1W_000.io.in <= io.in @[RandomHardware_1_11.scala 16:33]
    io.out <= RegFile2R1W_000.io.out @[RandomHardware_1_11.scala 17:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum_1 @[RandomHardware_1_13.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_13.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module Div : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 59:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 60:20]
    node _io_out_T = div(in1, in2) @[ArithmeticLogical.scala 61:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 61:12]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    inst Div_000 of Div @[RandomHardware_1_14.scala 14:26]
    Div_000.clock <= clock
    Div_000.reset <= reset
    Div_000.io.in <= io.in @[RandomHardware_1_14.scala 16:25]
    io.out <= Div_000.io.out @[RandomHardware_1_14.scala 17:10]
    
  module CompareMux_1 : 
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
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    inst CompareMux_000 of CompareMux_1 @[RandomHardware_1_15.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_15.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_15.scala 17:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<12>}
    
    node IN1 = bits(io.in, 27, 16) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 15, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module ShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module SignExtendDouble_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<16>}
    
    node _io_out_T = bits(io.in, 7, 7) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<12>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<16> @[RandomHardware_2_1.scala 14:24]
    inst ReduceXorMux_000 of ReduceXorMux_1 @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_3 @[RandomHardware_2_1.scala 17:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble_4 @[RandomHardware_2_1.scala 18:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    node _ShiftRegister_001_io_in_T = bits(io.in, 19, 8) @[RandomHardware_2_1.scala 20:41]
    ShiftRegister_001.io.in <= _ShiftRegister_001_io_in_T @[RandomHardware_2_1.scala 20:33]
    node _SignExtendDouble_002_io_in_T = bits(io.in, 7, 0) @[RandomHardware_2_1.scala 21:41]
    SignExtendDouble_002.io.in <= _SignExtendDouble_002_io_in_T @[RandomHardware_2_1.scala 21:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_2_1.scala 22:10]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 24:18]
    wire_001 <= SignExtendDouble_002.io.out @[RandomHardware_2_1.scala 25:18]
    node _ReduceXorMux_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ReduceXorMux_000.io.in <= _ReduceXorMux_000_io_in_T @[RandomHardware_2_1.scala 26:33]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    inst ShiftRight_000 of ShiftRight_1 @[RandomHardware_2_2.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_2.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_2_2.scala 17:10]
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<12>}
    
    wire wire_000 : UInt<20> @[RandomHardware_1_16.scala 13:24]
    wire wire_001 : UInt<20> @[RandomHardware_1_16.scala 14:24]
    inst Reg_000 of Reg_1 @[RandomHardware_1_16.scala 16:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_16.scala 17:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_16.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_16.scala 20:25]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_16.scala 21:10]
    RandomHardware_002.io.in <= wire_000 @[RandomHardware_1_16.scala 23:33]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_1_16.scala 24:18]
    wire_000 <= Reg_000.io.out @[RandomHardware_1_16.scala 25:18]
    RandomHardware_001.io.in <= wire_001 @[RandomHardware_1_16.scala 26:33]
    
  module ReduceXorMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<10>}
    
    node IN1 = bits(io.in, 25, 16) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 15, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<10>}
    
    inst ReduceXorMux_000 of ReduceXorMux_2 @[RandomHardware_1_17.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_17.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_17.scala 17:10]
    
  module ShiftRegister_4 : 
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
    
  module SignExtendDouble_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<50>}
    
    node _io_out_T = bits(io.in, 24, 24) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<25>("h01ffffff"), UInt<25>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<25>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<25>, clock with : (reset => (reset, UInt<25>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<25>, clock with : (reset => (reset, UInt<25>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<25>, clock with : (reset => (reset, UInt<25>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<25>, clock with : (reset => (reset, UInt<25>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<50>}
    
    wire wire_000 : UInt<25> @[RandomHardware_1_19.scala 13:24]
    inst SignExtendDouble_000 of SignExtendDouble_5 @[RandomHardware_1_19.scala 15:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister @[RandomHardware_1_19.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    ResetShiftRegister_001.io.in <= io.in @[RandomHardware_1_19.scala 18:33]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_1_19.scala 19:10]
    wire_000 <= ResetShiftRegister_001.io.out @[RandomHardware_1_19.scala 21:18]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_19.scala 22:33]
    
  module SignExtendDouble_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<22>}
    
    node _io_out_T = bits(io.in, 10, 10) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<11>("h07ff"), UInt<11>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftLeft_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<13>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<12>}
    
    node IN1 = bits(io.in, 27, 16) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 15, 4) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<13>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_21.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft_2 @[RandomHardware_1_21.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst ReduceOrMux_001 of ReduceOrMux @[RandomHardware_1_21.scala 16:34]
    ReduceOrMux_001.clock <= clock
    ReduceOrMux_001.reset <= reset
    ReduceOrMux_001.io.in <= io.in @[RandomHardware_1_21.scala 18:33]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_21.scala 19:10]
    wire_000 <= ReduceOrMux_001.io.out @[RandomHardware_1_21.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_21.scala 22:25]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<21>}
    
    node IN1 = bits(io.in, 49, 29) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 28, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
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
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_22 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<20>}
    
    wire wire_000 : UInt<21> @[RandomHardware_1_22.scala 13:24]
    wire wire_001 : UInt<10> @[RandomHardware_1_22.scala 14:24]
    wire wire_002 : UInt<10> @[RandomHardware_1_22.scala 15:24]
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_1_22.scala 17:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst Accum_001 of Accum_2 @[RandomHardware_1_22.scala 18:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst Mux2_002 of Mux2 @[RandomHardware_1_22.scala 19:26]
    Mux2_002.clock <= clock
    Mux2_002.reset <= reset
    inst Reg_003 of Reg_2 @[RandomHardware_1_22.scala 20:26]
    Reg_003.clock <= clock
    Reg_003.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_22.scala 22:33]
    node _io_out_T = cat(Accum_001.io.out, Reg_003.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_22.scala 23:10]
    Mux2_002.io.in <= wire_000 @[RandomHardware_1_22.scala 25:25]
    wire_002 <= Mux2_002.io.out @[RandomHardware_1_22.scala 26:18]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_1_22.scala 27:18]
    node _wire_001_T = bits(ReduceOrMux_000.io.out, 9, 0) @[RandomHardware_1_22.scala 28:44]
    wire_001 <= _wire_001_T @[RandomHardware_1_22.scala 28:18]
    Accum_001.io.in <= wire_002 @[RandomHardware_1_22.scala 29:25]
    Reg_003.io.in <= wire_001 @[RandomHardware_1_22.scala 30:25]
    
  module ShiftLeft_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<6>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftLeft_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<12>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Reg_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<87>}
    
    wire wire_000 : UInt<10> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<5> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<5> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<5> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<5> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<5> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<20> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<10> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<5> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<5> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<12> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<20> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<5> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<20> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<20> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<6> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<5> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<14> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<12> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<6> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<5> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<8> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<8> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<12> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<50> @[RandomHardware.scala 39:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 41:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 42:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble @[RandomHardware.scala 43:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 44:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst ShiftLeft_004 of ShiftLeft @[RandomHardware.scala 45:34]
    ShiftLeft_004.clock <= clock
    ShiftLeft_004.reset <= reset
    inst ShiftRegister_005 of ShiftRegister_1 @[RandomHardware.scala 46:42]
    ShiftRegister_005.clock <= clock
    ShiftRegister_005.reset <= reset
    inst ShiftLeft_006 of ShiftLeft_1 @[RandomHardware.scala 47:34]
    ShiftLeft_006.clock <= clock
    ShiftLeft_006.reset <= reset
    inst ShiftRegister_007 of ShiftRegister_2 @[RandomHardware.scala 48:42]
    ShiftRegister_007.clock <= clock
    ShiftRegister_007.reset <= reset
    inst SignExtendDouble_008 of SignExtendDouble_2 @[RandomHardware.scala 49:42]
    SignExtendDouble_008.clock <= clock
    SignExtendDouble_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 50:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 51:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 52:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst Accum_012 of Accum @[RandomHardware.scala 53:34]
    Accum_012.clock <= clock
    Accum_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 54:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 55:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 56:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 57:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 58:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst ShiftRegister_018 of ShiftRegister_4 @[RandomHardware.scala 59:42]
    ShiftRegister_018.clock <= clock
    ShiftRegister_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 60:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst SignExtendDouble_020 of SignExtendDouble_6 @[RandomHardware.scala 61:42]
    SignExtendDouble_020.clock <= clock
    SignExtendDouble_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 62:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst RandomHardware_022 of RandomHardware_1_22 @[RandomHardware.scala 63:42]
    RandomHardware_022.clock <= clock
    RandomHardware_022.reset <= reset
    inst ShiftLeft_023 of ShiftLeft_3 @[RandomHardware.scala 64:34]
    ShiftLeft_023.clock <= clock
    ShiftLeft_023.reset <= reset
    inst ShiftLeft_024 of ShiftLeft_4 @[RandomHardware.scala 65:34]
    ShiftLeft_024.clock <= clock
    ShiftLeft_024.reset <= reset
    inst Reg_025 of Reg_3 @[RandomHardware.scala 66:26]
    Reg_025.clock <= clock
    Reg_025.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 68:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 68:33]
    node _RandomHardware_001_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 69:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 69:33]
    node _RandomHardware_003_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 70:41]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 70:33]
    node _RandomHardware_010_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 71:41]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 71:33]
    node _RandomHardware_015_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 72:41]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 72:33]
    node _ShiftLeft_023_io_in_T = bits(io.in, 3, 0) @[RandomHardware.scala 73:33]
    ShiftLeft_023.io.in <= _ShiftLeft_023_io_in_T @[RandomHardware.scala 73:25]
    node _ShiftLeft_024_io_in_T = bits(io.in, 7, 0) @[RandomHardware.scala 74:33]
    ShiftLeft_024.io.in <= _ShiftLeft_024_io_in_T @[RandomHardware.scala 74:25]
    node io_out_lo_hi = cat(RandomHardware_017.io.out, SignExtendDouble_020.io.out) @[Cat.scala 30:58]
    node io_out_lo = cat(io_out_lo_hi, RandomHardware_021.io.out) @[Cat.scala 30:58]
    node io_out_hi_lo = cat(RandomHardware_009.io.out, RandomHardware_014.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(ShiftLeft_004.io.out, ShiftLeft_006.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 75:10]
    SignExtendDouble_002.io.in <= wire_001 @[RandomHardware.scala 77:33]
    wire_000 <= SignExtendDouble_002.io.out @[RandomHardware.scala 78:18]
    ShiftRegister_005.io.in <= wire_003 @[RandomHardware.scala 79:33]
    wire_018 <= ShiftRegister_005.io.out @[RandomHardware.scala 80:18]
    ShiftRegister_007.io.in <= wire_005 @[RandomHardware.scala 81:33]
    wire_004 <= ShiftRegister_007.io.out @[RandomHardware.scala 82:18]
    SignExtendDouble_008.io.in <= wire_006 @[RandomHardware.scala 83:33]
    wire_009 <= SignExtendDouble_008.io.out @[RandomHardware.scala 84:18]
    node RandomHardware_011_io_in_hi = cat(wire_008, wire_009) @[Cat.scala 30:58]
    node _RandomHardware_011_io_in_T = cat(RandomHardware_011_io_in_hi, wire_010) @[Cat.scala 30:58]
    RandomHardware_011.io.in <= _RandomHardware_011_io_in_T @[RandomHardware.scala 85:33]
    wire_019 <= RandomHardware_011.io.out @[RandomHardware.scala 86:18]
    Accum_012.io.in <= wire_011 @[RandomHardware.scala 87:25]
    wire_001 <= Accum_012.io.out @[RandomHardware.scala 88:18]
    wire_010 <= Accum_012.io.out @[RandomHardware.scala 89:18]
    RandomHardware_013.io.in <= wire_012 @[RandomHardware.scala 90:33]
    wire_020 <= RandomHardware_013.io.out @[RandomHardware.scala 91:18]
    RandomHardware_016.io.in <= wire_015 @[RandomHardware.scala 92:33]
    wire_012 <= RandomHardware_016.io.out @[RandomHardware.scala 93:18]
    ShiftRegister_018.io.in <= wire_018 @[RandomHardware.scala 94:33]
    wire_022 <= ShiftRegister_018.io.out @[RandomHardware.scala 95:18]
    node _RandomHardware_019_io_in_T = cat(wire_019, wire_020) @[Cat.scala 30:58]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 96:33]
    wire_026 <= RandomHardware_019.io.out @[RandomHardware.scala 97:18]
    RandomHardware_022.io.in <= wire_026 @[RandomHardware.scala 98:33]
    wire_007 <= RandomHardware_022.io.out @[RandomHardware.scala 99:18]
    node _Reg_025_io_in_T = cat(wire_000, wire_014) @[Cat.scala 30:58]
    Reg_025.io.in <= _Reg_025_io_in_T @[RandomHardware.scala 100:25]
    wire_005 <= Reg_025.io.out @[RandomHardware.scala 101:18]
    wire_006 <= Reg_025.io.out @[RandomHardware.scala 102:18]
    wire_023 <= RandomHardware_000.io.out @[RandomHardware.scala 103:18]
    wire_013 <= RandomHardware_001.io.out @[RandomHardware.scala 104:18]
    wire_015 <= RandomHardware_001.io.out @[RandomHardware.scala 105:18]
    wire_016 <= RandomHardware_001.io.out @[RandomHardware.scala 106:18]
    wire_008 <= RandomHardware_003.io.out @[RandomHardware.scala 107:18]
    wire_024 <= RandomHardware_003.io.out @[RandomHardware.scala 108:18]
    wire_021 <= RandomHardware_010.io.out @[RandomHardware.scala 109:18]
    wire_002 <= RandomHardware_015.io.out @[RandomHardware.scala 110:18]
    wire_003 <= RandomHardware_015.io.out @[RandomHardware.scala 111:18]
    wire_011 <= RandomHardware_015.io.out @[RandomHardware.scala 112:18]
    wire_014 <= RandomHardware_015.io.out @[RandomHardware.scala 113:18]
    wire_017 <= ShiftLeft_023.io.out @[RandomHardware.scala 114:18]
    wire_025 <= ShiftLeft_024.io.out @[RandomHardware.scala 115:18]
    ShiftLeft_004.io.in <= wire_002 @[RandomHardware.scala 116:25]
    ShiftLeft_006.io.in <= wire_004 @[RandomHardware.scala 117:25]
    RandomHardware_009.io.in <= wire_007 @[RandomHardware.scala 118:33]
    RandomHardware_014.io.in <= wire_013 @[RandomHardware.scala 119:33]
    node _RandomHardware_017_io_in_T = cat(wire_016, wire_017) @[Cat.scala 30:58]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 120:33]
    node _SignExtendDouble_020_io_in_T = cat(wire_021, wire_022) @[Cat.scala 30:58]
    SignExtendDouble_020.io.in <= _SignExtendDouble_020_io_in_T @[RandomHardware.scala 121:33]
    node RandomHardware_021_io_in_hi = cat(wire_023, wire_024) @[Cat.scala 30:58]
    node _RandomHardware_021_io_in_T = cat(RandomHardware_021_io_in_hi, wire_025) @[Cat.scala 30:58]
    RandomHardware_021.io.in <= _RandomHardware_021_io_in_T @[RandomHardware.scala 122:33]
    
