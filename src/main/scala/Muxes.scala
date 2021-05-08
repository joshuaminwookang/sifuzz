// See LICENSE.txt for license details.
package randomhardware

import chisel3._
import chisel3.util._
import scala.util.Random

// TODO: There must be a more parameterizable way to instatiate all of these
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
  val sel = io.in(4*n+1,4*n)
  val in3 = io.in(4*n-1,3*n)
  val in2 = io.in(3*n-1,2*n)
  val in1 = io.in(2*n-1,n)
  val in0 = io.in(n-1,0)
  when     (sel === "b11".U)  { io.out := in3 }
  .elsewhen(sel === "b10".U)  { io.out := in2 }
  .elsewhen(sel === "b01".U)  { io.out := in1 }
  .otherwise              { io.out := in0 }
}

class Mux8(val n:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((8*n+3).W))
    val out  = Output(UInt(n.W))
  })
  val sel = io.in(8*n+2,8*n)
  val in7 = io.in(8*n-1,3*n)
  val in6 = io.in(7*n-1,2*n)
  val in5 = io.in(6*n-1,5*n)
  val in4 = io.in(5*n-1,4*n)
  val in3 = io.in(4*n-1,3*n)
  val in2 = io.in(3*n-1,2*n)
  val in1 = io.in(2*n-1,n)
  val in0 = io.in(n-1,0)
  when     (sel === "b111".U)  { io.out := in7 }
  .elsewhen(sel === "b110".U)  { io.out := in6 }
  .elsewhen(sel === "b101".U)  { io.out := in5 }
  .elsewhen(sel === "b100".U)  { io.out := in4 }
  .elsewhen(sel === "b011".U)  { io.out := in3 }
  .elsewhen(sel === "b010".U)  { io.out := in2 }
  .elsewhen(sel === "b001".U)  { io.out := in1 }
  .otherwise              { io.out := in0 }
}

// class NMux (val)
class ReduceAndMux(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n+2*b).W))
    val out  = Output(UInt(n.W))
  })
    val IN1        = io.in( 2*n+b-1 , n+b )
    val IN2        = io.in( n+b-1   , b   )
    val SEL        = io.in( b-1     , 0   )
    
    io.out := Mux(SEL.andR, IN1, IN2)
}

class ReduceOrMux(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n+2*b).W))
    val out  = Output(UInt(n.W))
  })
    val IN1        = io.in( 2*n+2*b-1 , n+2*b )
    val IN2        = io.in( n+2*b-1   , 2*b   )
    val SEL        = io.in( 2*b-1     , 0     )
    
    io.out := Mux(SEL.orR, IN1, IN2)
}

class ReduceXorMux(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n+2*b).W))
    val out  = Output(UInt(n.W))
  })
    val IN1        = io.in( 2*n+2*b-1 , n+2*b )
    val IN2        = io.in( n+2*b-1   , 2*b   )
    val SEL        = io.in( 2*b-1     , 0     )
    
    io.out := Mux(SEL.xorR, IN1, IN2)
}

class CompareMux(val n:Int, val b:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt((2*n+2*b).W))
    val out  = Output(UInt(n.W))
  })
    val IN1        = io.in( 2*n+2*b-1   , n+b )
    val IN2        = io.in( n+2*b-1     , 2*b )
    val SEL1       = io.in( 2*b-1       , b   )
    val SEL2       = io.in( b-1         , 0   )
     
    io.out := Mux(SEL1 >= SEL2, IN1, IN2)
}
