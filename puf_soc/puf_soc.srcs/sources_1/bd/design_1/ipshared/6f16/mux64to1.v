`timescale 1ns / 1ps

(*DONT_TOUCH*)
module mux64to1 (
 input [63:0] data_in,
 input [5:0] selector,
 output out
);

(* keep = "true" *) assign  out = data_in[selector];


endmodule