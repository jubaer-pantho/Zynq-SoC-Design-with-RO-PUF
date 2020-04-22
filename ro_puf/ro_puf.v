`timescale 1ns / 1ps

module ro_puf #(
 parameter MAX_COUNT = 20000,   // Arbitrary value to see clear distinction etween the counter values
 parameter DATA_WIDTH = 64,      // PUF output width (1-64 bits). For values greater than 64 add appropriate contraints(.xdc)
 parameter COUNTER_WIDTH = 6
)
(
 input enable,                  // Enable pin for the ring oscillators
 input [1:0] challenge,         // challenge bit for the RO PUF
 input [3:0] selector,          // bit segment selector used to output data to the leds
 output wire [3:0] leds         // leds to show PUF response 
);

(*keep = "true" *) wire [DATA_WIDTH-1:0] roout1, roout2;
wire roclk1, roclk2;
reg [COUNTER_WIDTH-1:0] current_counter = 0, second_counter = 0, old_counter = 0;
reg [31:0] rocounter1 = 0, rocounter2 = 0;

(* dont_merge *) reg[DATA_WIDTH-1:0] PUFResponse;

    genvar i;
    generate    
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin : ro_blocks    
            (* keep_hierarchy = "yes" *)ro_unit ro1 (.en(enable), .out(roout1[i]));
            (* keep_hierarchy = "yes" *)ro_unit ro2 (.en(enable), .out(roout2[i]));
        end
    endgenerate

mux64to1 roSet1(.data_in(roout1), .selector(current_counter), .out(roclk1)); 
mux64to1 roSet2(.data_in(roout2), .selector(second_counter), .out(roclk2));
dispModule disp1(.selector(selector), .data(PUFResponse), .leds(leds));

always @(posedge roclk1) begin
if (enable == 0) begin
    rocounter1 <= 0;
    current_counter <= 0;
    second_counter <= challenge;
end
else begin
    rocounter1 <= rocounter1 +1;

    if (rocounter1 == MAX_COUNT) begin
        PUFResponse[current_counter] <=  (rocounter1 > rocounter2) ? 1:0;
        rocounter1 <= 0;

        if (current_counter == (DATA_WIDTH-1)) begin
            current_counter <= 0;
            second_counter <= challenge;
        end
        else begin
            current_counter <= current_counter + 1;
            second_counter <= (current_counter + 1 + challenge) % DATA_WIDTH;
        end
    end
end
end

always @(posedge roclk2) begin
    if (enable == 0) begin
        rocounter2 <= 0;
    end
    else begin
        rocounter2 <= rocounter2 +1;
        if (current_counter != old_counter) begin
            rocounter2 <= 0;
            old_counter <= current_counter;
        end
    end
end

endmodule
