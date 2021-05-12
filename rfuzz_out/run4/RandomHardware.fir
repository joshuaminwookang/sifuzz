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
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<13>}
    
    node IN1 = bits(io.in, 27, 15) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 14, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftRegister_1 : 
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
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<8>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
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
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<19>}
    
    node _io_out_T = shr(io.in, 1) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RegE : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<31>}
    
    node data = bits(io.in, 31, 1) @[Memory.scala 20:21]
    node en = bits(io.in, 0, 0) @[Memory.scala 21:19]
    reg reg : UInt<30>, clock @[Memory.scala 22:18]
    when en : @[Memory.scala 23:14]
      reg <= data @[Memory.scala 23:20]
      skip @[Memory.scala 23:14]
    io.out <= reg @[Memory.scala 24:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<47>, out : UInt<39>}
    
    wire wire_000 : UInt<19> @[RandomHardware_1_1.scala 13:24]
    wire wire_001 : UInt<6> @[RandomHardware_1_1.scala 14:24]
    wire wire_002 : UInt<13> @[RandomHardware_1_1.scala 15:24]
    wire wire_003 : UInt<19> @[RandomHardware_1_1.scala 16:24]
    wire wire_004 : UInt<13> @[RandomHardware_1_1.scala 17:24]
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_1.scala 19:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_1 @[RandomHardware_1_1.scala 20:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst ShiftLeft_002 of ShiftLeft @[RandomHardware_1_1.scala 21:34]
    ShiftLeft_002.clock <= clock
    ShiftLeft_002.reset <= reset
    inst ShiftRegister_003 of ShiftRegister_2 @[RandomHardware_1_1.scala 22:42]
    ShiftRegister_003.clock <= clock
    ShiftRegister_003.reset <= reset
    inst ShiftRight_004 of ShiftRight @[RandomHardware_1_1.scala 23:34]
    ShiftRight_004.clock <= clock
    ShiftRight_004.reset <= reset
    inst RegE_005 of RegE @[RandomHardware_1_1.scala 24:26]
    RegE_005.clock <= clock
    RegE_005.reset <= reset
    node _ReduceOrMux_000_io_in_T = bits(io.in, 46, 19) @[RandomHardware_1_1.scala 26:41]
    ReduceOrMux_000.io.in <= _ReduceOrMux_000_io_in_T @[RandomHardware_1_1.scala 26:33]
    node _ShiftRight_004_io_in_T = bits(io.in, 18, 0) @[RandomHardware_1_1.scala 27:33]
    ShiftRight_004.io.in <= _ShiftRight_004_io_in_T @[RandomHardware_1_1.scala 27:25]
    node _io_out_T = cat(ShiftLeft_002.io.out, RegE_005.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_1.scala 28:10]
    ShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_1.scala 30:33]
    wire_003 <= ShiftRegister_001.io.out @[RandomHardware_1_1.scala 31:18]
    ShiftRegister_003.io.in <= wire_002 @[RandomHardware_1_1.scala 32:33]
    node _wire_001_T = bits(ShiftRegister_003.io.out, 5, 0) @[RandomHardware_1_1.scala 33:46]
    wire_001 <= _wire_001_T @[RandomHardware_1_1.scala 33:18]
    wire_004 <= ShiftRegister_003.io.out @[RandomHardware_1_1.scala 34:18]
    wire_002 <= ReduceOrMux_000.io.out @[RandomHardware_1_1.scala 35:18]
    wire_000 <= ShiftRight_004.io.out @[RandomHardware_1_1.scala 36:18]
    ShiftLeft_002.io.in <= wire_001 @[RandomHardware_1_1.scala 37:25]
    node _RegE_005_io_in_T = cat(wire_003, wire_004) @[Cat.scala 30:58]
    RegE_005.io.in <= _RegE_005_io_in_T @[RandomHardware_1_1.scala 38:25]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<10>}
    
    node _io_out_T = bits(io.in, 4, 4) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<5>("h01f"), UInt<5>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<26>}
    
    node _io_out_T = bits(io.in, 12, 12) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<13>("h01fff"), UInt<13>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
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
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 10) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<11>}
    
    node IN1 = bits(io.in, 31, 21) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 20, 10) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<11>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_2_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<11>}
    
    wire wire_000 : UInt<11> @[RandomHardware_2_4.scala 13:24]
    inst ReduceOrMux_000 of ReduceOrMux_1 @[RandomHardware_2_4.scala 15:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst Reg_001 of Reg @[RandomHardware_2_4.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_2_4.scala 18:33]
    io.out <= Reg_001.io.out @[RandomHardware_2_4.scala 19:10]
    wire_000 <= ReduceOrMux_000.io.out @[RandomHardware_2_4.scala 21:18]
    Reg_001.io.in <= wire_000 @[RandomHardware_2_4.scala 22:25]
    
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
    
  module ShiftRegister_3 : 
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
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    node in1 = bits(io.in, 9, 5) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 4, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<73>, out : UInt<56>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_3.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware_1_3.scala 14:24]
    wire wire_002 : UInt<11> @[RandomHardware_1_3.scala 15:24]
    wire wire_003 : UInt<10> @[RandomHardware_1_3.scala 16:24]
    wire wire_004 : UInt<10> @[RandomHardware_1_3.scala 17:24]
    wire wire_005 : UInt<10> @[RandomHardware_1_3.scala 18:24]
    wire wire_006 : UInt<10> @[RandomHardware_1_3.scala 19:24]
    inst SignExtendDouble_000 of SignExtendDouble_1 @[RandomHardware_1_3.scala 21:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst Mux2_001 of Mux2 @[RandomHardware_1_3.scala 22:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    inst CompareMux_002 of CompareMux @[RandomHardware_1_3.scala 23:34]
    CompareMux_002.clock <= clock
    CompareMux_002.reset <= reset
    inst Accum_003 of Accum @[RandomHardware_1_3.scala 24:34]
    Accum_003.clock <= clock
    Accum_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_2_4 @[RandomHardware_1_3.scala 25:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst Mux2_005 of Mux2_1 @[RandomHardware_1_3.scala 26:26]
    Mux2_005.clock <= clock
    Mux2_005.reset <= reset
    inst ShiftRegister_006 of ShiftRegister_3 @[RandomHardware_1_3.scala 27:42]
    ShiftRegister_006.clock <= clock
    ShiftRegister_006.reset <= reset
    inst Mul_007 of Mul @[RandomHardware_1_3.scala 28:26]
    Mul_007.clock <= clock
    Mul_007.reset <= reset
    node _CompareMux_002_io_in_T = bits(io.in, 19, 0) @[RandomHardware_1_3.scala 30:33]
    CompareMux_002.io.in <= _CompareMux_002_io_in_T @[RandomHardware_1_3.scala 30:25]
    node _RandomHardware_004_io_in_T = bits(io.in, 31, 0) @[RandomHardware_1_3.scala 31:41]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware_1_3.scala 31:33]
    node _Mux2_005_io_in_T = bits(io.in, 20, 0) @[RandomHardware_1_3.scala 32:33]
    Mux2_005.io.in <= _Mux2_005_io_in_T @[RandomHardware_1_3.scala 32:25]
    node io_out_lo = cat(Accum_003.io.out, Mul_007.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(SignExtendDouble_000.io.out, Mux2_001.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_3.scala 33:10]
    ShiftRegister_006.io.in <= wire_005 @[RandomHardware_1_3.scala 35:33]
    wire_004 <= ShiftRegister_006.io.out @[RandomHardware_1_3.scala 36:18]
    wire_000 <= CompareMux_002.io.out @[RandomHardware_1_3.scala 37:18]
    node _wire_001_T = bits(RandomHardware_004.io.out, 9, 5) @[RandomHardware_1_3.scala 38:47]
    wire_001 <= _wire_001_T @[RandomHardware_1_3.scala 38:18]
    wire_002 <= RandomHardware_004.io.out @[RandomHardware_1_3.scala 39:18]
    wire_003 <= Mux2_005.io.out @[RandomHardware_1_3.scala 40:18]
    wire_005 <= Mux2_005.io.out @[RandomHardware_1_3.scala 41:18]
    wire_006 <= Mux2_005.io.out @[RandomHardware_1_3.scala 42:18]
    node _SignExtendDouble_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    SignExtendDouble_000.io.in <= _SignExtendDouble_000_io_in_T @[RandomHardware_1_3.scala 43:33]
    node _Mux2_001_io_in_T = cat(wire_002, wire_003) @[Cat.scala 30:58]
    Mux2_001.io.in <= _Mux2_001_io_in_T @[RandomHardware_1_3.scala 44:25]
    Accum_003.io.in <= wire_004 @[RandomHardware_1_3.scala 45:25]
    Mul_007.io.in <= wire_006 @[RandomHardware_1_3.scala 46:25]
    
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
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_1 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_2 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_2 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<16>}
    
    wire wire_000 : UInt<30> @[RandomHardware_2_0.scala 13:24]
    inst Sub_000 of Sub @[RandomHardware_2_0.scala 15:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1 @[RandomHardware_2_0.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Sub_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_0.scala 21:18]
    Sub_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<13>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_4.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_4.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_4.scala 17:10]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<15>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<15>}
    
    inst ShiftLeft_000 of ShiftLeft_1 @[RandomHardware_1_5.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_5.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_5.scala 17:10]
    
  module ShiftLeft_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<17>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Mod : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<14>}
    
    node in1 = bits(io.in, 27, 14) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 13, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<17>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_6.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft_2 @[RandomHardware_1_6.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst Mod_001 of Mod @[RandomHardware_1_6.scala 16:26]
    Mod_001.clock <= clock
    Mod_001.reset <= reset
    Mod_001.io.in <= io.in @[RandomHardware_1_6.scala 18:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_6.scala 19:10]
    wire_000 <= Mod_001.io.out @[RandomHardware_1_6.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_6.scala 22:25]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<32>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ResetShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<31>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<31>, clock with : (reset => (reset, UInt<31>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<31>, clock with : (reset => (reset, UInt<31>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<31>, clock with : (reset => (reset, UInt<31>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<31>, clock with : (reset => (reset, UInt<31>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<31>}
    
    wire wire_000 : UInt<32> @[RandomHardware_1_7.scala 13:24]
    inst Accum_000 of Accum_2 @[RandomHardware_1_7.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister_1 @[RandomHardware_1_7.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_7.scala 18:25]
    io.out <= ResetShiftRegister_001.io.out @[RandomHardware_1_7.scala 19:10]
    wire_000 <= Accum_000.io.out @[RandomHardware_1_7.scala 21:18]
    ResetShiftRegister_001.io.in <= wire_000 @[RandomHardware_1_7.scala 22:33]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<30>}
    
    node _io_out_T = bits(io.in, 14, 14) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<15>("h07fff"), UInt<15>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftLeft_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    inst ShiftLeft_000 of ShiftLeft_3 @[RandomHardware_2_1.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module ShiftRegister_4 : 
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
    
  module And : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module ReduceOrMux_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<22>}
    
    node IN1 = bits(io.in, 49, 28) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 27, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_3_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst ShiftRight_000 of ShiftRight_1 @[RandomHardware_3_0.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module Accum_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_3 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_4 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_4 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister_2 @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module Accum_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<11>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceOrMux_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<11>}
    
    node IN1 = bits(io.in, 31, 21) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 20, 10) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 9, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ShiftRegister_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<11>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module Mux2_2 : 
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
    
  module Mul_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node in1 = bits(io.in, 11, 6) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 5, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_2_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<55>, out : UInt<35>}
    
    wire wire_000 : UInt<12> @[RandomHardware_2_5.scala 13:24]
    wire wire_001 : UInt<11> @[RandomHardware_2_5.scala 14:24]
    wire wire_002 : UInt<11> @[RandomHardware_2_5.scala 15:24]
    wire wire_003 : UInt<11> @[RandomHardware_2_5.scala 16:24]
    wire wire_004 : UInt<11> @[RandomHardware_2_5.scala 17:24]
    wire wire_005 : UInt<12> @[RandomHardware_2_5.scala 18:24]
    inst RandomHardware_000 of RandomHardware_3_0 @[RandomHardware_2_5.scala 20:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1_1 @[RandomHardware_2_5.scala 21:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst Accum_002 of Accum_4 @[RandomHardware_2_5.scala 22:34]
    Accum_002.clock <= clock
    Accum_002.reset <= reset
    inst ReduceOrMux_003 of ReduceOrMux_5 @[RandomHardware_2_5.scala 23:34]
    ReduceOrMux_003.clock <= clock
    ReduceOrMux_003.reset <= reset
    inst ShiftRegister_004 of ShiftRegister_5 @[RandomHardware_2_5.scala 24:42]
    ShiftRegister_004.clock <= clock
    ShiftRegister_004.reset <= reset
    inst Mux2_005 of Mux2_2 @[RandomHardware_2_5.scala 25:26]
    Mux2_005.clock <= clock
    Mux2_005.reset <= reset
    inst Mul_006 of Mul_1 @[RandomHardware_2_5.scala 26:26]
    Mul_006.clock <= clock
    Mul_006.reset <= reset
    node _ReduceOrMux_003_io_in_T = bits(io.in, 31, 0) @[RandomHardware_2_5.scala 28:41]
    ReduceOrMux_003.io.in <= _ReduceOrMux_003_io_in_T @[RandomHardware_2_5.scala 28:33]
    node _Mux2_005_io_in_T = bits(io.in, 22, 0) @[RandomHardware_2_5.scala 29:33]
    Mux2_005.io.in <= _Mux2_005_io_in_T @[RandomHardware_2_5.scala 29:25]
    node io_out_hi = cat(RandomHardware_000.io.out, ShiftRegister_004.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, Mul_006.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_2_5.scala 30:10]
    node _RandomHardware_001_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware_2_5.scala 32:33]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_5.scala 33:18]
    wire_005 <= RandomHardware_001.io.out @[RandomHardware_2_5.scala 34:18]
    Accum_002.io.in <= wire_003 @[RandomHardware_2_5.scala 35:25]
    wire_001 <= Accum_002.io.out @[RandomHardware_2_5.scala 36:18]
    wire_002 <= ReduceOrMux_003.io.out @[RandomHardware_2_5.scala 37:18]
    wire_004 <= ReduceOrMux_003.io.out @[RandomHardware_2_5.scala 38:18]
    wire_003 <= Mux2_005.io.out @[RandomHardware_2_5.scala 39:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_2_5.scala 40:33]
    ShiftRegister_004.io.in <= wire_004 @[RandomHardware_2_5.scala 41:33]
    Mul_006.io.in <= wire_005 @[RandomHardware_2_5.scala 42:25]
    
  module ResetShiftRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<15>, out : UInt<15>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<51>, out : UInt<10>}
    
    wire wire_000 : UInt<15> @[RandomHardware_1_8.scala 13:24]
    wire wire_001 : UInt<22> @[RandomHardware_1_8.scala 14:24]
    wire wire_002 : UInt<10> @[RandomHardware_1_8.scala 15:24]
    wire wire_003 : UInt<35> @[RandomHardware_1_8.scala 16:24]
    wire wire_004 : UInt<15> @[RandomHardware_1_8.scala 17:24]
    wire wire_005 : UInt<30> @[RandomHardware_1_8.scala 18:24]
    wire wire_006 : UInt<10> @[RandomHardware_1_8.scala 19:24]
    wire wire_007 : UInt<15> @[RandomHardware_1_8.scala 20:24]
    inst SignExtendDouble_000 of SignExtendDouble_3 @[RandomHardware_1_8.scala 22:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_8.scala 23:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst ShiftRegister_002 of ShiftRegister_4 @[RandomHardware_1_8.scala 24:42]
    ShiftRegister_002.clock <= clock
    ShiftRegister_002.reset <= reset
    inst And_003 of And @[RandomHardware_1_8.scala 25:26]
    And_003.clock <= clock
    And_003.reset <= reset
    inst ReduceOrMux_004 of ReduceOrMux_3 @[RandomHardware_1_8.scala 26:34]
    ReduceOrMux_004.clock <= clock
    ReduceOrMux_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_2_5 @[RandomHardware_1_8.scala 27:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst ResetShiftRegister_006 of ResetShiftRegister_3 @[RandomHardware_1_8.scala 28:42]
    ResetShiftRegister_006.clock <= clock
    ResetShiftRegister_006.reset <= reset
    inst Reg_007 of Reg_1 @[RandomHardware_1_8.scala 29:26]
    Reg_007.clock <= clock
    Reg_007.reset <= reset
    node _And_003_io_in_T = bits(io.in, 50, 31) @[RandomHardware_1_8.scala 31:33]
    And_003.io.in <= _And_003_io_in_T @[RandomHardware_1_8.scala 31:25]
    node _ResetShiftRegister_006_io_in_T = bits(io.in, 15, 0) @[RandomHardware_1_8.scala 32:41]
    ResetShiftRegister_006.io.in <= _ResetShiftRegister_006_io_in_T @[RandomHardware_1_8.scala 32:33]
    node _Reg_007_io_in_T = bits(io.in, 50, 36) @[RandomHardware_1_8.scala 33:33]
    Reg_007.io.in <= _Reg_007_io_in_T @[RandomHardware_1_8.scala 33:25]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_8.scala 34:10]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_8.scala 36:33]
    wire_005 <= SignExtendDouble_000.io.out @[RandomHardware_1_8.scala 37:18]
    ShiftRegister_002.io.in <= wire_002 @[RandomHardware_1_8.scala 38:33]
    wire_006 <= ShiftRegister_002.io.out @[RandomHardware_1_8.scala 39:18]
    node _ReduceOrMux_004_io_in_T = cat(wire_003, wire_004) @[Cat.scala 30:58]
    ReduceOrMux_004.io.in <= _ReduceOrMux_004_io_in_T @[RandomHardware_1_8.scala 40:33]
    wire_001 <= ReduceOrMux_004.io.out @[RandomHardware_1_8.scala 41:18]
    node RandomHardware_005_io_in_hi = cat(wire_005, wire_006) @[Cat.scala 30:58]
    node _RandomHardware_005_io_in_T = cat(RandomHardware_005_io_in_hi, wire_007) @[Cat.scala 30:58]
    RandomHardware_005.io.in <= _RandomHardware_005_io_in_T @[RandomHardware_1_8.scala 42:33]
    wire_003 <= RandomHardware_005.io.out @[RandomHardware_1_8.scala 43:18]
    wire_002 <= And_003.io.out @[RandomHardware_1_8.scala 44:18]
    wire_004 <= ResetShiftRegister_006.io.out @[RandomHardware_1_8.scala 45:18]
    wire_000 <= Reg_007.io.out @[RandomHardware_1_8.scala 46:18]
    wire_007 <= Reg_007.io.out @[RandomHardware_1_8.scala 47:18]
    RandomHardware_001.io.in <= wire_001 @[RandomHardware_1_8.scala 48:33]
    
  module ShiftLeft_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<10>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module And_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<56>, out : UInt<28>}
    
    node in1 = bits(io.in, 55, 28) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 27, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<56>, out : UInt<56>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<56>, out : UInt<28>}
    
    wire wire_000 : UInt<56> @[RandomHardware_1_10.scala 13:24]
    inst And_000 of And_1 @[RandomHardware_1_10.scala 15:26]
    And_000.clock <= clock
    And_000.reset <= reset
    inst ShiftRight_001 of ShiftRight_2 @[RandomHardware_1_10.scala 16:34]
    ShiftRight_001.clock <= clock
    ShiftRight_001.reset <= reset
    ShiftRight_001.io.in <= io.in @[RandomHardware_1_10.scala 18:25]
    io.out <= And_000.io.out @[RandomHardware_1_10.scala 19:10]
    wire_000 <= ShiftRight_001.io.out @[RandomHardware_1_10.scala 21:18]
    And_000.io.in <= wire_000 @[RandomHardware_1_10.scala 22:25]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<14>}
    
    node IN1 = bits(io.in, 29, 16) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 15, 2) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<14>}
    
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_1_11.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_11.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_11.scala 17:10]
    
  module SignExtendDouble_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<14>}
    
    node _io_out_T = bits(io.in, 6, 6) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<7>("h07f"), UInt<7>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<7>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftLeft_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<8>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<14>}
    
    node IN1 = bits(io.in, 29, 16) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 15, 2) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module ReduceAndMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    node IN1 = bits(io.in, 19, 12) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 11, 4) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module ReduceAndMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<7>}
    
    node IN1 = bits(io.in, 17, 11) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 10, 4) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 3, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module RandomHardware_2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<56>, out : UInt<7>}
    
    wire wire_000 : UInt<14> @[RandomHardware_2_3.scala 13:24]
    wire wire_001 : UInt<8> @[RandomHardware_2_3.scala 14:24]
    inst ReduceAndMux_000 of ReduceAndMux @[RandomHardware_2_3.scala 16:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    inst ReduceAndMux_001 of ReduceAndMux_1 @[RandomHardware_2_3.scala 17:34]
    ReduceAndMux_001.clock <= clock
    ReduceAndMux_001.reset <= reset
    inst ReduceAndMux_002 of ReduceAndMux_2 @[RandomHardware_2_3.scala 18:34]
    ReduceAndMux_002.clock <= clock
    ReduceAndMux_002.reset <= reset
    node _ReduceAndMux_000_io_in_T = bits(io.in, 55, 24) @[RandomHardware_2_3.scala 20:41]
    ReduceAndMux_000.io.in <= _ReduceAndMux_000_io_in_T @[RandomHardware_2_3.scala 20:33]
    node _ReduceAndMux_001_io_in_T = bits(io.in, 23, 0) @[RandomHardware_2_3.scala 21:41]
    ReduceAndMux_001.io.in <= _ReduceAndMux_001_io_in_T @[RandomHardware_2_3.scala 21:33]
    io.out <= ReduceAndMux_002.io.out @[RandomHardware_2_3.scala 22:10]
    wire_000 <= ReduceAndMux_000.io.out @[RandomHardware_2_3.scala 24:18]
    wire_001 <= ReduceAndMux_001.io.out @[RandomHardware_2_3.scala 25:18]
    node _ReduceAndMux_002_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ReduceAndMux_002.io.in <= _ReduceAndMux_002_io_in_T @[RandomHardware_2_3.scala 26:33]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<56>, out : UInt<22>}
    
    wire wire_000 : UInt<7> @[RandomHardware_1_12.scala 13:24]
    wire wire_001 : UInt<7> @[RandomHardware_1_12.scala 14:24]
    wire wire_002 : UInt<7> @[RandomHardware_1_12.scala 15:24]
    inst SignExtendDouble_000 of SignExtendDouble_5 @[RandomHardware_1_12.scala 17:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst Accum_001 of Accum_5 @[RandomHardware_1_12.scala 18:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst ShiftLeft_002 of ShiftLeft_5 @[RandomHardware_1_12.scala 19:34]
    ShiftLeft_002.clock <= clock
    ShiftLeft_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_2_3 @[RandomHardware_1_12.scala 20:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    RandomHardware_003.io.in <= io.in @[RandomHardware_1_12.scala 22:33]
    node _io_out_T = cat(SignExtendDouble_000.io.out, ShiftLeft_002.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_12.scala 23:10]
    Accum_001.io.in <= wire_002 @[RandomHardware_1_12.scala 25:25]
    wire_000 <= Accum_001.io.out @[RandomHardware_1_12.scala 26:18]
    wire_001 <= RandomHardware_003.io.out @[RandomHardware_1_12.scala 27:18]
    wire_002 <= RandomHardware_003.io.out @[RandomHardware_1_12.scala 28:18]
    SignExtendDouble_000.io.in <= wire_001 @[RandomHardware_1_12.scala 29:33]
    ShiftLeft_002.io.in <= wire_000 @[RandomHardware_1_12.scala 30:25]
    
  module ShiftLeft_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<17>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<17>}
    
    inst ShiftLeft_000 of ShiftLeft_6 @[RandomHardware_1_13.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_13.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module Sub_1 : 
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
    
  module Accum_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_6 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_6 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_6 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister_4 @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<16>}
    
    wire wire_000 : UInt<30> @[RandomHardware_2_0.scala 13:24]
    inst Sub_000 of Sub_1 @[RandomHardware_2_0.scala 15:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1_2 @[RandomHardware_2_0.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Sub_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_0.scala 21:18]
    Sub_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module ShiftLeft_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<55>, out : UInt<59>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftLeft_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<42>, out : UInt<44>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<74>, out : UInt<59>}
    
    wire wire_000 : UInt<11> @[RandomHardware_1_14.scala 13:24]
    wire wire_001 : UInt<44> @[RandomHardware_1_14.scala 14:24]
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_14.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ShiftLeft_001 of ShiftLeft_7 @[RandomHardware_1_14.scala 17:34]
    ShiftLeft_001.clock <= clock
    ShiftLeft_001.reset <= reset
    inst ShiftLeft_002 of ShiftLeft_8 @[RandomHardware_1_14.scala 18:34]
    ShiftLeft_002.clock <= clock
    ShiftLeft_002.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 73, 42) @[RandomHardware_1_14.scala 20:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware_1_14.scala 20:33]
    node _ShiftLeft_002_io_in_T = bits(io.in, 73, 32) @[RandomHardware_1_14.scala 21:33]
    ShiftLeft_002.io.in <= _ShiftLeft_002_io_in_T @[RandomHardware_1_14.scala 21:25]
    io.out <= ShiftLeft_001.io.out @[RandomHardware_1_14.scala 22:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_14.scala 24:18]
    wire_001 <= ShiftLeft_002.io.out @[RandomHardware_1_14.scala 25:18]
    node _ShiftLeft_001_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ShiftLeft_001.io.in <= _ShiftLeft_001_io_in_T @[RandomHardware_1_14.scala 26:25]
    
  module ShiftLeft_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<49>, out : UInt<51>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module Mux2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<51>, out : UInt<25>}
    
    node _sel_T = bits(io.in, 50, 50) @[Muxes.scala 16:18]
    node sel = bits(_sel_T, 0, 0) @[Muxes.scala 16:24]
    node in1 = bits(io.in, 49, 25) @[Muxes.scala 17:18]
    node in0 = bits(io.in, 24, 0) @[Muxes.scala 18:18]
    when sel : @[Muxes.scala 19:15]
      io.out <= in1 @[Muxes.scala 19:24]
      skip @[Muxes.scala 19:15]
    else : @[Muxes.scala 20:15]
      io.out <= in0 @[Muxes.scala 20:24]
      skip @[Muxes.scala 20:15]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<49>, out : UInt<25>}
    
    wire wire_000 : UInt<51> @[RandomHardware_1_15.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft_9 @[RandomHardware_1_15.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst Mux2_001 of Mux2_3 @[RandomHardware_1_15.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_15.scala 18:25]
    io.out <= Mux2_001.io.out @[RandomHardware_1_15.scala 19:10]
    wire_000 <= ShiftLeft_000.io.out @[RandomHardware_1_15.scala 21:18]
    Mux2_001.io.in <= wire_000 @[RandomHardware_1_15.scala 22:25]
    
  module And_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<20>}
    
    node in1 = bits(io.in, 39, 20) @[ArithmeticLogical.scala 36:20]
    node in2 = bits(io.in, 19, 0) @[ArithmeticLogical.scala 37:20]
    node _io_out_T = and(in1, in2) @[ArithmeticLogical.scala 38:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 38:12]
    
  module ShiftRegister_6 : 
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
    
  module ResetShiftRegister_5 : 
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
    
  module Mux2_4 : 
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
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<18>}
    
    wire wire_000 : UInt<19> @[RandomHardware_2_2.scala 13:24]
    inst ResetShiftRegister_000 of ResetShiftRegister_5 @[RandomHardware_2_2.scala 15:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    inst Mux2_001 of Mux2_4 @[RandomHardware_2_2.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    Mux2_001.io.in <= io.in @[RandomHardware_2_2.scala 18:25]
    io.out <= ResetShiftRegister_000.io.out @[RandomHardware_2_2.scala 19:10]
    wire_000 <= Mux2_001.io.out @[RandomHardware_2_2.scala 21:18]
    ResetShiftRegister_000.io.in <= wire_000 @[RandomHardware_2_2.scala 22:33]
    
  module RegE_1 : 
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
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<38>}
    
    wire wire_000 : UInt<20> @[RandomHardware_1_16.scala 13:24]
    wire wire_001 : UInt<2> @[RandomHardware_1_16.scala 14:24]
    wire wire_002 : UInt<19> @[RandomHardware_1_16.scala 15:24]
    wire wire_003 : UInt<19> @[RandomHardware_1_16.scala 16:24]
    wire wire_004 : UInt<19> @[RandomHardware_1_16.scala 17:24]
    wire wire_005 : UInt<20> @[RandomHardware_1_16.scala 18:24]
    inst And_000 of And_2 @[RandomHardware_1_16.scala 20:26]
    And_000.clock <= clock
    And_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister_6 @[RandomHardware_1_16.scala 21:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_16.scala 22:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RegE_003 of RegE_1 @[RandomHardware_1_16.scala 23:26]
    RegE_003.clock <= clock
    RegE_003.reset <= reset
    inst RegE_004 of RegE_2 @[RandomHardware_1_16.scala 24:26]
    RegE_004.clock <= clock
    RegE_004.reset <= reset
    And_000.io.in <= io.in @[RandomHardware_1_16.scala 26:25]
    node _io_out_T = cat(ShiftRegister_001.io.out, RegE_003.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_16.scala 27:10]
    RandomHardware_002.io.in <= wire_003 @[RandomHardware_1_16.scala 29:33]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_1_16.scala 30:18]
    RegE_004.io.in <= wire_005 @[RandomHardware_1_16.scala 31:25]
    wire_002 <= RegE_004.io.out @[RandomHardware_1_16.scala 32:18]
    wire_003 <= RegE_004.io.out @[RandomHardware_1_16.scala 33:18]
    wire_004 <= RegE_004.io.out @[RandomHardware_1_16.scala 34:18]
    wire_000 <= And_000.io.out @[RandomHardware_1_16.scala 35:18]
    wire_005 <= And_000.io.out @[RandomHardware_1_16.scala 36:18]
    node ShiftRegister_001_io_in_hi = cat(wire_000, wire_001) @[Cat.scala 30:58]
    node _ShiftRegister_001_io_in_T = cat(ShiftRegister_001_io_in_hi, wire_002) @[Cat.scala 30:58]
    ShiftRegister_001.io.in <= _ShiftRegister_001_io_in_T @[RandomHardware_1_16.scala 37:33]
    RegE_003.io.in <= wire_004 @[RandomHardware_1_16.scala 38:25]
    
  module Mux8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<27>, out : UInt<3>}
    
    node sel = bits(io.in, 26, 24) @[Muxes.scala 44:18]
    node in7 = bits(io.in, 23, 9) @[Muxes.scala 45:18]
    node in6 = bits(io.in, 20, 6) @[Muxes.scala 46:18]
    node in5 = bits(io.in, 17, 15) @[Muxes.scala 47:18]
    node in4 = bits(io.in, 14, 12) @[Muxes.scala 48:18]
    node in3 = bits(io.in, 11, 9) @[Muxes.scala 49:18]
    node in2 = bits(io.in, 8, 6) @[Muxes.scala 50:18]
    node in1 = bits(io.in, 5, 3) @[Muxes.scala 51:18]
    node in0 = bits(io.in, 2, 0) @[Muxes.scala 52:18]
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
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<3>, out : UInt<3>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<27>, out : UInt<3>}
    
    wire wire_000 : UInt<3> @[RandomHardware_1_17.scala 13:24]
    inst Mux8_000 of Mux8 @[RandomHardware_1_17.scala 15:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    inst Reg_001 of Reg_2 @[RandomHardware_1_17.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_1_17.scala 18:25]
    io.out <= Reg_001.io.out @[RandomHardware_1_17.scala 19:10]
    wire_000 <= Mux8_000.io.out @[RandomHardware_1_17.scala 21:18]
    Reg_001.io.in <= wire_000 @[RandomHardware_1_17.scala 22:25]
    
  module Sub_2 : 
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
    
  module Accum_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_7 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_7 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_7 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister_6 @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<16>}
    
    wire wire_000 : UInt<30> @[RandomHardware_2_0.scala 13:24]
    inst Sub_000 of Sub_2 @[RandomHardware_2_0.scala 15:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1_3 @[RandomHardware_2_0.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Sub_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_0.scala 21:18]
    Sub_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module ShiftLeft_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    inst ShiftLeft_000 of ShiftLeft_10 @[RandomHardware_2_1.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<27>}
    
    wire wire_000 : UInt<42> @[RandomHardware_1_18.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_18.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_18.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_18.scala 18:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_18.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_18.scala 21:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_1_18.scala 22:33]
    
  module Accum_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<21>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<21>, out : UInt<21>}
    
    inst Accum_000 of Accum_8 @[RandomHardware_1_19.scala 14:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    Accum_000.io.in <= io.in @[RandomHardware_1_19.scala 16:25]
    io.out <= Accum_000.io.out @[RandomHardware_1_19.scala 17:10]
    
  module Sub_3 : 
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
    
  module Accum_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_9 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_8 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_8 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister_7 @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module RandomHardware_2_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<16>}
    
    wire wire_000 : UInt<30> @[RandomHardware_2_0.scala 13:24]
    inst Sub_000 of Sub_3 @[RandomHardware_2_0.scala 15:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1_4 @[RandomHardware_2_0.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Sub_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_0.scala 21:18]
    Sub_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module SignExtendDouble_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<56>}
    
    node _io_out_T = bits(io.in, 27, 27) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<28>("h0fffffff"), UInt<28>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_20 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<56>}
    
    wire wire_000 : UInt<28> @[RandomHardware_1_20.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_3 @[RandomHardware_1_20.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_9 @[RandomHardware_1_20.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_20.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_1_20.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_20.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_1_20.scala 22:33]
    
  module ResetShiftRegister_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<31>, out : UInt<30>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<30>, clock with : (reset => (reset, UInt<30>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<30>, clock with : (reset => (reset, UInt<30>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<30>, clock with : (reset => (reset, UInt<30>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<30>, clock with : (reset => (reset, UInt<30>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<31>, out : UInt<30>}
    
    inst ResetShiftRegister_000 of ResetShiftRegister_8 @[RandomHardware_1_21.scala 14:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    ResetShiftRegister_000.io.in <= io.in @[RandomHardware_1_21.scala 16:33]
    io.out <= ResetShiftRegister_000.io.out @[RandomHardware_1_21.scala 17:10]
    
  module CompareMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<7>}
    
    node IN1 = bits(io.in, 17, 9) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 10, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module ResetShiftRegister_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<18>, out : UInt<17>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<17>, clock with : (reset => (reset, UInt<17>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<17>, clock with : (reset => (reset, UInt<17>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<17>, clock with : (reset => (reset, UInt<17>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<17>, clock with : (reset => (reset, UInt<17>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module ResetShiftRegister_10 : 
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
    
  module Mux2_5 : 
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
    
  module RandomHardware_2_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<18>}
    
    wire wire_000 : UInt<19> @[RandomHardware_2_2.scala 13:24]
    inst ResetShiftRegister_000 of ResetShiftRegister_10 @[RandomHardware_2_2.scala 15:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    inst Mux2_001 of Mux2_5 @[RandomHardware_2_2.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    Mux2_001.io.in <= io.in @[RandomHardware_2_2.scala 18:25]
    io.out <= ResetShiftRegister_000.io.out @[RandomHardware_2_2.scala 19:10]
    wire_000 <= Mux2_001.io.out @[RandomHardware_2_2.scala 21:18]
    ResetShiftRegister_000.io.in <= wire_000 @[RandomHardware_2_2.scala 22:33]
    
  module RandomHardware_1_22 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<39>, out : UInt<7>}
    
    wire wire_000 : UInt<17> @[RandomHardware_1_22.scala 13:24]
    wire wire_001 : UInt<18> @[RandomHardware_1_22.scala 14:24]
    wire wire_002 : UInt<18> @[RandomHardware_1_22.scala 15:24]
    inst CompareMux_000 of CompareMux_1 @[RandomHardware_1_22.scala 17:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister_9 @[RandomHardware_1_22.scala 18:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2_1 @[RandomHardware_1_22.scala 19:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    RandomHardware_002.io.in <= io.in @[RandomHardware_1_22.scala 21:33]
    io.out <= CompareMux_000.io.out @[RandomHardware_1_22.scala 22:10]
    ResetShiftRegister_001.io.in <= wire_002 @[RandomHardware_1_22.scala 24:33]
    wire_000 <= ResetShiftRegister_001.io.out @[RandomHardware_1_22.scala 25:18]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_1_22.scala 26:18]
    wire_002 <= RandomHardware_002.io.out @[RandomHardware_1_22.scala 27:18]
    node _CompareMux_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    CompareMux_000.io.in <= _CompareMux_000_io_in_T @[RandomHardware_1_22.scala 28:25]
    
  module SignExtendDouble_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<18>}
    
    node _io_out_T = bits(io.in, 8, 8) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<9>("h01ff"), UInt<9>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    node IN1 = bits(io.in, 23, 15) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 14, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<18>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_23.scala 13:24]
    inst SignExtendDouble_000 of SignExtendDouble_10 @[RandomHardware_1_23.scala 15:42]
    SignExtendDouble_000.clock <= clock
    SignExtendDouble_000.reset <= reset
    inst ReduceOrMux_001 of ReduceOrMux_9 @[RandomHardware_1_23.scala 16:34]
    ReduceOrMux_001.clock <= clock
    ReduceOrMux_001.reset <= reset
    ReduceOrMux_001.io.in <= io.in @[RandomHardware_1_23.scala 18:33]
    io.out <= SignExtendDouble_000.io.out @[RandomHardware_1_23.scala 19:10]
    wire_000 <= ReduceOrMux_001.io.out @[RandomHardware_1_23.scala 21:18]
    SignExtendDouble_000.io.in <= wire_000 @[RandomHardware_1_23.scala 22:33]
    
  module CompareMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<9>}
    
    node IN1 = bits(io.in, 21, 11) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 12, 4) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 3, 2) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 1, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module Reg_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_24 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_24.scala 13:24]
    inst CompareMux_000 of CompareMux_2 @[RandomHardware_1_24.scala 15:34]
    CompareMux_000.clock <= clock
    CompareMux_000.reset <= reset
    inst Reg_001 of Reg_3 @[RandomHardware_1_24.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    CompareMux_000.io.in <= io.in @[RandomHardware_1_24.scala 18:25]
    io.out <= Reg_001.io.out @[RandomHardware_1_24.scala 19:10]
    wire_000 <= CompareMux_000.io.out @[RandomHardware_1_24.scala 21:18]
    Reg_001.io.in <= wire_000 @[RandomHardware_1_24.scala 22:25]
    
  module Sub_4 : 
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
    
  module Accum_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<30>, out : UInt<30>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ReduceOrMux_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<15>}
    
    node IN1 = bits(io.in, 31, 17) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 16, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module ResetShiftRegister_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<15>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<15>, clock with : (reset => (reset, UInt<15>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_3_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<30>}
    
    wire wire_000 : UInt<15> @[RandomHardware_3_1.scala 13:24]
    wire wire_001 : UInt<15> @[RandomHardware_3_1.scala 14:24]
    wire wire_002 : UInt<32> @[RandomHardware_3_1.scala 15:24]
    inst Accum_000 of Accum_10 @[RandomHardware_3_1.scala 17:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble_11 @[RandomHardware_3_1.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux_10 @[RandomHardware_3_1.scala 19:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst ResetShiftRegister_003 of ResetShiftRegister_11 @[RandomHardware_3_1.scala 20:42]
    ResetShiftRegister_003.clock <= clock
    ResetShiftRegister_003.reset <= reset
    node _SignExtendDouble_001_io_in_T = bits(io.in, 31, 16) @[RandomHardware_3_1.scala 22:41]
    SignExtendDouble_001.io.in <= _SignExtendDouble_001_io_in_T @[RandomHardware_3_1.scala 22:33]
    node _ResetShiftRegister_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_3_1.scala 23:41]
    ResetShiftRegister_003.io.in <= _ResetShiftRegister_003_io_in_T @[RandomHardware_3_1.scala 23:33]
    io.out <= Accum_000.io.out @[RandomHardware_3_1.scala 24:10]
    ReduceOrMux_002.io.in <= wire_002 @[RandomHardware_3_1.scala 26:33]
    wire_000 <= ReduceOrMux_002.io.out @[RandomHardware_3_1.scala 27:18]
    wire_002 <= SignExtendDouble_001.io.out @[RandomHardware_3_1.scala 28:18]
    wire_001 <= ResetShiftRegister_003.io.out @[RandomHardware_3_1.scala 29:18]
    node _Accum_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    Accum_000.io.in <= _Accum_000_io_in_T @[RandomHardware_3_1.scala 30:25]
    
  module RandomHardware_2_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<16>}
    
    wire wire_000 : UInt<30> @[RandomHardware_2_0.scala 13:24]
    inst Sub_000 of Sub_4 @[RandomHardware_2_0.scala 15:26]
    Sub_000.clock <= clock
    Sub_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_3_1_5 @[RandomHardware_2_0.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= Sub_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_2_0.scala 21:18]
    Sub_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:25]
    
  module ShiftLeft_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_2_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<35>, out : UInt<38>}
    
    inst ShiftLeft_000 of ShiftLeft_11 @[RandomHardware_2_1.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_2_1.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_2_1.scala 17:10]
    
  module Accum_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<19>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware_1_25 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<51>, out : UInt<38>}
    
    wire wire_000 : UInt<16> @[RandomHardware_1_25.scala 13:24]
    wire wire_001 : UInt<19> @[RandomHardware_1_25.scala 14:24]
    inst RandomHardware_000 of RandomHardware_2_0_4 @[RandomHardware_1_25.scala 16:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_2 @[RandomHardware_1_25.scala 17:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst Accum_002 of Accum_11 @[RandomHardware_1_25.scala 18:34]
    Accum_002.clock <= clock
    Accum_002.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 50, 19) @[RandomHardware_1_25.scala 20:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware_1_25.scala 20:33]
    node _Accum_002_io_in_T = bits(io.in, 50, 32) @[RandomHardware_1_25.scala 21:33]
    Accum_002.io.in <= _Accum_002_io_in_T @[RandomHardware_1_25.scala 21:25]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_25.scala 22:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_25.scala 24:18]
    wire_001 <= Accum_002.io.out @[RandomHardware_1_25.scala 25:18]
    node _RandomHardware_001_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware_1_25.scala 26:33]
    
  module Accum_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<111>}
    
    wire wire_000 : UInt<5> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<17> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<30> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<5> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<6> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<56> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<5> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<17> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<13> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<5> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<15> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<10> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<30> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<7> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<56> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<30> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<18> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<38> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<10> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<7> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<14> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<22> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<38> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<28> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<21> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<27> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<17> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<19> @[RandomHardware.scala 40:24]
    wire wire_028 : UInt<3> @[RandomHardware.scala 41:24]
    wire wire_029 : UInt<18> @[RandomHardware.scala 42:24]
    wire wire_030 : UInt<15> @[RandomHardware.scala 43:24]
    wire wire_031 : UInt<17> @[RandomHardware.scala 44:24]
    wire wire_032 : UInt<14> @[RandomHardware.scala 45:24]
    wire wire_033 : UInt<31> @[RandomHardware.scala 46:24]
    wire wire_034 : UInt<39> @[RandomHardware.scala 47:24]
    wire wire_035 : UInt<10> @[RandomHardware.scala 48:24]
    wire wire_036 : UInt<14> @[RandomHardware.scala 49:24]
    wire wire_037 : UInt<17> @[RandomHardware.scala 50:24]
    wire wire_038 : UInt<5> @[RandomHardware.scala 51:24]
    wire wire_039 : UInt<10> @[RandomHardware.scala 52:24]
    wire wire_040 : UInt<30> @[RandomHardware.scala 53:24]
    wire wire_041 : UInt<9> @[RandomHardware.scala 54:24]
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware.scala 56:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 57:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble @[RandomHardware.scala 58:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 59:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 60:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_1_5 @[RandomHardware.scala 61:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 62:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 63:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 64:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst ShiftLeft_009 of ShiftLeft_4 @[RandomHardware.scala 65:34]
    ShiftLeft_009.clock <= clock
    ShiftLeft_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 66:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 67:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 68:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 69:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 70:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 71:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 72:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 73:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 74:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 75:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst RandomHardware_020 of RandomHardware_1_20 @[RandomHardware.scala 76:42]
    RandomHardware_020.clock <= clock
    RandomHardware_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 77:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst RandomHardware_022 of RandomHardware_1_22 @[RandomHardware.scala 78:42]
    RandomHardware_022.clock <= clock
    RandomHardware_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 79:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    inst RandomHardware_024 of RandomHardware_1_24 @[RandomHardware.scala 80:42]
    RandomHardware_024.clock <= clock
    RandomHardware_024.reset <= reset
    inst RandomHardware_025 of RandomHardware_1_25 @[RandomHardware.scala 81:42]
    RandomHardware_025.clock <= clock
    RandomHardware_025.reset <= reset
    inst Accum_026 of Accum_12 @[RandomHardware.scala 82:34]
    Accum_026.clock <= clock
    Accum_026.reset <= reset
    node _RandomHardware_006_io_in_T = bits(io.in, 99, 72) @[RandomHardware.scala 84:41]
    RandomHardware_006.io.in <= _RandomHardware_006_io_in_T @[RandomHardware.scala 84:33]
    node _RandomHardware_007_io_in_T = bits(io.in, 99, 68) @[RandomHardware.scala 85:41]
    RandomHardware_007.io.in <= _RandomHardware_007_io_in_T @[RandomHardware.scala 85:33]
    node _RandomHardware_016_io_in_T = bits(io.in, 39, 0) @[RandomHardware.scala 86:41]
    RandomHardware_016.io.in <= _RandomHardware_016_io_in_T @[RandomHardware.scala 86:33]
    node io_out_lo = cat(RandomHardware_015.io.out, Accum_026.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(RandomHardware_013.io.out, RandomHardware_014.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 87:10]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware.scala 89:33]
    wire_003 <= ShiftRegister_000.io.out @[RandomHardware.scala 90:18]
    wire_006 <= ShiftRegister_000.io.out @[RandomHardware.scala 91:18]
    wire_009 <= ShiftRegister_000.io.out @[RandomHardware.scala 92:18]
    node _RandomHardware_001_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 93:33]
    wire_034 <= RandomHardware_001.io.out @[RandomHardware.scala 94:18]
    SignExtendDouble_002.io.in <= wire_003 @[RandomHardware.scala 95:33]
    wire_018 <= SignExtendDouble_002.io.out @[RandomHardware.scala 96:18]
    wire_039 <= SignExtendDouble_002.io.out @[RandomHardware.scala 97:18]
    node _RandomHardware_003_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 98:33]
    wire_014 <= RandomHardware_003.io.out @[RandomHardware.scala 99:18]
    node _RandomHardware_004_io_in_T = cat(wire_006, wire_007) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 100:33]
    node _hi_T = bits(RandomHardware_004.io.out, 11, 6) @[RandomHardware.scala 101:47]
    wire_004 <= _hi_T @[RandomHardware.scala 101:18]
    wire_008 <= RandomHardware_004.io.out @[RandomHardware.scala 102:18]
    RandomHardware_005.io.in <= wire_008 @[RandomHardware.scala 103:33]
    wire_010 <= RandomHardware_005.io.out @[RandomHardware.scala 104:18]
    wire_030 <= RandomHardware_005.io.out @[RandomHardware.scala 105:18]
    node RandomHardware_008_io_in_hi = cat(wire_009, wire_010) @[Cat.scala 30:58]
    node _RandomHardware_008_io_in_T = cat(RandomHardware_008_io_in_hi, wire_012) @[Cat.scala 30:58]
    RandomHardware_008.io.in <= _RandomHardware_008_io_in_T @[RandomHardware.scala 106:33]
    wire_035 <= RandomHardware_008.io.out @[RandomHardware.scala 107:18]
    wire_011 <= RandomHardware_008.io.out @[RandomHardware.scala 108:18]
    ShiftLeft_009.io.in <= wire_013 @[RandomHardware.scala 109:25]
    node _wire_000_T = bits(ShiftLeft_009.io.out, 4, 0) @[RandomHardware.scala 110:42]
    wire_000 <= _wire_000_T @[RandomHardware.scala 110:18]
    node _wire_038_T = bits(ShiftLeft_009.io.out, 9, 5) @[RandomHardware.scala 111:42]
    wire_038 <= _wire_038_T @[RandomHardware.scala 111:18]
    RandomHardware_010.io.in <= wire_014 @[RandomHardware.scala 112:33]
    wire_023 <= RandomHardware_010.io.out @[RandomHardware.scala 113:18]
    RandomHardware_011.io.in <= wire_015 @[RandomHardware.scala 114:33]
    wire_020 <= RandomHardware_011.io.out @[RandomHardware.scala 115:18]
    wire_032 <= RandomHardware_011.io.out @[RandomHardware.scala 116:18]
    wire_036 <= RandomHardware_011.io.out @[RandomHardware.scala 117:18]
    node _RandomHardware_012_io_in_T = cat(wire_016, wire_017) @[Cat.scala 30:58]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 118:33]
    wire_021 <= RandomHardware_012.io.out @[RandomHardware.scala 119:18]
    RandomHardware_017.io.in <= wire_025 @[RandomHardware.scala 120:33]
    wire_028 <= RandomHardware_017.io.out @[RandomHardware.scala 121:18]
    node _RandomHardware_018_io_in_T = cat(wire_026, wire_027) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 122:33]
    wire_025 <= RandomHardware_018.io.out @[RandomHardware.scala 123:18]
    node _RandomHardware_019_io_in_T = cat(wire_028, wire_029) @[Cat.scala 30:58]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 124:33]
    wire_024 <= RandomHardware_019.io.out @[RandomHardware.scala 125:18]
    node RandomHardware_020_io_in_hi = cat(wire_030, wire_031) @[Cat.scala 30:58]
    node _RandomHardware_020_io_in_T = cat(RandomHardware_020_io_in_hi, wire_032) @[Cat.scala 30:58]
    RandomHardware_020.io.in <= _RandomHardware_020_io_in_T @[RandomHardware.scala 126:33]
    wire_005 <= RandomHardware_020.io.out @[RandomHardware.scala 127:18]
    RandomHardware_021.io.in <= wire_033 @[RandomHardware.scala 128:33]
    wire_002 <= RandomHardware_021.io.out @[RandomHardware.scala 129:18]
    wire_012 <= RandomHardware_021.io.out @[RandomHardware.scala 130:18]
    wire_015 <= RandomHardware_021.io.out @[RandomHardware.scala 131:18]
    wire_040 <= RandomHardware_021.io.out @[RandomHardware.scala 132:18]
    RandomHardware_022.io.in <= wire_034 @[RandomHardware.scala 133:33]
    wire_013 <= RandomHardware_022.io.out @[RandomHardware.scala 134:18]
    wire_019 <= RandomHardware_022.io.out @[RandomHardware.scala 135:18]
    node _RandomHardware_023_io_in_T = cat(wire_035, wire_036) @[Cat.scala 30:58]
    RandomHardware_023.io.in <= _RandomHardware_023_io_in_T @[RandomHardware.scala 136:33]
    wire_016 <= RandomHardware_023.io.out @[RandomHardware.scala 137:18]
    wire_029 <= RandomHardware_023.io.out @[RandomHardware.scala 138:18]
    node _RandomHardware_024_io_in_T = cat(wire_037, wire_038) @[Cat.scala 30:58]
    RandomHardware_024.io.in <= _RandomHardware_024_io_in_T @[RandomHardware.scala 139:33]
    wire_041 <= RandomHardware_024.io.out @[RandomHardware.scala 140:18]
    node RandomHardware_025_io_in_hi = cat(wire_039, wire_040) @[Cat.scala 30:58]
    node _RandomHardware_025_io_in_T = cat(RandomHardware_025_io_in_hi, wire_041) @[Cat.scala 30:58]
    RandomHardware_025.io.in <= _RandomHardware_025_io_in_T @[RandomHardware.scala 141:33]
    wire_017 <= RandomHardware_025.io.out @[RandomHardware.scala 142:18]
    wire_001 <= RandomHardware_006.io.out @[RandomHardware.scala 143:18]
    wire_007 <= RandomHardware_006.io.out @[RandomHardware.scala 144:18]
    wire_026 <= RandomHardware_006.io.out @[RandomHardware.scala 145:18]
    wire_031 <= RandomHardware_006.io.out @[RandomHardware.scala 146:18]
    wire_037 <= RandomHardware_006.io.out @[RandomHardware.scala 147:18]
    wire_033 <= RandomHardware_007.io.out @[RandomHardware.scala 148:18]
    wire_022 <= RandomHardware_016.io.out @[RandomHardware.scala 149:18]
    node _lo_T = bits(RandomHardware_016.io.out, 37, 19) @[RandomHardware.scala 150:47]
    wire_027 <= _lo_T @[RandomHardware.scala 150:18]
    node _RandomHardware_013_io_in_T = cat(wire_018, wire_019) @[Cat.scala 30:58]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 151:33]
    node RandomHardware_014_io_in_hi = cat(wire_020, wire_021) @[Cat.scala 30:58]
    node _RandomHardware_014_io_in_T = cat(RandomHardware_014_io_in_hi, wire_022) @[Cat.scala 30:58]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 152:33]
    node _RandomHardware_015_io_in_T = cat(wire_023, wire_024) @[Cat.scala 30:58]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 153:33]
    Accum_026.io.in <= wire_011 @[RandomHardware.scala 154:25]
    
