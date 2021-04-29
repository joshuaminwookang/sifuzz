package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_9 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(116.W))
  val out	 = Output(UInt(116.W))
})
  val wire_000 	 = Wire(UInt(18.W))
  val wire_001 	 = Wire(UInt(18.W))
  val wire_002 	 = Wire(UInt(38.W))
  val wire_003 	 = Wire(UInt(60.W))
  val wire_004 	 = Wire(UInt(20.W))
  val wire_005 	 = Wire(UInt(20.W))
  val wire_006 	 = Wire(UInt(40.W))

  val Multiply_000 	 = Module(new Multiply(36))
  val And_001 	 = Module(new And(60))
  val Add_002 	 = Module(new Add(38))
  val Multiply_003 	 = Module(new Multiply(38))
  val And_004 	 = Module(new And(18))
  val Add_005 	 = Module(new Add(60))
  val Add_006 	 = Module(new Add(40))
  val And_007 	 = Module(new And(40))

  Multiply_000.io.in 	:= io.in(35,0)
  Add_006.io.in 	:= io.in(75,36)
  And_007.io.in 	:= io.in(115,76)
  io.out := Cat(Seq(And_001.io.out,Multiply_003.io.out,And_004.io.out))

  Add_002.io.in 	:= Cat(Seq(wire_000,wire_004))
  wire_002 	 :=  Add_002.io.out(37,0)
  Add_005.io.in 	:= Cat(Seq(wire_005,wire_006))
  wire_003 	 :=  Add_005.io.out(59,0)
  wire_000 	 :=  Multiply_000.io.out(17,0)
  wire_001 	 :=  Multiply_000.io.out(35,18)
  wire_004 	 :=  Add_006.io.out(19,0)
  wire_005 	 :=  Add_006.io.out(39,20)
  wire_006 	 :=  And_007.io.out(39,0)
  And_001.io.in 	:= Cat(Seq(wire_003))
  Multiply_003.io.in 	:= Cat(Seq(wire_002))
  And_004.io.in 	:= Cat(Seq(wire_001))
}

