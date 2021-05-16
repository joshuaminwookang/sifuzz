// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import chisel3.util._
import chisel3.util.random._
import chisel3.assert

// TODO: There must be a more parameterizable way to instatiate all of these
class LFSR(val n:Int, val b: Int) extends Module {
  val io = IO(new Bundle {
    val out  = Output(UInt(n.W))
  })
  val lfsr = Module(new MaxPeriodFibonacciLFSR(n))
  io.out := lfsr.io.out
}   