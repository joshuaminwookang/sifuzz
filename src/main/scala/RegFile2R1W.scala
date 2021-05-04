package randomhardware

import chisel3._

import chisel3.util._

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