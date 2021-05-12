;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<11>}
    
    node IN1 = bits(io.in, 23, 12) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 12, 2) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 1, 1) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 0, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<11>}
    
    inst CompareMux_000 of CompareMux @[RandomHardware_1_0.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_0.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module Mux2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<19>}
    
    node _sel_T = bits(io.in, 38, 38) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 37, 19) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 18, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<19>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<19>}
    
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware_2_1.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_2_1.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<19>}
    
    wire wire_000 : UInt<19> @[RandomHardware_1_1.scala 13:24]
    inst Mux2_000 of Mux2 @[RandomHardware_1_1.scala 15:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_1.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_1.scala 18:25]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_1.scala 19:10]
    wire_000 <= Mux2_000.io.out @[RandomHardware_1_1.scala 21:18]
    RandomHardware_001.io.in <= wire_000 @[RandomHardware_1_1.scala 22:33]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<16>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<16>}
    
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_3.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_3.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_3.scala 17:10]
    
  module Sub : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<15>}
    
    node _in1_T = bits(io.in, 27, 14) @[ArithmeticLogical.scala 24:20]
    node in1 = asSInt(_in1_T) @[ArithmeticLogical.scala 24:30]
    node _in2_T = bits(io.in, 13, 0) @[ArithmeticLogical.scala 25:20]
    node in2 = asSInt(_in2_T) @[ArithmeticLogical.scala 25:28]
    node _sub_T = sub(in1, in2) @[ArithmeticLogical.scala 26:19]
    node _sub_T_1 = tail(_sub_T, 1) @[ArithmeticLogical.scala 26:19]
    node sub = asSInt(_sub_T_1) @[ArithmeticLogical.scala 26:19]
    node _io_out_T = asUInt(sub) @[ArithmeticLogical.scala 27:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 27:12]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<26>}
    
    node _io_out_T = bits(io.in, 12, 12) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<13>("h01fff"), UInt<13>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<28>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<6>}
    
    node IN1 = bits(io.in, 15, 10) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 9, 4) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module ShiftRegister_1 : 
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
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<10>}
    
    node IN1 = bits(io.in, 25, 16) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 15, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    node in1 = bits(io.in, 9, 5) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 4, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_2_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_2_6.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_2_6.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst Mul_001 of Mul @[RandomHardware_2_6.scala 16:26]
    Mul_001.clock <= clock
    Mul_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_6.scala 18:33]
    io.out <= Mul_001.io.out @[RandomHardware_2_6.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_6.scala 21:18]
    Mul_001.io.in <= wire_000 @[RandomHardware_2_6.scala 22:25]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<52>, out : UInt<33>}
    
    wire wire_000 : UInt<28> @[RandomHardware_1_4.scala 13:24]
    wire wire_001 : UInt<7> @[RandomHardware_1_4.scala 14:24]
    wire wire_002 : UInt<26> @[RandomHardware_1_4.scala 15:24]
    wire wire_003 : UInt<6> @[RandomHardware_1_4.scala 16:24]
    wire wire_004 : UInt<15> @[RandomHardware_1_4.scala 17:24]
    wire wire_005 : UInt<8> @[RandomHardware_1_4.scala 18:24]
    inst Sub_000 of Sub @[RandomHardware_1_4.scala 20:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble @[RandomHardware_1_4.scala 21:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ShiftLeft_002 of ShiftLeft_1 @[RandomHardware_1_4.scala 22:34]
    ShiftLeft_002.clock <= clock
    ShiftLeft_002.reset <= reset
    inst Accum_003 of Accum @[RandomHardware_1_4.scala 23:34]
    Accum_003.clock <= clock
    Accum_003.reset <= reset
    inst ReduceAndMux_004 of ReduceAndMux @[RandomHardware_1_4.scala 24:34]
    ReduceAndMux_004.clock <= clock
    ReduceAndMux_004.reset <= reset
    inst ShiftRegister_005 of ShiftRegister_1 @[RandomHardware_1_4.scala 25:42]
    ShiftRegister_005.clock <= clock
    ShiftRegister_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_2_6 @[RandomHardware_1_4.scala 26:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    node _ShiftLeft_002_io_in_T = bits(io.in, 23, 0) @[RandomHardware_1_4.scala 28:33]
    ShiftLeft_002.io.in <= _ShiftLeft_002_io_in_T @[RandomHardware_1_4.scala 28:25]
    node _ReduceAndMux_004_io_in_T = bits(io.in, 19, 0) @[RandomHardware_1_4.scala 29:41]
    ReduceAndMux_004.io.in <= _ReduceAndMux_004_io_in_T @[RandomHardware_1_4.scala 29:33]
    node _ShiftRegister_005_io_in_T = bits(io.in, 7, 0) @[RandomHardware_1_4.scala 30:41]
    ShiftRegister_005.io.in <= _ShiftRegister_005_io_in_T @[RandomHardware_1_4.scala 30:33]
    node _io_out_T = cat(Accum_003.io.out, RandomHardware_006.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_4.scala 31:10]
    Sub_000.io.in <= wire_000 @[RandomHardware_1_4.scala 33:25]
    node _wire_001_T = bits(Sub_000.io.out, 6, 0) @[RandomHardware_1_4.scala 34:36]
    wire_001 <= _wire_001_T @[RandomHardware_1_4.scala 34:18]
    wire_004 <= Sub_000.io.out @[RandomHardware_1_4.scala 35:18]
    node _SignExtendDouble_001_io_in_T = cat(wire_001, wire_003) @[Cat.scala 30:58]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_1_4.scala 36:33]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_1_4.scala 37:18]
    wire_000 <= ShiftLeft_002.io.out @[RandomHardware_1_4.scala 38:18]
    wire_003 <= ReduceAndMux_004.io.out @[RandomHardware_1_4.scala 39:18]
    wire_005 <= ShiftRegister_005.io.out @[RandomHardware_1_4.scala 40:18]
    node _Accum_003_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    Accum_003.io.in <= _Accum_003_io_in_T @[RandomHardware_1_4.scala 41:25]
    RandomHardware_006.io.in <= wire_002 @[RandomHardware_1_4.scala 42:33]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    inst ShiftRight_000 of ShiftRight_1 @[RandomHardware_2_0.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_5.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_5.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_5.scala 17:10]
    
  module ShiftLeft_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<13>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    inst ShiftRight_000 of ShiftRight_2 @[RandomHardware_2_0.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<38>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_7.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_7.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_7.scala 17:10]
    
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
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_8.scala 13:24]
    wire wire_001 : UInt<20> @[RandomHardware_1_8.scala 14:24]
    inst ShiftRegister_000 of ShiftRegister_2 @[RandomHardware_1_8.scala 16:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst ReduceOrMux_001 of ReduceOrMux_1 @[RandomHardware_1_8.scala 17:34]
    ReduceOrMux_001.clock <= clock
    ReduceOrMux_001.reset <= reset
    inst ShiftRegister_002 of ShiftRegister_3 @[RandomHardware_1_8.scala 18:42]
    ShiftRegister_002.clock <= clock
    ShiftRegister_002.reset <= reset
    ShiftRegister_002.io.in <= io.in @[RandomHardware_1_8.scala 20:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_1_8.scala 21:10]
    ReduceOrMux_001.io.in <= wire_001 @[RandomHardware_1_8.scala 23:33]
    wire_000 <= ReduceOrMux_001.io.out @[RandomHardware_1_8.scala 24:18]
    wire_001 <= ShiftRegister_002.io.out @[RandomHardware_1_8.scala 25:18]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware_1_8.scala 26:33]
    
  module ReduceOrMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<12>}
    
    node IN1 = bits(io.in, 29, 18) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 17, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRegister_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<18>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_9.scala 13:24]
    wire wire_001 : UInt<6> @[RandomHardware_1_9.scala 14:24]
    inst ReduceOrMux_000 of ReduceOrMux_2 @[RandomHardware_1_9.scala 16:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst Reg_001 of Reg @[RandomHardware_1_9.scala 17:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    inst ShiftRegister_002 of ShiftRegister_4 @[RandomHardware_1_9.scala 18:42]
    ShiftRegister_002.clock <= clock
    ShiftRegister_002.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_9.scala 20:33]
    node _io_out_T = cat(Reg_001.io.out, ShiftRegister_002.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_9.scala 21:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_1_9.scala 23:18]
    node _wire_001_T = bits(ReduceOrMux_000.io.out, 11, 6) @[RandomHardware_1_9.scala 24:44]
    wire_001 <= _wire_001_T @[RandomHardware_1_9.scala 24:18]
    Reg_001.io.in <= wire_000 @[RandomHardware_1_9.scala 25:25]
    ShiftRegister_002.io.in <= wire_001 @[RandomHardware_1_9.scala 26:33]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<10>}
    
    node _io_out_T = bits(io.in, 4, 4) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<5>("h01f"), UInt<5>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<20>}
    
    node _io_out_T = bits(io.in, 9, 9) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<10>("h03ff"), UInt<10>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    node IN1 = bits(io.in, 19, 15) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 14, 10) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<10>}
    
    node _io_out_T = bits(io.in, 4, 4) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<5>("h01f"), UInt<5>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    wire wire_000 : UInt<5> @[RandomHardware_1_12.scala 13:24]
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_1_12.scala 15:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_3 @[RandomHardware_1_12.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_12.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_1_12.scala 19:10]
    wire_000 <= ReduceXorMux_000.io.out @[RandomHardware_1_12.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_1_12.scala 22:33]
    
  module RegE : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<23>}
    
    node data = bits(io.in, 23, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<22>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module ShiftRegister_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<23>}
    
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
    output io : {flip in : UInt<24>, out : UInt<23>}
    
    wire wire_000 : UInt<23> @[RandomHardware_1_13.scala 13:24]
    inst RegE_000 of RegE @[RandomHardware_1_13.scala 15:26]
    RegE_000.clock <= clock
    RegE_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_5 @[RandomHardware_1_13.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    RegE_000.io.in <= io.in @[RandomHardware_1_13.scala 18:25]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_13.scala 19:10]
    wire_000 <= RegE_000.io.out @[RandomHardware_1_13.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_13.scala 22:33]
    
  module ShiftLeft_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<9>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftRight_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mux2_1 : 
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
    
  module ShiftRegister_6 : 
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
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_16.scala 13:24]
    inst Mux2_000 of Mux2_1 @[RandomHardware_1_16.scala 15:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_6 @[RandomHardware_1_16.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_16.scala 18:25]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_16.scala 19:10]
    wire_000 <= Mux2_000.io.out @[RandomHardware_1_16.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_16.scala 22:33]
    
  module ReduceAndMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<44>, out : UInt<21>}
    
    node IN1 = bits(io.in, 42, 22) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 21, 1) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 0, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module ShiftRight_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<21>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<44>, out : UInt<21>}
    
    wire wire_000 : UInt<21> @[RandomHardware_1_17.scala 13:24]
    inst ReduceAndMux_000 of ReduceAndMux_1 @[RandomHardware_1_17.scala 15:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    inst ShiftRight_001 of ShiftRight_4 @[RandomHardware_1_17.scala 16:34]
    ShiftRight_001.clock <= clock
    ShiftRight_001.reset <= reset
    ReduceAndMux_000.io.in <= io.in @[RandomHardware_1_17.scala 18:33]
    io.out <= ShiftRight_001.io.out @[RandomHardware_1_17.scala 19:10]
    wire_000 <= ReduceAndMux_000.io.out @[RandomHardware_1_17.scala 21:18]
    ShiftRight_001.io.in <= wire_000 @[RandomHardware_1_17.scala 22:25]
    
  module ShiftRight_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    inst ShiftRight_000 of ShiftRight_5 @[RandomHardware_2_0.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_0.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<29>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_18.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_18.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_18.scala 17:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRight_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    node _io_out_T = shr(io.in, 1) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Mux8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    node sel = bits(io.in, 18, 16) @[Muxes.scala 44:18]
    node in7 = bits(io.in, 15, 6) @[Muxes.scala 45:18]
    node in6 = bits(io.in, 13, 4) @[Muxes.scala 46:18]
    node in5 = bits(io.in, 11, 10) @[Muxes.scala 47:18]
    node in4 = bits(io.in, 9, 8) @[Muxes.scala 48:18]
    node in3 = bits(io.in, 7, 6) @[Muxes.scala 49:18]
    node in2 = bits(io.in, 5, 4) @[Muxes.scala 50:18]
    node in1 = bits(io.in, 3, 2) @[Muxes.scala 51:18]
    node in0 = bits(io.in, 1, 0) @[Muxes.scala 52:18]
    node _T = eq(sel, UInt<3>("h07")) @[Muxes.scala 53:17]
    when _T : @[Muxes.scala 53:32]
      io.out <= in7 @[Muxes.scala 53:41]
      skip @[Muxes.scala 53:32]
    else : @[Muxes.scala 54:32]
      node _T_1 = eq(sel, UInt<3>("h06")) @[Muxes.scala 54:17]
      when _T_1 : @[Muxes.scala 54:32]
        io.out <= in6 @[Muxes.scala 54:41]
        skip @[Muxes.scala 54:32]
      else : @[Muxes.scala 55:32]
        node _T_2 = eq(sel, UInt<3>("h05")) @[Muxes.scala 55:17]
        when _T_2 : @[Muxes.scala 55:32]
          io.out <= in5 @[Muxes.scala 55:41]
          skip @[Muxes.scala 55:32]
        else : @[Muxes.scala 56:32]
          node _T_3 = eq(sel, UInt<3>("h04")) @[Muxes.scala 56:17]
          when _T_3 : @[Muxes.scala 56:32]
            io.out <= in4 @[Muxes.scala 56:41]
            skip @[Muxes.scala 56:32]
          else : @[Muxes.scala 57:32]
            node _T_4 = eq(sel, UInt<2>("h03")) @[Muxes.scala 57:17]
            when _T_4 : @[Muxes.scala 57:32]
              io.out <= in3 @[Muxes.scala 57:41]
              skip @[Muxes.scala 57:32]
            else : @[Muxes.scala 58:32]
              node _T_5 = eq(sel, UInt<2>("h02")) @[Muxes.scala 58:17]
              when _T_5 : @[Muxes.scala 58:32]
                io.out <= in2 @[Muxes.scala 58:41]
                skip @[Muxes.scala 58:32]
              else : @[Muxes.scala 59:32]
                node _T_6 = eq(sel, UInt<1>("h01")) @[Muxes.scala 59:17]
                when _T_6 : @[Muxes.scala 59:32]
                  io.out <= in1 @[Muxes.scala 59:41]
                  skip @[Muxes.scala 59:32]
                else : @[Muxes.scala 60:27]
                  io.out <= in0 @[Muxes.scala 60:36]
                  skip @[Muxes.scala 60:27]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<19>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftLeft_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<2>, out : UInt<3>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceAndMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<44>, out : UInt<19>}
    
    node IN1 = bits(io.in, 40, 22) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 21, 3) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 2, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<44>, out : UInt<22>}
    
    wire wire_000 : UInt<2> @[RandomHardware_1_21.scala 13:24]
    wire wire_001 : UInt<19> @[RandomHardware_1_21.scala 14:24]
    wire wire_002 : UInt<19> @[RandomHardware_1_21.scala 15:24]
    inst Mux8_000 of Mux8 @[RandomHardware_1_21.scala 17:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    inst Accum_001 of Accum_1 @[RandomHardware_1_21.scala 18:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst ShiftLeft_002 of ShiftLeft_4 @[RandomHardware_1_21.scala 19:34]
    ShiftLeft_002.clock <= clock
    ShiftLeft_002.reset <= reset
    inst ReduceAndMux_003 of ReduceAndMux_2 @[RandomHardware_1_21.scala 20:34]
    ReduceAndMux_003.clock <= clock
    ReduceAndMux_003.reset <= reset
    ReduceAndMux_003.io.in <= io.in @[RandomHardware_1_21.scala 22:33]
    node _io_out_T = cat(Accum_001.io.out, ShiftLeft_002.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_21.scala 23:10]
    Mux8_000.io.in <= wire_001 @[RandomHardware_1_21.scala 25:25]
    wire_000 <= Mux8_000.io.out @[RandomHardware_1_21.scala 26:18]
    wire_001 <= ReduceAndMux_003.io.out @[RandomHardware_1_21.scala 27:18]
    wire_002 <= ReduceAndMux_003.io.out @[RandomHardware_1_21.scala 28:18]
    Accum_001.io.in <= wire_002 @[RandomHardware_1_21.scala 29:25]
    ShiftLeft_002.io.in <= wire_000 @[RandomHardware_1_21.scala 30:25]
    
  module ShiftRegister_7 : 
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
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<4>}
    
    inst Mux4_000 of Mux4 @[RandomHardware_1_23.scala 14:26]
    Mux4_000.clock <= clock
    Mux4_000.reset <= reset
    Mux4_000.io.in <= io.in @[RandomHardware_1_23.scala 16:25]
    io.out <= Mux4_000.io.out @[RandomHardware_1_23.scala 17:10]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<10>}
    
    node IN1 = bits(io.in, 23, 14) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 13, 4) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_24 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<10>}
    
    inst ReduceXorMux_000 of ReduceXorMux_1 @[RandomHardware_1_24.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_24.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_24.scala 17:10]
    
  module ShiftRegister_8 : 
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
    
  module ShiftLeft_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<38>}
    
    node _io_out_T = shl(io.in, 5) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<33>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_26 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<33>, out : UInt<38>}
    
    wire wire_000 : UInt<33> @[RandomHardware_1_26.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft_5 @[RandomHardware_1_26.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst Accum_001 of Accum_2 @[RandomHardware_1_26.scala 16:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    Accum_001.io.in <= io.in @[RandomHardware_1_26.scala 18:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_26.scala 19:10]
    wire_000 <= Accum_001.io.out @[RandomHardware_1_26.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_26.scala 22:25]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<81>}
    
    wire wire_000 : UInt<15> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<4> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<5> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<29> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<10> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<5> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<29> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<5> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<20> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<38> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<38> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<5> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<19> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<38> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<13> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<7> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<10> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<10> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<10> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<5> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<10> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<10> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<10> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<5> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<10> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<21> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<16> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<23> @[RandomHardware.scala 40:24]
    wire wire_028 : UInt<5> @[RandomHardware.scala 41:24]
    wire wire_029 : UInt<11> @[RandomHardware.scala 42:24]
    wire wire_030 : UInt<18> @[RandomHardware.scala 43:24]
    wire wire_031 : UInt<9> @[RandomHardware.scala 44:24]
    wire wire_032 : UInt<9> @[RandomHardware.scala 45:24]
    wire wire_033 : UInt<23> @[RandomHardware.scala 46:24]
    wire wire_034 : UInt<21> @[RandomHardware.scala 47:24]
    wire wire_035 : UInt<10> @[RandomHardware.scala 48:24]
    wire wire_036 : UInt<18> @[RandomHardware.scala 49:24]
    wire wire_037 : UInt<5> @[RandomHardware.scala 50:24]
    wire wire_038 : UInt<5> @[RandomHardware.scala 51:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 53:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 54:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst ShiftRight_002 of ShiftRight @[RandomHardware.scala 55:34]
    ShiftRight_002.clock <= clock
    ShiftRight_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 56:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 57:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_1_5 @[RandomHardware.scala 58:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst ShiftLeft_006 of ShiftLeft_2 @[RandomHardware.scala 59:34]
    ShiftLeft_006.clock <= clock
    ShiftLeft_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 60:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 61:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 62:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst SignExtendDouble_010 of SignExtendDouble_1 @[RandomHardware.scala 63:42]
    SignExtendDouble_010.clock <= clock
    SignExtendDouble_010.reset <= reset
    inst SignExtendDouble_011 of SignExtendDouble_2 @[RandomHardware.scala 64:42]
    SignExtendDouble_011.clock <= clock
    SignExtendDouble_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 65:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 66:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst ShiftLeft_014 of ShiftLeft_3 @[RandomHardware.scala 67:34]
    ShiftLeft_014.clock <= clock
    ShiftLeft_014.reset <= reset
    inst ShiftRight_015 of ShiftRight_3 @[RandomHardware.scala 68:34]
    ShiftRight_015.clock <= clock
    ShiftRight_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 69:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 70:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 71:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst Reg_019 of Reg_1 @[RandomHardware.scala 72:26]
    Reg_019.clock <= clock
    Reg_019.reset <= reset
    inst ShiftRight_020 of ShiftRight_6 @[RandomHardware.scala 73:34]
    ShiftRight_020.clock <= clock
    ShiftRight_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 74:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst ShiftRegister_022 of ShiftRegister_7 @[RandomHardware.scala 75:42]
    ShiftRegister_022.clock <= clock
    ShiftRegister_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 76:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    inst RandomHardware_024 of RandomHardware_1_24 @[RandomHardware.scala 77:42]
    RandomHardware_024.clock <= clock
    RandomHardware_024.reset <= reset
    inst ShiftRegister_025 of ShiftRegister_8 @[RandomHardware.scala 78:42]
    ShiftRegister_025.clock <= clock
    ShiftRegister_025.reset <= reset
    inst RandomHardware_026 of RandomHardware_1_26 @[RandomHardware.scala 79:42]
    RandomHardware_026.clock <= clock
    RandomHardware_026.reset <= reset
    node _RandomHardware_005_io_in_T = bits(io.in, 31, 0) @[RandomHardware.scala 81:41]
    RandomHardware_005.io.in <= _RandomHardware_005_io_in_T @[RandomHardware.scala 81:33]
    node _RandomHardware_012_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 82:41]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 82:33]
    node _RandomHardware_013_io_in_T = bits(io.in, 23, 0) @[RandomHardware.scala 83:41]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 83:33]
    node _RandomHardware_024_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 84:41]
    RandomHardware_024.io.in <= _RandomHardware_024_io_in_T @[RandomHardware.scala 84:33]
    node io_out_lo = cat(ShiftRight_020.io.out, RandomHardware_021.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(RandomHardware_004.io.out, RandomHardware_008.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, ShiftLeft_014.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 85:10]
    node RandomHardware_000_io_in_hi = cat(wire_000, wire_001) @[Cat.scala 30:58]
    node _RandomHardware_000_io_in_T = cat(RandomHardware_000_io_in_hi, wire_002) @[Cat.scala 30:58]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 87:33]
    wire_029 <= RandomHardware_000.io.out @[RandomHardware.scala 88:18]
    node _RandomHardware_001_io_in_T = cat(wire_003, wire_004) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 89:33]
    wire_012 <= RandomHardware_001.io.out @[RandomHardware.scala 90:18]
    node _wire_031_T = bits(RandomHardware_001.io.out, 8, 0) @[RandomHardware.scala 91:47]
    wire_031 <= _wire_031_T @[RandomHardware.scala 91:18]
    ShiftRight_002.io.in <= wire_005 @[RandomHardware.scala 92:25]
    wire_037 <= ShiftRight_002.io.out @[RandomHardware.scala 93:18]
    node _RandomHardware_003_io_in_T = cat(wire_006, wire_007) @[Cat.scala 30:58]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 94:33]
    wire_026 <= RandomHardware_003.io.out @[RandomHardware.scala 95:18]
    node _ShiftLeft_006_io_in_T = cat(wire_010, wire_011) @[Cat.scala 30:58]
    ShiftLeft_006.io.in <= _ShiftLeft_006_io_in_T @[RandomHardware.scala 96:25]
    wire_014 <= ShiftLeft_006.io.out @[RandomHardware.scala 97:18]
    RandomHardware_007.io.in <= wire_012 @[RandomHardware.scala 98:33]
    wire_010 <= RandomHardware_007.io.out @[RandomHardware.scala 99:18]
    wire_013 <= RandomHardware_007.io.out @[RandomHardware.scala 100:18]
    node RandomHardware_009_io_in_hi = cat(wire_016, wire_017) @[Cat.scala 30:58]
    node _RandomHardware_009_io_in_T = cat(RandomHardware_009_io_in_hi, wire_018) @[Cat.scala 30:58]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 101:33]
    wire_030 <= RandomHardware_009.io.out @[RandomHardware.scala 102:18]
    wire_036 <= RandomHardware_009.io.out @[RandomHardware.scala 103:18]
    SignExtendDouble_010.io.in <= wire_019 @[RandomHardware.scala 104:33]
    wire_016 <= SignExtendDouble_010.io.out @[RandomHardware.scala 105:18]
    wire_024 <= SignExtendDouble_010.io.out @[RandomHardware.scala 106:18]
    SignExtendDouble_011.io.in <= wire_021 @[RandomHardware.scala 107:33]
    wire_008 <= SignExtendDouble_011.io.out @[RandomHardware.scala 108:18]
    node _wire_020_T = bits(SignExtendDouble_011.io.out, 19, 10) @[RandomHardware.scala 109:49]
    wire_020 <= _wire_020_T @[RandomHardware.scala 109:18]
    ShiftRight_015.io.in <= wire_024 @[RandomHardware.scala 110:25]
    wire_018 <= ShiftRight_015.io.out @[RandomHardware.scala 111:18]
    RandomHardware_016.io.in <= wire_025 @[RandomHardware.scala 112:33]
    wire_021 <= RandomHardware_016.io.out @[RandomHardware.scala 113:18]
    node RandomHardware_017_io_in_hi = cat(wire_026, wire_027) @[Cat.scala 30:58]
    node _RandomHardware_017_io_in_T = cat(RandomHardware_017_io_in_hi, wire_028) @[Cat.scala 30:58]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 114:33]
    wire_025 <= RandomHardware_017.io.out @[RandomHardware.scala 115:18]
    wire_034 <= RandomHardware_017.io.out @[RandomHardware.scala 116:18]
    node _RandomHardware_018_io_in_T = cat(wire_029, wire_030) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 117:33]
    wire_003 <= RandomHardware_018.io.out @[RandomHardware.scala 118:18]
    wire_006 <= RandomHardware_018.io.out @[RandomHardware.scala 119:18]
    Reg_019.io.in <= wire_031 @[RandomHardware.scala 120:25]
    wire_032 <= Reg_019.io.out @[RandomHardware.scala 121:18]
    ShiftRegister_022.io.in <= wire_035 @[RandomHardware.scala 122:33]
    wire_004 <= ShiftRegister_022.io.out @[RandomHardware.scala 123:18]
    RandomHardware_023.io.in <= wire_036 @[RandomHardware.scala 124:33]
    wire_001 <= RandomHardware_023.io.out @[RandomHardware.scala 125:18]
    ShiftRegister_025.io.in <= wire_037 @[RandomHardware.scala 126:33]
    wire_002 <= ShiftRegister_025.io.out @[RandomHardware.scala 127:18]
    wire_007 <= ShiftRegister_025.io.out @[RandomHardware.scala 128:18]
    wire_028 <= ShiftRegister_025.io.out @[RandomHardware.scala 129:18]
    wire_038 <= ShiftRegister_025.io.out @[RandomHardware.scala 130:18]
    node RandomHardware_026_io_in_lo = cat(wire_022, wire_038) @[Cat.scala 30:58]
    node RandomHardware_026_io_in_hi = cat(wire_013, wire_020) @[Cat.scala 30:58]
    node _RandomHardware_026_io_in_T = cat(RandomHardware_026_io_in_hi, RandomHardware_026_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_026.io.in <= _RandomHardware_026_io_in_T @[RandomHardware.scala 131:33]
    wire_009 <= RandomHardware_026.io.out @[RandomHardware.scala 132:18]
    wire_000 <= RandomHardware_005.io.out @[RandomHardware.scala 133:18]
    node _wire_019_T = bits(RandomHardware_005.io.out, 11, 7) @[RandomHardware.scala 134:47]
    wire_019 <= _wire_019_T @[RandomHardware.scala 134:18]
    node _wire_023_T = bits(RandomHardware_005.io.out, 11, 7) @[RandomHardware.scala 135:47]
    wire_023 <= _wire_023_T @[RandomHardware.scala 135:18]
    wire_017 <= RandomHardware_012.io.out @[RandomHardware.scala 136:18]
    wire_035 <= RandomHardware_012.io.out @[RandomHardware.scala 137:18]
    wire_022 <= RandomHardware_012.io.out @[RandomHardware.scala 138:18]
    node _wire_015_T = bits(RandomHardware_013.io.out, 17, 11) @[RandomHardware.scala 139:47]
    wire_015 <= _wire_015_T @[RandomHardware.scala 139:18]
    wire_027 <= RandomHardware_013.io.out @[RandomHardware.scala 140:18]
    wire_033 <= RandomHardware_013.io.out @[RandomHardware.scala 141:18]
    node _wire_005_T = bits(RandomHardware_024.io.out, 4, 0) @[RandomHardware.scala 142:47]
    wire_005 <= _wire_005_T @[RandomHardware.scala 142:18]
    node _lo_T = bits(RandomHardware_024.io.out, 9, 5) @[RandomHardware.scala 143:47]
    wire_011 <= _lo_T @[RandomHardware.scala 143:18]
    node _RandomHardware_004_io_in_T = cat(wire_008, wire_009) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 144:33]
    node _RandomHardware_008_io_in_T = cat(wire_014, wire_015) @[Cat.scala 30:58]
    RandomHardware_008.io.in <= _RandomHardware_008_io_in_T @[RandomHardware.scala 145:33]
    ShiftLeft_014.io.in <= wire_023 @[RandomHardware.scala 146:25]
    ShiftRight_020.io.in <= wire_032 @[RandomHardware.scala 147:25]
    node _RandomHardware_021_io_in_T = cat(wire_033, wire_034) @[Cat.scala 30:58]
    RandomHardware_021.io.in <= _RandomHardware_021_io_in_T @[RandomHardware.scala 148:33]
    
