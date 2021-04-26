module BlackBoxRealAdd #(parameter N) (
    input  [N-1:0] in1,
    input  [N-1:0] in2,
    output [N-1:0] out);
    
    always @* begin
      out <= $realtobits($bitstoreal(in1) + $bitstoreal(in2));
    end
endmodule