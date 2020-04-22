`timescale 1ns / 1ps

module dispModule (
 input [3:0] selector,
 input [63:0] data,
 output reg [3:0] leds
);
    
  //  reg [63:0] data = 64'hFEDCBA9876543210;

always @* begin
      if(selector == 4'b0000)
        leds = data[3:0];
      else if(selector == 4'b0001)
        leds = data[7:4];
      else if(selector == 4'b0010)
        leds = data[11:8];
      else if(selector == 4'b0011)
        leds = data[15:12];
      else if(selector == 4'b0100)
        leds = data[19:16];
      else if(selector == 4'b0101)
        leds = data[23:20];
      else if(selector == 4'b0110)
        leds = data[27:24];
      else if(selector == 4'b0111)
        leds = data[31:28];
      else if(selector == 4'b1000)
        leds = data[35:32];
      else if(selector == 4'b1001)
        leds = data[39:36];
      else if(selector == 4'b1010)
        leds = data[43:40];
      else if(selector == 4'b1011)
        leds = data[47:44];
      else if(selector == 4'b1100)
        leds = data[51:48];
      else if(selector == 4'b1101)
        leds = data[55:52];
      else if(selector == 4'b1110)
        leds = data[59:56];
      else if(selector == 4'b1111)
        leds = data[63:60];
end
    
endmodule
