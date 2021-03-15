//see LICENSE for license
package bloom

import Chisel._

// import chisel3.util._
import chisel3.iotesters.PeekPokeTester
import scala.collection.mutable.HashMap
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

class TestBloomModule extends Module {

// class TestBloomModule(val M: Int, val K: Int) extends Module {
  //val W = 64
  val io = new Bundle { 
    val input_value = Input(UInt(64.W))
    val input_bit_array = Input(Reg(Vec(20000,UInt(1.W))))
    // val input_reset = Input(Bool())
    val output_found = Output(UInt(1.W))
    val output_debug = Output(UInt(64.W))
    val output_busy = Output(Bool())
  }
    // states of this module 
    // val s_idle :: s_hash :: s_resp :: Nil = Enum(Bits(), 3)
    // val state_reg = RegInit(s_idle)

     // Local variables
    val x0  = Wire(UInt())
    val y0  = Wire(UInt())

    val x1  = Wire(UInt())
    val y1  = Wire(UInt())

    val x2  = Wire(UInt())
    val y2  = Wire(UInt())

    val x3  = Wire(UInt())
    val y3  = Wire(UInt())

    val x4  = Wire(UInt())
    val y4  = Wire(UInt())

    val x5  = Wire(UInt())
    val y5  = Wire(UInt())

    // val found1 = RegInit(Bool(true))
    // val found2 = RegInit(Bool(true))
    // val found3 = RegInit(Bool(true))
    // val found4 = RegInit(Bool(true))
    // val found5 = RegInit(Bool(true))

    val found1 = Wire(UInt())
    val found2 = Wire(UInt())
    val found3 = Wire(UInt())
    val found4 = Wire(UInt())
    val found5 = Wire(UInt())

    // Hash computation
    x0 := io.input_value
    y0 := io.input_value >> 4.U(64.W)

    x1 := (x0 + y0) % 20000.U(64.W)
    y1 := (y0 + 0.U(64.W)) % 20000.U(64.W)

    x2 := (x1 + y1) % 20000.U(64.W)
    y2 := (y1 + 1.U(64.W)) % 20000.U(64.W)

    x3 := (x2 + y2) % 20000.U(64.W)
    y3 := (y2 + 2.U(64.W)) % 20000.U(64.W)

    x4 := (x3 + y3) % 20000.U(64.W)
    y4 := (y3 + 3.U(64.W)) % 20000.U(64.W)

    x5 := (x4 + y4) % 20000.U(64.W)
    y5 := (y4 + 4.U(64.W)) % 20000.U(64.W)

    // found1 := io.input_bit_array(x1) === 1.U(1.W)
    // found2 := io.input_bit_array(x2) === 1.U(1.W)
    // found3 := io.input_bit_array(x2) === 1.U(1.W)
    // found4 := io.input_bit_array(x2) === 1.U(1.W)
    // found5 := io.input_bit_array(x2) === 1.U(1.W)
    
    found1 := io.input_bit_array(x1(15,0)) 
    found2 := io.input_bit_array(x2(15,0)) 
    found3 := io.input_bit_array(x3(15,0)) 
    found4 := io.input_bit_array(x4(15,0)) 
    found5 := io.input_bit_array(x5(15,0))

    io.output_busy :=  (found1 =/= io.input_bit_array(x1(15,0))) || (found2 =/= io.input_bit_array(x2(15,0))) || (found3 =/= io.input_bit_array(x3(15,0))) || (found4 =/= io.input_bit_array(x4(15,0)))|| (found5 =/= io.input_bit_array(x5(15,0)))
    io.output_debug := x5*100000.U(64.W) + found1*10000.U(64.W)+ found2*1000.U(64.W)+found3*100.U(64.W)+found4*10.U(64.W)+found5
    io.output_found := found1 & found2 & found3 & found4 & found5

    // BETTER WAY WITH PARAMETERIZABLE HASH UNITS 
    // But not working rn

    // val i  = RegInit(0.U(64.W))
    // val bit = RegInit(1.U(1.W))
    // val done = RegInit(Bool(false))
    
    // done := (i === 5.U(64.W)) || (bit === 0.U(1.W))

    // switch(state_reg) {
    //   is (s_idle) {
    //     when(io.input_reset){
    //       i := RegInit(0.U(64.W))
    //       x := io.input_value
    //       y := io.input_value >> 4.U(64.W)
    //       bit := RegInit(1.U(1.W))
    //       io.output_bit := 0.U(1.W)
    //       // get into hashing state
    //       state_reg := s_hash
    //       io.output_busy := true.B
    //     } otherwise {
    //       io.output_busy := false.B
    //     }
    //   }
    //   is (s_hash) {
    //     i := i + 1.U(64.W)
    //     x := (x + y) % 5.U(64.W)  
    //     y := (y + i) % 5.U(64.W)
    //     bit := io.input_bit_array(x)
    //     io.output_bit := ~bit
    //     io.output_busy := true.B
    //     when (done) {
    //       state_reg := s_resp
    //     }
    //   }
    //   is (s_resp) {
    //     bit := io.input_bit_array(x)
    //     io.output_bit := ~bit
    //     io.output_busy := false.B
    //     state_reg := s_idle
    //   }
    // }
}