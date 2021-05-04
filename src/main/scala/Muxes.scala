// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import scala.util.Random


class Mux2(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n+1).W))
    val out  = Output(UInt(n.W))
  })
  val sel = io.in(2*n).asBool
  val in1 = io.in(2*n-1,n)
  val in2 = io.in(n-1,0)
  when(sel)   { io.out := in1 }
  .otherwise  { io.out := in2 }
}