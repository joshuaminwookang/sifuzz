package randomhardware 

import chisel3._ 
import chisel3.stage.ChiselStage 
import chisel3.util._

class RandomHardware extends Module {
val io = IO(new Bundle {
  val in 	 = Input(UInt(44.W))
  val out	 = Output(UInt(38.W))
})
