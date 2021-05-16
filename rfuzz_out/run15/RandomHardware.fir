;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<7>}
    
    node IN1 = bits(io.in, 19, 13) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 12, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<7> @[RandomHardware_2_0.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_2_0.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble @[RandomHardware_2_0.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_0.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<9>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    inst Accum_000 of Accum @[RandomHardware_1_1.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_1.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module Mux4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<4>}
    
    node sel = bits(io.in, 17, 16) @[Muxes.scala 28:18]
    node in3 = bits(io.in, 15, 12) @[Muxes.scala 29:18]
    node in2 = bits(io.in, 11, 8) @[Muxes.scala 30:18]
    node in1 = bits(io.in, 7, 4) @[Muxes.scala 31:18]
    node in0 = bits(io.in, 3, 0) @[Muxes.scala 32:18]
    node _T = eq(sel, UInt<2>("h03")) @[Muxes.scala 33:17]
    when _T : @[Muxes.scala 33:31]
      io.out <= in3 @[Muxes.scala 33:40]
      skip @[Muxes.scala 33:31]
    else : @[Muxes.scala 34:31]
      node _T_1 = eq(sel, UInt<2>("h02")) @[Muxes.scala 34:17]
      when _T_1 : @[Muxes.scala 34:31]
        io.out <= in2 @[Muxes.scala 34:40]
        skip @[Muxes.scala 34:31]
      else : @[Muxes.scala 35:31]
        node _T_2 = eq(sel, UInt<1>("h01")) @[Muxes.scala 35:17]
        when _T_2 : @[Muxes.scala 35:31]
          io.out <= in1 @[Muxes.scala 35:40]
          skip @[Muxes.scala 35:31]
        else : @[Muxes.scala 36:27]
          io.out <= in0 @[Muxes.scala 36:36]
          skip @[Muxes.scala 36:27]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<18>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<18>, clock with : (reset => (reset, UInt<18>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<18>, clock with : (reset => (reset, UInt<18>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<18>, clock with : (reset => (reset, UInt<18>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<18>, clock with : (reset => (reset, UInt<18>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<4>}
    
    wire wire_000 : UInt<18> @[RandomHardware_1_2.scala 13:24]
    inst Mux4_000 of Mux4 @[RandomHardware_1_2.scala 15:26]
    Mux4_000.clock <= clock
    Mux4_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister @[RandomHardware_1_2.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    ResetShiftRegister_001.io.in <= io.in @[RandomHardware_1_2.scala 18:33]
    io.out <= Mux4_000.io.out @[RandomHardware_1_2.scala 19:10]
    wire_000 <= ResetShiftRegister_001.io.out @[RandomHardware_1_2.scala 21:18]
    Mux4_000.io.in <= wire_000 @[RandomHardware_1_2.scala 22:25]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<7>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<12>}
    
    node _io_out_T = bits(io.in, 5, 5) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<6>("h03f"), UInt<6>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Mux2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<14>}
    
    node _sel_T = bits(io.in, 28, 28) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 27, 14) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 13, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<14>}
    
    inst Mux2_000 of Mux2 @[RandomHardware_1_5.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_5.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_5.scala 17:10]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<7>}
    
    node IN1 = bits(io.in, 19, 13) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 12, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<7> @[RandomHardware_2_0.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_2_0.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_2 @[RandomHardware_2_0.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_0.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_6.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_6.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_6.scala 17:10]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<24>}
    
    node _io_out_T = bits(io.in, 11, 11) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<12>("h0fff"), UInt<12>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<7>}
    
    node IN1 = bits(io.in, 23, 12) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 16, 10) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 9, 5) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 4, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<7>}
    
    wire wire_000 : UInt<24> @[RandomHardware_1_7.scala 13:24]
    inst SignExtendDouble_000 of SignExtendDouble_3 @[RandomHardware_1_7.scala 15:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst CompareMux_001 of CompareMux @[RandomHardware_1_7.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    SignExtendDouble_000.io.in <= io.in @[RandomHardware_1_7.scala 18:33]
    io.out <= CompareMux_001.io.out @[RandomHardware_1_7.scala 19:10]
    wire_000 <= SignExtendDouble_000.io.out @[RandomHardware_1_7.scala 21:18]
    CompareMux_001.io.in <= wire_000 @[RandomHardware_1_7.scala 22:25]
    
  module ReduceOrMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<7>}
    
    node IN1 = bits(io.in, 19, 13) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 12, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module SignExtendDouble_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<7> @[RandomHardware_2_0.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_2 @[RandomHardware_2_0.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_4 @[RandomHardware_2_0.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_0.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_8.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_8.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_8.scala 17:10]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<13>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<13>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_9.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_9.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst And_001 of And @[RandomHardware_1_9.scala 16:26]
    And_001.clock <= clock
    And_001.reset <= reset
    And_001.io.in <= io.in @[RandomHardware_1_9.scala 18:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_9.scala 19:10]
    wire_000 <= And_001.io.out @[RandomHardware_1_9.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_9.scala 22:25]
    
  module Mux2_1 : 
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
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<16>}
    
    inst Mux2_000 of Mux2_1 @[RandomHardware_1_10.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_10.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_10.scala 17:10]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    node in1 = bits(io.in, 5, 3) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 2, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module ReduceOrMux_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<20>}
    
    node _io_out_T = shl(io.in, 5) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<20>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_12.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_3 @[RandomHardware_1_12.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft_1 @[RandomHardware_1_12.scala 16:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_12.scala 18:33]
    io.out <= ShiftLeft_001.io.out @[RandomHardware_1_12.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_1_12.scala 21:18]
    ShiftLeft_001.io.in <= wire_000 @[RandomHardware_1_12.scala 22:25]
    
  module ReduceOrMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    node IN1 = bits(io.in, 23, 16) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 15, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    inst ReduceOrMux_000 of ReduceOrMux_4 @[RandomHardware_1_13.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_13.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module Reg : 
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
    
    inst Reg_000 of Reg @[RandomHardware_1_14.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_14.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_14.scala 17:10]
    
  module ReduceOrMux_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<7>}
    
    node IN1 = bits(io.in, 19, 13) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 12, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module SignExtendDouble_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_2_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<7> @[RandomHardware_2_0.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_5 @[RandomHardware_2_0.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_5 @[RandomHardware_2_0.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_0.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    inst Accum_000 of Accum_1 @[RandomHardware_2_2.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_2_2.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_2_2.scala 17:10]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<14>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_15.scala 13:24]
    wire wire_001 : UInt<14> @[RandomHardware_1_15.scala 14:24]
    inst RandomHardware_000 of RandomHardware_2_0_3 @[RandomHardware_1_15.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister @[RandomHardware_1_15.scala 17:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_15.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_15.scala 20:33]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_15.scala 21:10]
    RandomHardware_002.io.in <= wire_000 @[RandomHardware_1_15.scala 23:33]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_1_15.scala 24:18]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_15.scala 25:18]
    ShiftRegister_001.io.in <= wire_001 @[RandomHardware_1_15.scala 26:33]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Reg_000 of Reg_1 @[RandomHardware_1_16.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_16.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_16.scala 17:10]
    
  module Div : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<9>}
    
    node in1 = bits(io.in, 17, 9) @[ArithmeticLogical.scala 59:20]
    node in2 = bits(io.in, 8, 0) @[ArithmeticLogical.scala 60:20]
    node _io_out_T = div(in1, in2) @[ArithmeticLogical.scala 61:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 61:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<9>}
    
    inst Div_000 of Div @[RandomHardware_1_17.scala 14:26]
    Div_000.clock <= clock
    Div_000.reset <= reset
    Div_000.io.in <= io.in @[RandomHardware_1_17.scala 16:25]
    io.out <= Div_000.io.out @[RandomHardware_1_17.scala 17:10]
    
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
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    inst RegE_000 of RegE @[RandomHardware_1_18.scala 14:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_1_18.scala 16:25]
    io.out <= RegE_000.io.out @[RandomHardware_1_18.scala 17:10]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<72>}
    
    wire wire_000 : UInt<12> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<7> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<7> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<6> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<9> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<20> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<6> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<12> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<12> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<13> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<14> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<6> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<14> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<12> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<9> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<12> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<7> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<13> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<6> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<12> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<20> @[RandomHardware.scala 34:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 36:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 37:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 38:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst ShiftRight_003 of ShiftRight @[RandomHardware.scala 39:34]
    ShiftRight_003.clock <= clock
    ShiftRight_003.reset <= reset
    inst SignExtendDouble_004 of SignExtendDouble_1 @[RandomHardware.scala 40:42]
    SignExtendDouble_004.clock <= clock
    SignExtendDouble_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_1_5 @[RandomHardware.scala 41:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 42:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 43:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 44:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 45:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 46:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst Mul_011 of Mul @[RandomHardware.scala 47:26]
    Mul_011.clock <= clock
    Mul_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 48:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 49:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 50:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 51:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 52:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 53:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 54:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst Reg_019 of Reg_2 @[RandomHardware.scala 55:26]
    Reg_019.clock <= clock
    Reg_019.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 57:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 57:33]
    node _RandomHardware_001_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 58:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 58:33]
    node _RandomHardware_006_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 59:41]
    RandomHardware_006.io.in <= _RandomHardware_006_io_in_T @[RandomHardware.scala 59:33]
    node _RandomHardware_007_io_in_T = bits(io.in, 11, 0) @[RandomHardware.scala 60:41]
    RandomHardware_007.io.in <= _RandomHardware_007_io_in_T @[RandomHardware.scala 60:33]
    node _RandomHardware_013_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 61:41]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 61:33]
    node _RandomHardware_016_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 62:41]
    RandomHardware_016.io.in <= _RandomHardware_016_io_in_T @[RandomHardware.scala 62:33]
    node io_out_lo_hi = cat(Mul_011.io.out, RandomHardware_012.io.out) @[Cat.scala 30:58]
    node io_out_lo = cat(io_out_lo_hi, RandomHardware_018.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(RandomHardware_002.io.out, ShiftRight_003.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, RandomHardware_010.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 63:10]
    SignExtendDouble_004.io.in <= wire_003 @[RandomHardware.scala 65:33]
    wire_000 <= SignExtendDouble_004.io.out @[RandomHardware.scala 66:18]
    node _RandomHardware_005_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    RandomHardware_005.io.in <= _RandomHardware_005_io_in_T @[RandomHardware.scala 67:33]
    wire_013 <= RandomHardware_005.io.out @[RandomHardware.scala 68:18]
    RandomHardware_008.io.in <= wire_007 @[RandomHardware.scala 69:33]
    wire_014 <= RandomHardware_008.io.out @[RandomHardware.scala 70:18]
    node _RandomHardware_009_io_in_T = cat(wire_008, wire_009) @[Cat.scala 30:58]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 71:33]
    wire_010 <= RandomHardware_009.io.out @[RandomHardware.scala 72:18]
    wire_018 <= RandomHardware_009.io.out @[RandomHardware.scala 73:18]
    RandomHardware_014.io.in <= wire_016 @[RandomHardware.scala 74:33]
    wire_020 <= RandomHardware_014.io.out @[RandomHardware.scala 75:18]
    node _RandomHardware_015_io_in_T = cat(wire_017, wire_018) @[Cat.scala 30:58]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 76:33]
    wire_011 <= RandomHardware_015.io.out @[RandomHardware.scala 77:18]
    node _RandomHardware_017_io_in_T = cat(wire_019, wire_020) @[Cat.scala 30:58]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 78:33]
    wire_015 <= RandomHardware_017.io.out @[RandomHardware.scala 79:18]
    Reg_019.io.in <= wire_006 @[RandomHardware.scala 80:25]
    wire_003 <= Reg_019.io.out @[RandomHardware.scala 81:18]
    wire_012 <= Reg_019.io.out @[RandomHardware.scala 82:18]
    wire_004 <= RandomHardware_000.io.out @[RandomHardware.scala 83:18]
    wire_005 <= RandomHardware_001.io.out @[RandomHardware.scala 84:18]
    wire_021 <= RandomHardware_001.io.out @[RandomHardware.scala 85:18]
    node _hi_T = bits(RandomHardware_006.io.out, 11, 6) @[RandomHardware.scala 86:47]
    wire_019 <= _hi_T @[RandomHardware.scala 86:18]
    node _wire_006_T = bits(RandomHardware_006.io.out, 5, 0) @[RandomHardware.scala 87:47]
    wire_006 <= _wire_006_T @[RandomHardware.scala 87:18]
    wire_001 <= RandomHardware_007.io.out @[RandomHardware.scala 88:18]
    wire_002 <= RandomHardware_007.io.out @[RandomHardware.scala 89:18]
    wire_017 <= RandomHardware_007.io.out @[RandomHardware.scala 90:18]
    wire_008 <= RandomHardware_013.io.out @[RandomHardware.scala 91:18]
    wire_007 <= RandomHardware_016.io.out @[RandomHardware.scala 92:18]
    wire_009 <= RandomHardware_016.io.out @[RandomHardware.scala 93:18]
    wire_016 <= RandomHardware_016.io.out @[RandomHardware.scala 94:18]
    node _RandomHardware_002_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 95:33]
    ShiftRight_003.io.in <= wire_002 @[RandomHardware.scala 96:25]
    node _RandomHardware_010_io_in_T = cat(wire_010, wire_011) @[Cat.scala 30:58]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 97:33]
    Mul_011.io.in <= wire_012 @[RandomHardware.scala 98:25]
    node RandomHardware_012_io_in_hi = cat(wire_013, wire_014) @[Cat.scala 30:58]
    node _RandomHardware_012_io_in_T = cat(RandomHardware_012_io_in_hi, wire_015) @[Cat.scala 30:58]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 99:33]
    RandomHardware_018.io.in <= wire_021 @[RandomHardware.scala 100:33]
    
