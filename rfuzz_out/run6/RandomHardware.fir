;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module ShiftRegister : 
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
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_2_0.scala 13:24]
    inst ShiftRegister_000 of ShiftRegister @[RandomHardware_2_0.scala 15:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst CompareMux_001 of CompareMux @[RandomHardware_2_0.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:25]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module ShiftRegister_1 : 
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
    
  module CompareMux_1 : 
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
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_2_0.scala 13:24]
    inst ShiftRegister_000 of ShiftRegister_1 @[RandomHardware_2_0.scala 15:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst CompareMux_001 of CompareMux_1 @[RandomHardware_2_0.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:25]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
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
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<9>}
    
    wire wire_000 : UInt<19> @[RandomHardware_1_1.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_1.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst Mux2_001 of Mux2 @[RandomHardware_1_1.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_1.scala 18:33]
    io.out <= Mux2_001.io.out @[RandomHardware_1_1.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_1.scala 21:18]
    Mux2_001.io.in <= wire_000 @[RandomHardware_1_1.scala 22:25]
    
  module Mod : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    node in1 = bits(io.in, 19, 10) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 9, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<10>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    wire wire_000 : UInt<10> @[RandomHardware_1_2.scala 13:24]
    inst Mod_000 of Mod @[RandomHardware_1_2.scala 15:26]
    Mod_000.clock <= clock
    Mod_000.reset <= reset
    inst Reg_001 of Reg @[RandomHardware_1_2.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    Mod_000.io.in <= io.in @[RandomHardware_1_2.scala 18:25]
    io.out <= Reg_001.io.out @[RandomHardware_1_2.scala 19:10]
    wire_000 <= Mod_000.io.out @[RandomHardware_1_2.scala 21:18]
    Reg_001.io.in <= wire_000 @[RandomHardware_1_2.scala 22:25]
    
  module Mod_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<8>}
    
    node in1 = bits(io.in, 15, 8) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 7, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<8>}
    
    inst Mod_000 of Mod_1 @[RandomHardware_1_3.scala 14:26]
    Mod_000.clock <= clock
    Mod_000.reset <= reset
    Mod_000.io.in <= io.in @[RandomHardware_1_3.scala 16:25]
    io.out <= Mod_000.io.out @[RandomHardware_1_3.scala 17:10]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<16>}
    
    node _io_out_T = bits(io.in, 7, 7) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
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
    
  module RegFile2R1W : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    node R1_SEL = bits(io.in, 3, 3) @[Memory.scala 37:28]
    node R2_SEL = bits(io.in, 2, 2) @[Memory.scala 38:28]
    node W_DATA = bits(io.in, 1, 0) @[Memory.scala 39:28]
    reg registers : UInt<2>[2], clock @[Memory.scala 41:22]
    registers[R1_SEL] <= W_DATA @[Memory.scala 44:21]
    node _io_out_T = cat(registers[R1_SEL], registers[R2_SEL]) @[Cat.scala 30:58]
    io.out <= _io_out_T @[Memory.scala 50:10]
    
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
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<11>}
    
    inst Mux2_000 of Mux2_1 @[RandomHardware_1_7.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_7.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_7.scala 17:10]
    
  module ShiftRegister_3 : 
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
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<22>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<22>, clock with : (reset => (reset, UInt<22>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<22>, clock with : (reset => (reset, UInt<22>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<22>, clock with : (reset => (reset, UInt<22>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<22>, clock with : (reset => (reset, UInt<22>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module Add : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<22>, out : UInt<12>}
    
    node in1 = bits(io.in, 21, 11) @[ArithmeticLogical.scala 13:20]
    node in2 = bits(io.in, 10, 0) @[ArithmeticLogical.scala 14:20]
    node _io_out_T = add(in1, in2) @[ArithmeticLogical.scala 15:19]
    node _io_out_T_1 = tail(_io_out_T, 1) @[ArithmeticLogical.scala 15:19]
    io.out <= _io_out_T_1 @[ArithmeticLogical.scala 15:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<23>, out : UInt<12>}
    
    wire wire_000 : UInt<22> @[RandomHardware_1_9.scala 13:24]
    inst ResetShiftRegister_000 of ResetShiftRegister @[RandomHardware_1_9.scala 15:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    inst Add_001 of Add @[RandomHardware_1_9.scala 16:26]
    Add_001.clock <= clock
    Add_001.reset <= reset
    ResetShiftRegister_000.io.in <= io.in @[RandomHardware_1_9.scala 18:33]
    io.out <= Add_001.io.out @[RandomHardware_1_9.scala 19:10]
    wire_000 <= ResetShiftRegister_000.io.out @[RandomHardware_1_9.scala 21:18]
    Add_001.io.in <= wire_000 @[RandomHardware_1_9.scala 22:25]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<7>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<10>, out : UInt<15>}
    
    node _io_out_T = shl(io.in, 5) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ShiftRegister_4 : 
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
    
  module CompareMux_2 : 
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
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_2_0.scala 13:24]
    inst ShiftRegister_000 of ShiftRegister_4 @[RandomHardware_2_0.scala 15:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    inst CompareMux_001 of CompareMux_2 @[RandomHardware_2_0.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_2_0.scala 18:25]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_2_0.scala 21:18]
    ShiftRegister_000.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_13.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_13.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module ShiftRegister_5 : 
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
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<36>, out : UInt<36>}
    
    inst ShiftRegister_000 of ShiftRegister_5 @[RandomHardware_1_14.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_1_14.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_1_14.scala 17:10]
    
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
    
  module RegFile2R1W_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node R1_SEL = bits(io.in, 7, 6) @[Memory.scala 37:28]
    node R2_SEL = bits(io.in, 5, 4) @[Memory.scala 38:28]
    node W_DATA = bits(io.in, 3, 0) @[Memory.scala 39:28]
    reg registers : UInt<4>[4], clock @[Memory.scala 41:22]
    registers[R1_SEL] <= W_DATA @[Memory.scala 44:21]
    node _io_out_T = cat(registers[R1_SEL], registers[R2_SEL]) @[Cat.scala 30:58]
    io.out <= _io_out_T @[Memory.scala 50:10]
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_15.scala 13:24]
    inst Mux2_000 of Mux2_2 @[RandomHardware_1_15.scala 15:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    inst RegFile2R1W_001 of RegFile2R1W_1 @[RandomHardware_1_15.scala 16:34]
    RegFile2R1W_001.clock <= clock
    RegFile2R1W_001.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_15.scala 18:25]
    io.out <= RegFile2R1W_001.io.out @[RandomHardware_1_15.scala 19:10]
    wire_000 <= Mux2_000.io.out @[RandomHardware_1_15.scala 21:18]
    RegFile2R1W_001.io.in <= wire_000 @[RandomHardware_1_15.scala 22:33]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<5>, out : UInt<5>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<8>}
    
    node _io_out_T = bits(io.in, 3, 3) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<4>("h0f"), UInt<4>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<69>}
    
    wire wire_000 : UInt<8> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<12> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<8> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<5> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<4> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<16> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<7> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<15> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<5> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<4> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<10> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<20> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<8> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<8> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<8> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<9> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<5> @[RandomHardware.scala 30:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 32:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 33:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 34:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 35:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst SignExtendDouble_004 of SignExtendDouble @[RandomHardware.scala 36:42]
    SignExtendDouble_004.clock <= clock
    SignExtendDouble_004.reset <= reset
    inst ShiftRegister_005 of ShiftRegister_2 @[RandomHardware.scala 37:42]
    ShiftRegister_005.clock <= clock
    ShiftRegister_005.reset <= reset
    inst RegFile2R1W_006 of RegFile2R1W @[RandomHardware.scala 38:34]
    RegFile2R1W_006.clock <= clock
    RegFile2R1W_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 39:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst ShiftRegister_008 of ShiftRegister_3 @[RandomHardware.scala 40:42]
    ShiftRegister_008.clock <= clock
    ShiftRegister_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 41:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst Accum_010 of Accum @[RandomHardware.scala 42:34]
    Accum_010.clock <= clock
    Accum_010.reset <= reset
    inst ShiftLeft_011 of ShiftLeft @[RandomHardware.scala 43:34]
    ShiftLeft_011.clock <= clock
    ShiftLeft_011.reset <= reset
    inst ShiftLeft_012 of ShiftLeft_1 @[RandomHardware.scala 44:34]
    ShiftLeft_012.clock <= clock
    ShiftLeft_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 45:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 46:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 47:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst ShiftRight_016 of ShiftRight @[RandomHardware.scala 48:34]
    ShiftRight_016.clock <= clock
    ShiftRight_016.reset <= reset
    inst Reg_017 of Reg_1 @[RandomHardware.scala 49:26]
    Reg_017.clock <= clock
    Reg_017.reset <= reset
    inst SignExtendDouble_018 of SignExtendDouble_1 @[RandomHardware.scala 50:42]
    SignExtendDouble_018.clock <= clock
    SignExtendDouble_018.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 52:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 52:33]
    node _RandomHardware_002_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 53:41]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 53:33]
    node _RandomHardware_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 54:41]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 54:33]
    node _RegFile2R1W_006_io_in_T = bits(io.in, 3, 0) @[RandomHardware.scala 55:41]
    RegFile2R1W_006.io.in <= _RegFile2R1W_006_io_in_T @[RandomHardware.scala 55:33]
    node _ShiftRegister_008_io_in_T = bits(io.in, 7, 0) @[RandomHardware.scala 56:41]
    ShiftRegister_008.io.in <= _ShiftRegister_008_io_in_T @[RandomHardware.scala 56:33]
    node _RandomHardware_013_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 57:41]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 57:33]
    node _ShiftRight_016_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 58:33]
    ShiftRight_016.io.in <= _ShiftRight_016_io_in_T @[RandomHardware.scala 58:25]
    node io_out_lo = cat(Reg_017.io.out, SignExtendDouble_018.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(RandomHardware_001.io.out, RandomHardware_007.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, RandomHardware_014.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 59:10]
    SignExtendDouble_004.io.in <= wire_002 @[RandomHardware.scala 61:33]
    wire_005 <= SignExtendDouble_004.io.out @[RandomHardware.scala 62:18]
    ShiftRegister_005.io.in <= wire_003 @[RandomHardware.scala 63:33]
    wire_009 <= ShiftRegister_005.io.out @[RandomHardware.scala 64:18]
    node _RandomHardware_009_io_in_T = cat(wire_007, wire_008) @[Cat.scala 30:58]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 65:33]
    wire_001 <= RandomHardware_009.io.out @[RandomHardware.scala 66:18]
    Accum_010.io.in <= wire_009 @[RandomHardware.scala 67:25]
    wire_017 <= Accum_010.io.out @[RandomHardware.scala 68:18]
    ShiftLeft_011.io.in <= wire_010 @[RandomHardware.scala 69:25]
    wire_006 <= ShiftLeft_011.io.out @[RandomHardware.scala 70:18]
    ShiftLeft_012.io.in <= wire_011 @[RandomHardware.scala 71:25]
    wire_007 <= ShiftLeft_012.io.out @[RandomHardware.scala 72:18]
    node _RandomHardware_015_io_in_T = cat(wire_015, wire_016) @[Cat.scala 30:58]
    RandomHardware_015.io.in <= _RandomHardware_015_io_in_T @[RandomHardware.scala 73:33]
    wire_008 <= RandomHardware_015.io.out @[RandomHardware.scala 74:18]
    wire_012 <= RandomHardware_000.io.out @[RandomHardware.scala 75:18]
    node _wire_003_T = bits(RandomHardware_002.io.out, 9, 5) @[RandomHardware.scala 76:47]
    wire_003 <= _wire_003_T @[RandomHardware.scala 76:18]
    wire_011 <= RandomHardware_002.io.out @[RandomHardware.scala 77:18]
    wire_002 <= RandomHardware_003.io.out @[RandomHardware.scala 78:18]
    wire_015 <= RandomHardware_003.io.out @[RandomHardware.scala 79:18]
    wire_010 <= RegFile2R1W_006.io.out @[RandomHardware.scala 80:18]
    wire_004 <= RegFile2R1W_006.io.out @[RandomHardware.scala 81:18]
    wire_000 <= ShiftRegister_008.io.out @[RandomHardware.scala 82:18]
    wire_013 <= ShiftRegister_008.io.out @[RandomHardware.scala 83:18]
    wire_016 <= RandomHardware_013.io.out @[RandomHardware.scala 84:18]
    wire_014 <= ShiftRight_016.io.out @[RandomHardware.scala 85:18]
    node _RandomHardware_001_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 86:33]
    node _RandomHardware_007_io_in_T = cat(wire_005, wire_006) @[Cat.scala 30:58]
    RandomHardware_007.io.in <= _RandomHardware_007_io_in_T @[RandomHardware.scala 87:33]
    node RandomHardware_014_io_in_hi = cat(wire_012, wire_013) @[Cat.scala 30:58]
    node _RandomHardware_014_io_in_T = cat(RandomHardware_014_io_in_hi, wire_014) @[Cat.scala 30:58]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 88:33]
    Reg_017.io.in <= wire_017 @[RandomHardware.scala 89:25]
    SignExtendDouble_018.io.in <= wire_004 @[RandomHardware.scala 90:33]
    
