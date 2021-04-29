package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_1_6 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(64.W))
  val out	 = Output(UInt(148.W))
})
  val wire_000 	 = Wire(UInt(32.W))
  val wire_001 	 = Wire(UInt(16.W))
  val wire_002 	 = Wire(UInt(16.W))
  val wire_003 	 = Wire(UInt(16.W))

  val And_000 	 = Module(new And(32))
  val And_001 	 = Module(new And(16))
  val And_002 	 = Module(new And(32))
  val RandomHardware_003 	 = Module(new RandomHardware_2_3())

  And_000.io.in 	:= io.in(31,0)
  And_002.io.in 	:= io.in(63,32)
  io.out := Cat(Seq(RandomHardware_003.io.out))

  And_001.io.in 	:= Cat(Seq(wire_002))
  wire_001 	 :=  And_001.io.out(15,0)
  wire_000 	 :=  And_000.io.out(31,0)
  wire_002 	 :=  And_002.io.out(15,0)
  wire_003 	 :=  And_002.io.out(31,16)
  RandomHardware_003.io.in 	:= Cat(Seq(wire_000,wire_001,wire_003))
}

