;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<7>}
    
    node IN1 = bits(io.in, 15, 8) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 8, 2) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 1, 1) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 0, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<7>}
    
    inst CompareMux_000 of CompareMux @[RandomHardware_1_0.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_0.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Accum_000 of Accum @[RandomHardware_1_1.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_1.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<36>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_3_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware_3_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_3_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_3_2.scala 17:10]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<36>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_0.scala 13:24]
    wire wire_001 : UInt<24> @[RandomHardware_2_0.scala 14:24]
    inst Reg_000 of Reg @[RandomHardware_2_0.scala 16:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst Accum_001 of Accum_1 @[RandomHardware_2_0.scala 17:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_3_2 @[RandomHardware_2_0.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    node _Accum_001_io_in_T = bits(io.in, 31, 20) @[RandomHardware_2_0.scala 20:33]
    Accum_001.io.in <= _Accum_001_io_in_T @[RandomHardware_2_0.scala 20:25]
    node _RandomHardware_002_io_in_T = bits(io.in, 31, 12) @[RandomHardware_2_0.scala 21:41]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware_2_0.scala 21:33]
    io.out <= Reg_000.io.out @[RandomHardware_2_0.scala 22:10]
    wire_000 <= Accum_001.io.out @[RandomHardware_2_0.scala 24:18]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_2_0.scala 25:18]
    node _Reg_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Reg_000.io.in <= _Reg_000_io_in_T @[RandomHardware_2_0.scala 26:25]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    node _io_out_T = shr(io.in, 1) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module ShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_3_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRegister_000 of ShiftRegister_2 @[RandomHardware_3_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_3_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_3_2.scala 17:10]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    node in1 = bits(io.in, 29, 15) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 14, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_3_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    inst Mul_000 of Mul @[RandomHardware_3_3.scala 14:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    Mul_000.io.in <= io.in @[RandomHardware_3_3.scala 16:25]
    io.out <= Mul_000.io.out @[RandomHardware_3_3.scala 17:10]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module CompareMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    node IN1 = bits(io.in, 29, 15) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 16, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_4_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    inst CompareMux_000 of CompareMux_1 @[RandomHardware_4_1.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_4_1.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_4_1.scala 17:10]
    
  module RandomHardware_3_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    wire wire_000 : UInt<13> @[RandomHardware_3_4.scala 13:24]
    inst Accum_000 of Accum_2 @[RandomHardware_3_4.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_4_1 @[RandomHardware_3_4.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_3_4.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_4.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_3_4.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_3_4.scala 22:25]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<26>}
    
    wire wire_000 : UInt<13> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<13> @[RandomHardware_2_1.scala 14:24]
    wire wire_002 : UInt<13> @[RandomHardware_2_1.scala 15:24]
    wire wire_003 : UInt<30> @[RandomHardware_2_1.scala 16:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_2_1.scala 18:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_1 @[RandomHardware_2_1.scala 19:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_3_2_1 @[RandomHardware_2_1.scala 20:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_3_3 @[RandomHardware_2_1.scala 21:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_3_4 @[RandomHardware_2_1.scala 22:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    RandomHardware_003.io.in <= io.in @[RandomHardware_2_1.scala 24:33]
    node _io_out_T = cat(ShiftRight_000.io.out, RandomHardware_002.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_2_1.scala 25:10]
    ShiftRegister_001.io.in <= wire_001 @[RandomHardware_2_1.scala 27:33]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 28:18]
    wire_002 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 29:18]
    RandomHardware_004.io.in <= wire_003 @[RandomHardware_2_1.scala 30:33]
    wire_001 <= RandomHardware_004.io.out @[RandomHardware_2_1.scala 31:18]
    wire_003 <= RandomHardware_003.io.out @[RandomHardware_2_1.scala 32:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_2_1.scala 33:25]
    RandomHardware_002.io.in <= wire_002 @[RandomHardware_2_1.scala 34:33]
    
  module Mux4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<58>, out : UInt<14>}
    
    node sel = bits(io.in, 57, 56) @[Muxes.scala 28:18]
    node in3 = bits(io.in, 55, 42) @[Muxes.scala 29:18]
    node in2 = bits(io.in, 41, 28) @[Muxes.scala 30:18]
    node in1 = bits(io.in, 27, 14) @[Muxes.scala 31:18]
    node in0 = bits(io.in, 13, 0) @[Muxes.scala 32:18]
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
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<29>, out : UInt<58>}
    
    node _io_out_T = bits(io.in, 28, 28) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<29>("h01fffffff"), UInt<29>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<61>, out : UInt<31>}
    
    wire wire_000 : UInt<34> @[RandomHardware_1_2.scala 13:24]
    wire wire_001 : UInt<14> @[RandomHardware_1_2.scala 14:24]
    wire wire_002 : UInt<29> @[RandomHardware_1_2.scala 15:24]
    wire wire_003 : UInt<58> @[RandomHardware_1_2.scala 16:24]
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_2.scala 18:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_2.scala 19:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst Mux4_002 of Mux4 @[RandomHardware_1_2.scala 20:26]
    Mux4_002.clock <= clock
    Mux4_002.reset <= reset
    inst SignExtendDouble_003 of SignExtendDouble @[RandomHardware_1_2.scala 21:42]
    SignExtendDouble_003.clock <= clock
    SignExtendDouble_003.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 60, 29) @[RandomHardware_1_2.scala 23:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware_1_2.scala 23:33]
    node _SignExtendDouble_003_io_in_T = bits(io.in, 28, 0) @[RandomHardware_1_2.scala 24:41]
    SignExtendDouble_003.io.in <= _SignExtendDouble_003_io_in_T @[RandomHardware_1_2.scala 24:33]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_2.scala 25:10]
    Mux4_002.io.in <= wire_003 @[RandomHardware_1_2.scala 27:25]
    wire_001 <= Mux4_002.io.out @[RandomHardware_1_2.scala 28:18]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_2.scala 29:18]
    node _wire_002_T = bits(SignExtendDouble_003.io.out, 57, 29) @[RandomHardware_1_2.scala 30:49]
    wire_002 <= _wire_002_T @[RandomHardware_1_2.scala 30:18]
    wire_003 <= SignExtendDouble_003.io.out @[RandomHardware_1_2.scala 31:18]
    node RandomHardware_001_io_in_hi = cat(wire_000, wire_001) @[Cat.scala 30:58]
    node _RandomHardware_001_io_in_T = cat(RandomHardware_001_io_in_hi, wire_002) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware_1_2.scala 32:33]
    
  module CompareMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<14>}
    
    node IN1 = bits(io.in, 33, 17) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 19, 6) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 5, 3) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 2, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<17>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<17>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_3.scala 13:24]
    inst CompareMux_000 of CompareMux_2 @[RandomHardware_1_3.scala 15:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft @[RandomHardware_1_3.scala 16:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_3.scala 18:25]
    io.out <= ShiftLeft_001.io.out @[RandomHardware_1_3.scala 19:10]
    wire_000 <= CompareMux_000.io.out @[RandomHardware_1_3.scala 21:18]
    ShiftLeft_001.io.in <= wire_000 @[RandomHardware_1_3.scala 22:25]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<30>}
    
    node _io_out_T = bits(io.in, 14, 14) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<15>("h07fff"), UInt<15>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<30>}
    
    inst SignExtendDouble_000 of SignExtendDouble_1 @[RandomHardware_1_4.scala 14:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    SignExtendDouble_000.io.in <= io.in @[RandomHardware_1_4.scala 16:33]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_1_4.scala 17:10]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<14>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<14>}
    
    inst ShiftLeft_000 of ShiftLeft_1 @[RandomHardware_1_5.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_5.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_5.scala 17:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    inst Reg_000 of Reg_1 @[RandomHardware_1_6.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_6.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_6.scala 17:10]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<8>}
    
    node _io_out_T = bits(io.in, 3, 3) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<4>("h0f"), UInt<4>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<12>}
    
    node in1 = bits(io.in, 23, 12) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 11, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module ShiftLeft_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<16>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<16>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_11.scala 13:24]
    inst And_000 of And @[RandomHardware_1_11.scala 15:26]
    And_000.clock <= clock
    And_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft_2 @[RandomHardware_1_11.scala 16:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    And_000.io.in <= io.in @[RandomHardware_1_11.scala 18:25]
    io.out <= ShiftLeft_001.io.out @[RandomHardware_1_11.scala 19:10]
    wire_000 <= And_000.io.out @[RandomHardware_1_11.scala 21:18]
    ShiftLeft_001.io.in <= wire_000 @[RandomHardware_1_11.scala 22:25]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Reg_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<36>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module Accum_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_3_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRegister_000 of ShiftRegister_3 @[RandomHardware_3_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_3_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_3_2.scala 17:10]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<36>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_0.scala 13:24]
    wire wire_001 : UInt<24> @[RandomHardware_2_0.scala 14:24]
    inst Reg_000 of Reg_3 @[RandomHardware_2_0.scala 16:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst Accum_001 of Accum_4 @[RandomHardware_2_0.scala 17:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_3_2_2 @[RandomHardware_2_0.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    node _Accum_001_io_in_T = bits(io.in, 31, 20) @[RandomHardware_2_0.scala 20:33]
    Accum_001.io.in <= _Accum_001_io_in_T @[RandomHardware_2_0.scala 20:25]
    node _RandomHardware_002_io_in_T = bits(io.in, 31, 12) @[RandomHardware_2_0.scala 21:41]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware_2_0.scala 21:33]
    io.out <= Reg_000.io.out @[RandomHardware_2_0.scala 22:10]
    wire_000 <= Accum_001.io.out @[RandomHardware_2_0.scala 24:18]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_2_0.scala 25:18]
    node _Reg_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Reg_000.io.in <= _Reg_000_io_in_T @[RandomHardware_2_0.scala 26:25]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_13.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_13.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module ShiftRegister_4 : 
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
    
  module Reg_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<36>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRegister_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_3_2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRegister_000 of ShiftRegister_5 @[RandomHardware_3_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_3_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_3_2.scala 17:10]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<36>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_0.scala 13:24]
    wire wire_001 : UInt<24> @[RandomHardware_2_0.scala 14:24]
    inst Reg_000 of Reg_4 @[RandomHardware_2_0.scala 16:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst Accum_001 of Accum_5 @[RandomHardware_2_0.scala 17:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_3_2_3 @[RandomHardware_2_0.scala 18:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    node _Accum_001_io_in_T = bits(io.in, 31, 20) @[RandomHardware_2_0.scala 20:33]
    Accum_001.io.in <= _Accum_001_io_in_T @[RandomHardware_2_0.scala 20:25]
    node _RandomHardware_002_io_in_T = bits(io.in, 31, 12) @[RandomHardware_2_0.scala 21:41]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware_2_0.scala 21:33]
    io.out <= Reg_000.io.out @[RandomHardware_2_0.scala 22:10]
    wire_000 <= Accum_001.io.out @[RandomHardware_2_0.scala 24:18]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_2_0.scala 25:18]
    node _Reg_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Reg_000.io.in <= _Reg_000_io_in_T @[RandomHardware_2_0.scala 26:25]
    
  module ShiftRegister_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<36>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<36>}
    
    wire wire_000 : UInt<36> @[RandomHardware_1_15.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_15.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_6 @[RandomHardware_1_15.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_15.scala 18:33]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_15.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_15.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_15.scala 22:33]
    
  module ShiftLeft_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<12>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftRegister_7 : 
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
    
  module Accum_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module CompareMux_3 : 
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
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<5>}
    
    wire wire_000 : UInt<5> @[RandomHardware_1_19.scala 13:24]
    inst CompareMux_000 of CompareMux_3 @[RandomHardware_1_19.scala 15:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_8 @[RandomHardware_1_19.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_19.scala 18:25]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_19.scala 19:10]
    wire_000 <= CompareMux_000.io.out @[RandomHardware_1_19.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_19.scala 22:33]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<20>}
    
    node _io_out_T = bits(io.in, 9, 9) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<10>("h03ff"), UInt<10>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<10>}
    
    node IN1 = bits(io.in, 23, 14) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 13, 4) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module Accum_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_21.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_21.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst Accum_001 of Accum_7 @[RandomHardware_1_21.scala 16:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_21.scala 18:33]
    io.out <= Accum_001.io.out @[RandomHardware_1_21.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_1_21.scala 21:18]
    Accum_001.io.in <= wire_000 @[RandomHardware_1_21.scala 22:25]
    
  module ShiftRight_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 1) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<7>}
    
    node IN1 = bits(io.in, 21, 15) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 14, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftLeft_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<11>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<11>}
    
    wire wire_000 : UInt<7> @[RandomHardware_1_23.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_1_23.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft_4 @[RandomHardware_1_23.scala 16:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_23.scala 18:33]
    io.out <= ShiftLeft_001.io.out @[RandomHardware_1_23.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_1_23.scala 21:18]
    ShiftLeft_001.io.in <= wire_000 @[RandomHardware_1_23.scala 22:25]
    
  module Accum_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Reg_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<11>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<5>}
    
    node IN1 = bits(io.in, 12, 8) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 7, 3) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 2, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module Mux4_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<6>}
    
    node sel = bits(io.in, 25, 24) @[Muxes.scala 28:18]
    node in3 = bits(io.in, 23, 18) @[Muxes.scala 29:18]
    node in2 = bits(io.in, 17, 12) @[Muxes.scala 30:18]
    node in1 = bits(io.in, 11, 6) @[Muxes.scala 31:18]
    node in0 = bits(io.in, 5, 0) @[Muxes.scala 32:18]
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
    
  module RandomHardware_1_24 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<42>, out : UInt<16>}
    
    wire wire_000 : UInt<5> @[RandomHardware_1_24.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware_1_24.scala 14:24]
    wire wire_002 : UInt<6> @[RandomHardware_1_24.scala 15:24]
    inst Accum_000 of Accum_8 @[RandomHardware_1_24.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst Reg_001 of Reg_5 @[RandomHardware_1_24.scala 18:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    inst ReduceAndMux_002 of ReduceAndMux @[RandomHardware_1_24.scala 19:34]
    ReduceAndMux_002.clock <= clock
    ReduceAndMux_002.reset <= reset
    inst Mux4_003 of Mux4_1 @[RandomHardware_1_24.scala 20:26]
    Mux4_003.clock <= clock
    Mux4_003.reset <= reset
    node _ReduceAndMux_002_io_in_T = bits(io.in, 15, 0) @[RandomHardware_1_24.scala 22:41]
    ReduceAndMux_002.io.in <= _ReduceAndMux_002_io_in_T @[RandomHardware_1_24.scala 22:33]
    node _Mux4_003_io_in_T = bits(io.in, 25, 0) @[RandomHardware_1_24.scala 23:33]
    Mux4_003.io.in <= _Mux4_003_io_in_T @[RandomHardware_1_24.scala 23:25]
    node _io_out_T = cat(Accum_000.io.out, Reg_001.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_24.scala 24:10]
    wire_000 <= ReduceAndMux_002.io.out @[RandomHardware_1_24.scala 26:18]
    wire_001 <= ReduceAndMux_002.io.out @[RandomHardware_1_24.scala 27:18]
    wire_002 <= Mux4_003.io.out @[RandomHardware_1_24.scala 28:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_1_24.scala 29:25]
    node _Reg_001_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    Reg_001.io.in <= _Reg_001_io_in_T @[RandomHardware_1_24.scala 30:25]
    
  module ShiftLeft_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<11>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Mod : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<13>}
    
    node in1 = bits(io.in, 25, 13) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 12, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module ShiftRight_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    node _io_out_T = shr(io.in, 1) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ShiftRegister_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module ShiftRegister_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_3_2_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    inst ShiftRegister_000 of ShiftRegister_10 @[RandomHardware_3_2.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_3_2.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_3_2.scala 17:10]
    
  module Mul_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    node in1 = bits(io.in, 29, 15) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 14, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_3_3_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    inst Mul_000 of Mul_1 @[RandomHardware_3_3.scala 14:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    Mul_000.io.in <= io.in @[RandomHardware_3_3.scala 16:25]
    io.out <= Mul_000.io.out @[RandomHardware_3_3.scala 17:10]
    
  module Accum_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<13>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module CompareMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    node IN1 = bits(io.in, 29, 15) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 16, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_4_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    inst CompareMux_000 of CompareMux_4 @[RandomHardware_4_1.scala 14:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_4_1.scala 16:25]
    io.out <= CompareMux_000.io.out @[RandomHardware_4_1.scala 17:10]
    
  module RandomHardware_3_4_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    wire wire_000 : UInt<13> @[RandomHardware_3_4.scala 13:24]
    inst Accum_000 of Accum_9 @[RandomHardware_3_4.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_4_1_1 @[RandomHardware_3_4.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_3_4.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_4.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_3_4.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_3_4.scala 22:25]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<26>}
    
    wire wire_000 : UInt<13> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<13> @[RandomHardware_2_1.scala 14:24]
    wire wire_002 : UInt<13> @[RandomHardware_2_1.scala 15:24]
    wire wire_003 : UInt<30> @[RandomHardware_2_1.scala 16:24]
    inst ShiftRight_000 of ShiftRight_4 @[RandomHardware_2_1.scala 18:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_9 @[RandomHardware_2_1.scala 19:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_3_2_4 @[RandomHardware_2_1.scala 20:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_3_3_1 @[RandomHardware_2_1.scala 21:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_3_4_1 @[RandomHardware_2_1.scala 22:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    RandomHardware_003.io.in <= io.in @[RandomHardware_2_1.scala 24:33]
    node _io_out_T = cat(ShiftRight_000.io.out, RandomHardware_002.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_2_1.scala 25:10]
    ShiftRegister_001.io.in <= wire_001 @[RandomHardware_2_1.scala 27:33]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 28:18]
    wire_002 <= ShiftRegister_001.io.out @[RandomHardware_2_1.scala 29:18]
    RandomHardware_004.io.in <= wire_003 @[RandomHardware_2_1.scala 30:33]
    wire_001 <= RandomHardware_004.io.out @[RandomHardware_2_1.scala 31:18]
    wire_003 <= RandomHardware_003.io.out @[RandomHardware_2_1.scala 32:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_2_1.scala 33:25]
    RandomHardware_002.io.in <= wire_002 @[RandomHardware_2_1.scala 34:33]
    
  module RandomHardware_1_26 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<13>}
    
    wire wire_000 : UInt<26> @[RandomHardware_1_26.scala 13:24]
    inst Mod_000 of Mod @[RandomHardware_1_26.scala 15:26]
    Mod_000.clock <= clock
    Mod_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_26.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_26.scala 18:33]
    io.out <= Mod_000.io.out @[RandomHardware_1_26.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_26.scala 21:18]
    Mod_000.io.in <= wire_000 @[RandomHardware_1_26.scala 22:25]
    
  module CompareMux_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<8>}
    
    node IN1 = bits(io.in, 21, 11) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 13, 6) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 5, 3) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 2, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module ShiftRegister_11 : 
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
    
  module RandomHardware_1_27 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_27.scala 13:24]
    inst CompareMux_000 of CompareMux_5 @[RandomHardware_1_27.scala 15:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_11 @[RandomHardware_1_27.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_27.scala 18:25]
    io.out <= ShiftRegister_001.io.out @[RandomHardware_1_27.scala 19:10]
    wire_000 <= CompareMux_000.io.out @[RandomHardware_1_27.scala 21:18]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_27.scala 22:33]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<60>}
    
    wire wire_000 : UInt<12> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<8> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<16> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<4> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<20> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<13> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<31> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<30> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<4> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<11> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<14> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<8> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<8> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<12> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<7> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<5> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<8> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<5> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<7> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<17> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<8> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<8> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<8> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<6> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<4> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<13> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<10> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<11> @[RandomHardware.scala 40:24]
    wire wire_028 : UInt<8> @[RandomHardware.scala 41:24]
    wire wire_029 : UInt<14> @[RandomHardware.scala 42:24]
    wire wire_030 : UInt<8> @[RandomHardware.scala 43:24]
    wire wire_031 : UInt<31> @[RandomHardware.scala 44:24]
    wire wire_032 : UInt<11> @[RandomHardware.scala 45:24]
    wire wire_033 : UInt<7> @[RandomHardware.scala 46:24]
    wire wire_034 : UInt<12> @[RandomHardware.scala 47:24]
    wire wire_035 : UInt<11> @[RandomHardware.scala 48:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 50:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 51:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 52:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 53:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 54:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_1_5 @[RandomHardware.scala 55:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 56:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst SignExtendDouble_007 of SignExtendDouble_2 @[RandomHardware.scala 57:42]
    SignExtendDouble_007.clock <= clock
    SignExtendDouble_007.reset <= reset
    inst Reg_008 of Reg_2 @[RandomHardware.scala 58:26]
    Reg_008.clock <= clock
    Reg_008.reset <= reset
    inst ShiftRight_009 of ShiftRight_1 @[RandomHardware.scala 59:34]
    ShiftRight_009.clock <= clock
    ShiftRight_009.reset <= reset
    inst Accum_010 of Accum_3 @[RandomHardware.scala 60:34]
    Accum_010.clock <= clock
    Accum_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 61:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst ShiftRight_012 of ShiftRight_2 @[RandomHardware.scala 62:34]
    ShiftRight_012.clock <= clock
    ShiftRight_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 63:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst ShiftRegister_014 of ShiftRegister_4 @[RandomHardware.scala 64:42]
    ShiftRegister_014.clock <= clock
    ShiftRegister_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 65:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst ShiftLeft_016 of ShiftLeft_3 @[RandomHardware.scala 66:34]
    ShiftLeft_016.clock <= clock
    ShiftLeft_016.reset <= reset
    inst ShiftRegister_017 of ShiftRegister_7 @[RandomHardware.scala 67:42]
    ShiftRegister_017.clock <= clock
    ShiftRegister_017.reset <= reset
    inst Accum_018 of Accum_6 @[RandomHardware.scala 68:34]
    Accum_018.clock <= clock
    Accum_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 69:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst SignExtendDouble_020 of SignExtendDouble_3 @[RandomHardware.scala 70:42]
    SignExtendDouble_020.clock <= clock
    SignExtendDouble_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 71:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst ShiftRight_022 of ShiftRight_3 @[RandomHardware.scala 72:34]
    ShiftRight_022.clock <= clock
    ShiftRight_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 73:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    inst RandomHardware_024 of RandomHardware_1_24 @[RandomHardware.scala 74:42]
    RandomHardware_024.clock <= clock
    RandomHardware_024.reset <= reset
    inst ShiftLeft_025 of ShiftLeft_5 @[RandomHardware.scala 75:34]
    ShiftLeft_025.clock <= clock
    ShiftLeft_025.reset <= reset
    inst RandomHardware_026 of RandomHardware_1_26 @[RandomHardware.scala 76:42]
    RandomHardware_026.clock <= clock
    RandomHardware_026.reset <= reset
    inst RandomHardware_027 of RandomHardware_1_27 @[RandomHardware.scala 77:42]
    RandomHardware_027.clock <= clock
    RandomHardware_027.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 99, 84) @[RandomHardware.scala 79:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 79:33]
    node _RandomHardware_001_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 80:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 80:33]
    node _RandomHardware_005_io_in_T = bits(io.in, 99, 88) @[RandomHardware.scala 81:41]
    RandomHardware_005.io.in <= _RandomHardware_005_io_in_T @[RandomHardware.scala 81:33]
    node _SignExtendDouble_007_io_in_T = bits(io.in, 3, 0) @[RandomHardware.scala 82:41]
    SignExtendDouble_007.io.in <= _SignExtendDouble_007_io_in_T @[RandomHardware.scala 82:33]
    node _Accum_010_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 83:33]
    Accum_010.io.in <= _Accum_010_io_in_T @[RandomHardware.scala 83:25]
    node _ShiftRight_012_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 84:33]
    ShiftRight_012.io.in <= _ShiftRight_012_io_in_T @[RandomHardware.scala 84:25]
    node _ShiftRegister_014_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 85:41]
    ShiftRegister_014.io.in <= _ShiftRegister_014_io_in_T @[RandomHardware.scala 85:33]
    node _ShiftRegister_017_io_in_T = bits(io.in, 99, 96) @[RandomHardware.scala 86:41]
    ShiftRegister_017.io.in <= _ShiftRegister_017_io_in_T @[RandomHardware.scala 86:33]
    node _RandomHardware_019_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 87:41]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 87:33]
    node _ShiftLeft_025_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 88:33]
    ShiftLeft_025.io.in <= _ShiftLeft_025_io_in_T @[RandomHardware.scala 88:25]
    node io_out_hi = cat(RandomHardware_015.io.out, Accum_018.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, RandomHardware_024.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 89:10]
    node RandomHardware_002_io_in_lo = cat(wire_004, wire_005) @[Cat.scala 30:58]
    node RandomHardware_002_io_in_hi_hi = cat(wire_001, wire_002) @[Cat.scala 30:58]
    node RandomHardware_002_io_in_hi = cat(RandomHardware_002_io_in_hi_hi, wire_003) @[Cat.scala 30:58]
    node _RandomHardware_002_io_in_T = cat(RandomHardware_002_io_in_hi, RandomHardware_002_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 91:33]
    wire_006 <= RandomHardware_002.io.out @[RandomHardware.scala 92:18]
    wire_031 <= RandomHardware_002.io.out @[RandomHardware.scala 93:18]
    node _RandomHardware_003_io_in_T = cat(wire_006, wire_007) @[Cat.scala 30:58]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 94:33]
    wire_019 <= RandomHardware_003.io.out @[RandomHardware.scala 95:18]
    node _RandomHardware_004_io_in_T = cat(wire_008, wire_009) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 96:33]
    wire_007 <= RandomHardware_004.io.out @[RandomHardware.scala 97:18]
    RandomHardware_006.io.in <= wire_010 @[RandomHardware.scala 98:33]
    node _wire_014_T = bits(RandomHardware_006.io.out, 6, 0) @[RandomHardware.scala 99:47]
    wire_014 <= _wire_014_T @[RandomHardware.scala 99:18]
    wire_029 <= RandomHardware_006.io.out @[RandomHardware.scala 100:18]
    Reg_008.io.in <= wire_011 @[RandomHardware.scala 101:25]
    wire_021 <= Reg_008.io.out @[RandomHardware.scala 102:18]
    ShiftRight_009.io.in <= wire_012 @[RandomHardware.scala 103:25]
    wire_001 <= ShiftRight_009.io.out @[RandomHardware.scala 104:18]
    node RandomHardware_011_io_in_hi = cat(wire_013, wire_014) @[Cat.scala 30:58]
    node _RandomHardware_011_io_in_T = cat(RandomHardware_011_io_in_hi, wire_015) @[Cat.scala 30:58]
    RandomHardware_011.io.in <= _RandomHardware_011_io_in_T @[RandomHardware.scala 105:33]
    wire_002 <= RandomHardware_011.io.out @[RandomHardware.scala 106:18]
    node _RandomHardware_013_io_in_T = cat(wire_016, wire_017) @[Cat.scala 30:58]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 107:33]
    node _wire_023_T = bits(RandomHardware_013.io.out, 5, 0) @[RandomHardware.scala 108:47]
    wire_023 <= _wire_023_T @[RandomHardware.scala 108:18]
    wire_025 <= RandomHardware_013.io.out @[RandomHardware.scala 109:18]
    ShiftLeft_016.io.in <= wire_021 @[RandomHardware.scala 110:25]
    wire_034 <= ShiftLeft_016.io.out @[RandomHardware.scala 111:18]
    node _SignExtendDouble_020_io_in_T = cat(wire_023, wire_024) @[Cat.scala 30:58]
    SignExtendDouble_020.io.in <= _SignExtendDouble_020_io_in_T @[RandomHardware.scala 112:33]
    wire_004 <= SignExtendDouble_020.io.out @[RandomHardware.scala 113:18]
    node _RandomHardware_021_io_in_T = cat(wire_025, wire_027) @[Cat.scala 30:58]
    RandomHardware_021.io.in <= _RandomHardware_021_io_in_T @[RandomHardware.scala 114:33]
    wire_026 <= RandomHardware_021.io.out @[RandomHardware.scala 115:18]
    ShiftRight_022.io.in <= wire_028 @[RandomHardware.scala 116:25]
    wire_020 <= ShiftRight_022.io.out @[RandomHardware.scala 117:18]
    node _RandomHardware_023_io_in_T = cat(wire_029, wire_030) @[Cat.scala 30:58]
    RandomHardware_023.io.in <= _RandomHardware_023_io_in_T @[RandomHardware.scala 118:33]
    wire_032 <= RandomHardware_023.io.out @[RandomHardware.scala 119:18]
    node RandomHardware_026_io_in_hi = cat(wire_033, wire_034) @[Cat.scala 30:58]
    node _RandomHardware_026_io_in_T = cat(RandomHardware_026_io_in_hi, wire_035) @[Cat.scala 30:58]
    RandomHardware_026.io.in <= _RandomHardware_026_io_in_T @[RandomHardware.scala 120:33]
    wire_005 <= RandomHardware_026.io.out @[RandomHardware.scala 121:18]
    node _RandomHardware_027_io_in_T = cat(wire_000, wire_026) @[Cat.scala 30:58]
    RandomHardware_027.io.in <= _RandomHardware_027_io_in_T @[RandomHardware.scala 122:33]
    wire_022 <= RandomHardware_027.io.out @[RandomHardware.scala 123:18]
    wire_030 <= RandomHardware_027.io.out @[RandomHardware.scala 124:18]
    wire_018 <= RandomHardware_000.io.out @[RandomHardware.scala 125:18]
    wire_033 <= RandomHardware_000.io.out @[RandomHardware.scala 126:18]
    wire_013 <= RandomHardware_001.io.out @[RandomHardware.scala 127:18]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware.scala 128:18]
    wire_010 <= RandomHardware_005.io.out @[RandomHardware.scala 129:18]
    wire_028 <= SignExtendDouble_007.io.out @[RandomHardware.scala 130:18]
    wire_011 <= Accum_010.io.out @[RandomHardware.scala 131:18]
    wire_016 <= ShiftRight_012.io.out @[RandomHardware.scala 132:18]
    wire_012 <= ShiftRegister_014.io.out @[RandomHardware.scala 133:18]
    wire_003 <= ShiftRegister_017.io.out @[RandomHardware.scala 134:18]
    wire_008 <= ShiftRegister_017.io.out @[RandomHardware.scala 135:18]
    wire_024 <= ShiftRegister_017.io.out @[RandomHardware.scala 136:18]
    wire_015 <= RandomHardware_019.io.out @[RandomHardware.scala 137:18]
    wire_017 <= RandomHardware_019.io.out @[RandomHardware.scala 138:18]
    wire_009 <= ShiftLeft_025.io.out @[RandomHardware.scala 139:18]
    wire_027 <= ShiftLeft_025.io.out @[RandomHardware.scala 140:18]
    wire_035 <= ShiftLeft_025.io.out @[RandomHardware.scala 141:18]
    node RandomHardware_015_io_in_hi = cat(wire_018, wire_019) @[Cat.scala 30:58]
    node _RandomHardware_015_io_in_T = cat(RandomHardware_015_io_in_hi, wire_020) @[Cat.scala 30:58]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 142:33]
    Accum_018.io.in <= wire_022 @[RandomHardware.scala 143:25]
    node _RandomHardware_024_io_in_T = cat(wire_031, wire_032) @[Cat.scala 30:58]
    RandomHardware_024.io.in <= _RandomHardware_024_io_in_T @[RandomHardware.scala 144:33]
    
