package randomhardware

import chisel3._

class Reg(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    io.out := RegNext(io.in)
}

class RegE(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((n+1).W))
    val out  = Output(UInt(n.W))
  })
    val data = io.in(n,1)
    val en = io.in(0)
    val reg = Reg(UInt((n-1).W))
    when(en) { reg := data }
    io.out := reg
}