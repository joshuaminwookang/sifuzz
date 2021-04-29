package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_0 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(72.W))
  val out	 = Output(UInt(72.W))
})
  val wire_000 	 = Wire(UInt(40.W))
  val wire_001 	 = Wire(UInt(32.W))
  val wire_002 	 = Wire(UInt(32.W))

  val Add_000 	 = Module(new Add(40))
  val And_001 	 = Module(new And(72))
  val Add_002 	 = Module(new Add(32))
  val And_003 	 = Module(new And(32))

  Add_000.io.in 	:= io.in(39,0)
  And_003.io.in 	:= io.in(71,40)
  io.out := Cat(Seq(And_001.io.out))

  Add_002.io.in 	:= Cat(Seq(wire_002))
  wire_001 	 :=  Add_002.io.out(31,0)
  wire_000 	 :=  Add_000.io.out(39,0)
  wire_002 	 :=  And_003.io.out(31,0)
  And_001.io.in 	:= Cat(Seq(wire_000,wire_001))
}

