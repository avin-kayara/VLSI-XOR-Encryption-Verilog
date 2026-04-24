// Top Level - VLSI XOR Encryption System
`include "xor_encrypt.v"
`include "xor_decrypt.v"
`include "key_register.v"

module encryption_top(
    input clk, reset,
    input load_key,
    input  [7:0] plaintext,
    input  [7:0] key_in,
    output [7:0] ciphertext,
    output [7:0] decrypted
);
    wire [7:0] key;

    // Key Register
    key_register KR (
        .clk(clk),
        .reset(reset),
        .load(load_key),
        .key_in(key_in),
        .key_out(key)
    );

    // Encryption
    xor_encrypt ENC (
        .plaintext(plaintext),
        .key(key),
        .ciphertext(ciphertext)
    );

    // Decryption
    xor_decrypt DEC (
        .ciphertext(ciphertext),
        .key(key),
        .plaintext(decrypted)
    );

endmodule
