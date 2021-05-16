SiFuzz
========

SiFuzz is a scalable, bottom-up random circuit generator. A hierarchical random graph, describing a transactional actor network of hardware units (compute, memory, and network) and their point-to-point connections, is generated in Python using the `python-igraph` library. 

[Chisel HDL](https://github.com/chipsalliance/chisel3.git) generator then translates the random graph to [Chisel/FIRRTL](https://www.chisel-lang.org/).
Based on the generated FIRRTL,  [RFUZZ](https://github.com/ekiwi/rfuzz.git) performs coverage-directed test generation (CDG) for each random circuit RTL.
Testbench generator creates a Verilog testharness based on the test vectors discovered by RFUZZ, and this testbench can be used for RTL and post-Synthesis geate-level simulation.


# Getting Started for a Ubuntu 18.04 

1. Install  `sbt`:

```
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt
```

2. Install dependencies for [RFUZZ](https://github.com/ekiwi/rfuzz.git)):
```
apt update && apt upgrade
apt install build-essential meson pkg-config openjdk-8-jdk verilator cargo
apt install python3-toml python3-numpy python3-matplotlib graphviz
```
3. Install [`python-igraph`](https://igraph.org/python/)
```
sudo apt-get install python-igraph
sudo apt install python3-pip
pip3 install cairocffi
```
`cairocffi` is used as a graphics back-end by `igraph`.


# Questions and Contributions

We welcome feedback and contributions from the open-source hardware community.
If you have a question or problem, please file an issue on GitHub.
To contribute bugfixes or new features, submit a pull request.

# Contributors
(c) 2021 Josh Kang and Nayiri Krzysztofowicz
