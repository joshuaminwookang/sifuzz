package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_7 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(32.W))
  val out	 = Output(UInt(32.W))
})
  val wire_000 	 = Wire(UInt(16.W))
  val wire_001 	 = Wire(UInt(16.W))
  val wire_002 	 = Wire(UInt(16.W))

  val Add_000 	 = Module(new Add(16))
  val Multiply_001 	 = Module(new Multiply(16))
  val And_002 	 = Module(new And(32))
  val Add_003 	 = Module(new Add(16))

  And_002.io.in 	:= io.in(31,0)
  io.out := Cat(Seq(Add_000.io.out,Multiply_001.io.out))

  Add_003.io.in 	:= Cat(Seq(wire_001))
  wire_002 	 :=  Add_003.io.out(15,0)
  wire_000 	 :=  And_002.io.out(15,0)
  wire_001 	 :=  And_002.io.out(31,16)
  Add_000.io.in 	:= Cat(Seq(wire_002))
  Multiply_001.io.in 	:= Cat(Seq(wire_000))
}

