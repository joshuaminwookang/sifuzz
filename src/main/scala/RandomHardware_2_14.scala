package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_14 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(56.W))
  val out	 = Output(UInt(56.W))
})
  val wire_000 	 = Wire(UInt(24.W))
  val wire_001 	 = Wire(UInt(32.W))

  val And_000 	 = Module(new And(24))
  val Add_001 	 = Module(new Add(56))
  val Multiply_002 	 = Module(new Multiply(32))

  And_000.io.in 	:= io.in(23,0)
  Multiply_002.io.in 	:= io.in(55,24)
  io.out := Cat(Seq(Add_001.io.out))

  wire_000 	 :=  And_000.io.out(23,0)
  wire_001 	 :=  Multiply_002.io.out(31,0)
  Add_001.io.in 	:= Cat(Seq(wire_000,wire_001))
}

