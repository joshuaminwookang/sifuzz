;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
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
    
  module ReduceAndMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    node IN1 = bits(io.in, 17, 10) @[Muxes.scala 98:27]
    node IN2 = bits(io.in, 9, 2) @[Muxes.scala 99:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 100:27]
    node _io_out_T = andr(SEL) @[Muxes.scala 102:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 102:18]
    io.out <= _io_out_T_1 @[Muxes.scala 102:12]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<40>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    node IN1 = bits(io.in, 39, 23) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 22, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    wire wire_000 : UInt<40> @[RandomHardware_2_1.scala 13:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_2_1.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_1.scala 18:25]
    io.out <= ReduceXorMux_001.io.out @[RandomHardware_2_1.scala 19:10]
    wire_000 <= ShiftRight_000.io.out @[RandomHardware_2_1.scala 21:18]
    ReduceXorMux_001.io.in <= wire_000 @[RandomHardware_2_1.scala 22:33]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<8>}
    
    wire wire_000 : UInt<20> @[RandomHardware_1_1.scala 13:24]
    inst ReduceAndMux_000 of ReduceAndMux @[RandomHardware_1_1.scala 15:34]
    ReduceAndMux_000.clock <= clock
    ReduceAndMux_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_1.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_1.scala 18:33]
    io.out <= ReduceAndMux_000.io.out @[RandomHardware_1_1.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_1.scala 21:18]
    ReduceAndMux_000.io.in <= wire_000 @[RandomHardware_1_1.scala 22:33]
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<28>}
    
    node _io_out_T = bits(io.in, 13, 13) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<14>("h03fff"), UInt<14>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
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
    
  module RandomHardware_3_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<14>}
    
    inst RandomHardware_000 of RandomHardware_3_0 @[RandomHardware_2_2.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_2.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_2.scala 17:10]
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<14>, out : UInt<14>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<28>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_2.scala 13:24]
    wire wire_001 : UInt<14> @[RandomHardware_1_2.scala 14:24]
    wire wire_002 : UInt<14> @[RandomHardware_1_2.scala 15:24]
    inst ShiftRight_000 of ShiftRight_1 @[RandomHardware_1_2.scala 17:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst SignExtendDouble_001 of SignExtendDouble @[RandomHardware_1_2.scala 18:42]
    SignExtendDouble_001.clock <= clock
    SignExtendDouble_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_2_2 @[RandomHardware_1_2.scala 19:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst ShiftRight_003 of ShiftRight_2 @[RandomHardware_1_2.scala 20:34]
    ShiftRight_003.clock <= clock
    ShiftRight_003.reset <= reset
    RandomHardware_002.io.in <= io.in @[RandomHardware_1_2.scala 22:33]
    io.out <= SignExtendDouble_001.io.out @[RandomHardware_1_2.scala 23:10]
    ShiftRight_000.io.in <= wire_001 @[RandomHardware_1_2.scala 25:25]
    wire_000 <= ShiftRight_000.io.out @[RandomHardware_1_2.scala 26:18]
    ShiftRight_003.io.in <= wire_000 @[RandomHardware_1_2.scala 27:25]
    wire_002 <= ShiftRight_003.io.out @[RandomHardware_1_2.scala 28:18]
    wire_001 <= RandomHardware_002.io.out @[RandomHardware_1_2.scala 29:18]
    SignExtendDouble_001.io.in <= wire_002 @[RandomHardware_1_2.scala 30:33]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    inst Reg_000 of Reg @[RandomHardware_1_3.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_3.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_3.scala 17:10]
    
  module ShiftRight_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst ShiftRight_000 of ShiftRight_3 @[RandomHardware_1_4.scala 14:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_1_4.scala 16:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_1_4.scala 17:10]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<27>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<27>, clock with : (reset => (reset, UInt<27>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<27>, clock with : (reset => (reset, UInt<27>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<27>, clock with : (reset => (reset, UInt<27>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<27>, clock with : (reset => (reset, UInt<27>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<34>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<61>, out : UInt<122>}
    
    node _io_out_T = bits(io.in, 60, 60) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<61>("h01fffffffffffffff"), UInt<61>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<62>, out : UInt<122>}
    
    wire wire_000 : UInt<27> @[RandomHardware_1_5.scala 13:24]
    wire wire_001 : UInt<34> @[RandomHardware_1_5.scala 14:24]
    inst ResetShiftRegister_000 of ResetShiftRegister @[RandomHardware_1_5.scala 16:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    inst Accum_001 of Accum @[RandomHardware_1_5.scala 17:34]
    Accum_001.clock <= clock
    Accum_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble_1 @[RandomHardware_1_5.scala 18:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    node _ResetShiftRegister_000_io_in_T = bits(io.in, 61, 34) @[RandomHardware_1_5.scala 20:41]
    ResetShiftRegister_000.io.in <= _ResetShiftRegister_000_io_in_T @[RandomHardware_1_5.scala 20:33]
    node _Accum_001_io_in_T = bits(io.in, 61, 28) @[RandomHardware_1_5.scala 21:33]
    Accum_001.io.in <= _Accum_001_io_in_T @[RandomHardware_1_5.scala 21:25]
    io.out <= SignExtendDouble_002.io.out @[RandomHardware_1_5.scala 22:10]
    wire_000 <= ResetShiftRegister_000.io.out @[RandomHardware_1_5.scala 24:18]
    wire_001 <= Accum_001.io.out @[RandomHardware_1_5.scala 25:18]
    node _SignExtendDouble_002_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    SignExtendDouble_002.io.in <= _SignExtendDouble_002_io_in_T @[RandomHardware_1_5.scala 26:33]
    
  module Mux8_1 : 
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
    
  module RandomHardware_3_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_1 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_1 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<9>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_6.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_6.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_6.scala 17:10]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<13>, out : UInt<17>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<13>}
    
    node IN1 = bits(io.in, 27, 15) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 14, 2) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module ShiftRight_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<17>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<28>, out : UInt<17>}
    
    wire wire_000 : UInt<17> @[RandomHardware_1_7.scala 13:24]
    wire wire_001 : UInt<13> @[RandomHardware_1_7.scala 14:24]
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_7.scala 16:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_1 @[RandomHardware_1_7.scala 17:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    inst ShiftRight_002 of ShiftRight_4 @[RandomHardware_1_7.scala 18:34]
    ShiftRight_002.clock <= clock
    ShiftRight_002.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_1_7.scala 20:33]
    io.out <= ShiftRight_002.io.out @[RandomHardware_1_7.scala 21:10]
    ShiftLeft_000.io.in <= wire_001 @[RandomHardware_1_7.scala 23:25]
    wire_000 <= ShiftLeft_000.io.out @[RandomHardware_1_7.scala 24:18]
    wire_001 <= ReduceXorMux_001.io.out @[RandomHardware_1_7.scala 25:18]
    ShiftRight_002.io.in <= wire_000 @[RandomHardware_1_7.scala 26:25]
    
  module Mux8_2 : 
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
    
  module RandomHardware_3_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_2 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_2 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<10>}
    
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_8.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_8.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_8.scala 17:10]
    
  module Mux8_3 : 
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
    
  module RandomHardware_3_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_3 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_3 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module ShiftRight_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<40>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceXorMux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    node IN1 = bits(io.in, 39, 23) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 22, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    wire wire_000 : UInt<40> @[RandomHardware_2_1.scala 13:24]
    inst ShiftRight_000 of ShiftRight_5 @[RandomHardware_2_1.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_2 @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_1.scala 18:25]
    io.out <= ReduceXorMux_001.io.out @[RandomHardware_2_1.scala 19:10]
    wire_000 <= ShiftRight_000.io.out @[RandomHardware_2_1.scala 21:18]
    ReduceXorMux_001.io.in <= wire_000 @[RandomHardware_2_1.scala 22:33]
    
  module ReduceOrMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<38>, out : UInt<15>}
    
    node IN1 = bits(io.in, 37, 23) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 22, 8) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 7, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<32>}
    
    node _io_out_T = bits(io.in, 15, 15) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<31>, out : UInt<34>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
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
    
  module Mux4 : 
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
    
  module ResetShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<16>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module Mod : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<17>}
    
    node in1 = bits(io.in, 33, 17) @[ArithmeticLogical.scala 71:20]
    node in2 = bits(io.in, 16, 0) @[ArithmeticLogical.scala 72:20]
    node _io_out_T = rem(in1, in2) @[ArithmeticLogical.scala 73:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 73:12]
    
  module ReduceXorMux_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<14>}
    
    node IN1 = bits(io.in, 33, 20) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 19, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<67>, out : UInt<53>}
    
    wire wire_000 : UInt<17> @[RandomHardware_1_9.scala 13:24]
    wire wire_001 : UInt<32> @[RandomHardware_1_9.scala 14:24]
    wire wire_002 : UInt<6> @[RandomHardware_1_9.scala 15:24]
    wire wire_003 : UInt<34> @[RandomHardware_1_9.scala 16:24]
    wire wire_004 : UInt<14> @[RandomHardware_1_9.scala 17:24]
    wire wire_005 : UInt<9> @[RandomHardware_1_9.scala 18:24]
    wire wire_006 : UInt<17> @[RandomHardware_1_9.scala 19:24]
    wire wire_007 : UInt<17> @[RandomHardware_1_9.scala 20:24]
    wire wire_008 : UInt<34> @[RandomHardware_1_9.scala 21:24]
    inst RandomHardware_000 of RandomHardware_2_0_2 @[RandomHardware_1_9.scala 23:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_1 @[RandomHardware_1_9.scala 24:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst ReduceOrMux_002 of ReduceOrMux @[RandomHardware_1_9.scala 25:34]
    ReduceOrMux_002.clock <= clock
    ReduceOrMux_002.reset <= reset
    inst SignExtendDouble_003 of SignExtendDouble_2 @[RandomHardware_1_9.scala 26:42]
    SignExtendDouble_003.clock <= clock
    SignExtendDouble_003.reset <= reset
    inst ShiftLeft_004 of ShiftLeft_1 @[RandomHardware_1_9.scala 27:34]
    ShiftLeft_004.clock <= clock
    ShiftLeft_004.reset <= reset
    inst ShiftRegister_005 of ShiftRegister @[RandomHardware_1_9.scala 28:42]
    ShiftRegister_005.clock <= clock
    ShiftRegister_005.reset <= reset
    inst Mux4_006 of Mux4 @[RandomHardware_1_9.scala 29:26]
    Mux4_006.clock <= clock
    Mux4_006.reset <= reset
    inst ResetShiftRegister_007 of ResetShiftRegister_1 @[RandomHardware_1_9.scala 30:42]
    ResetShiftRegister_007.clock <= clock
    ResetShiftRegister_007.reset <= reset
    inst Mod_008 of Mod @[RandomHardware_1_9.scala 31:26]
    Mod_008.clock <= clock
    Mod_008.reset <= reset
    inst ReduceXorMux_009 of ReduceXorMux_3 @[RandomHardware_1_9.scala 32:34]
    ReduceXorMux_009.clock <= clock
    ReduceXorMux_009.reset <= reset
    node _RandomHardware_000_io_in_T = bits(io.in, 66, 47) @[RandomHardware_1_9.scala 34:41]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware_1_9.scala 34:33]
    node _SignExtendDouble_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware_1_9.scala 35:41]
    SignExtendDouble_003.io.in <= _SignExtendDouble_003_io_in_T @[RandomHardware_1_9.scala 35:33]
    node _ShiftLeft_004_io_in_T = bits(io.in, 30, 0) @[RandomHardware_1_9.scala 36:33]
    ShiftLeft_004.io.in <= _ShiftLeft_004_io_in_T @[RandomHardware_1_9.scala 36:25]
    node io_out_lo = cat(ShiftRegister_005.io.out, ResetShiftRegister_007.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(RandomHardware_001.io.out, ReduceOrMux_002.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware_1_9.scala 37:10]
    node _Mux4_006_io_in_T = cat(wire_005, wire_006) @[Cat.scala 30:58]
    Mux4_006.io.in <= _Mux4_006_io_in_T @[RandomHardware_1_9.scala 39:25]
    wire_002 <= Mux4_006.io.out @[RandomHardware_1_9.scala 40:18]
    Mod_008.io.in <= wire_008 @[RandomHardware_1_9.scala 41:25]
    wire_000 <= Mod_008.io.out @[RandomHardware_1_9.scala 42:18]
    wire_006 <= Mod_008.io.out @[RandomHardware_1_9.scala 43:18]
    wire_007 <= Mod_008.io.out @[RandomHardware_1_9.scala 44:18]
    ReduceXorMux_009.io.in <= wire_003 @[RandomHardware_1_9.scala 45:33]
    wire_004 <= ReduceXorMux_009.io.out @[RandomHardware_1_9.scala 46:18]
    wire_005 <= RandomHardware_000.io.out @[RandomHardware_1_9.scala 47:18]
    wire_001 <= SignExtendDouble_003.io.out @[RandomHardware_1_9.scala 48:18]
    wire_008 <= ShiftLeft_004.io.out @[RandomHardware_1_9.scala 49:18]
    wire_003 <= ShiftLeft_004.io.out @[RandomHardware_1_9.scala 50:18]
    RandomHardware_001.io.in <= wire_000 @[RandomHardware_1_9.scala 51:33]
    node _ReduceOrMux_002_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    ReduceOrMux_002.io.in <= _ReduceOrMux_002_io_in_T @[RandomHardware_1_9.scala 52:33]
    ShiftRegister_005.io.in <= wire_004 @[RandomHardware_1_9.scala 53:33]
    ResetShiftRegister_007.io.in <= wire_007 @[RandomHardware_1_9.scala 54:33]
    
  module Mux8_4 : 
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
    
  module RandomHardware_3_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_4 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_4 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module ShiftRight_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<40>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceXorMux_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    node IN1 = bits(io.in, 39, 23) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 22, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    wire wire_000 : UInt<40> @[RandomHardware_2_1.scala 13:24]
    inst ShiftRight_000 of ShiftRight_6 @[RandomHardware_2_1.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_4 @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_1.scala 18:25]
    io.out <= ReduceXorMux_001.io.out @[RandomHardware_2_1.scala 19:10]
    wire_000 <= ShiftRight_000.io.out @[RandomHardware_2_1.scala 21:18]
    ReduceXorMux_001.io.in <= wire_000 @[RandomHardware_2_1.scala 22:33]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<26>, out : UInt<28>}
    
    wire wire_000 : UInt<14> @[RandomHardware_1_10.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_3 @[RandomHardware_1_10.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_2 @[RandomHardware_1_10.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_10.scala 18:33]
    io.out <= RandomHardware_001.io.out @[RandomHardware_1_10.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_10.scala 21:18]
    RandomHardware_001.io.in <= wire_000 @[RandomHardware_1_10.scala 22:33]
    
  module SignExtendDouble_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<16>}
    
    node _io_out_T = bits(io.in, 7, 7) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
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
    
  module Accum_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<17>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module ShiftRight_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<40>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ReduceXorMux_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    node IN1 = bits(io.in, 39, 23) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 22, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_2_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    wire wire_000 : UInt<40> @[RandomHardware_2_1.scala 13:24]
    inst ShiftRight_000 of ShiftRight_7 @[RandomHardware_2_1.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_5 @[RandomHardware_2_1.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ShiftRight_000.io.in <= io.in @[RandomHardware_2_1.scala 18:25]
    io.out <= ReduceXorMux_001.io.out @[RandomHardware_2_1.scala 19:10]
    wire_000 <= ShiftRight_000.io.out @[RandomHardware_2_1.scala 21:18]
    ReduceXorMux_001.io.in <= wire_000 @[RandomHardware_2_1.scala 22:33]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<40>, out : UInt<17>}
    
    wire wire_000 : UInt<17> @[RandomHardware_1_13.scala 13:24]
    inst Accum_000 of Accum_1 @[RandomHardware_1_13.scala 15:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1_3 @[RandomHardware_1_13.scala 16:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_13.scala 18:33]
    io.out <= Accum_000.io.out @[RandomHardware_1_13.scala 19:10]
    wire_000 <= RandomHardware_001.io.out @[RandomHardware_1_13.scala 21:18]
    Accum_000.io.in <= wire_000 @[RandomHardware_1_13.scala 22:25]
    
  module Accum_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
  module Mux2 : 
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
    
  module RandomHardware_1_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<8>}
    
    inst Mux2_000 of Mux2 @[RandomHardware_1_15.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_15.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_15.scala 17:10]
    
  module Mux8_5 : 
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
    
  module RandomHardware_3_0_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_5 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_5 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<4>}
    
    inst RandomHardware_000 of RandomHardware_2_0_4 @[RandomHardware_1_16.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_16.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_16.scala 17:10]
    
  module Mux8_6 : 
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
    
  module RandomHardware_3_0_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_6 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_6 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<32>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt<5>}
    
    wire wire_000 : UInt<32> @[RandomHardware_1_17.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_5 @[RandomHardware_1_17.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst Reg_001 of Reg_1 @[RandomHardware_1_17.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    Reg_001.io.in <= io.in @[RandomHardware_1_17.scala 18:25]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_17.scala 19:10]
    wire_000 <= Reg_001.io.out @[RandomHardware_1_17.scala 21:18]
    RandomHardware_000.io.in <= wire_000 @[RandomHardware_1_17.scala 22:33]
    
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
    
  module RandomHardware_1_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<25>, out : UInt<12>}
    
    inst Mux2_000 of Mux2_1 @[RandomHardware_1_18.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_18.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_18.scala 17:10]
    
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
    
  module RandomHardware_1_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<17>, out : UInt<8>}
    
    inst Mux2_000 of Mux2_2 @[RandomHardware_1_19.scala 14:26]
    Mux2_000.clock <= clock
    Mux2_000.reset <= reset
    Mux2_000.io.in <= io.in @[RandomHardware_1_19.scala 16:25]
    io.out <= Mux2_000.io.out @[RandomHardware_1_19.scala 17:10]
    
  module SignExtendDouble_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<18>}
    
    node _io_out_T = bits(io.in, 8, 8) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<9>("h01ff"), UInt<9>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<9>, out : UInt<9>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module ReduceOrMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<9>}
    
    node IN1 = bits(io.in, 19, 11) @[Muxes.scala 110:27]
    node IN2 = bits(io.in, 10, 2) @[Muxes.scala 111:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 112:27]
    node _io_out_T = orr(SEL) @[Muxes.scala 114:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 114:18]
    io.out <= _io_out_T_1 @[Muxes.scala 114:12]
    
  module RandomHardware_1_21 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<9>}
    
    wire wire_000 : UInt<9> @[RandomHardware_1_21.scala 13:24]
    inst Reg_000 of Reg_2 @[RandomHardware_1_21.scala 15:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    inst ReduceOrMux_001 of ReduceOrMux_1 @[RandomHardware_1_21.scala 16:34]
    ReduceOrMux_001.clock <= clock
    ReduceOrMux_001.reset <= reset
    ReduceOrMux_001.io.in <= io.in @[RandomHardware_1_21.scala 18:33]
    io.out <= Reg_000.io.out @[RandomHardware_1_21.scala 19:10]
    wire_000 <= ReduceOrMux_001.io.out @[RandomHardware_1_21.scala 21:18]
    Reg_000.io.in <= wire_000 @[RandomHardware_1_21.scala 22:25]
    
  module ResetShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<23>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<23>, clock with : (reset => (reset, UInt<23>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<23>, clock with : (reset => (reset, UInt<23>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<23>, clock with : (reset => (reset, UInt<23>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<23>, clock with : (reset => (reset, UInt<23>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_1_22 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<24>, out : UInt<23>}
    
    inst ResetShiftRegister_000 of ResetShiftRegister_2 @[RandomHardware_1_22.scala 14:42]
    ResetShiftRegister_000.clock <= clock
    ResetShiftRegister_000.reset <= reset
    ResetShiftRegister_000.io.in <= io.in @[RandomHardware_1_22.scala 16:33]
    io.out <= ResetShiftRegister_000.io.out @[RandomHardware_1_22.scala 17:10]
    
  module Mux8_7 : 
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
    
  module RandomHardware_3_0_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst Mux8_000 of Mux8_7 @[RandomHardware_3_0.scala 14:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    Mux8_000.io.in <= io.in @[RandomHardware_3_0.scala 16:25]
    io.out <= Mux8_000.io.out @[RandomHardware_3_0.scala 17:10]
    
  module RandomHardware_2_0_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_3_0_7 @[RandomHardware_2_0.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 17:10]
    
  module RandomHardware_1_23 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<19>, out : UInt<2>}
    
    inst RandomHardware_000 of RandomHardware_2_0_6 @[RandomHardware_1_23.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_23.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_23.scala 17:10]
    
  module ShiftRight_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<210>}
    
    wire wire_000 : UInt<8> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<16> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<12> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<16> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<53> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<11> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<16> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<28> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<12> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<8> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<16> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<16> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<12> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<23> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<17> @[RandomHardware.scala 27:24]
    wire wire_015 : UInt<9> @[RandomHardware.scala 28:24]
    wire wire_016 : UInt<8> @[RandomHardware.scala 29:24]
    wire wire_017 : UInt<8> @[RandomHardware.scala 30:24]
    wire wire_018 : UInt<28> @[RandomHardware.scala 31:24]
    wire wire_019 : UInt<12> @[RandomHardware.scala 32:24]
    wire wire_020 : UInt<9> @[RandomHardware.scala 33:24]
    wire wire_021 : UInt<17> @[RandomHardware.scala 34:24]
    wire wire_022 : UInt<16> @[RandomHardware.scala 35:24]
    wire wire_023 : UInt<8> @[RandomHardware.scala 36:24]
    wire wire_024 : UInt<8> @[RandomHardware.scala 37:24]
    wire wire_025 : UInt<16> @[RandomHardware.scala 38:24]
    wire wire_026 : UInt<16> @[RandomHardware.scala 39:24]
    wire wire_027 : UInt<9> @[RandomHardware.scala 40:24]
    wire wire_028 : UInt<9> @[RandomHardware.scala 41:24]
    wire wire_029 : UInt<8> @[RandomHardware.scala 42:24]
    wire wire_030 : UInt<9> @[RandomHardware.scala 43:24]
    wire wire_031 : UInt<5> @[RandomHardware.scala 44:24]
    wire wire_032 : UInt<8> @[RandomHardware.scala 45:24]
    inst RegFile2R1W_000 of RegFile2R1W @[RandomHardware.scala 47:34]
    RegFile2R1W_000.clock <= clock
    RegFile2R1W_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 48:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 49:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst RandomHardware_003 of RandomHardware_1_3 @[RandomHardware.scala 50:42]
    RandomHardware_003.clock <= clock
    RandomHardware_003.reset <= reset
    inst RandomHardware_004 of RandomHardware_1_4 @[RandomHardware.scala 51:42]
    RandomHardware_004.clock <= clock
    RandomHardware_004.reset <= reset
    inst RandomHardware_005 of RandomHardware_1_5 @[RandomHardware.scala 52:42]
    RandomHardware_005.clock <= clock
    RandomHardware_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 53:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst RandomHardware_007 of RandomHardware_1_7 @[RandomHardware.scala 54:42]
    RandomHardware_007.clock <= clock
    RandomHardware_007.reset <= reset
    inst RandomHardware_008 of RandomHardware_1_8 @[RandomHardware.scala 55:42]
    RandomHardware_008.clock <= clock
    RandomHardware_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 56:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 57:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst SignExtendDouble_011 of SignExtendDouble_3 @[RandomHardware.scala 58:42]
    SignExtendDouble_011.clock <= clock
    SignExtendDouble_011.reset <= reset
    inst ShiftRegister_012 of ShiftRegister_1 @[RandomHardware.scala 59:42]
    ShiftRegister_012.clock <= clock
    ShiftRegister_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 60:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst Accum_014 of Accum_2 @[RandomHardware.scala 61:34]
    Accum_014.clock <= clock
    Accum_014.reset <= reset
    inst RandomHardware_015 of RandomHardware_1_15 @[RandomHardware.scala 62:42]
    RandomHardware_015.clock <= clock
    RandomHardware_015.reset <= reset
    inst RandomHardware_016 of RandomHardware_1_16 @[RandomHardware.scala 63:42]
    RandomHardware_016.clock <= clock
    RandomHardware_016.reset <= reset
    inst RandomHardware_017 of RandomHardware_1_17 @[RandomHardware.scala 64:42]
    RandomHardware_017.clock <= clock
    RandomHardware_017.reset <= reset
    inst RandomHardware_018 of RandomHardware_1_18 @[RandomHardware.scala 65:42]
    RandomHardware_018.clock <= clock
    RandomHardware_018.reset <= reset
    inst RandomHardware_019 of RandomHardware_1_19 @[RandomHardware.scala 66:42]
    RandomHardware_019.clock <= clock
    RandomHardware_019.reset <= reset
    inst SignExtendDouble_020 of SignExtendDouble_4 @[RandomHardware.scala 67:42]
    SignExtendDouble_020.clock <= clock
    SignExtendDouble_020.reset <= reset
    inst RandomHardware_021 of RandomHardware_1_21 @[RandomHardware.scala 68:42]
    RandomHardware_021.clock <= clock
    RandomHardware_021.reset <= reset
    inst RandomHardware_022 of RandomHardware_1_22 @[RandomHardware.scala 69:42]
    RandomHardware_022.clock <= clock
    RandomHardware_022.reset <= reset
    inst RandomHardware_023 of RandomHardware_1_23 @[RandomHardware.scala 70:42]
    RandomHardware_023.clock <= clock
    RandomHardware_023.reset <= reset
    inst ShiftRight_024 of ShiftRight_8 @[RandomHardware.scala 71:34]
    ShiftRight_024.clock <= clock
    ShiftRight_024.reset <= reset
    node _RandomHardware_001_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 73:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 73:33]
    node _RandomHardware_003_io_in_T = bits(io.in, 15, 0) @[RandomHardware.scala 74:41]
    RandomHardware_003.io.in <= _RandomHardware_003_io_in_T @[RandomHardware.scala 74:33]
    node _RandomHardware_004_io_in_T = bits(io.in, 11, 0) @[RandomHardware.scala 75:41]
    RandomHardware_004.io.in <= _RandomHardware_004_io_in_T @[RandomHardware.scala 75:33]
    node _RandomHardware_021_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 76:41]
    RandomHardware_021.io.in <= _RandomHardware_021_io_in_T @[RandomHardware.scala 76:33]
    node _RandomHardware_022_io_in_T = bits(io.in, 23, 0) @[RandomHardware.scala 77:41]
    RandomHardware_022.io.in <= _RandomHardware_022_io_in_T @[RandomHardware.scala 77:33]
    node _ShiftRight_024_io_in_T = bits(io.in, 99, 92) @[RandomHardware.scala 78:33]
    ShiftRight_024.io.in <= _ShiftRight_024_io_in_T @[RandomHardware.scala 78:25]
    node io_out_lo_lo = cat(SignExtendDouble_020.io.out, RandomHardware_023.io.out) @[Cat.scala 30:58]
    node io_out_lo_hi = cat(RandomHardware_016.io.out, RandomHardware_019.io.out) @[Cat.scala 30:58]
    node io_out_lo = cat(io_out_lo_hi, io_out_lo_lo) @[Cat.scala 30:58]
    node io_out_hi_lo = cat(RandomHardware_010.io.out, Accum_014.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi_hi = cat(RandomHardware_005.io.out, RandomHardware_006.io.out) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(io_out_hi_hi_hi, RandomHardware_008.io.out) @[Cat.scala 30:58]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 79:10]
    RegFile2R1W_000.io.in <= wire_000 @[RandomHardware.scala 81:33]
    wire_023 <= RegFile2R1W_000.io.out @[RandomHardware.scala 82:18]
    node _RandomHardware_002_io_in_T = cat(wire_001, wire_002) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 83:33]
    wire_007 <= RandomHardware_002.io.out @[RandomHardware.scala 84:18]
    wire_018 <= RandomHardware_002.io.out @[RandomHardware.scala 85:18]
    node _wire_020_T = bits(RandomHardware_002.io.out, 8, 0) @[RandomHardware.scala 86:47]
    wire_020 <= _wire_020_T @[RandomHardware.scala 86:18]
    RandomHardware_007.io.in <= wire_007 @[RandomHardware.scala 87:33]
    wire_014 <= RandomHardware_007.io.out @[RandomHardware.scala 88:18]
    node RandomHardware_009_io_in_lo = cat(wire_012, wire_013) @[Cat.scala 30:58]
    node RandomHardware_009_io_in_hi = cat(wire_010, wire_011) @[Cat.scala 30:58]
    node _RandomHardware_009_io_in_T = cat(RandomHardware_009_io_in_hi, RandomHardware_009_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 89:33]
    wire_004 <= RandomHardware_009.io.out @[RandomHardware.scala 90:18]
    SignExtendDouble_011.io.in <= wire_016 @[RandomHardware.scala 91:33]
    wire_006 <= SignExtendDouble_011.io.out @[RandomHardware.scala 92:18]
    wire_011 <= SignExtendDouble_011.io.out @[RandomHardware.scala 93:18]
    wire_025 <= SignExtendDouble_011.io.out @[RandomHardware.scala 94:18]
    wire_026 <= SignExtendDouble_011.io.out @[RandomHardware.scala 95:18]
    ShiftRegister_012.io.in <= wire_017 @[RandomHardware.scala 96:33]
    wire_016 <= ShiftRegister_012.io.out @[RandomHardware.scala 97:18]
    node _RandomHardware_013_io_in_T = cat(wire_018, wire_019) @[Cat.scala 30:58]
    RandomHardware_013.io.in <= _RandomHardware_013_io_in_T @[RandomHardware.scala 98:33]
    wire_021 <= RandomHardware_013.io.out @[RandomHardware.scala 99:18]
    RandomHardware_015.io.in <= wire_021 @[RandomHardware.scala 100:33]
    wire_017 <= RandomHardware_015.io.out @[RandomHardware.scala 101:18]
    node RandomHardware_017_io_in_hi = cat(wire_023, wire_024) @[Cat.scala 30:58]
    node _RandomHardware_017_io_in_T = cat(RandomHardware_017_io_in_hi, wire_025) @[Cat.scala 30:58]
    RandomHardware_017.io.in <= _RandomHardware_017_io_in_T @[RandomHardware.scala 102:33]
    wire_031 <= RandomHardware_017.io.out @[RandomHardware.scala 103:18]
    node _RandomHardware_018_io_in_T = cat(wire_026, wire_027) @[Cat.scala 30:58]
    RandomHardware_018.io.in <= _RandomHardware_018_io_in_T @[RandomHardware.scala 104:33]
    wire_012 <= RandomHardware_018.io.out @[RandomHardware.scala 105:18]
    wire_024 <= RandomHardware_001.io.out @[RandomHardware.scala 106:18]
    wire_001 <= RandomHardware_003.io.out @[RandomHardware.scala 107:18]
    wire_003 <= RandomHardware_003.io.out @[RandomHardware.scala 108:18]
    wire_010 <= RandomHardware_003.io.out @[RandomHardware.scala 109:18]
    wire_022 <= RandomHardware_003.io.out @[RandomHardware.scala 110:18]
    wire_002 <= RandomHardware_004.io.out @[RandomHardware.scala 111:18]
    wire_008 <= RandomHardware_004.io.out @[RandomHardware.scala 112:18]
    wire_019 <= RandomHardware_004.io.out @[RandomHardware.scala 113:18]
    wire_015 <= RandomHardware_021.io.out @[RandomHardware.scala 114:18]
    wire_027 <= RandomHardware_021.io.out @[RandomHardware.scala 115:18]
    wire_028 <= RandomHardware_021.io.out @[RandomHardware.scala 116:18]
    wire_030 <= RandomHardware_021.io.out @[RandomHardware.scala 117:18]
    node _wire_005_T = bits(RandomHardware_022.io.out, 10, 0) @[RandomHardware.scala 118:47]
    wire_005 <= _wire_005_T @[RandomHardware.scala 118:18]
    wire_013 <= RandomHardware_022.io.out @[RandomHardware.scala 119:18]
    wire_000 <= ShiftRight_024.io.out @[RandomHardware.scala 120:18]
    wire_009 <= ShiftRight_024.io.out @[RandomHardware.scala 121:18]
    wire_029 <= ShiftRight_024.io.out @[RandomHardware.scala 122:18]
    wire_032 <= ShiftRight_024.io.out @[RandomHardware.scala 123:18]
    node RandomHardware_005_io_in_hi = cat(wire_003, wire_004) @[Cat.scala 30:58]
    node _RandomHardware_005_io_in_T = cat(RandomHardware_005_io_in_hi, wire_005) @[Cat.scala 30:58]
    RandomHardware_005.io.in <= _RandomHardware_005_io_in_T @[RandomHardware.scala 124:33]
    RandomHardware_006.io.in <= wire_006 @[RandomHardware.scala 125:33]
    node _RandomHardware_008_io_in_T = cat(wire_008, wire_009) @[Cat.scala 30:58]
    RandomHardware_008.io.in <= _RandomHardware_008_io_in_T @[RandomHardware.scala 126:33]
    node _RandomHardware_010_io_in_T = cat(wire_014, wire_015) @[Cat.scala 30:58]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 127:33]
    Accum_014.io.in <= wire_020 @[RandomHardware.scala 128:25]
    RandomHardware_016.io.in <= wire_022 @[RandomHardware.scala 129:33]
    node _RandomHardware_019_io_in_T = cat(wire_028, wire_029) @[Cat.scala 30:58]
    RandomHardware_019.io.in <= _RandomHardware_019_io_in_T @[RandomHardware.scala 130:33]
    SignExtendDouble_020.io.in <= wire_030 @[RandomHardware.scala 131:33]
    node _RandomHardware_023_io_in_T = cat(wire_031, wire_032) @[Cat.scala 30:58]
    RandomHardware_023.io.in <= _RandomHardware_023_io_in_T @[RandomHardware.scala 132:33]
    
