package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_1_5 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(68.W))
  val out	 = Output(UInt(32.W))
})
  val wire_000 	 = Wire(UInt(32.W))

  val Add_000 	 = Module(new Add(32))
  val RandomHardware_001 	 = Module(new RandomHardware_2_1())

  RandomHardware_001.io.in 	:= io.in(67,0)
  io.out := Cat(Seq(Add_000.io.out))

  wire_000 	 :=  RandomHardware_001.io.out(31,0)
  Add_000.io.in 	:= Cat(Seq(wire_000))
}

