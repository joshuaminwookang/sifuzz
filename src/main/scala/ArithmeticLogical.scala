// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import chisel3.util._

//A n-bit adder 
class Add(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt((n+1).W))
  })
    val in1 = io.in(2*n-1,n)
    val in2 = io.in(n-1,0)
    io.out := in1 + in2
}

//A n-bit sbu 
class Sub(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt((n+1).W))
  })
    val in1 = io.in(2*n-1,n).asSInt
    val in2 = io.in(n-1,0).asSInt
    val sub = in1 - in2
    io.out := sub.asUInt
}

//A n-bit and unit 
class And(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt(n.W))
  })
    val in1 = io.in(2*n-1, n)
    val in2 = io.in(n-1,0)
    io.out := in1 & in2
}

// n-bit MULTIPLY unit 
class Mul(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt((2*n).W))
  })
    val in1 = io.in(2*n-1, n)
    val in2 = io.in(n-1,0)
    io.out := in1 * in2
}

// n-bit MULTIPLY unit 
class Div(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(2*n-1, n)
    val in2 = io.in(n-1,0)
    io.out := in1 / in2
}

// n-bit MULTIPLY unit 
class Mod(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n).W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(2*n-1, n)
    val in2 = io.in(n-1,0)
    io.out := in1 % in2
}

//A n-bit adder 
class Accum(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val sum = Reg(UInt()) 
    sum := sum + io.in 
    io.out := sum
}


//A n-bit shift left (arithemtic) by b 
class ShiftLeft(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt((n+b).W))
  })
    io.out := io.in << b
}

//A n-bit shift left (arithemtic) by b 
class ShiftRight(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    io.out := io.in >> b
}

// Sign extend to double width
class SignExtendDouble(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt((2*n).W))
  })
    io.out := Cat(Fill(n,io.in(n-1)), io.in)
}

class ByteSelector(val n:Int, val a:Int)  extends Module {
  val io = IO(new Bundle {
    val in     = Input(UInt((n+a).W))
    val out    = Output(UInt(8.W))
  })
  val s = 1<< (a-1)
  io.out := 0.U(8.W)
  io.out := io.in(a + s + 7, a + s)
}
