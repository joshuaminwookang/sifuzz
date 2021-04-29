package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_15 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(40.W))
  val out	 = Output(UInt(40.W))
})
  val wire_000 	 = Wire(UInt(40.W))
  val wire_001 	 = Wire(UInt(40.W))

  val Add_000 	 = Module(new Add(40))
  val Add_001 	 = Module(new Add(40))
  val Add_002 	 = Module(new Add(40))

  Add_001.io.in 	:= io.in(39,0)
  io.out := Cat(Seq(Add_000.io.out))

  Add_002.io.in 	:= Cat(Seq(wire_000))
  wire_001 	 :=  Add_002.io.out(39,0)
  wire_000 	 :=  Add_001.io.out(39,0)
  Add_000.io.in 	:= Cat(Seq(wire_001))
}

