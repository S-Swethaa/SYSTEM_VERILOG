// Code your design here
//full adder full design and verification:
module full_adder(input logic a, b, c, output logic sum, carry);
  assign sum = a ^ b ^ c;
  assign carry = (a & b) | (b & c) | (c & a);
endmodule
