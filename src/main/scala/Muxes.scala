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
  val in0 = io.in(n-1,0)
  when(sel)   { io.out := in1 }
  .otherwise  { io.out := in0 }
}

class Mux4(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((4*n+2).W))
    val out  = Output(UInt(n.W))
  })
  val sel = io.in(4*n+1,4*n).asBool
  val in3 = io.in(4*n-1,3*n)
  val in2 = io.in(3*n-1,2*n)
  val in1 = io.in(2*n-1,n)
  val in0 = io.in(n-1,0)
  when     (sel == "11")  { io.out := in3 }
  .elsewhen(sel == "10")  { io.out := in2 }
  .elsewhen(sel == "01")  { io.out := in1 }
  .otherwise              { io.out := in0 }
}