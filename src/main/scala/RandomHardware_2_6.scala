package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_6 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(36.W))
  val out	 = Output(UInt(36.W))
})
  val wire_000 	 = Wire(UInt(36.W))

  val And_000 	 = Module(new And(36))
  val Multiply_001 	 = Module(new Multiply(36))

  And_000.io.in 	:= io.in(35,0)
  io.out := Cat(Seq(Multiply_001.io.out))

  wire_000 	 :=  And_000.io.out(35,0)
  Multiply_001.io.in 	:= Cat(Seq(wire_000))
}

