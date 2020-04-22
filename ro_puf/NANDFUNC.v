`timescale 1ns / 1ps
// This core is used to add an enable signal to the ring osc

// This is done by replacing one of the not gates to a nand gate with
// an enable signal  

(*DONT_TOUCH*)
module NANDFUNC(
 input a,b,
 output c
);

assign c= ~(a & b);

endmodule
