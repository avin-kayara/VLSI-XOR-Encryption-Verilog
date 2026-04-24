// Key Register Module
// Stores and manages the secret encryption key
module key_register(
    input clk, reset,
    input load,
    input  [7:0] key_in,
    output reg [7:0] key_out
);
    always @(posedge clk or posedge reset) begin
        if(reset)
            key_out <= 8'b00000000;
        else if(load)
            key_out <= key_in;
    end
endmodule
