`timescale 1ns/1ns

module encryption_tb;

    reg clk, reset, load_key;
    reg [7:0] plaintext, key_in;
    wire [7:0] ciphertext, decrypted;

    // Instantiate top level
    encryption_top DUT (
        .clk(clk),
        .reset(reset),
        .load_key(load_key),
        .plaintext(plaintext),
        .key_in(key_in),
        .ciphertext(ciphertext),
        .decrypted(decrypted)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("encryption.vcd");
        $dumpvars(0, encryption_tb);

        clk = 0; reset = 1; load_key = 0;
        plaintext = 8'b0; key_in = 8'b0;
        #10 reset = 0;

        $display("=== VLSI XOR Encryption System ===");
        $display("Plaintext  | Key       | Ciphertext | Decrypted | Match?");
        $display("----------------------------------------------------------");

        // Test 1: key = 10101010
        key_in = 8'b10101010; load_key = 1; #10; load_key = 0;
        plaintext = 8'b11001100; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        // Test 2: key = 11110000
        key_in = 8'b11110000; load_key = 1; #10; load_key = 0;
        plaintext = 8'b10101010; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        // Test 3: key = 01010101
        key_in = 8'b01010101; load_key = 1; #10; load_key = 0;
        plaintext = 8'b11111111; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        // Test 4: key = 11001100
        key_in = 8'b11001100; load_key = 1; #10; load_key = 0;
        plaintext = 8'b00110011; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        // Test 5: all zeros key
        key_in = 8'b00000000; load_key = 1; #10; load_key = 0;
        plaintext = 8'b10110110; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        // Test 6: all ones key
        key_in = 8'b11111111; load_key = 1; #10; load_key = 0;
        plaintext = 8'b10110110; #10;
        $display("%b  | %b | %b  | %b  | %s",
            plaintext, key_in, ciphertext, decrypted,
            (plaintext == decrypted) ? "PASS" : "FAIL");

        $display("=== Simulation Complete ===");
        $finish;
    end

endmodule
