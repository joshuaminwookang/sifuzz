import chisel3._
import chisel3.stage.ChiselStage
import chisel3.withClock
import chisel3.util.HasBlackBoxResource
import chisel3.experimental._

/**
  * Chisel wrapper for random hardware 
  */
class RandomBlackBox(val n: Int) extends BlackBox(Map("N" -> IntParam(n))) with HasBlackBoxResource {
  val io = IO(new Bundle {
    val in1 = Input(UInt(n.W))
    val in2 = Input(UInt(n.W))
    val out = Output(UInt(n.W))
  })
  addResource("/vsrc/Random_Temp.v")
}

class RandomHardware extends Module{
  val io = IO(new Bundle {
    val in1 = Input(UInt(64.W))
    val in2 = Input(UInt(64.W))
    val in_valid = Input(Bool())
    val out = Output(UInt(64.W))
  })
  // Instatiate registers and Blackbox module
  val x  = Reg(UInt())
  val y  = Reg(UInt())
  val BB = Module(new RandomBlackBox(64))

  // Take Inputs
  when(io.in_valid) {
    x := io.in1
    y := io.in2
  }

  // Wire 
  BB.io.in1 := x
  BB.io.in2 := y
  io.out := BB.io.out
}

object RandomHWGenerator extends App {
  (new ChiselStage).emitVerilog(new RandomHardware)
}