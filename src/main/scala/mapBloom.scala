//see LICENSE for license
package bloom

import Chisel._

// import chisel3.util._
import chisel3.iotesters.PeekPokeTester
import scala.collection.mutable.HashMap
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

class MapBloomModule extends Module {

// class MapBloomModule(val M: Int, val K: Int) extends Module {
  //val W = 64
  val io = new Bundle { 
    val input_value = Input(UInt(64.W))
    // val input_reset = Input(Bool())
    val output_hashBits = Output(Reg(Vec(20000,UInt(1.W))))
    val output_hashIndex = Output(UInt(64.W))
    val output_busy = Output(Bool())
  }
    // states of this module 
    // val s_idle :: s_hash :: s_resp :: Nil = Enum(Bits(), 3)
    // val state_reg = RegInit(s_idle)

     // Local variables
    // val x0  = RegInit(0.U(64.W))
    // val y0  = RegInit(0.U(64.W))

    // val x1  = RegInit(0.U(64.W))
    // val y1  = RegInit(0.U(64.W))

    // val x2  = RegInit(0.U(64.W))
    // val y2  = RegInit(0.U(64.W))

    // val x3  = RegInit(0.U(64.W))
    // val y3  = RegInit(0.U(64.W))

    // val x4  = RegInit(0.U(64.W))
    // val y4  = RegInit(0.U(64.W))

    // val x5  = RegInit(0.U(64.W))
    // val y5  = RegInit(0.U(64.W))

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

    // val done = (i === K.asUInt(64.W))
  
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

    io.output_hashBits(x1) := 1.U(1.W)
    io.output_hashBits(x2(15,0)) := 1.U(1.W)
    io.output_hashBits(x3(15,0)) := 1.U(1.W)
    io.output_hashBits(x4(15,0)) := 1.U(1.W)
    io.output_hashBits(x5(15,0)) := 1.U(1.W)

    io.output_busy := (io.output_hashBits(x1(15,0)) =/= 1.U(1.W)) || (io.output_hashBits(x2(15,0)) =/= 1.U(1.W)) || (io.output_hashBits(x3(15,0)) =/= 1.U(1.W)) || (io.output_hashBits(x4) =/= 1.U(1.W)) || (io.output_hashBits(x5(15,0)) =/= 1.U(1.W))
    io.output_hashIndex := x5

    // when(io.input_reset){
    //   i := RegInit(0.U(64.W))
    //   x := io.input_value
    //   y := io.input_value >> 4
    // } otherwise {
    //   i := i + 1.U(64.W)
    //   x := Mux(~done, (x + y) % K.asUInt(64.W), x)  
    //   y := Mux(~done, (y + i) % K.asUInt(64.W), y)
    //   io.output_hashBits(x) := 1.U(1.W)
    //   io.output_hashIndex := x
    // }

    // switch(state_reg) {
    //   is (s_idle) {
    //     when(io.input_reset){
    //       i := RegInit(0.U(64.W))
    //       x := io.input_value
    //       y := io.input_value >> 4.U(64.W)
    //       io.output_hashBits(x) := 1.U(1.W)
    //       io.output_hashIndex := x
    //       // get into hashing state
    //       state_reg := s_hash
    //       io.output_busy := true.B
    //     } otherwise {
    //       io.output_busy := false.B
    //     }
    //   }
    //   is (s_hash) {
    //     i := i + 1.U(64.W)
    //     x := (x + y) % K.asUInt(64.W)  
    //     y := (y + i) % K.asUInt(64.W)
    //     io.output_hashBits(x) := 1.U(1.W)
    //     io.output_hashIndex := x
    //     io.output_busy := true.B
    //     // are we done hashing?
    //     when (done) {
    //       state_reg := s_resp
    //     }
    //   }
    //   // respond to main module 
    //   is (s_resp) {
    //     io.output_hashBits(x) := 1.U(1.W)
    //     io.output_hashIndex := i
    //     state_reg := s_idle
    //     io.output_busy := false.B
    //   }
    // }


}