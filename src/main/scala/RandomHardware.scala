package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(356.W))
  val out	 = Output(UInt(208.W))
})
  val wire_000 	 = Wire(UInt(15.W))
  val wire_001 	 = Wire(UInt(29.W))
  val wire_002 	 = Wire(UInt(24.W))
  val wire_003 	 = Wire(UInt(13.W))
  val wire_004 	 = Wire(UInt(18.W))
  val wire_005 	 = Wire(UInt(15.W))
  val wire_006 	 = Wire(UInt(25.W))
  val wire_007 	 = Wire(UInt(12.W))
  val wire_008 	 = Wire(UInt(14.W))
  val wire_009 	 = Wire(UInt(12.W))
  val wire_010 	 = Wire(UInt(16.W))
  val wire_011 	 = Wire(UInt(12.W))
  val wire_012 	 = Wire(UInt(15.W))
  val wire_013 	 = Wire(UInt(16.W))
  val wire_014 	 = Wire(UInt(16.W))
  val wire_015 	 = Wire(UInt(13.W))
  val wire_016 	 = Wire(UInt(25.W))
  val wire_017 	 = Wire(UInt(51.W))
  val wire_018 	 = Wire(UInt(12.W))
  val wire_019 	 = Wire(UInt(18.W))
  val wire_020 	 = Wire(UInt(26.W))
  val wire_021 	 = Wire(UInt(37.W))
  val wire_022 	 = Wire(UInt(14.W))

  val And_000 	 = Module(new And(29))
  val And_001 	 = Module(new And(37))
  val And_002 	 = Module(new And(24))
  val RandomHardware_003 	 = Module(new RandomHardware_1_3())
  val Add_004 	 = Module(new Add(25))
  val RandomHardware_005 	 = Module(new RandomHardware_1_5())
  val RandomHardware_006 	 = Module(new RandomHardware_1_6())
  val And_007 	 = Module(new And(26))
  val And_008 	 = Module(new And(16))
  val RandomHardware_009 	 = Module(new RandomHardware_1_9())
  val And_010 	 = Module(new And(29))
  val Multiply_011 	 = Module(new Multiply(25))
  val RandomHardware_012 	 = Module(new RandomHardware_1_12())
  val Add_013 	 = Module(new Add(51))
  val Multiply_014 	 = Module(new Multiply(24))
  val RandomHardware_015 	 = Module(new RandomHardware_1_15())
  val Multiply_016 	 = Module(new Multiply(26))
  val Add_017 	 = Module(new Add(51))
  val Add_018 	 = Module(new Add(32))
  val Multiply_019 	 = Module(new Multiply(15))

  RandomHardware_003.io.in 	:= io.in(35,0)
  RandomHardware_006.io.in 	:= io.in(99,36)
  RandomHardware_012.io.in 	:= io.in(467,100)
  Multiply_014.io.in 	:= io.in(491,468)
  Add_018.io.in 	:= io.in(523,492)
  io.out := Cat(Seq(Add_004.io.out,RandomHardware_005.io.out,And_007.io.out,RandomHardware_009.io.out,Multiply_016.io.out,Multiply_019.io.out))

  And_000.io.in 	:= Cat(Seq(wire_001))
  wire_008 	 :=  And_000.io.out(13,0)
  wire_000 	 :=  And_000.io.out(28,14)
  And_001.io.in 	:= Cat(Seq(wire_002,wire_003))
  wire_021 	 :=  And_001.io.out(36,0)
  And_002.io.in 	:= Cat(Seq(wire_004,wire_005))
  wire_002 	 :=  And_002.io.out(23,0)
  And_008.io.in 	:= Cat(Seq(wire_010))
  wire_014 	 :=  And_008.io.out(15,0)
  And_010.io.in 	:= Cat(Seq(wire_014,wire_015))
  wire_001 	 :=  And_010.io.out(28,0)
  Multiply_011.io.in 	:= Cat(Seq(wire_016))
  wire_006 	 :=  Multiply_011.io.out(24,0)
  Add_013.io.in 	:= Cat(Seq(wire_017))
  wire_016 	 :=  Add_013.io.out(24,0)
  wire_020 	 :=  Add_013.io.out(50,25)
  RandomHardware_015.io.in 	:= Cat(Seq(wire_018,wire_019))
  wire_005 	 :=  RandomHardware_015.io.out(14,0)
  wire_012 	 :=  RandomHardware_015.io.out(29,15)
  Add_017.io.in 	:= Cat(Seq(wire_021,wire_022))
  wire_017 	 :=  Add_017.io.out(50,0)
  wire_009 	 :=  RandomHardware_003.io.out(11,0)
  wire_018 	 :=  RandomHardware_003.io.out(23,12)
  wire_004 	 :=  RandomHardware_006.io.out(17,0)
  wire_019 	 :=  RandomHardware_006.io.out(35,18)
  wire_003 	 :=  RandomHardware_012.io.out(12,0)
  wire_015 	 :=  RandomHardware_012.io.out(25,13)
  wire_022 	 :=  RandomHardware_012.io.out(39,26)
  wire_007 	 :=  Multiply_014.io.out(11,0)
  wire_011 	 :=  Multiply_014.io.out(23,12)
  wire_010 	 :=  Add_018.io.out(15,0)
  wire_013 	 :=  Add_018.io.out(31,16)
  Add_004.io.in 	:= Cat(Seq(wire_006))
  RandomHardware_005.io.in 	:= Cat(Seq(wire_007))
  And_007.io.in 	:= Cat(Seq(wire_008,wire_009))
  RandomHardware_009.io.in 	:= Cat(Seq(wire_011,wire_012,wire_013))
  Multiply_016.io.in 	:= Cat(Seq(wire_020))
  Multiply_019.io.in 	:= Cat(Seq(wire_000))
}

object RandomHardwareDriver extends App {(new ChiselStage).emitVerilog(new RandomHardware)}
