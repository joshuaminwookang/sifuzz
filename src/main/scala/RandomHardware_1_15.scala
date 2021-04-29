package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_1_15 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(108.W))
  val out	 = Output(UInt(72.W))
})
  val wire_000 	 = Wire(UInt(18.W))
  val wire_001 	 = Wire(UInt(18.W))
  val wire_002 	 = Wire(UInt(18.W))
  val wire_003 	 = Wire(UInt(18.W))
  val wire_004 	 = Wire(UInt(18.W))
  val wire_005 	 = Wire(UInt(18.W))

  val RandomHardware_000 	 = Module(new RandomHardware_2_0())
  val Add_001 	 = Module(new Add(18))
  val Multiply_002 	 = Module(new Multiply(18))
  val Multiply_003 	 = Module(new Multiply(36))
  val Add_004 	 = Module(new Add(36))
  val And_005 	 = Module(new And(18))
  val Add_006 	 = Module(new Add(18))

  RandomHardware_000.io.in 	:= io.in(71,0)
  Add_004.io.in 	:= io.in(107,72)
  io.out := Cat(Seq(Multiply_002.io.out,Multiply_003.io.out,Add_006.io.out))

  Add_001.io.in 	:= Cat(Seq(wire_005))
  wire_002 	 :=  Add_001.io.out(17,0)
  And_005.io.in 	:= Cat(Seq(wire_004))
  wire_005 	 :=  And_005.io.out(17,0)
  wire_000 	 :=  RandomHardware_000.io.out(17,0)
  wire_001 	 :=  RandomHardware_000.io.out(35,18)
  wire_003 	 :=  Add_004.io.out(17,0)
  wire_004 	 :=  Add_004.io.out(35,18)
  Multiply_002.io.in 	:= Cat(Seq(wire_002))
  Multiply_003.io.in 	:= Cat(Seq(wire_000,wire_003))
  Add_006.io.in 	:= Cat(Seq(wire_001))
}

