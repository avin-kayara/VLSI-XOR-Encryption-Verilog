// XOR Decryption Module
// Decrypts 8-bit ciphertext using same 8-bit key
module xor_decrypt(
    input  [7:0] ciphertext,
    input  [7:0] key,
    output [7:0] plaintext
);
    assign plaintext = ciphertext ^ key;
endmodule
