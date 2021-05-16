;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_0.scala 13:24]
    inst Accum_000 of Accum @[RandomHardware_1_0.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst Accum_001 of Accum_1 @[RandomHardware_1_0.scala 16:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_0.scala 18:25]
    io.out <= Accum_001.io.out @[RandomHardware_1_0.scala 19:10]
    wire_000 <= Accum_000.io.out @[RandomHardware_1_0.scala 21:18]
    Accum_001.io.in <= wire_000 @[RandomHardware_1_0.scala 22:25]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<7>}
    
    node IN1 = bits(io.in, 23, 17) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 16, 10) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<7>}
    
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_1_1.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_1.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<9>}
    
    node IN1 = bits(io.in, 22, 14) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 13, 5) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 4, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_2.scala 13:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_1_2.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceAndMux_001 of ReduceAndMux @[RandomHardware_1_2.scala 16:34]
    ReduceAndMux_001.clock <= clock
    ReduceAndMux_001.reset <= reset
    ReduceAndMux_001.io.in <= io.in @[RandomHardware_1_2.scala 18:33]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_2.scala 19:10]
    wire_000 <= ReduceAndMux_001.io.out @[RandomHardware_1_2.scala 21:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_1_2.scala 22:25]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<18>}
    
    node _io_out_T = bits(io.in, 8, 8) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<9>("h01ff"), UInt<9>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module Div : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 59:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 60:20]
    node _io_out_T = div(in1, in2) @[ArithmeticLogical.scala 61:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 61:12]
    
  module ReduceAndMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<12>}
    
    node IN1 = bits(io.in, 27, 16) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 15, 4) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<6>}
    
    node IN1 = bits(io.in, 15, 8) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 9, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<62>, out : UInt<12>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_4.scala 13:24]
    wire wire_001 : UInt<10> @[RandomHardware_1_4.scala 14:24]
    wire wire_002 : UInt<6> @[RandomHardware_1_4.scala 15:24]
    wire wire_003 : UInt<6> @[RandomHardware_1_4.scala 16:24]
    inst And_000 of And @[RandomHardware_1_4.scala 18:26]
    And_000.clock <= clock
    And_000.reset <= reset
    inst Div_001 of Div @[RandomHardware_1_4.scala 19:26]
    Div_001.clock <= clock
    Div_001.reset <= reset
    inst ReduceAndMux_002 of ReduceAndMux_1 @[RandomHardware_1_4.scala 20:34]
    ReduceAndMux_002.clock <= clock
    ReduceAndMux_002.reset <= reset
    inst CompareMux_003 of CompareMux @[RandomHardware_1_4.scala 21:34]
    CompareMux_003.clock <= clock
    CompareMux_003.reset <= reset
    inst Reg_004 of Reg @[RandomHardware_1_4.scala 22:26]
    Reg_004.clock <= clock
    Reg_004.reset <= reset
    node _And_000_io_in_T = bits(io.in, 61, 42) @[RandomHardware_1_4.scala 24:33]
    And_000.io.in <= _And_000_io_in_T @[RandomHardware_1_4.scala 24:25]
    node _Div_001_io_in_T = bits(io.in, 61, 42) @[RandomHardware_1_4.scala 25:33]
    Div_001.io.in <= _Div_001_io_in_T @[RandomHardware_1_4.scala 25:25]
    node _CompareMux_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_1_4.scala 26:33]
    CompareMux_003.io.in <= _CompareMux_003_io_in_T @[RandomHardware_1_4.scala 26:25]
    node _Reg_004_io_in_T = bits(io.in, 5, 0) @[RandomHardware_1_4.scala 27:33]
    Reg_004.io.in <= _Reg_004_io_in_T @[RandomHardware_1_4.scala 27:25]
    io.out <= ReduceAndMux_002.io.out @[RandomHardware_1_4.scala 28:10]
    wire_000 <= And_000.io.out @[RandomHardware_1_4.scala 30:18]
    wire_001 <= Div_001.io.out @[RandomHardware_1_4.scala 31:18]
    wire_002 <= CompareMux_003.io.out @[RandomHardware_1_4.scala 32:18]
    wire_003 <= Reg_004.io.out @[RandomHardware_1_4.scala 33:18]
    node ReduceAndMux_002_io_in_lo = cat(wire_002, wire_003) @[Cat.scala 30:58]
    node ReduceAndMux_002_io_in_hi = cat(wire_000, wire_001) @[Cat.scala 30:58]
    node _ReduceAndMux_002_io_in_T = cat(ReduceAndMux_002_io_in_hi, ReduceAndMux_002_io_in_lo) @[Cat.scala 30:58]
    ReduceAndMux_002.io.in <= _ReduceAndMux_002_io_in_T @[RandomHardware_1_4.scala 34:33]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<14>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
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
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware_1_6.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_1_6.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_1_6.scala 17:10]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<15>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<15>}
    
    inst ShiftLeft_000 of ShiftLeft_1 @[RandomHardware_1_7.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_7.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_7.scala 17:10]
    
  module ShiftRegister_1 : 
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
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    node IN1 = bits(io.in, 23, 16) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 15, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_9.scala 13:24]
    inst Reg_000 of Reg_1 @[RandomHardware_1_9.scala 15:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst ReduceOrMux_001 of ReduceOrMux @[RandomHardware_1_9.scala 16:34]
    ReduceOrMux_001.clock <= clock
    ReduceOrMux_001.reset <= reset
    ReduceOrMux_001.io.in <= io.in @[RandomHardware_1_9.scala 18:33]
    io.out <= Reg_000.io.out @[RandomHardware_1_9.scala 19:10]
    wire_000 <= ReduceOrMux_001.io.out @[RandomHardware_1_9.scala 21:18]
    Reg_000.io.in <= wire_000 @[RandomHardware_1_9.scala 22:25]
    
  module ShiftLeft_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<12>}
    
    node _io_out_T = shl(io.in, 5) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Mux2 : 
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
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<9>}
    
    inst Mux2_000 of Mux2 @[RandomHardware_1_11.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_11.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_11.scala 17:10]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
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
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    wire wire_000 : UInt<5> @[RandomHardware_1_12.scala 13:24]
    inst Reg_000 of Reg_2 @[RandomHardware_1_12.scala 15:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst CompareMux_001 of CompareMux_1 @[RandomHardware_1_12.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_1_12.scala 18:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_12.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_1_12.scala 21:18]
    Reg_000.io.in <= wire_000 @[RandomHardware_1_12.scala 22:25]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    node IN1 = bits(io.in, 23, 15) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 14, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_1_13.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_13.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<48>}
    
    node _io_out_T = bits(io.in, 23, 23) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<24>("h0ffffff"), UInt<24>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<24>}
    
    node in1 = bits(io.in, 23, 12) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 11, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<48>}
    
    wire wire_000 : UInt<24> @[RandomHardware_2_0.scala 13:24]
    inst SignExtendDouble_000 of SignExtendDouble_1 @[RandomHardware_2_0.scala 15:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst Mul_001 of Mul @[RandomHardware_2_0.scala 16:26]
    Mul_001.clock <= clock
    Mul_001.reset <= reset
    Mul_001.io.in <= io.in @[RandomHardware_2_0.scala 18:25]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= Mul_001.io.out @[RandomHardware_2_0.scala 21:18]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module ShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<24>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<48>}
    
    wire wire_000 : UInt<24> @[RandomHardware_1_14.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_14.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_2 @[RandomHardware_1_14.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    ShiftRegister_001.io.in <= io.in @[RandomHardware_1_14.scala 18:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_14.scala 19:10]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_1_14.scala 21:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_1_14.scala 22:33]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module CompareMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<10>}
    
    node IN1 = bits(io.in, 27, 14) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 17, 8) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 7, 4) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 3, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_15.scala 13:24]
    inst Accum_000 of Accum_2 @[RandomHardware_1_15.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst CompareMux_001 of CompareMux_2 @[RandomHardware_1_15.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_1_15.scala 18:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_15.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_1_15.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_1_15.scala 22:25]
    
  module ShiftLeft_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<16>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<15>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<15>}
    
    inst ShiftRegister_000 of ShiftRegister_3 @[RandomHardware_2_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_2_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_2_2.scala 17:10]
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<16>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_16.scala 13:24]
    wire wire_001 : UInt<16> @[RandomHardware_1_16.scala 14:24]
    inst ShiftLeft_000 of ShiftLeft_3 @[RandomHardware_1_16.scala 16:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst Accum_001 of Accum_3 @[RandomHardware_1_16.scala 17:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_16.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    RandomHardware_002.io.in <= io.in @[RandomHardware_1_16.scala 20:33]
    io.out <= Accum_001.io.out @[RandomHardware_1_16.scala 21:10]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_16.scala 23:25]
    wire_001 <= ShiftLeft_000.io.out @[RandomHardware_1_16.scala 24:18]
    wire_000 <= RandomHardware_002.io.out @[RandomHardware_1_16.scala 25:18]
    Accum_001.io.in <= wire_001 @[RandomHardware_1_16.scala 26:25]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<47>}
    
    wire wire_000 : UInt<14> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<12> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<16> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<9> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<14> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<48> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<10> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<12> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<12> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<7> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<7> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<12> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<7> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<12> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<8> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<24> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<6> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<9> @[RandomHardware.scala 30:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 32:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 33:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 34:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst SignExtendDouble_003 of SignExtendDouble @[RandomHardware.scala 35:42]
    SignExtendDouble_003.clock <= clock
    SignExtendDouble_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 36:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst ShiftLeft_005 of ShiftLeft @[RandomHardware.scala 37:34]
    ShiftLeft_005.clock <= clock
    ShiftLeft_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 38:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 39:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst ShiftRegister_008 of ShiftRegister_1 @[RandomHardware.scala 40:42]
    ShiftRegister_008.clock <= clock
    ShiftRegister_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 41:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst ShiftLeft_010 of ShiftLeft_2 @[RandomHardware.scala 42:34]
    ShiftLeft_010.clock <= clock
    ShiftLeft_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 43:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 44:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 45:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 46:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 47:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 48:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    node _RandomHardware_001_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 50:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 50:33]
    node _RandomHardware_009_io_in_T = bits(io.in, 23, 0) @[RandomHardware.scala 51:41]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 51:33]
    node _RandomHardware_014_io_in_T = bits(io.in, 23, 0) @[RandomHardware.scala 52:41]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 52:33]
    node _RandomHardware_015_io_in_T = bits(io.in, 27, 0) @[RandomHardware.scala 53:41]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 53:33]
    node io_out_lo = cat(RandomHardware_007.io.out, RandomHardware_012.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(RandomHardware_002.io.out, SignExtendDouble_003.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 54:10]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware.scala 56:33]
    wire_004 <= RandomHardware_000.io.out @[RandomHardware.scala 57:18]
    node _RandomHardware_004_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 58:33]
    wire_011 <= RandomHardware_004.io.out @[RandomHardware.scala 59:18]
    node _wire_016_T = bits(RandomHardware_004.io.out, 11, 6) @[RandomHardware.scala 60:47]
    wire_016 <= _wire_016_T @[RandomHardware.scala 60:18]
    ShiftLeft_005.io.in <= wire_006 @[RandomHardware.scala 61:25]
    wire_000 <= ShiftLeft_005.io.out @[RandomHardware.scala 62:18]
    RandomHardware_006.io.in <= wire_007 @[RandomHardware.scala 63:33]
    wire_013 <= RandomHardware_006.io.out @[RandomHardware.scala 64:18]
    ShiftRegister_008.io.in <= wire_009 @[RandomHardware.scala 65:33]
    wire_012 <= ShiftRegister_008.io.out @[RandomHardware.scala 66:18]
    ShiftLeft_010.io.in <= wire_010 @[RandomHardware.scala 67:25]
    wire_001 <= ShiftLeft_010.io.out @[RandomHardware.scala 68:18]
    wire_007 <= ShiftLeft_010.io.out @[RandomHardware.scala 69:18]
    wire_008 <= ShiftLeft_010.io.out @[RandomHardware.scala 70:18]
    node _RandomHardware_011_io_in_T = cat(wire_011, wire_012) @[Cat.scala 30:58]
    RandomHardware_011.io.in <= _RandomHardware_011_io_in_T @[RandomHardware.scala 71:33]
    wire_017 <= RandomHardware_011.io.out @[RandomHardware.scala 72:18]
    RandomHardware_013.io.in <= wire_015 @[RandomHardware.scala 73:33]
    wire_003 <= RandomHardware_013.io.out @[RandomHardware.scala 74:18]
    node _RandomHardware_016_io_in_T = cat(wire_016, wire_017) @[Cat.scala 30:58]
    RandomHardware_016.io.in <= _RandomHardware_016_io_in_T @[RandomHardware.scala 75:33]
    wire_002 <= RandomHardware_016.io.out @[RandomHardware.scala 76:18]
    wire_009 <= RandomHardware_001.io.out @[RandomHardware.scala 77:18]
    wire_010 <= RandomHardware_001.io.out @[RandomHardware.scala 78:18]
    wire_014 <= RandomHardware_009.io.out @[RandomHardware.scala 79:18]
    wire_005 <= RandomHardware_014.io.out @[RandomHardware.scala 80:18]
    node _wire_015_T = bits(RandomHardware_014.io.out, 47, 24) @[RandomHardware.scala 81:47]
    wire_015 <= _wire_015_T @[RandomHardware.scala 81:18]
    wire_006 <= RandomHardware_015.io.out @[RandomHardware.scala 82:18]
    node _RandomHardware_002_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 83:33]
    SignExtendDouble_003.io.in <= wire_003 @[RandomHardware.scala 84:33]
    RandomHardware_007.io.in <= wire_008 @[RandomHardware.scala 85:33]
    node _RandomHardware_012_io_in_T = cat(wire_013, wire_014) @[Cat.scala 30:58]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 86:33]
    
