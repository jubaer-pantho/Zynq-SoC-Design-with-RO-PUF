`timescale 1ns / 1ps

// we use a 5 stage ro unit for this project
(*DONT_TOUCH*)
module ro_unit (
 input en,
 output reg out
);

(* keep = "true" *) wire[4:0] connector;

(* keep_hierarchy = "yes" *)NANDFUNC NAND0  (.a(connector[0]), .b(en), .c(connector[1]));
(* keep_hierarchy = "yes" *)NOTFUNC NOT1   (.a(connector[1]), .b(connector[2]));
(* keep_hierarchy = "yes" *)NOTFUNC NOT2   (.a(connector[2]), .b(connector[3])); 
(* keep_hierarchy = "yes" *)NOTFUNC NOT3   (.a(connector[3]), .b(connector[4])); 
(* keep_hierarchy = "yes" *)NOTFUNC NOT4   (.a(connector[4]), .b(connector[0])); 

always@(*) begin
   out= connector[0];
end
 
endmodule
