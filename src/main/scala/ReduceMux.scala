// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import scala.util.Random

class ReduceAndMux(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val r = scala.util.Random
    val m = if (n >= 4) r.nextInt(n/4) + 1 else 1
    val half = (n-m)/2

    io.out := Mux((io.in.getWidth > 2).asBool, 
      Mux(io.in(m-1, 0).andR, io.in(m+half-1, m), io.in(n-1, m+half)), 
      Mux(io.in(0).asBool, io.in(1),io.in(0)))
}

class ReduceOrMux(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val r = scala.util.Random
    val m = if (n >= 4) r.nextInt(n/4) + 1 else 1
    val half = (n-m)/2

    io.out := Mux((io.in.getWidth > 4).asBool, 
      Mux(io.in(m-1, 0).orR, io.in(m+half-1, m), io.in(n-1, m+half)), 
      Mux(io.in(0).asBool, io.in(1),io.in(0)))
}

class ReduceXorMux(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val r = scala.util.Random
    val m = if (n >= 4) r.nextInt(n/4) + 1 else 1
    val half = (n-m)/2

    io.out := Mux((io.in.getWidth > 2).asBool, 
      Mux(io.in(m-1, 0).xorR, io.in(m+half-1, m), io.in(n-1, m+half)), 
      Mux(io.in(0).asBool, io.in(1),io.in(0)))
}