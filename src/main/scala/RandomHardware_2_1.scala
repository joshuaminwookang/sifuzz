package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_1 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(24.W))
  val out	 = Output(UInt(24.W))
})
  val wire_000 	 = Wire(UInt(12.W))
  val wire_001 	 = Wire(UInt(12.W))
  val wire_002 	 = Wire(UInt(12.W))
  val wire_003 	 = Wire(UInt(12.W))

  val Multiply_000 	 = Module(new Multiply(24))
  val Add_001 	 = Module(new Add(12))
  val And_002 	 = Module(new And(12))
  val And_003 	 = Module(new And(12))
  val Add_004 	 = Module(new Add(12))

  Multiply_000.io.in 	:= io.in(23,0)
  io.out := Cat(Seq(And_002.io.out,And_003.io.out))

  Add_001.io.in 	:= Cat(Seq(wire_000))
  wire_002 	 :=  Add_001.io.out(11,0)
  Add_004.io.in 	:= Cat(Seq(wire_001))
  wire_003 	 :=  Add_004.io.out(11,0)
  wire_000 	 :=  Multiply_000.io.out(11,0)
  wire_001 	 :=  Multiply_000.io.out(23,12)
  And_002.io.in 	:= Cat(Seq(wire_002))
  And_003.io.in 	:= Cat(Seq(wire_003))
}

