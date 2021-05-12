;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
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
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_1_0.scala 14:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_0.scala 16:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_0.scala 17:10]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<18>}
    
    node _io_out_T = shl(io.in, 1) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<18>}
    
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_1.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_1.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_1.scala 17:10]
    
  module ShiftRegister : 
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
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<11>}
    
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
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<7>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_4.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_4.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_4.scala 17:10]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
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
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
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
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8 @[RandomHardware_1_8.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_1_8.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_1_8.scala 17:10]
    
  module ShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
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
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    inst ShiftRegister_000 of ShiftRegister_1 @[RandomHardware_1_9.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_1_9.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_1_9.scala 17:10]
    
  module Accum_4 : 
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
    
    inst Accum_000 of Accum_4 @[RandomHardware_3_0.scala 14:34]
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
    
  module Mod : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<12>}
    
    node in1 = bits(io.in, 23, 12) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 11, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<12>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_10.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_10.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst Mod_001 of Mod @[RandomHardware_1_10.scala 16:26]
    Mod_001.clock <= clock
    Mod_001.reset <= reset
    Mod_001.io.in <= io.in @[RandomHardware_1_10.scala 18:25]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_10.scala 19:10]
    wire_000 <= Mod_001.io.out @[RandomHardware_1_10.scala 21:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_1_10.scala 22:33]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_11.scala 13:24]
    inst Reg_000 of Reg_1 @[RandomHardware_1_11.scala 15:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst ShiftRight_001 of ShiftRight @[RandomHardware_1_11.scala 16:34]
    ShiftRight_001.clock <= clock
    ShiftRight_001.reset <= reset
    ShiftRight_001.io.in <= io.in @[RandomHardware_1_11.scala 18:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_11.scala 19:10]
    wire_000 <= ShiftRight_001.io.out @[RandomHardware_1_11.scala 21:18]
    Reg_000.io.in <= wire_000 @[RandomHardware_1_11.scala 22:25]
    
  module ShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    inst ShiftRegister_000 of ShiftRegister_2 @[RandomHardware_1_12.scala 14:42]
    ShiftRegister_000.clock <= clock
    ShiftRegister_000.reset <= reset
    ShiftRegister_000.io.in <= io.in @[RandomHardware_1_12.scala 16:33]
    io.out <= ShiftRegister_000.io.out @[RandomHardware_1_12.scala 17:10]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    node IN1 = bits(io.in, 23, 16) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 15, 8) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<16>}
    
    node _io_out_T = bits(io.in, 7, 7) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<16>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_13.scala 13:24]
    inst ReduceXorMux_000 of ReduceXorMux_1 @[RandomHardware_1_13.scala 15:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble @[RandomHardware_1_13.scala 16:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    ReduceXorMux_000.io.in <= io.in @[RandomHardware_1_13.scala 18:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_1_13.scala 19:10]
    wire_000 <= ReduceXorMux_000.io.out @[RandomHardware_1_13.scala 21:18]
    SignExtendDouble_001.io.in <= wire_000 @[RandomHardware_1_13.scala 22:33]
    
  module RegFile2R1W : 
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
    
  module CompareMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    node IN1 = bits(io.in, 23, 12) @[Muxes.scala 134:27]
    node IN2 = bits(io.in, 15, 8) @[Muxes.scala 135:27]
    node SEL1 = bits(io.in, 7, 4) @[Muxes.scala 136:27]
    node SEL2 = bits(io.in, 3, 0) @[Muxes.scala 137:27]
    node _io_out_T = geq(SEL1, SEL2) @[Muxes.scala 139:24]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 139:18]
    io.out <= _io_out_T_1 @[Muxes.scala 139:12]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<8>}
    
    wire wire_000 : UInt<8> @[RandomHardware_1_14.scala 13:24]
    inst RegFile2R1W_000 of RegFile2R1W @[RandomHardware_1_14.scala 15:34]
    RegFile2R1W_000.clock <= clock
    RegFile2R1W_000.reset <= reset
    inst CompareMux_001 of CompareMux @[RandomHardware_1_14.scala 16:34]
    CompareMux_001.clock <= clock
    CompareMux_001.reset <= reset
    CompareMux_001.io.in <= io.in @[RandomHardware_1_14.scala 18:25]
    io.out <= RegFile2R1W_000.io.out @[RandomHardware_1_14.scala 19:10]
    wire_000 <= CompareMux_001.io.out @[RandomHardware_1_14.scala 21:18]
    RegFile2R1W_000.io.in <= wire_000 @[RandomHardware_1_14.scala 22:33]
    
  module Accum_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Accum_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    node IN1 = bits(io.in, 23, 15) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 14, 6) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<9>}
    
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_17.scala 14:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    ReduceOrMux_000.io.in <= io.in @[RandomHardware_1_17.scala 16:33]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_17.scala 17:10]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<11>}
    
    node _io_out_T = shl(io.in, 2) @[ArithmeticLogical.scala 94:21]
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
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<11>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_18.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft_1 @[RandomHardware_1_18.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst Mux2_001 of Mux2 @[RandomHardware_1_18.scala 16:26]
    Mux2_001.clock <= clock
    Mux2_001.reset <= reset
    Mux2_001.io.in <= io.in @[RandomHardware_1_18.scala 18:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_18.scala 19:10]
    wire_000 <= Mux2_001.io.out @[RandomHardware_1_18.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_18.scala 22:25]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<52>}
    
    wire wire_000 : UInt<12> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<5> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<8> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<11> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<8> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<8> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<8> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<8> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<8> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<11> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<8> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<16> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<12> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<7> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<9> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<8> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<8> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<8> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<16> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<7> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<12> @[RandomHardware.scala 33:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 35:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 36:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst ShiftRegister_002 of ShiftRegister @[RandomHardware.scala 37:42]
    ShiftRegister_002.clock <= clock
    ShiftRegister_002.reset <= reset
    inst Accum_003 of Accum @[RandomHardware.scala 38:34]
    Accum_003.clock <= clock
    Accum_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 39:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst Reg_005 of Reg @[RandomHardware.scala 40:26]
    Reg_005.clock <= clock
    Reg_005.reset <= reset
    inst Accum_006 of Accum_2 @[RandomHardware.scala 41:34]
    Accum_006.clock <= clock
    Accum_006.reset <= reset
    inst Accum_007 of Accum_3 @[RandomHardware.scala 42:34]
    Accum_007.clock <= clock
    Accum_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 43:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 44:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 45:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst RandomHardware_011 of RandomHardware_1_11 @[RandomHardware.scala 46:42]
    RandomHardware_011.clock <= clock
    RandomHardware_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 47:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 48:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 49:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    inst Accum_015 of Accum_5 @[RandomHardware.scala 50:34]
    Accum_015.clock <= clock
    Accum_015.reset <= reset
    inst Accum_016 of Accum_6 @[RandomHardware.scala 51:34]
    Accum_016.clock <= clock
    Accum_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 52:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 53:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 55:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 55:33]
    node _RandomHardware_010_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 56:41]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 56:33]
    node _RandomHardware_013_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 57:41]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 57:33]
    node _RandomHardware_014_io_in_T = bits(io.in, 99, 76) @[RandomHardware.scala 58:41]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 58:33]
    node _Accum_016_io_in_T = bits(io.in, 7, 0) @[RandomHardware.scala 59:33]
    Accum_016.io.in <= _Accum_016_io_in_T @[RandomHardware.scala 59:25]
    node io_out_lo = cat(RandomHardware_009.io.out, Accum_015.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(RandomHardware_001.io.out, ShiftRegister_002.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, RandomHardware_008.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 60:10]
    Accum_003.io.in <= wire_003 @[RandomHardware.scala 62:25]
    wire_009 <= Accum_003.io.out @[RandomHardware.scala 63:18]
    node _RandomHardware_004_io_in_T = cat(wire_004, wire_005) @[Cat.scala 30:58]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 64:33]
    wire_013 <= RandomHardware_004.io.out @[RandomHardware.scala 65:18]
    wire_019 <= RandomHardware_004.io.out @[RandomHardware.scala 66:18]
    Reg_005.io.in <= wire_006 @[RandomHardware.scala 67:25]
    wire_007 <= Reg_005.io.out @[RandomHardware.scala 68:18]
    wire_010 <= Reg_005.io.out @[RandomHardware.scala 69:18]
    wire_015 <= Reg_005.io.out @[RandomHardware.scala 70:18]
    Accum_006.io.in <= wire_007 @[RandomHardware.scala 71:25]
    wire_002 <= Accum_006.io.out @[RandomHardware.scala 72:18]
    Accum_007.io.in <= wire_008 @[RandomHardware.scala 73:25]
    wire_006 <= Accum_007.io.out @[RandomHardware.scala 74:18]
    RandomHardware_011.io.in <= wire_012 @[RandomHardware.scala 75:33]
    wire_020 <= RandomHardware_011.io.out @[RandomHardware.scala 76:18]
    node _RandomHardware_012_io_in_T = cat(wire_013, wire_014) @[Cat.scala 30:58]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 77:33]
    wire_011 <= RandomHardware_012.io.out @[RandomHardware.scala 78:18]
    node _RandomHardware_017_io_in_T = cat(wire_017, wire_018) @[Cat.scala 30:58]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 79:33]
    wire_014 <= RandomHardware_017.io.out @[RandomHardware.scala 80:18]
    node _RandomHardware_018_io_in_T = cat(wire_019, wire_020) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 81:33]
    node _wire_001_T = bits(RandomHardware_018.io.out, 4, 0) @[RandomHardware.scala 82:47]
    wire_001 <= _wire_001_T @[RandomHardware.scala 82:18]
    wire_003 <= RandomHardware_018.io.out @[RandomHardware.scala 83:18]
    wire_017 <= RandomHardware_000.io.out @[RandomHardware.scala 84:18]
    wire_000 <= RandomHardware_010.io.out @[RandomHardware.scala 85:18]
    wire_012 <= RandomHardware_010.io.out @[RandomHardware.scala 86:18]
    wire_018 <= RandomHardware_013.io.out @[RandomHardware.scala 87:18]
    wire_004 <= RandomHardware_014.io.out @[RandomHardware.scala 88:18]
    wire_005 <= Accum_016.io.out @[RandomHardware.scala 89:18]
    wire_008 <= Accum_016.io.out @[RandomHardware.scala 90:18]
    wire_016 <= Accum_016.io.out @[RandomHardware.scala 91:18]
    node _RandomHardware_001_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 92:33]
    ShiftRegister_002.io.in <= wire_002 @[RandomHardware.scala 93:33]
    node _RandomHardware_008_io_in_T = cat(wire_009, wire_010) @[Cat.scala 30:58]
    RandomHardware_008.io.in <= _RandomHardware_008_io_in_T @[RandomHardware.scala 94:33]
    RandomHardware_009.io.in <= wire_011 @[RandomHardware.scala 95:33]
    node _Accum_015_io_in_T = cat(wire_015, wire_016) @[Cat.scala 30:58]
    Accum_015.io.in <= _Accum_015_io_in_T @[RandomHardware.scala 96:25]
    
