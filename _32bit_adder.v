//module _32bit_adder (S,carry_out,A,B,carry_in);
//input [31:0] A,B;
//input carry_in;
//output carry_out;
//output [31:0] S;
//wire carry_out1,carry_out2,carry_out3,carry_out4,carry_out5,carry_out6,carry_out7;  //intermediate carries	
//	_4bit_adder fatb7(S[3:0], carry_out1, A[3:0], B[3:0], carry_in);		
//	_4bit_adder fatb6(S[7:4], carry_out2, A[7:4], B[7:4], carry_out1);	
//	_4bit_adder fatb5(S[11:8], carry_out3, A[11:8], B[11:8], carry_out2);	
//	_4bit_adder fatb4(S[15:12], carry_out4, A[15:12], B[15:12], carry_out3);
//	_4bit_adder fatb3(S[19:16], carry_out5, A[19:16], B[19:16], carry_out4);		
//	_4bit_adder fatb2(S[23:20], carry_out6, A[23:20], B[23:20], carry_out5);
//	_4bit_adder fatb1(S[27:24], carry_out7, A[27:24], B[27:24], carry_out6);
//	_4bit_adder fatb0(S[31:28], carry_out, A[31:28], B[31:28], carry_out7);
	
		
				
				
//endmodule

module _32bit_adder (S, carry_out, A, B, carry_in);
    input [31:0] A, B;
    input carry_in;
    output [31:0] S;
    output carry_out;

    // Generate (G) and Propagate (P) signals
    wire [31:0] G, P;
    assign G = A & B;  // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;  // Propagate: P[i] = A[i] ^ B[i]

    // Carry signals
    wire [32:0] C;
    assign C[0] = carry_in;  // Initial carry-in

    // Carry-lookahead logic
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : carry_gen
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    // Sum computation
    assign S = P ^ C[31:0];  // S[i] = P[i] ^ C[i]
    assign carry_out = C[32];  // Final carry-out
endmodule