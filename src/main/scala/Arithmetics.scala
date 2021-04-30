// See LICENSE.txt for license details.
package randomhardware

import chisel3._

//A n-bit adder 
class Add(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(n-1, half)
    val in2 = io.in(half-1,0)
    io.out := in1 + in2
}

//A n-bit and unit 
class And(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(n-1, half)
    val in2 = io.in(half-1,0)
    io.out := in1 & in2
}

// n-bit MULTIPLY unit 
class Mul(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(n-1, half)
    val in2 = io.in(half-1,0)
    io.out := in1 * in2
}

// n-bit MULTIPLY unit 
class Div(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(n-1, half)
    val in2 = io.in(half-1,0)
    io.out := in1 / in2
}

// n-bit MULTIPLY unit 
class Mod(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(n.W))
    val out  = Output(UInt(n.W))
  })
    val half = n/2
    val in1 = io.in(n-1, half)
    val in2 = io.in(half-1,0)
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