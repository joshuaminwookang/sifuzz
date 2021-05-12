;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  module ReduceXorMux : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<22>}
    
    node IN1 = bits(io.in, 49, 28) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 27, 6) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 5, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module ShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<50>}
    
    reg r0 : UInt, clock @[Memory.scala 78:19]
    r0 <= io.in @[Memory.scala 78:19]
    reg r1 : UInt, clock @[Memory.scala 79:19]
    r1 <= r0 @[Memory.scala 79:19]
    reg r2 : UInt, clock @[Memory.scala 80:19]
    r2 <= r1 @[Memory.scala 80:19]
    reg r3 : UInt, clock @[Memory.scala 81:19]
    r3 <= r2 @[Memory.scala 81:19]
    io.out <= r3 @[Memory.scala 82:10]
    
  module RandomHardware_1_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<50>, out : UInt<22>}
    
    wire wire_000 : UInt<50> @[RandomHardware_1_0.scala 13:24]
    inst ReduceXorMux_000 of ReduceXorMux @[RandomHardware_1_0.scala 15:34]
    ReduceXorMux_000.clock <= clock
    ReduceXorMux_000.reset <= reset
    inst ShiftRegister_001 of ShiftRegister @[RandomHardware_1_0.scala 16:42]
    ShiftRegister_001.clock <= clock
    ShiftRegister_001.reset <= reset
    ShiftRegister_001.io.in <= io.in @[RandomHardware_1_0.scala 18:33]
    io.out <= ReduceXorMux_000.io.out @[RandomHardware_1_0.scala 19:10]
    wire_000 <= ShiftRegister_001.io.out @[RandomHardware_1_0.scala 21:18]
    ReduceXorMux_000.io.in <= wire_000 @[RandomHardware_1_0.scala 22:33]
    
  module ShiftRight : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Reg : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_3_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    wire wire_000 : UInt<20> @[RandomHardware_3_0.scala 13:24]
    inst ShiftRight_000 of ShiftRight @[RandomHardware_3_0.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst Reg_001 of Reg @[RandomHardware_3_0.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    Reg_001.io.in <= io.in @[RandomHardware_3_0.scala 18:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_3_0.scala 19:10]
    wire_000 <= Reg_001.io.out @[RandomHardware_3_0.scala 21:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_3_0.scala 22:25]
    
  module ResetShiftRegister : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    wire wire_000 : UInt<20> @[RandomHardware_2_0.scala 13:24]
    inst RandomHardware_000 of RandomHardware_3_0 @[RandomHardware_2_0.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister @[RandomHardware_2_0.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= ResetShiftRegister_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 21:18]
    ResetShiftRegister_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
  module RandomHardware_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<12>}
    
    inst RandomHardware_000 of RandomHardware_2_0 @[RandomHardware_1_1.scala 14:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_1.scala 16:33]
    io.out <= RandomHardware_000.io.out @[RandomHardware_1_1.scala 17:10]
    
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
    
  module ShiftRight_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module CompareMux : 
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
    
  module RandomHardware_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<34>, out : UInt<7>}
    
    wire wire_000 : UInt<12> @[RandomHardware_1_2.scala 13:24]
    wire wire_001 : UInt<8> @[RandomHardware_1_2.scala 14:24]
    inst ReduceOrMux_000 of ReduceOrMux @[RandomHardware_1_2.scala 16:34]
    ReduceOrMux_000.clock <= clock
    ReduceOrMux_000.reset <= reset
    inst ShiftRight_001 of ShiftRight_1 @[RandomHardware_1_2.scala 17:34]
    ShiftRight_001.clock <= clock
    ShiftRight_001.reset <= reset
    inst CompareMux_002 of CompareMux @[RandomHardware_1_2.scala 18:34]
    CompareMux_002.clock <= clock
    CompareMux_002.reset <= reset
    node _ShiftRight_001_io_in_T = bits(io.in, 33, 22) @[RandomHardware_1_2.scala 20:33]
    ShiftRight_001.io.in <= _ShiftRight_001_io_in_T @[RandomHardware_1_2.scala 20:25]
    node _CompareMux_002_io_in_T = bits(io.in, 33, 12) @[RandomHardware_1_2.scala 21:33]
    CompareMux_002.io.in <= _CompareMux_002_io_in_T @[RandomHardware_1_2.scala 21:25]
    io.out <= ReduceOrMux_000.io.out @[RandomHardware_1_2.scala 22:10]
    wire_000 <= ShiftRight_001.io.out @[RandomHardware_1_2.scala 24:18]
    wire_001 <= CompareMux_002.io.out @[RandomHardware_1_2.scala 25:18]
    node _ReduceOrMux_000_io_in_T = cat(wire_000, wire_001) @[Cat.scala 30:58]
    ReduceOrMux_000.io.in <= _ReduceOrMux_000_io_in_T @[RandomHardware_1_2.scala 26:33]
    
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
    
  module ShiftRight_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<6>}
    
    node _io_out_T = shr(io.in, 3) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module SignExtendDouble : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<11>, out : UInt<22>}
    
    node _io_out_T = bits(io.in, 10, 10) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<11>("h07ff"), UInt<11>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module ShiftLeft : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<11>}
    
    node _io_out_T = shl(io.in, 4) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module ReduceXorMux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<7>}
    
    node IN1 = bits(io.in, 15, 9) @[Muxes.scala 122:27]
    node IN2 = bits(io.in, 8, 2) @[Muxes.scala 123:27]
    node SEL = bits(io.in, 1, 0) @[Muxes.scala 124:27]
    node _io_out_T = xorr(SEL) @[Muxes.scala 126:23]
    node _io_out_T_1 = mux(_io_out_T, IN1, IN2) @[Muxes.scala 126:18]
    io.out <= _io_out_T_1 @[Muxes.scala 126:12]
    
  module RandomHardware_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<16>, out : UInt<11>}
    
    wire wire_000 : UInt<7> @[RandomHardware_1_6.scala 13:24]
    inst ShiftLeft_000 of ShiftLeft @[RandomHardware_1_6.scala 15:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    inst ReduceXorMux_001 of ReduceXorMux_1 @[RandomHardware_1_6.scala 16:34]
    ReduceXorMux_001.clock <= clock
    ReduceXorMux_001.reset <= reset
    ReduceXorMux_001.io.in <= io.in @[RandomHardware_1_6.scala 18:33]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_6.scala 19:10]
    wire_000 <= ReduceXorMux_001.io.out @[RandomHardware_1_6.scala 21:18]
    ShiftLeft_000.io.in <= wire_000 @[RandomHardware_1_6.scala 22:25]
    
  module Reg_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module SignExtendDouble_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<6>, out : UInt<12>}
    
    node _io_out_T = bits(io.in, 5, 5) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<6>("h03f"), UInt<6>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module Reg_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Reg_000 of Reg_2 @[RandomHardware_1_9.scala 14:26]
    Reg_000.clock <= clock
    Reg_000.reset <= reset
    Reg_000.io.in <= io.in @[RandomHardware_1_9.scala 16:25]
    io.out <= Reg_000.io.out @[RandomHardware_1_9.scala 17:10]
    
  module ShiftLeft_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<15>}
    
    node _io_out_T = shl(io.in, 3) @[ArithmeticLogical.scala 94:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 94:12]
    
  module RandomHardware_1_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<15>}
    
    inst ShiftLeft_000 of ShiftLeft_1 @[RandomHardware_1_10.scala 14:34]
    ShiftLeft_000.clock <= clock
    ShiftLeft_000.reset <= reset
    ShiftLeft_000.io.in <= io.in @[RandomHardware_1_10.scala 16:25]
    io.out <= ShiftLeft_000.io.out @[RandomHardware_1_10.scala 17:10]
    
  module ShiftRight_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<7>, out : UInt<7>}
    
    node _io_out_T = shr(io.in, 5) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module ShiftRight_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    node _io_out_T = shr(io.in, 2) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module Reg_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    reg io_out_REG : UInt, clock @[Memory.scala 12:22]
    io_out_REG <= io.in @[Memory.scala 12:22]
    io.out <= io_out_REG @[Memory.scala 12:12]
    
  module RandomHardware_3_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<20>}
    
    wire wire_000 : UInt<20> @[RandomHardware_3_0.scala 13:24]
    inst ShiftRight_000 of ShiftRight_4 @[RandomHardware_3_0.scala 15:34]
    ShiftRight_000.clock <= clock
    ShiftRight_000.reset <= reset
    inst Reg_001 of Reg_3 @[RandomHardware_3_0.scala 16:26]
    Reg_001.clock <= clock
    Reg_001.reset <= reset
    Reg_001.io.in <= io.in @[RandomHardware_3_0.scala 18:25]
    io.out <= ShiftRight_000.io.out @[RandomHardware_3_0.scala 19:10]
    wire_000 <= Reg_001.io.out @[RandomHardware_3_0.scala 21:18]
    ShiftRight_000.io.in <= wire_000 @[RandomHardware_3_0.scala 22:25]
    
  module ResetShiftRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module RandomHardware_2_0_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    wire wire_000 : UInt<20> @[RandomHardware_2_0.scala 13:24]
    inst RandomHardware_000 of RandomHardware_3_0_1 @[RandomHardware_2_0.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister_1 @[RandomHardware_2_0.scala 16:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_2_0.scala 18:33]
    io.out <= ResetShiftRegister_001.io.out @[RandomHardware_2_0.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_2_0.scala 21:18]
    ResetShiftRegister_001.io.in <= wire_000 @[RandomHardware_2_0.scala 22:33]
    
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
    
  module RandomHardware_1_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<2>}
    
    wire wire_000 : UInt<19> @[RandomHardware_1_12.scala 13:24]
    inst RandomHardware_000 of RandomHardware_2_0_1 @[RandomHardware_1_12.scala 15:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst Mux8_001 of Mux8 @[RandomHardware_1_12.scala 16:26]
    Mux8_001.clock <= clock
    Mux8_001.reset <= reset
    RandomHardware_000.io.in <= io.in @[RandomHardware_1_12.scala 18:33]
    io.out <= Mux8_001.io.out @[RandomHardware_1_12.scala 19:10]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware_1_12.scala 21:18]
    Mux8_001.io.in <= wire_000 @[RandomHardware_1_12.scala 22:25]
    
  module Mul : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    node in1 = bits(io.in, 11, 6) @[ArithmeticLogical.scala 47:20]
    node in2 = bits(io.in, 5, 0) @[ArithmeticLogical.scala 48:20]
    node _io_out_T = mul(in1, in2) @[ArithmeticLogical.scala 49:19]
    io.out <= _io_out_T @[ArithmeticLogical.scala 49:12]
    
  module RandomHardware_1_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<12>, out : UInt<12>}
    
    inst Mul_000 of Mul @[RandomHardware_1_13.scala 14:26]
    Mul_000.clock <= clock
    Mul_000.reset <= reset
    Mul_000.io.in <= io.in @[RandomHardware_1_13.scala 16:25]
    io.out <= Mul_000.io.out @[RandomHardware_1_13.scala 17:10]
    
  module Accum : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<2>, out : UInt<2>}
    
    reg sum : UInt, clock @[ArithmeticLogical.scala 82:18]
    node _sum_T = add(sum, io.in) @[ArithmeticLogical.scala 83:16]
    node _sum_T_1 = tail(_sum_T, 1) @[ArithmeticLogical.scala 83:16]
    sum <= _sum_T_1 @[ArithmeticLogical.scala 83:9]
    io.out <= sum @[ArithmeticLogical.scala 84:12]
    
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
    
  module ResetShiftRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<19>}
    
    node shift = bits(io.in, 0, 0) @[Memory.scala 59:20]
    reg r0 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 60:19]
    reg r1 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 61:19]
    reg r2 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 62:19]
    reg r3 : UInt<19>, clock with : (reset => (reset, UInt<19>("h00"))) @[Memory.scala 63:19]
    when shift : @[Memory.scala 64:16]
      r0 <= io.in @[Memory.scala 65:8]
      r1 <= r0 @[Memory.scala 66:8]
      r2 <= r1 @[Memory.scala 67:8]
      r3 <= r2 @[Memory.scala 68:8]
      skip @[Memory.scala 64:16]
    io.out <= r3 @[Memory.scala 70:10]
    
  module ShiftRight_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<2>, out : UInt<2>}
    
    node _io_out_T = shr(io.in, 4) @[ArithmeticLogical.scala 103:21]
    io.out <= _io_out_T @[ArithmeticLogical.scala 103:12]
    
  module RandomHardware_2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<2>}
    
    wire wire_000 : UInt<2> @[RandomHardware_2_1.scala 13:24]
    wire wire_001 : UInt<19> @[RandomHardware_2_1.scala 14:24]
    inst Mux8_000 of Mux8_1 @[RandomHardware_2_1.scala 16:26]
    Mux8_000.clock <= clock
    Mux8_000.reset <= reset
    inst ResetShiftRegister_001 of ResetShiftRegister_2 @[RandomHardware_2_1.scala 17:42]
    ResetShiftRegister_001.clock <= clock
    ResetShiftRegister_001.reset <= reset
    inst ShiftRight_002 of ShiftRight_5 @[RandomHardware_2_1.scala 18:34]
    ShiftRight_002.clock <= clock
    ShiftRight_002.reset <= reset
    ResetShiftRegister_001.io.in <= io.in @[RandomHardware_2_1.scala 20:33]
    io.out <= ShiftRight_002.io.out @[RandomHardware_2_1.scala 21:10]
    Mux8_000.io.in <= wire_001 @[RandomHardware_2_1.scala 23:25]
    wire_000 <= Mux8_000.io.out @[RandomHardware_2_1.scala 24:18]
    wire_001 <= ResetShiftRegister_001.io.out @[RandomHardware_2_1.scala 25:18]
    ShiftRight_002.io.in <= wire_000 @[RandomHardware_2_1.scala 26:25]
    
  module SignExtendDouble_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<2>, out : UInt<4>}
    
    node _io_out_T = bits(io.in, 1, 1) @[ArithmeticLogical.scala 112:31]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi = mux(_io_out_T_1, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _io_out_T_2 = cat(io_out_hi, io.in) @[Cat.scala 30:58]
    io.out <= _io_out_T_2 @[ArithmeticLogical.scala 112:12]
    
  module RandomHardware_1_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<20>, out : UInt<4>}
    
    wire wire_000 : UInt<2> @[RandomHardware_1_14.scala 13:24]
    wire wire_001 : UInt<2> @[RandomHardware_1_14.scala 14:24]
    inst Accum_000 of Accum @[RandomHardware_1_14.scala 16:34]
    Accum_000.clock <= clock
    Accum_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_2_1 @[RandomHardware_1_14.scala 17:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst SignExtendDouble_002 of SignExtendDouble_2 @[RandomHardware_1_14.scala 18:42]
    SignExtendDouble_002.clock <= clock
    SignExtendDouble_002.reset <= reset
    RandomHardware_001.io.in <= io.in @[RandomHardware_1_14.scala 20:33]
    io.out <= SignExtendDouble_002.io.out @[RandomHardware_1_14.scala 21:10]
    Accum_000.io.in <= wire_001 @[RandomHardware_1_14.scala 23:25]
    wire_000 <= Accum_000.io.out @[RandomHardware_1_14.scala 24:18]
    wire_001 <= RandomHardware_001.io.out @[RandomHardware_1_14.scala 25:18]
    SignExtendDouble_002.io.in <= wire_000 @[RandomHardware_1_14.scala 26:33]
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<100>, out : UInt<35>}
    
    wire wire_000 : UInt<22> @[RandomHardware.scala 13:24]
    wire wire_001 : UInt<12> @[RandomHardware.scala 14:24]
    wire wire_002 : UInt<7> @[RandomHardware.scala 15:24]
    wire wire_003 : UInt<11> @[RandomHardware.scala 16:24]
    wire wire_004 : UInt<4> @[RandomHardware.scala 17:24]
    wire wire_005 : UInt<12> @[RandomHardware.scala 18:24]
    wire wire_006 : UInt<12> @[RandomHardware.scala 19:24]
    wire wire_007 : UInt<6> @[RandomHardware.scala 20:24]
    wire wire_008 : UInt<15> @[RandomHardware.scala 21:24]
    wire wire_009 : UInt<7> @[RandomHardware.scala 22:24]
    wire wire_010 : UInt<7> @[RandomHardware.scala 23:24]
    wire wire_011 : UInt<2> @[RandomHardware.scala 24:24]
    wire wire_012 : UInt<12> @[RandomHardware.scala 25:24]
    wire wire_013 : UInt<4> @[RandomHardware.scala 26:24]
    wire wire_014 : UInt<4> @[RandomHardware.scala 27:24]
    inst RandomHardware_000 of RandomHardware_1_0 @[RandomHardware.scala 29:42]
    RandomHardware_000.clock <= clock
    RandomHardware_000.reset <= reset
    inst RandomHardware_001 of RandomHardware_1_1 @[RandomHardware.scala 30:42]
    RandomHardware_001.clock <= clock
    RandomHardware_001.reset <= reset
    inst RandomHardware_002 of RandomHardware_1_2 @[RandomHardware.scala 31:42]
    RandomHardware_002.clock <= clock
    RandomHardware_002.reset <= reset
    inst ShiftRegister_003 of ShiftRegister_1 @[RandomHardware.scala 32:42]
    ShiftRegister_003.clock <= clock
    ShiftRegister_003.reset <= reset
    inst ShiftRight_004 of ShiftRight_2 @[RandomHardware.scala 33:34]
    ShiftRight_004.clock <= clock
    ShiftRight_004.reset <= reset
    inst SignExtendDouble_005 of SignExtendDouble @[RandomHardware.scala 34:42]
    SignExtendDouble_005.clock <= clock
    SignExtendDouble_005.reset <= reset
    inst RandomHardware_006 of RandomHardware_1_6 @[RandomHardware.scala 35:42]
    RandomHardware_006.clock <= clock
    RandomHardware_006.reset <= reset
    inst Reg_007 of Reg_1 @[RandomHardware.scala 36:26]
    Reg_007.clock <= clock
    Reg_007.reset <= reset
    inst SignExtendDouble_008 of SignExtendDouble_1 @[RandomHardware.scala 37:42]
    SignExtendDouble_008.clock <= clock
    SignExtendDouble_008.reset <= reset
    inst RandomHardware_009 of RandomHardware_1_9 @[RandomHardware.scala 38:42]
    RandomHardware_009.clock <= clock
    RandomHardware_009.reset <= reset
    inst RandomHardware_010 of RandomHardware_1_10 @[RandomHardware.scala 39:42]
    RandomHardware_010.clock <= clock
    RandomHardware_010.reset <= reset
    inst ShiftRight_011 of ShiftRight_3 @[RandomHardware.scala 40:34]
    ShiftRight_011.clock <= clock
    ShiftRight_011.reset <= reset
    inst RandomHardware_012 of RandomHardware_1_12 @[RandomHardware.scala 41:42]
    RandomHardware_012.clock <= clock
    RandomHardware_012.reset <= reset
    inst RandomHardware_013 of RandomHardware_1_13 @[RandomHardware.scala 42:42]
    RandomHardware_013.clock <= clock
    RandomHardware_013.reset <= reset
    inst RandomHardware_014 of RandomHardware_1_14 @[RandomHardware.scala 43:42]
    RandomHardware_014.clock <= clock
    RandomHardware_014.reset <= reset
    node _RandomHardware_001_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 45:41]
    RandomHardware_001.io.in <= _RandomHardware_001_io_in_T @[RandomHardware.scala 45:33]
    node _RandomHardware_006_io_in_T = bits(io.in, 99, 84) @[RandomHardware.scala 46:41]
    RandomHardware_006.io.in <= _RandomHardware_006_io_in_T @[RandomHardware.scala 46:33]
    node _RandomHardware_009_io_in_T = bits(io.in, 11, 0) @[RandomHardware.scala 47:41]
    RandomHardware_009.io.in <= _RandomHardware_009_io_in_T @[RandomHardware.scala 47:33]
    node _RandomHardware_010_io_in_T = bits(io.in, 11, 0) @[RandomHardware.scala 48:41]
    RandomHardware_010.io.in <= _RandomHardware_010_io_in_T @[RandomHardware.scala 48:33]
    node _RandomHardware_012_io_in_T = bits(io.in, 19, 0) @[RandomHardware.scala 49:41]
    RandomHardware_012.io.in <= _RandomHardware_012_io_in_T @[RandomHardware.scala 49:33]
    node _RandomHardware_014_io_in_T = bits(io.in, 99, 80) @[RandomHardware.scala 50:41]
    RandomHardware_014.io.in <= _RandomHardware_014_io_in_T @[RandomHardware.scala 50:33]
    node io_out_hi = cat(ShiftRegister_003.io.out, ShiftRight_004.io.out) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, SignExtendDouble_005.io.out) @[Cat.scala 30:58]
    io.out <= _io_out_T @[RandomHardware.scala 51:10]
    node RandomHardware_000_io_in_lo = cat(wire_006, wire_008) @[Cat.scala 30:58]
    node RandomHardware_000_io_in_hi = cat(wire_003, wire_005) @[Cat.scala 30:58]
    node _RandomHardware_000_io_in_T = cat(RandomHardware_000_io_in_hi, RandomHardware_000_io_in_lo) @[Cat.scala 30:58]
    RandomHardware_000.io.in <= _RandomHardware_000_io_in_T @[RandomHardware.scala 53:33]
    wire_000 <= RandomHardware_000.io.out @[RandomHardware.scala 54:18]
    node _RandomHardware_002_io_in_T = cat(wire_000, wire_012) @[Cat.scala 30:58]
    RandomHardware_002.io.in <= _RandomHardware_002_io_in_T @[RandomHardware.scala 55:33]
    wire_002 <= RandomHardware_002.io.out @[RandomHardware.scala 56:18]
    Reg_007.io.in <= wire_014 @[RandomHardware.scala 57:25]
    wire_004 <= Reg_007.io.out @[RandomHardware.scala 58:18]
    SignExtendDouble_008.io.in <= wire_007 @[RandomHardware.scala 59:33]
    wire_005 <= SignExtendDouble_008.io.out @[RandomHardware.scala 60:18]
    ShiftRight_011.io.in <= wire_002 @[RandomHardware.scala 61:25]
    wire_009 <= ShiftRight_011.io.out @[RandomHardware.scala 62:18]
    wire_010 <= ShiftRight_011.io.out @[RandomHardware.scala 63:18]
    RandomHardware_013.io.in <= wire_001 @[RandomHardware.scala 64:33]
    wire_012 <= RandomHardware_013.io.out @[RandomHardware.scala 65:18]
    wire_001 <= RandomHardware_001.io.out @[RandomHardware.scala 66:18]
    wire_003 <= RandomHardware_006.io.out @[RandomHardware.scala 67:18]
    wire_006 <= RandomHardware_009.io.out @[RandomHardware.scala 68:18]
    node _wire_007_T = bits(RandomHardware_009.io.out, 11, 6) @[RandomHardware.scala 69:47]
    wire_007 <= _wire_007_T @[RandomHardware.scala 69:18]
    wire_008 <= RandomHardware_010.io.out @[RandomHardware.scala 70:18]
    wire_011 <= RandomHardware_012.io.out @[RandomHardware.scala 71:18]
    wire_013 <= RandomHardware_014.io.out @[RandomHardware.scala 72:18]
    wire_014 <= RandomHardware_014.io.out @[RandomHardware.scala 73:18]
    ShiftRegister_003.io.in <= wire_009 @[RandomHardware.scala 74:33]
    node _ShiftRight_004_io_in_T = cat(wire_004, wire_011) @[Cat.scala 30:58]
    ShiftRight_004.io.in <= _ShiftRight_004_io_in_T @[RandomHardware.scala 75:25]
    node _SignExtendDouble_005_io_in_T = cat(wire_010, wire_013) @[Cat.scala 30:58]
    SignExtendDouble_005.io.in <= _SignExtendDouble_005_io_in_T @[RandomHardware.scala 76:33]
    
