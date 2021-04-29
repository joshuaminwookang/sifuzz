package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_12 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(72.W))
  val out	 = Output(UInt(72.W))
})
  val wire_000 	 = Wire(UInt(32.W))
  val wire_001 	 = Wire(UInt(40.W))

  val And_000 	 = Module(new And(32))
  val Multiply_001 	 = Module(new Multiply(40))
  val Multiply_002 	 = Module(new Multiply(72))

  And_000.io.in 	:= io.in(31,0)
  Multiply_001.io.in 	:= io.in(71,32)
  io.out := Cat(Seq(Multiply_002.io.out))

  wire_000 	 :=  And_000.io.out(31,0)
  wire_001 	 :=  Multiply_001.io.out(39,0)
  Multiply_002.io.in 	:= Cat(Seq(wire_000,wire_001))
}

