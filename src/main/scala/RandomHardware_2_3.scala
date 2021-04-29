package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware_2_3 extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(124.W))
  val out	 = Output(UInt(124.W))
})
  val wire_000 	 = Wire(UInt(58.W))
  val wire_001 	 = Wire(UInt(12.W))
  val wire_002 	 = Wire(UInt(12.W))
  val wire_003 	 = Wire(UInt(24.W))
  val wire_004 	 = Wire(UInt(18.W))
  val wire_005 	 = Wire(UInt(18.W))
  val wire_006 	 = Wire(UInt(40.W))
  val wire_007 	 = Wire(UInt(58.W))
  val wire_008 	 = Wire(UInt(12.W))

  val And_000 	 = Module(new And(12))
  val And_001 	 = Module(new And(58))
  val Multiply_002 	 = Module(new Multiply(82))
  val Add_003 	 = Module(new Add(24))
  val Add_004 	 = Module(new Add(24))
  val Multiply_005 	 = Module(new Multiply(36))
  val Multiply_006 	 = Module(new Multiply(40))
  val And_007 	 = Module(new And(58))
  val And_008 	 = Module(new And(12))
  val Multiply_009 	 = Module(new Multiply(30))

  Add_003.io.in 	:= io.in(23,0)
  Add_004.io.in 	:= io.in(47,24)
  Multiply_005.io.in 	:= io.in(83,48)
  Multiply_006.io.in 	:= io.in(123,84)
  io.out := Cat(Seq(And_000.io.out,Multiply_002.io.out,Multiply_009.io.out))

  And_001.io.in 	:= Cat(Seq(wire_004,wire_006))
  wire_000 	 :=  And_001.io.out(57,0)
  And_007.io.in 	:= Cat(Seq(wire_000))
  wire_007 	 :=  And_007.io.out(57,0)
  And_008.io.in 	:= Cat(Seq(wire_002))
  wire_008 	 :=  And_008.io.out(11,0)
  wire_001 	 :=  Add_003.io.out(11,0)
  wire_002 	 :=  Add_003.io.out(23,12)
  wire_003 	 :=  Add_004.io.out(23,0)
  wire_004 	 :=  Multiply_005.io.out(17,0)
  wire_005 	 :=  Multiply_005.io.out(35,18)
  wire_006 	 :=  Multiply_006.io.out(39,0)
  And_000.io.in 	:= Cat(Seq(wire_001))
  Multiply_002.io.in 	:= Cat(Seq(wire_003,wire_007))
  Multiply_009.io.in 	:= Cat(Seq(wire_005,wire_008))
}

