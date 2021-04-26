// All Compute Unit Modules

/** This black-boxes compute units available for BHPL
  *
  */

// Parameterized "add" unit
module add_n_2n #(parameter N) (input [N-1:0] A, input[N-1:0] B, output [2*N-1:0] C);
   C = A + B;
endmodule // add_n_2n

// Parameterized "add" unit
module and_n #(parameter N) (input [N-1:0] A, input[N-1:0] B, output [2*N-1:0] C);
   C = A & B;
endmodule // and_n_2n
