package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_1_12 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(368.W))
  val out	 = Output(UInt(220.W))
})
  val wire_000 	 = Wire(UInt(40.W))
  val wire_001 	 = Wire(UInt(9.W))
  val wire_002 	 = Wire(UInt(81.W))
  val wire_003 	 = Wire(UInt(14.W))
  val wire_004 	 = Wire(UInt(9.W))
  val wire_005 	 = Wire(UInt(49.W))
  val wire_006 	 = Wire(UInt(12.W))
  val wire_007 	 = Wire(UInt(20.W))
  val wire_008 	 = Wire(UInt(12.W))
  val wire_009 	 = Wire(UInt(14.W))
  val wire_010 	 = Wire(UInt(40.W))
  val wire_011 	 = Wire(UInt(20.W))
  val wire_012 	 = Wire(UInt(10.W))
  val wire_013 	 = Wire(UInt(20.W))
  val wire_014 	 = Wire(UInt(28.W))
  val wire_015 	 = Wire(UInt(28.W))

  val RandomHardware_000 	 = Module(new RandomHardware_2_0())
  val Add_001 	 = Module(new Add(81))
  val Add_002 	 = Module(new Add(28))
  val RandomHardware_003 	 = Module(new RandomHardware_2_3())
  val Multiply_004 	 = Module(new Multiply(23))
  val And_005 	 = Module(new And(81))
  val Multiply_006 	 = Module(new Multiply(66))
  val RandomHardware_007 	 = Module(new RandomHardware_2_7())
  val And_008 	 = Module(new And(28))
  val RandomHardware_009 	 = Module(new RandomHardware_2_9())
  val Add_010 	 = Module(new Add(40))
  val Add_011 	 = Module(new Add(10))
  val RandomHardware_012 	 = Module(new RandomHardware_2_12())
  val And_013 	 = Module(new And(28))
  val RandomHardware_014 	 = Module(new RandomHardware_2_14())
  val RandomHardware_015 	 = Module(new RandomHardware_2_15())

  Add_002.io.in 	:= io.in(27,0)
  RandomHardware_003.io.in 	:= io.in(151,28)
  RandomHardware_007.io.in 	:= io.in(183,152)
  And_008.io.in 	:= io.in(211,184)
  RandomHardware_009.io.in 	:= io.in(327,212)
  Add_010.io.in 	:= io.in(367,328)
  io.out := Cat(Seq(Add_001.io.out,Multiply_004.io.out,Multiply_006.io.out,Add_011.io.out,RandomHardware_015.io.out))

  RandomHardware_000.io.in 	:= Cat(Seq(wire_000,wire_001))
  wire_005 	 :=  RandomHardware_000.io.out(48,0)
  And_005.io.in 	:= Cat(Seq(wire_005,wire_006,wire_007))
  wire_002 	 :=  And_005.io.out(80,0)
  RandomHardware_012.io.in 	:= Cat(Seq(wire_013))
  wire_007 	 :=  RandomHardware_012.io.out(19,0)
  And_013.io.in 	:= Cat(Seq(wire_014))
  wire_015 	 :=  And_013.io.out(27,0)
  RandomHardware_014.io.in 	:= Cat(Seq(wire_015))
  wire_001 	 :=  RandomHardware_014.io.out(8,0)
  wire_004 	 :=  RandomHardware_014.io.out(17,9)
  wire_012 	 :=  RandomHardware_014.io.out(27,18)
  wire_014 	 :=  Add_002.io.out(27,0)
  wire_000 	 :=  RandomHardware_003.io.out(39,0)
  wire_006 	 :=  RandomHardware_007.io.out(11,0)
  wire_008 	 :=  RandomHardware_007.io.out(23,12)
  wire_003 	 :=  And_008.io.out(13,0)
  wire_009 	 :=  And_008.io.out(27,14)
  wire_010 	 :=  RandomHardware_009.io.out(39,0)
  wire_013 	 :=  Add_010.io.out(19,0)
  wire_011 	 :=  Add_010.io.out(39,20)
  Add_001.io.in 	:= Cat(Seq(wire_002))
  Multiply_004.io.in 	:= Cat(Seq(wire_003,wire_004))
  Multiply_006.io.in 	:= Cat(Seq(wire_008,wire_009,wire_010))
  Add_011.io.in 	:= Cat(Seq(wire_012))
  RandomHardware_015.io.in 	:= Cat(Seq(wire_011))
}

