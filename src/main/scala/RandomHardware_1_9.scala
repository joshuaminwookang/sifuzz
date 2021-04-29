package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_1_9 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(84.W))
  val out	 = Output(UInt(99.W))
})
  val wire_000 	 = Wire(UInt(12.W))
  val wire_001 	 = Wire(UInt(12.W))
  val wire_002 	 = Wire(UInt(21.W))
  val wire_003 	 = Wire(UInt(21.W))
  val wire_004 	 = Wire(UInt(6.W))
  val wire_005 	 = Wire(UInt(6.W))
  val wire_006 	 = Wire(UInt(24.W))
  val wire_007 	 = Wire(UInt(36.W))

  val Multiply_000 	 = Module(new Multiply(24))
  val RandomHardware_001 	 = Module(new RandomHardware_2_1())
  val Multiply_002 	 = Module(new Multiply(12))
  val Multiply_003 	 = Module(new Multiply(45))
  val Multiply_004 	 = Module(new Multiply(12))
  val And_005 	 = Module(new And(6))
  val RandomHardware_006 	 = Module(new RandomHardware_2_6())
  val And_007 	 = Module(new And(24))
  val Add_008 	 = Module(new Add(36))

  Multiply_000.io.in 	:= io.in(23,0)
  And_007.io.in 	:= io.in(47,24)
  Add_008.io.in 	:= io.in(83,48)
  io.out := Cat(Seq(Multiply_002.io.out,Multiply_003.io.out,And_005.io.out,RandomHardware_006.io.out))

  RandomHardware_001.io.in 	:= Cat(Seq(wire_004,wire_007))
  wire_002 	 :=  RandomHardware_001.io.out(20,0)
  wire_003 	 :=  RandomHardware_001.io.out(41,21)
  Multiply_004.io.in 	:= Cat(Seq(wire_001))
  wire_004 	 :=  Multiply_004.io.out(5,0)
  wire_005 	 :=  Multiply_004.io.out(11,6)
  wire_000 	 :=  Multiply_000.io.out(11,0)
  wire_001 	 :=  Multiply_000.io.out(23,12)
  wire_006 	 :=  And_007.io.out(23,0)
  wire_007 	 :=  Add_008.io.out(35,0)
  Multiply_002.io.in 	:= Cat(Seq(wire_000))
  Multiply_003.io.in 	:= Cat(Seq(wire_002,wire_006))
  And_005.io.in 	:= Cat(Seq(wire_005))
  RandomHardware_006.io.in 	:= Cat(Seq(wire_003))
}

