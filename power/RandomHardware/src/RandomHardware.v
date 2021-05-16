module ShiftLeft(
  input  [27:0] io_in,
  output [30:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftRight(
  input  [39:0] io_in,
  output [39:0] io_out
);
  assign io_out = {{3'd0}, io_in[39:3]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftLeft_1(
  input  [4:0] io_in,
  output [5:0] io_out
);
  assign io_out = {io_in, 1'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module ShiftLeft_2(
  input  [6:0] io_in,
  output [9:0] io_out
);
  assign io_out = {io_in, 3'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module RegFile2R1W(
  input          clock,
  input  [63:0]  io_in,
  output [103:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  wire [5:0] R1_SEL = io_in[63:58]; // @[Memory.scala 37:28]
  wire [5:0] R2_SEL = io_in[57:52]; // @[Memory.scala 38:28]
  wire [51:0] W_DATA = io_in[51:0]; // @[Memory.scala 39:28]
  reg [51:0] registers_0; // @[Memory.scala 41:22]
  reg [51:0] registers_1; // @[Memory.scala 41:22]
  reg [51:0] registers_2; // @[Memory.scala 41:22]
  reg [51:0] registers_3; // @[Memory.scala 41:22]
  reg [51:0] registers_4; // @[Memory.scala 41:22]
  reg [51:0] registers_5; // @[Memory.scala 41:22]
  reg [51:0] registers_6; // @[Memory.scala 41:22]
  reg [51:0] registers_7; // @[Memory.scala 41:22]
  reg [51:0] registers_8; // @[Memory.scala 41:22]
  reg [51:0] registers_9; // @[Memory.scala 41:22]
  reg [51:0] registers_10; // @[Memory.scala 41:22]
  reg [51:0] registers_11; // @[Memory.scala 41:22]
  reg [51:0] registers_12; // @[Memory.scala 41:22]
  reg [51:0] registers_13; // @[Memory.scala 41:22]
  reg [51:0] registers_14; // @[Memory.scala 41:22]
  reg [51:0] registers_15; // @[Memory.scala 41:22]
  reg [51:0] registers_16; // @[Memory.scala 41:22]
  reg [51:0] registers_17; // @[Memory.scala 41:22]
  reg [51:0] registers_18; // @[Memory.scala 41:22]
  reg [51:0] registers_19; // @[Memory.scala 41:22]
  reg [51:0] registers_20; // @[Memory.scala 41:22]
  reg [51:0] registers_21; // @[Memory.scala 41:22]
  reg [51:0] registers_22; // @[Memory.scala 41:22]
  reg [51:0] registers_23; // @[Memory.scala 41:22]
  reg [51:0] registers_24; // @[Memory.scala 41:22]
  reg [51:0] registers_25; // @[Memory.scala 41:22]
  reg [51:0] registers_26; // @[Memory.scala 41:22]
  reg [51:0] registers_27; // @[Memory.scala 41:22]
  reg [51:0] registers_28; // @[Memory.scala 41:22]
  reg [51:0] registers_29; // @[Memory.scala 41:22]
  reg [51:0] registers_30; // @[Memory.scala 41:22]
  reg [51:0] registers_31; // @[Memory.scala 41:22]
  reg [51:0] registers_32; // @[Memory.scala 41:22]
  reg [51:0] registers_33; // @[Memory.scala 41:22]
  reg [51:0] registers_34; // @[Memory.scala 41:22]
  reg [51:0] registers_35; // @[Memory.scala 41:22]
  reg [51:0] registers_36; // @[Memory.scala 41:22]
  reg [51:0] registers_37; // @[Memory.scala 41:22]
  reg [51:0] registers_38; // @[Memory.scala 41:22]
  reg [51:0] registers_39; // @[Memory.scala 41:22]
  reg [51:0] registers_40; // @[Memory.scala 41:22]
  reg [51:0] registers_41; // @[Memory.scala 41:22]
  reg [51:0] registers_42; // @[Memory.scala 41:22]
  reg [51:0] registers_43; // @[Memory.scala 41:22]
  reg [51:0] registers_44; // @[Memory.scala 41:22]
  reg [51:0] registers_45; // @[Memory.scala 41:22]
  reg [51:0] registers_46; // @[Memory.scala 41:22]
  reg [51:0] registers_47; // @[Memory.scala 41:22]
  reg [51:0] registers_48; // @[Memory.scala 41:22]
  reg [51:0] registers_49; // @[Memory.scala 41:22]
  reg [51:0] registers_50; // @[Memory.scala 41:22]
  reg [51:0] registers_51; // @[Memory.scala 41:22]
  reg [51:0] registers_52; // @[Memory.scala 41:22]
  reg [51:0] registers_53; // @[Memory.scala 41:22]
  reg [51:0] registers_54; // @[Memory.scala 41:22]
  reg [51:0] registers_55; // @[Memory.scala 41:22]
  reg [51:0] registers_56; // @[Memory.scala 41:22]
  reg [51:0] registers_57; // @[Memory.scala 41:22]
  reg [51:0] registers_58; // @[Memory.scala 41:22]
  reg [51:0] registers_59; // @[Memory.scala 41:22]
  reg [51:0] registers_60; // @[Memory.scala 41:22]
  reg [51:0] registers_61; // @[Memory.scala 41:22]
  reg [51:0] registers_62; // @[Memory.scala 41:22]
  reg [51:0] registers_63; // @[Memory.scala 41:22]
  wire [51:0] _GEN_65 = 6'h1 == R1_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_66 = 6'h2 == R1_SEL ? registers_2 : _GEN_65; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_67 = 6'h3 == R1_SEL ? registers_3 : _GEN_66; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_68 = 6'h4 == R1_SEL ? registers_4 : _GEN_67; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_69 = 6'h5 == R1_SEL ? registers_5 : _GEN_68; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_70 = 6'h6 == R1_SEL ? registers_6 : _GEN_69; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_71 = 6'h7 == R1_SEL ? registers_7 : _GEN_70; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_72 = 6'h8 == R1_SEL ? registers_8 : _GEN_71; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_73 = 6'h9 == R1_SEL ? registers_9 : _GEN_72; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_74 = 6'ha == R1_SEL ? registers_10 : _GEN_73; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_75 = 6'hb == R1_SEL ? registers_11 : _GEN_74; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_76 = 6'hc == R1_SEL ? registers_12 : _GEN_75; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_77 = 6'hd == R1_SEL ? registers_13 : _GEN_76; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_78 = 6'he == R1_SEL ? registers_14 : _GEN_77; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_79 = 6'hf == R1_SEL ? registers_15 : _GEN_78; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_80 = 6'h10 == R1_SEL ? registers_16 : _GEN_79; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_81 = 6'h11 == R1_SEL ? registers_17 : _GEN_80; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_82 = 6'h12 == R1_SEL ? registers_18 : _GEN_81; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_83 = 6'h13 == R1_SEL ? registers_19 : _GEN_82; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_84 = 6'h14 == R1_SEL ? registers_20 : _GEN_83; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_85 = 6'h15 == R1_SEL ? registers_21 : _GEN_84; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_86 = 6'h16 == R1_SEL ? registers_22 : _GEN_85; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_87 = 6'h17 == R1_SEL ? registers_23 : _GEN_86; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_88 = 6'h18 == R1_SEL ? registers_24 : _GEN_87; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_89 = 6'h19 == R1_SEL ? registers_25 : _GEN_88; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_90 = 6'h1a == R1_SEL ? registers_26 : _GEN_89; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_91 = 6'h1b == R1_SEL ? registers_27 : _GEN_90; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_92 = 6'h1c == R1_SEL ? registers_28 : _GEN_91; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_93 = 6'h1d == R1_SEL ? registers_29 : _GEN_92; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_94 = 6'h1e == R1_SEL ? registers_30 : _GEN_93; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_95 = 6'h1f == R1_SEL ? registers_31 : _GEN_94; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_96 = 6'h20 == R1_SEL ? registers_32 : _GEN_95; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_97 = 6'h21 == R1_SEL ? registers_33 : _GEN_96; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_98 = 6'h22 == R1_SEL ? registers_34 : _GEN_97; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_99 = 6'h23 == R1_SEL ? registers_35 : _GEN_98; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_100 = 6'h24 == R1_SEL ? registers_36 : _GEN_99; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_101 = 6'h25 == R1_SEL ? registers_37 : _GEN_100; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_102 = 6'h26 == R1_SEL ? registers_38 : _GEN_101; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_103 = 6'h27 == R1_SEL ? registers_39 : _GEN_102; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_104 = 6'h28 == R1_SEL ? registers_40 : _GEN_103; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_105 = 6'h29 == R1_SEL ? registers_41 : _GEN_104; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_106 = 6'h2a == R1_SEL ? registers_42 : _GEN_105; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_107 = 6'h2b == R1_SEL ? registers_43 : _GEN_106; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_108 = 6'h2c == R1_SEL ? registers_44 : _GEN_107; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_109 = 6'h2d == R1_SEL ? registers_45 : _GEN_108; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_110 = 6'h2e == R1_SEL ? registers_46 : _GEN_109; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_111 = 6'h2f == R1_SEL ? registers_47 : _GEN_110; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_112 = 6'h30 == R1_SEL ? registers_48 : _GEN_111; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_113 = 6'h31 == R1_SEL ? registers_49 : _GEN_112; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_114 = 6'h32 == R1_SEL ? registers_50 : _GEN_113; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_115 = 6'h33 == R1_SEL ? registers_51 : _GEN_114; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_116 = 6'h34 == R1_SEL ? registers_52 : _GEN_115; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_117 = 6'h35 == R1_SEL ? registers_53 : _GEN_116; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_118 = 6'h36 == R1_SEL ? registers_54 : _GEN_117; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_119 = 6'h37 == R1_SEL ? registers_55 : _GEN_118; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_120 = 6'h38 == R1_SEL ? registers_56 : _GEN_119; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_121 = 6'h39 == R1_SEL ? registers_57 : _GEN_120; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_122 = 6'h3a == R1_SEL ? registers_58 : _GEN_121; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_123 = 6'h3b == R1_SEL ? registers_59 : _GEN_122; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_124 = 6'h3c == R1_SEL ? registers_60 : _GEN_123; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_125 = 6'h3d == R1_SEL ? registers_61 : _GEN_124; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_126 = 6'h3e == R1_SEL ? registers_62 : _GEN_125; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_127 = 6'h3f == R1_SEL ? registers_63 : _GEN_126; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_129 = 6'h1 == R2_SEL ? registers_1 : registers_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_130 = 6'h2 == R2_SEL ? registers_2 : _GEN_129; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_131 = 6'h3 == R2_SEL ? registers_3 : _GEN_130; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_132 = 6'h4 == R2_SEL ? registers_4 : _GEN_131; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_133 = 6'h5 == R2_SEL ? registers_5 : _GEN_132; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_134 = 6'h6 == R2_SEL ? registers_6 : _GEN_133; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_135 = 6'h7 == R2_SEL ? registers_7 : _GEN_134; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_136 = 6'h8 == R2_SEL ? registers_8 : _GEN_135; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_137 = 6'h9 == R2_SEL ? registers_9 : _GEN_136; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_138 = 6'ha == R2_SEL ? registers_10 : _GEN_137; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_139 = 6'hb == R2_SEL ? registers_11 : _GEN_138; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_140 = 6'hc == R2_SEL ? registers_12 : _GEN_139; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_141 = 6'hd == R2_SEL ? registers_13 : _GEN_140; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_142 = 6'he == R2_SEL ? registers_14 : _GEN_141; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_143 = 6'hf == R2_SEL ? registers_15 : _GEN_142; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_144 = 6'h10 == R2_SEL ? registers_16 : _GEN_143; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_145 = 6'h11 == R2_SEL ? registers_17 : _GEN_144; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_146 = 6'h12 == R2_SEL ? registers_18 : _GEN_145; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_147 = 6'h13 == R2_SEL ? registers_19 : _GEN_146; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_148 = 6'h14 == R2_SEL ? registers_20 : _GEN_147; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_149 = 6'h15 == R2_SEL ? registers_21 : _GEN_148; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_150 = 6'h16 == R2_SEL ? registers_22 : _GEN_149; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_151 = 6'h17 == R2_SEL ? registers_23 : _GEN_150; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_152 = 6'h18 == R2_SEL ? registers_24 : _GEN_151; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_153 = 6'h19 == R2_SEL ? registers_25 : _GEN_152; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_154 = 6'h1a == R2_SEL ? registers_26 : _GEN_153; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_155 = 6'h1b == R2_SEL ? registers_27 : _GEN_154; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_156 = 6'h1c == R2_SEL ? registers_28 : _GEN_155; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_157 = 6'h1d == R2_SEL ? registers_29 : _GEN_156; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_158 = 6'h1e == R2_SEL ? registers_30 : _GEN_157; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_159 = 6'h1f == R2_SEL ? registers_31 : _GEN_158; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_160 = 6'h20 == R2_SEL ? registers_32 : _GEN_159; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_161 = 6'h21 == R2_SEL ? registers_33 : _GEN_160; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_162 = 6'h22 == R2_SEL ? registers_34 : _GEN_161; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_163 = 6'h23 == R2_SEL ? registers_35 : _GEN_162; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_164 = 6'h24 == R2_SEL ? registers_36 : _GEN_163; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_165 = 6'h25 == R2_SEL ? registers_37 : _GEN_164; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_166 = 6'h26 == R2_SEL ? registers_38 : _GEN_165; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_167 = 6'h27 == R2_SEL ? registers_39 : _GEN_166; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_168 = 6'h28 == R2_SEL ? registers_40 : _GEN_167; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_169 = 6'h29 == R2_SEL ? registers_41 : _GEN_168; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_170 = 6'h2a == R2_SEL ? registers_42 : _GEN_169; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_171 = 6'h2b == R2_SEL ? registers_43 : _GEN_170; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_172 = 6'h2c == R2_SEL ? registers_44 : _GEN_171; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_173 = 6'h2d == R2_SEL ? registers_45 : _GEN_172; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_174 = 6'h2e == R2_SEL ? registers_46 : _GEN_173; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_175 = 6'h2f == R2_SEL ? registers_47 : _GEN_174; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_176 = 6'h30 == R2_SEL ? registers_48 : _GEN_175; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_177 = 6'h31 == R2_SEL ? registers_49 : _GEN_176; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_178 = 6'h32 == R2_SEL ? registers_50 : _GEN_177; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_179 = 6'h33 == R2_SEL ? registers_51 : _GEN_178; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_180 = 6'h34 == R2_SEL ? registers_52 : _GEN_179; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_181 = 6'h35 == R2_SEL ? registers_53 : _GEN_180; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_182 = 6'h36 == R2_SEL ? registers_54 : _GEN_181; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_183 = 6'h37 == R2_SEL ? registers_55 : _GEN_182; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_184 = 6'h38 == R2_SEL ? registers_56 : _GEN_183; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_185 = 6'h39 == R2_SEL ? registers_57 : _GEN_184; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_186 = 6'h3a == R2_SEL ? registers_58 : _GEN_185; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_187 = 6'h3b == R2_SEL ? registers_59 : _GEN_186; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_188 = 6'h3c == R2_SEL ? registers_60 : _GEN_187; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_189 = 6'h3d == R2_SEL ? registers_61 : _GEN_188; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_190 = 6'h3e == R2_SEL ? registers_62 : _GEN_189; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_191 = 6'h3f == R2_SEL ? registers_63 : _GEN_190; // @[Cat.scala 30:58 Cat.scala 30:58]
  assign io_out = {_GEN_127,_GEN_191}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (6'h0 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_0 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_1 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_2 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_3 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h4 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_4 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h5 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_5 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h6 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_6 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h7 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_7 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h8 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_8 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h9 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_9 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'ha == R1_SEL) begin // @[Memory.scala 44:21]
      registers_10 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'hb == R1_SEL) begin // @[Memory.scala 44:21]
      registers_11 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'hc == R1_SEL) begin // @[Memory.scala 44:21]
      registers_12 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'hd == R1_SEL) begin // @[Memory.scala 44:21]
      registers_13 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'he == R1_SEL) begin // @[Memory.scala 44:21]
      registers_14 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'hf == R1_SEL) begin // @[Memory.scala 44:21]
      registers_15 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h10 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_16 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h11 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_17 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h12 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_18 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h13 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_19 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h14 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_20 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h15 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_21 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h16 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_22 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h17 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_23 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h18 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_24 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h19 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_25 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1a == R1_SEL) begin // @[Memory.scala 44:21]
      registers_26 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1b == R1_SEL) begin // @[Memory.scala 44:21]
      registers_27 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1c == R1_SEL) begin // @[Memory.scala 44:21]
      registers_28 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1d == R1_SEL) begin // @[Memory.scala 44:21]
      registers_29 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1e == R1_SEL) begin // @[Memory.scala 44:21]
      registers_30 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h1f == R1_SEL) begin // @[Memory.scala 44:21]
      registers_31 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h20 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_32 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h21 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_33 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h22 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_34 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h23 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_35 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h24 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_36 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h25 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_37 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h26 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_38 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h27 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_39 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h28 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_40 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h29 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_41 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2a == R1_SEL) begin // @[Memory.scala 44:21]
      registers_42 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2b == R1_SEL) begin // @[Memory.scala 44:21]
      registers_43 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2c == R1_SEL) begin // @[Memory.scala 44:21]
      registers_44 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2d == R1_SEL) begin // @[Memory.scala 44:21]
      registers_45 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2e == R1_SEL) begin // @[Memory.scala 44:21]
      registers_46 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h2f == R1_SEL) begin // @[Memory.scala 44:21]
      registers_47 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h30 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_48 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h31 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_49 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h32 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_50 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h33 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_51 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h34 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_52 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h35 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_53 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h36 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_54 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h37 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_55 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h38 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_56 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h39 == R1_SEL) begin // @[Memory.scala 44:21]
      registers_57 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3a == R1_SEL) begin // @[Memory.scala 44:21]
      registers_58 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3b == R1_SEL) begin // @[Memory.scala 44:21]
      registers_59 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3c == R1_SEL) begin // @[Memory.scala 44:21]
      registers_60 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3d == R1_SEL) begin // @[Memory.scala 44:21]
      registers_61 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3e == R1_SEL) begin // @[Memory.scala 44:21]
      registers_62 <= W_DATA; // @[Memory.scala 44:21]
    end
    if (6'h3f == R1_SEL) begin // @[Memory.scala 44:21]
      registers_63 <= W_DATA; // @[Memory.scala 44:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  registers_0 = _RAND_0[51:0];
  _RAND_1 = {2{`RANDOM}};
  registers_1 = _RAND_1[51:0];
  _RAND_2 = {2{`RANDOM}};
  registers_2 = _RAND_2[51:0];
  _RAND_3 = {2{`RANDOM}};
  registers_3 = _RAND_3[51:0];
  _RAND_4 = {2{`RANDOM}};
  registers_4 = _RAND_4[51:0];
  _RAND_5 = {2{`RANDOM}};
  registers_5 = _RAND_5[51:0];
  _RAND_6 = {2{`RANDOM}};
  registers_6 = _RAND_6[51:0];
  _RAND_7 = {2{`RANDOM}};
  registers_7 = _RAND_7[51:0];
  _RAND_8 = {2{`RANDOM}};
  registers_8 = _RAND_8[51:0];
  _RAND_9 = {2{`RANDOM}};
  registers_9 = _RAND_9[51:0];
  _RAND_10 = {2{`RANDOM}};
  registers_10 = _RAND_10[51:0];
  _RAND_11 = {2{`RANDOM}};
  registers_11 = _RAND_11[51:0];
  _RAND_12 = {2{`RANDOM}};
  registers_12 = _RAND_12[51:0];
  _RAND_13 = {2{`RANDOM}};
  registers_13 = _RAND_13[51:0];
  _RAND_14 = {2{`RANDOM}};
  registers_14 = _RAND_14[51:0];
  _RAND_15 = {2{`RANDOM}};
  registers_15 = _RAND_15[51:0];
  _RAND_16 = {2{`RANDOM}};
  registers_16 = _RAND_16[51:0];
  _RAND_17 = {2{`RANDOM}};
  registers_17 = _RAND_17[51:0];
  _RAND_18 = {2{`RANDOM}};
  registers_18 = _RAND_18[51:0];
  _RAND_19 = {2{`RANDOM}};
  registers_19 = _RAND_19[51:0];
  _RAND_20 = {2{`RANDOM}};
  registers_20 = _RAND_20[51:0];
  _RAND_21 = {2{`RANDOM}};
  registers_21 = _RAND_21[51:0];
  _RAND_22 = {2{`RANDOM}};
  registers_22 = _RAND_22[51:0];
  _RAND_23 = {2{`RANDOM}};
  registers_23 = _RAND_23[51:0];
  _RAND_24 = {2{`RANDOM}};
  registers_24 = _RAND_24[51:0];
  _RAND_25 = {2{`RANDOM}};
  registers_25 = _RAND_25[51:0];
  _RAND_26 = {2{`RANDOM}};
  registers_26 = _RAND_26[51:0];
  _RAND_27 = {2{`RANDOM}};
  registers_27 = _RAND_27[51:0];
  _RAND_28 = {2{`RANDOM}};
  registers_28 = _RAND_28[51:0];
  _RAND_29 = {2{`RANDOM}};
  registers_29 = _RAND_29[51:0];
  _RAND_30 = {2{`RANDOM}};
  registers_30 = _RAND_30[51:0];
  _RAND_31 = {2{`RANDOM}};
  registers_31 = _RAND_31[51:0];
  _RAND_32 = {2{`RANDOM}};
  registers_32 = _RAND_32[51:0];
  _RAND_33 = {2{`RANDOM}};
  registers_33 = _RAND_33[51:0];
  _RAND_34 = {2{`RANDOM}};
  registers_34 = _RAND_34[51:0];
  _RAND_35 = {2{`RANDOM}};
  registers_35 = _RAND_35[51:0];
  _RAND_36 = {2{`RANDOM}};
  registers_36 = _RAND_36[51:0];
  _RAND_37 = {2{`RANDOM}};
  registers_37 = _RAND_37[51:0];
  _RAND_38 = {2{`RANDOM}};
  registers_38 = _RAND_38[51:0];
  _RAND_39 = {2{`RANDOM}};
  registers_39 = _RAND_39[51:0];
  _RAND_40 = {2{`RANDOM}};
  registers_40 = _RAND_40[51:0];
  _RAND_41 = {2{`RANDOM}};
  registers_41 = _RAND_41[51:0];
  _RAND_42 = {2{`RANDOM}};
  registers_42 = _RAND_42[51:0];
  _RAND_43 = {2{`RANDOM}};
  registers_43 = _RAND_43[51:0];
  _RAND_44 = {2{`RANDOM}};
  registers_44 = _RAND_44[51:0];
  _RAND_45 = {2{`RANDOM}};
  registers_45 = _RAND_45[51:0];
  _RAND_46 = {2{`RANDOM}};
  registers_46 = _RAND_46[51:0];
  _RAND_47 = {2{`RANDOM}};
  registers_47 = _RAND_47[51:0];
  _RAND_48 = {2{`RANDOM}};
  registers_48 = _RAND_48[51:0];
  _RAND_49 = {2{`RANDOM}};
  registers_49 = _RAND_49[51:0];
  _RAND_50 = {2{`RANDOM}};
  registers_50 = _RAND_50[51:0];
  _RAND_51 = {2{`RANDOM}};
  registers_51 = _RAND_51[51:0];
  _RAND_52 = {2{`RANDOM}};
  registers_52 = _RAND_52[51:0];
  _RAND_53 = {2{`RANDOM}};
  registers_53 = _RAND_53[51:0];
  _RAND_54 = {2{`RANDOM}};
  registers_54 = _RAND_54[51:0];
  _RAND_55 = {2{`RANDOM}};
  registers_55 = _RAND_55[51:0];
  _RAND_56 = {2{`RANDOM}};
  registers_56 = _RAND_56[51:0];
  _RAND_57 = {2{`RANDOM}};
  registers_57 = _RAND_57[51:0];
  _RAND_58 = {2{`RANDOM}};
  registers_58 = _RAND_58[51:0];
  _RAND_59 = {2{`RANDOM}};
  registers_59 = _RAND_59[51:0];
  _RAND_60 = {2{`RANDOM}};
  registers_60 = _RAND_60[51:0];
  _RAND_61 = {2{`RANDOM}};
  registers_61 = _RAND_61[51:0];
  _RAND_62 = {2{`RANDOM}};
  registers_62 = _RAND_62[51:0];
  _RAND_63 = {2{`RANDOM}};
  registers_63 = _RAND_63[51:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SignExtendDouble(
  input  [39:0] io_in,
  output [79:0] io_out
);
  wire [39:0] io_out_hi = io_in[39] ? 40'hffffffffff : 40'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceAndMux(
  input  [39:0] io_in,
  output [16:0] io_out
);
  wire [16:0] IN1 = io_in[36:20]; // @[Muxes.scala 67:27]
  wire [16:0] IN2 = io_in[19:3]; // @[Muxes.scala 68:27]
  wire [2:0] SEL = io_in[2:0]; // @[Muxes.scala 69:27]
  assign io_out = &SEL ? IN1 : IN2; // @[Muxes.scala 71:18]
endmodule
module ResetShiftRegister(
  input         clock,
  input         reset,
  input  [18:0] io_in,
  output [17:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  shift = io_in[0]; // @[Memory.scala 59:20]
  reg [17:0] r0; // @[Memory.scala 60:19]
  reg [17:0] r1; // @[Memory.scala 61:19]
  reg [17:0] r2; // @[Memory.scala 62:19]
  reg [17:0] r3; // @[Memory.scala 63:19]
  wire [18:0] _GEN_0 = shift ? io_in : {{1'd0}, r0}; // @[Memory.scala 64:16 Memory.scala 65:8 Memory.scala 60:19]
  assign io_out = r3; // @[Memory.scala 70:10]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 60:19]
      r0 <= 18'h0; // @[Memory.scala 60:19]
    end else begin
      r0 <= _GEN_0[17:0];
    end
    if (reset) begin // @[Memory.scala 61:19]
      r1 <= 18'h0; // @[Memory.scala 61:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r1 <= r0; // @[Memory.scala 66:8]
    end
    if (reset) begin // @[Memory.scala 62:19]
      r2 <= 18'h0; // @[Memory.scala 62:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r2 <= r1; // @[Memory.scala 67:8]
    end
    if (reset) begin // @[Memory.scala 63:19]
      r3 <= 18'h0; // @[Memory.scala 63:19]
    end else if (shift) begin // @[Memory.scala 64:16]
      r3 <= r2; // @[Memory.scala 68:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[17:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[17:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[17:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mux2(
  input  [30:0] io_in,
  output [14:0] io_out
);
  wire  sel = io_in[30]; // @[Muxes.scala 14:18]
  wire [14:0] in1 = io_in[29:15]; // @[Muxes.scala 15:18]
  wire [14:0] in0 = io_in[14:0]; // @[Muxes.scala 16:18]
  assign io_out = sel ? in1 : in0; // @[Muxes.scala 17:15 Muxes.scala 17:24 Muxes.scala 18:24]
endmodule
module CompareMux(
  input  [39:0] io_in,
  output [18:0] io_out
);
  wire [19:0] IN1 = io_in[39:20]; // @[Muxes.scala 103:27]
  wire [18:0] IN2 = io_in[20:2]; // @[Muxes.scala 104:27]
  wire  SEL1 = io_in[1]; // @[Muxes.scala 105:27]
  wire  SEL2 = io_in[0]; // @[Muxes.scala 106:27]
  wire [19:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{1'd0}, IN2}; // @[Muxes.scala 108:18]
  assign io_out = _io_out_T_1[18:0]; // @[Muxes.scala 108:12]
endmodule
module CompareMux_1(
  input  [81:0] io_in,
  output [37:0] io_out
);
  wire [40:0] IN1 = io_in[81:41]; // @[Muxes.scala 103:27]
  wire [37:0] IN2 = io_in[43:6]; // @[Muxes.scala 104:27]
  wire [2:0] SEL1 = io_in[5:3]; // @[Muxes.scala 105:27]
  wire [2:0] SEL2 = io_in[2:0]; // @[Muxes.scala 106:27]
  wire [40:0] _io_out_T_1 = SEL1 >= SEL2 ? IN1 : {{3'd0}, IN2}; // @[Muxes.scala 108:18]
  assign io_out = _io_out_T_1[37:0]; // @[Muxes.scala 108:12]
endmodule
module Accum(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] sum; // @[ArithmeticLogical.scala 82:18]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[ArithmeticLogical.scala 83:16]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sum = _RAND_0[14:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_1(
  input  [14:0] io_in,
  output [14:0] io_out
);
  assign io_out = {{2'd0}, io_in[14:2]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module ShiftRegister(
  input         clock,
  input  [14:0] io_in,
  output [14:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] r0; // @[Memory.scala 78:19]
  reg [14:0] r1; // @[Memory.scala 79:19]
  reg [14:0] r2; // @[Memory.scala 80:19]
  reg [14:0] r3; // @[Memory.scala 81:19]
  assign io_out = r3; // @[Memory.scala 82:10]
  always @(posedge clock) begin
    r0 <= io_in; // @[Memory.scala 78:19]
    r1 <= r0; // @[Memory.scala 79:19]
    r2 <= r1; // @[Memory.scala 80:19]
    r3 <= r2; // @[Memory.scala 81:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[14:0];
  _RAND_2 = {1{`RANDOM}};
  r2 = _RAND_2[14:0];
  _RAND_3 = {1{`RANDOM}};
  r3 = _RAND_3[14:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module And(
  input  [79:0] io_in,
  output [39:0] io_out
);
  wire [39:0] in1 = io_in[79:40]; // @[ArithmeticLogical.scala 36:20]
  wire [39:0] in2 = io_in[39:0]; // @[ArithmeticLogical.scala 37:20]
  assign io_out = in1 & in2; // @[ArithmeticLogical.scala 38:19]
endmodule
module ShiftLeft_3(
  input  [14:0] io_in,
  output [18:0] io_out
);
  assign io_out = {io_in, 4'h0}; // @[ArithmeticLogical.scala 94:21]
endmodule
module SignExtendDouble_1(
  input  [31:0] io_in,
  output [63:0] io_out
);
  wire [31:0] io_out_hi = io_in[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module ReduceOrMux(
  input  [37:0] io_in,
  output [17:0] io_out
);
  wire [17:0] IN1 = io_in[37:20]; // @[Muxes.scala 79:27]
  wire [17:0] IN2 = io_in[19:2]; // @[Muxes.scala 80:27]
  wire [1:0] SEL = io_in[1:0]; // @[Muxes.scala 81:27]
  assign io_out = |SEL ? IN1 : IN2; // @[Muxes.scala 83:18]
endmodule
module SignExtendDouble_2(
  input  [6:0]  io_in,
  output [13:0] io_out
);
  wire [6:0] io_out_hi = io_in[6] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  assign io_out = {io_out_hi,io_in}; // @[Cat.scala 30:58]
endmodule
module Accum_1(
  input         clock,
  input  [18:0] io_in,
  output [18:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [18:0] sum; // @[ArithmeticLogical.scala 82:18]
  assign io_out = sum; // @[ArithmeticLogical.scala 84:12]
  always @(posedge clock) begin
    sum <= sum + io_in; // @[ArithmeticLogical.scala 83:16]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sum = _RAND_0[18:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ShiftRight_2(
  input  [51:0] io_in,
  output [51:0] io_out
);
  assign io_out = {{5'd0}, io_in[51:5]}; // @[ArithmeticLogical.scala 103:21]
endmodule
module RandomHardware(
  input          clock,
  input          reset,
  input  [99:0]  io_in,
  output [221:0] io_out
);
  wire [27:0] ShiftLeft_000_io_in; // @[RandomHardware.scala 35:34]
  wire [30:0] ShiftLeft_000_io_out; // @[RandomHardware.scala 35:34]
  wire [39:0] ShiftRight_001_io_in; // @[RandomHardware.scala 36:34]
  wire [39:0] ShiftRight_001_io_out; // @[RandomHardware.scala 36:34]
  wire [4:0] ShiftLeft_002_io_in; // @[RandomHardware.scala 37:34]
  wire [5:0] ShiftLeft_002_io_out; // @[RandomHardware.scala 37:34]
  wire [6:0] ShiftLeft_003_io_in; // @[RandomHardware.scala 38:34]
  wire [9:0] ShiftLeft_003_io_out; // @[RandomHardware.scala 38:34]
  wire  RegFile2R1W_004_clock; // @[RandomHardware.scala 39:34]
  wire [63:0] RegFile2R1W_004_io_in; // @[RandomHardware.scala 39:34]
  wire [103:0] RegFile2R1W_004_io_out; // @[RandomHardware.scala 39:34]
  wire [39:0] SignExtendDouble_005_io_in; // @[RandomHardware.scala 40:42]
  wire [79:0] SignExtendDouble_005_io_out; // @[RandomHardware.scala 40:42]
  wire [39:0] ReduceAndMux_006_io_in; // @[RandomHardware.scala 41:34]
  wire [16:0] ReduceAndMux_006_io_out; // @[RandomHardware.scala 41:34]
  wire  ResetShiftRegister_007_clock; // @[RandomHardware.scala 42:42]
  wire  ResetShiftRegister_007_reset; // @[RandomHardware.scala 42:42]
  wire [18:0] ResetShiftRegister_007_io_in; // @[RandomHardware.scala 42:42]
  wire [17:0] ResetShiftRegister_007_io_out; // @[RandomHardware.scala 42:42]
  wire [30:0] Mux2_008_io_in; // @[RandomHardware.scala 43:26]
  wire [14:0] Mux2_008_io_out; // @[RandomHardware.scala 43:26]
  wire [39:0] CompareMux_009_io_in; // @[RandomHardware.scala 44:34]
  wire [18:0] CompareMux_009_io_out; // @[RandomHardware.scala 44:34]
  wire [81:0] CompareMux_010_io_in; // @[RandomHardware.scala 45:34]
  wire [37:0] CompareMux_010_io_out; // @[RandomHardware.scala 45:34]
  wire  Accum_011_clock; // @[RandomHardware.scala 46:34]
  wire [14:0] Accum_011_io_in; // @[RandomHardware.scala 46:34]
  wire [14:0] Accum_011_io_out; // @[RandomHardware.scala 46:34]
  wire [14:0] ShiftRight_012_io_in; // @[RandomHardware.scala 47:34]
  wire [14:0] ShiftRight_012_io_out; // @[RandomHardware.scala 47:34]
  wire  ShiftRegister_013_clock; // @[RandomHardware.scala 48:42]
  wire [14:0] ShiftRegister_013_io_in; // @[RandomHardware.scala 48:42]
  wire [14:0] ShiftRegister_013_io_out; // @[RandomHardware.scala 48:42]
  wire [79:0] And_014_io_in; // @[RandomHardware.scala 49:26]
  wire [39:0] And_014_io_out; // @[RandomHardware.scala 49:26]
  wire [14:0] ShiftLeft_015_io_in; // @[RandomHardware.scala 50:34]
  wire [18:0] ShiftLeft_015_io_out; // @[RandomHardware.scala 50:34]
  wire [31:0] SignExtendDouble_016_io_in; // @[RandomHardware.scala 51:42]
  wire [63:0] SignExtendDouble_016_io_out; // @[RandomHardware.scala 51:42]
  wire [37:0] ReduceOrMux_017_io_in; // @[RandomHardware.scala 52:34]
  wire [17:0] ReduceOrMux_017_io_out; // @[RandomHardware.scala 52:34]
  wire [6:0] SignExtendDouble_018_io_in; // @[RandomHardware.scala 53:42]
  wire [13:0] SignExtendDouble_018_io_out; // @[RandomHardware.scala 53:42]
  wire  Accum_019_clock; // @[RandomHardware.scala 54:34]
  wire [18:0] Accum_019_io_in; // @[RandomHardware.scala 54:34]
  wire [18:0] Accum_019_io_out; // @[RandomHardware.scala 54:34]
  wire [51:0] ShiftRight_020_io_in; // @[RandomHardware.scala 55:34]
  wire [51:0] ShiftRight_020_io_out; // @[RandomHardware.scala 55:34]
  wire [84:0] io_out_lo = {Accum_011_io_out,ReduceOrMux_017_io_out,ShiftRight_020_io_out}; // @[Cat.scala 30:58]
  wire [136:0] io_out_hi = {ShiftLeft_002_io_out,ShiftLeft_003_io_out,RegFile2R1W_004_io_out,ReduceAndMux_006_io_out}; // @[Cat.scala 30:58]
  wire [17:0] wire_008 = ResetShiftRegister_007_io_out; // @[RandomHardware.scala 21:24 RandomHardware.scala 65:18]
  wire [63:0] wire_009 = SignExtendDouble_016_io_out; // @[RandomHardware.scala 22:24 RandomHardware.scala 93:18]
  wire [18:0] wire_015 = CompareMux_009_io_out; // @[RandomHardware.scala 28:24 RandomHardware.scala 70:18]
  wire [18:0] wire_016 = ShiftLeft_015_io_out; // @[RandomHardware.scala 29:24 RandomHardware.scala 84:18]
  wire [37:0] wire_019 = CompareMux_010_io_out; // @[RandomHardware.scala 32:24 RandomHardware.scala 72:18]
  wire [13:0] wire_020 = SignExtendDouble_018_io_out; // @[RandomHardware.scala 33:24 RandomHardware.scala 87:18]
  ShiftLeft ShiftLeft_000 ( // @[RandomHardware.scala 35:34]
    .io_in(ShiftLeft_000_io_in),
    .io_out(ShiftLeft_000_io_out)
  );
  ShiftRight ShiftRight_001 ( // @[RandomHardware.scala 36:34]
    .io_in(ShiftRight_001_io_in),
    .io_out(ShiftRight_001_io_out)
  );
  ShiftLeft_1 ShiftLeft_002 ( // @[RandomHardware.scala 37:34]
    .io_in(ShiftLeft_002_io_in),
    .io_out(ShiftLeft_002_io_out)
  );
  ShiftLeft_2 ShiftLeft_003 ( // @[RandomHardware.scala 38:34]
    .io_in(ShiftLeft_003_io_in),
    .io_out(ShiftLeft_003_io_out)
  );
  RegFile2R1W RegFile2R1W_004 ( // @[RandomHardware.scala 39:34]
    .clock(RegFile2R1W_004_clock),
    .io_in(RegFile2R1W_004_io_in),
    .io_out(RegFile2R1W_004_io_out)
  );
  SignExtendDouble SignExtendDouble_005 ( // @[RandomHardware.scala 40:42]
    .io_in(SignExtendDouble_005_io_in),
    .io_out(SignExtendDouble_005_io_out)
  );
  ReduceAndMux ReduceAndMux_006 ( // @[RandomHardware.scala 41:34]
    .io_in(ReduceAndMux_006_io_in),
    .io_out(ReduceAndMux_006_io_out)
  );
  ResetShiftRegister ResetShiftRegister_007 ( // @[RandomHardware.scala 42:42]
    .clock(ResetShiftRegister_007_clock),
    .reset(ResetShiftRegister_007_reset),
    .io_in(ResetShiftRegister_007_io_in),
    .io_out(ResetShiftRegister_007_io_out)
  );
  Mux2 Mux2_008 ( // @[RandomHardware.scala 43:26]
    .io_in(Mux2_008_io_in),
    .io_out(Mux2_008_io_out)
  );
  CompareMux CompareMux_009 ( // @[RandomHardware.scala 44:34]
    .io_in(CompareMux_009_io_in),
    .io_out(CompareMux_009_io_out)
  );
  CompareMux_1 CompareMux_010 ( // @[RandomHardware.scala 45:34]
    .io_in(CompareMux_010_io_in),
    .io_out(CompareMux_010_io_out)
  );
  Accum Accum_011 ( // @[RandomHardware.scala 46:34]
    .clock(Accum_011_clock),
    .io_in(Accum_011_io_in),
    .io_out(Accum_011_io_out)
  );
  ShiftRight_1 ShiftRight_012 ( // @[RandomHardware.scala 47:34]
    .io_in(ShiftRight_012_io_in),
    .io_out(ShiftRight_012_io_out)
  );
  ShiftRegister ShiftRegister_013 ( // @[RandomHardware.scala 48:42]
    .clock(ShiftRegister_013_clock),
    .io_in(ShiftRegister_013_io_in),
    .io_out(ShiftRegister_013_io_out)
  );
  And And_014 ( // @[RandomHardware.scala 49:26]
    .io_in(And_014_io_in),
    .io_out(And_014_io_out)
  );
  ShiftLeft_3 ShiftLeft_015 ( // @[RandomHardware.scala 50:34]
    .io_in(ShiftLeft_015_io_in),
    .io_out(ShiftLeft_015_io_out)
  );
  SignExtendDouble_1 SignExtendDouble_016 ( // @[RandomHardware.scala 51:42]
    .io_in(SignExtendDouble_016_io_in),
    .io_out(SignExtendDouble_016_io_out)
  );
  ReduceOrMux ReduceOrMux_017 ( // @[RandomHardware.scala 52:34]
    .io_in(ReduceOrMux_017_io_in),
    .io_out(ReduceOrMux_017_io_out)
  );
  SignExtendDouble_2 SignExtendDouble_018 ( // @[RandomHardware.scala 53:42]
    .io_in(SignExtendDouble_018_io_in),
    .io_out(SignExtendDouble_018_io_out)
  );
  Accum_1 Accum_019 ( // @[RandomHardware.scala 54:34]
    .clock(Accum_019_clock),
    .io_in(Accum_019_io_in),
    .io_out(Accum_019_io_out)
  );
  ShiftRight_2 ShiftRight_020 ( // @[RandomHardware.scala 55:34]
    .io_in(ShiftRight_020_io_in),
    .io_out(ShiftRight_020_io_out)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign ShiftLeft_000_io_in = io_in[27:0]; // @[RandomHardware.scala 57:33]
  assign ShiftRight_001_io_in = And_014_io_out; // @[RandomHardware.scala 13:24 RandomHardware.scala 81:18]
  assign ShiftLeft_002_io_in = ShiftRegister_013_io_out[4:0]; // @[RandomHardware.scala 77:46]
  assign ShiftLeft_003_io_in = Mux2_008_io_out[6:0]; // @[RandomHardware.scala 67:37]
  assign RegFile2R1W_004_clock = clock;
  assign RegFile2R1W_004_io_in = SignExtendDouble_016_io_out; // @[RandomHardware.scala 16:24 RandomHardware.scala 92:18]
  assign SignExtendDouble_005_io_in = io_in[39:0]; // @[RandomHardware.scala 58:41]
  assign ReduceAndMux_006_io_in = And_014_io_out; // @[RandomHardware.scala 17:24 RandomHardware.scala 82:18]
  assign ResetShiftRegister_007_clock = clock;
  assign ResetShiftRegister_007_reset = reset;
  assign ResetShiftRegister_007_io_in = Accum_019_io_out; // @[RandomHardware.scala 18:24 RandomHardware.scala 89:18]
  assign Mux2_008_io_in = ShiftLeft_000_io_out; // @[RandomHardware.scala 19:24 RandomHardware.scala 90:18]
  assign CompareMux_009_io_in = ShiftRight_001_io_out; // @[RandomHardware.scala 20:24 RandomHardware.scala 63:18]
  assign CompareMux_010_io_in = {wire_008,wire_009}; // @[Cat.scala 30:58]
  assign Accum_011_clock = clock;
  assign Accum_011_io_in = ShiftRegister_013_io_out; // @[RandomHardware.scala 23:24 RandomHardware.scala 78:18]
  assign ShiftRight_012_io_in = Mux2_008_io_out; // @[RandomHardware.scala 24:24 RandomHardware.scala 68:18]
  assign ShiftRegister_013_clock = clock;
  assign ShiftRegister_013_io_in = ShiftRight_012_io_out; // @[RandomHardware.scala 25:24 RandomHardware.scala 74:18]
  assign And_014_io_in = SignExtendDouble_005_io_out; // @[RandomHardware.scala 26:24 RandomHardware.scala 91:18]
  assign ShiftLeft_015_io_in = ShiftRegister_013_io_out; // @[RandomHardware.scala 27:24 RandomHardware.scala 79:18]
  assign SignExtendDouble_016_io_in = io_in[99:68]; // @[RandomHardware.scala 59:41]
  assign ReduceOrMux_017_io_in = {wire_015,wire_016}; // @[Cat.scala 30:58]
  assign SignExtendDouble_018_io_in = ShiftRight_012_io_out[6:0]; // @[RandomHardware.scala 75:43]
  assign Accum_019_clock = clock;
  assign Accum_019_io_in = ShiftLeft_015_io_out; // @[RandomHardware.scala 31:24 RandomHardware.scala 85:18]
  assign ShiftRight_020_io_in = {wire_019,wire_020}; // @[Cat.scala 30:58]
endmodule
