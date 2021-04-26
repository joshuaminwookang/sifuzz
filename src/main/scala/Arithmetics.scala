// See LICENSE.txt for license details.
package randomhardware

import chisel3._

//A n-bit adder 
class ComputeAdd(val n:Int,val m:Int) extends Module {
  val io = IO(new Bundle {
    val in1  = Input(UInt(n.W))
    val in2  = Input(UInt(n.W))
    val out  = Output(UInt(m.W))
  })
    io.out := io.in1 + io.in2
}

//A n-bit and unit 
class ComputeAnd(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in1  = Input(UInt(n.W))
    val in2  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    io.out := io.in1 & io.in2
}
