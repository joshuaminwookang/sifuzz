package randomaccels

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.withClock
import chisel3.util.HasBlackBoxResource


/**
  * Chisel wrapper for random hardware 
  */
class RandomHardware(val n: Int) extends BlackBox(Map("N" -> IntParam(n))) with HasBlackBoxResource {
  val io = IO(new Bundle {
    val in1 = Input(UInt(64.W))
    val in2 = Input(UInt(64.W))
    val out = Output(UInt(64.W))
  })
  addResource("/vsrc/RealAdd.v")
}

object RandomHWGenerator extends App {
  (new ChiselStage).emitVerilog(new RandomHardware)
}