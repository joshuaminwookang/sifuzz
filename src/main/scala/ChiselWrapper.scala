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
  addResource("/vsrc/RealAdd.v")
}

class RandomHardware extends Module{
  val io = IO(new Bundle {
    val in1 = Input(UInt(64.W))
    val in2 = Input(UInt(64.W))
    val out = Output(UInt(64.W))
  })
   val BB = Module(new RandomBlackBox(64))
   BB.io.in1 := io.in1
   BB.io.in1 := io.in1
   io.out := BB.io.out
}

object RandomHWGenerator extends App {
  (new ChiselStage).emitVerilog(new RandomHardware)
}