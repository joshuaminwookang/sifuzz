// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import chisel3.util._

class ResetShiftRegister(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in    = Input(UInt(n.W))
    val shift = Input(Bool())
    val out   = Output(UInt(n.W))
  })
  // Register reset to zero
  val r0 = RegInit(0.U(n.W))
  val r1 = RegInit(0.U(n.W))
  val r2 = RegInit(0.U(n.W))
  val r3 = RegInit(0.U(n.W))
  when (io.shift) {
    r0 := io.in
    r1 := r0
    r2 := r1
    r3 := r2
  }
  io.out := r3
}

class ShiftRegister(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out = Output(UInt(n.W))
  })
  val r0 = RegNext(io.in)
  val r1 = RegNext(r0)
  val r2 = RegNext(r1)
  val r3 = RegNext(r2)
  io.out := r3
}

class Register(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out = Output(UInt(n.W))
  })
  val r0 = RegNext(io.in)
  io.out := r0
}

// DEPT=5 for now adjusted from example
class Stack(val n: Int) extends Module {
  val io = IO(new Bundle {
    val in      = Input(UInt(n.W))
    val out     = Output(UInt(n.W))
    // val push    = Input(Bool())
    // val pop     = Input(Bool())
    // val en      = Input(Bool())
    // val dataIn  = Input(UInt(32.W))
    // val dataOut = Output(UInt(32.W))
  })

  val push    = io.in(n-1)
  val pop     = io.in(n-2)
  val en      = io.in(n-3)
  val dataIn  = io.in(n-4,0)

  var depth:Int = 5
  val real_width:Int = n-3
  val stack_mem = Mem(depth, UInt(real_width.W))
  val sp        = RegInit(0.U(log2Ceil(depth+1).W))
  val out       = RegInit(0.U(real_width.W))

  when (en) {
    when(push && (sp < depth.asUInt)) {
      stack_mem(sp) := dataIn
      sp := sp + 1.U
    } .elsewhen(pop && (sp > 0.U)) {
      sp := sp - 1.U
    }
    when (sp > 0.U) {
      out := stack_mem(sp - 1.U)
    }
  }

  io.out := Cat("b000".U, out)
}
