// XOR Encryption Module
// Encrypts 8-bit plaintext using 8-bit key
module xor_encrypt(
    input  [7:0] plaintext,
    input  [7:0] key,
    output [7:0] ciphertext
);
    assign ciphertext = plaintext ^ key;
endmodule
