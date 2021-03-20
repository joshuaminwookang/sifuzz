// RoCC Bloom filter accelerator
// Now accessing shared D$ for data transfer
// (c) 2019 Josh Kang 

// Current version hard-codes the BF, m = 20,000 and k = 5
// To-do: parameterize m and k; make accelerator more scalable

package randomaccels

import Chisel._
// import chisel3.util._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.rocket._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tile._
import freechips.rocketchip.util.InOrderArbiter

class RandomAccel(opcodes: OpcodeSet)
(implicit p: Parameters) extends LazyRoCC(
    opcodes) {
  override lazy val module = new RandomAccelImp(this)
}

class RandomAccelImp(outer: RandomAccel)(implicit p: Parameters) extends LazyRoCCModuleImp(outer) {
  
} 


class WithRandomAccel extends Config ((site, here, up) => {

  case BuildRoCC => Seq(
    (p: Parameters) => {
      val bloom = LazyModule.apply(new RandomAccel(OpcodeSet.custom2)(p))
      dut_accel
    }
  )
})
