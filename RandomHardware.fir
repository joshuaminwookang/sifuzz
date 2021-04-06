;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RandomHardware : 
  extmodule RandomBlackBox : 
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    
    defname = RandomBlackBox
    parameter N = 64
    
  module RandomHardware : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<64>, flip in2 : UInt<64>, out : UInt<64>}
    
    inst BB of RandomBlackBox @[ChiselWrapper.scala 25:19]
    BB.out is invalid
    BB.in2 is invalid
    BB.in1 is invalid
    BB.in1 <= io.in1 @[ChiselWrapper.scala 26:14]
    BB.in1 <= io.in1 @[ChiselWrapper.scala 27:14]
    io.out <= BB.out @[ChiselWrapper.scala 28:11]
    
