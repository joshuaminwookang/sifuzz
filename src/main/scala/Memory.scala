// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import chisel3.util._

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

// source: https://therestlessengineer.com/processor-episode-3/
/** 
 * The Register File for the JOCEL processor implementation.
 */
class RegFile2R1W(val n:Int, val a:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((n+2*a).W))
    val out  = Output(UInt((2*n).W))
  })
  
  val R1_SEL        = io.in( n+2*a-1, n+a )
  val R2_SEL        = io.in( n+a-1  , n   )
  val W_DATA        = io.in( n-1    , 0   )

  val registers = Reg(Vec(1 << a, UInt(n.W)))

  // for now, always write data (bc LD signal might be always low in our graph)
  registers(R1_SEL) := W_DATA

  // Set the output to be whatever was selected.
  val R1 = registers(R1_SEL)
  val R2 = registers(R2_SEL)

  io.out := Cat(R1,R2)
}

class ResetShiftRegister(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in    = Input(UInt((n+1).W))
    val out   = Output(UInt(n.W))
  })
  // Register reset to zero
  val shift = io.in(0)
  val r0 = RegInit(0.U(n.W))
  val r1 = RegInit(0.U(n.W))
  val r2 = RegInit(0.U(n.W))
  val r3 = RegInit(0.U(n.W))
  when (shift) {
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

// depth of stack = b 
class Stack(val n: Int, val b: Int) extends Module {
  val io = IO(new Bundle {
    val in      = Input(UInt((n+3).W))
    val out     = Output(UInt(n.W))
  })

  val push    = io.in(0)
  val pop     = io.in(1)
  val en      = io.in(2)
  val dataIn  = io.in(n+2,3)

  val stack_mem = Mem(b, UInt(n.W))
  val sp        = RegInit(0.U(log2Ceil(b+1).W))
  val out       = RegInit(0.U(n.W))

  when (en) {
    when(push && (sp < b.asUInt)) {
      stack_mem(sp) := dataIn
      sp := sp + 1.U
    } .elsewhen(pop && (sp > 0.U)) {
      sp := sp - 1.U
    }
    when (sp > 0.U) {
      out := stack_mem(sp - 1.U)
    }
  }

  io.out := out
}

