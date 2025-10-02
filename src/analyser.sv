module analyser (
    // simple 4-bit linear feedback shift register.
    // primitive polynomial is x^4 + x^3 + 1
    // Author: Peter YK Cheung
    // Version: 1.0, 17-9-25

	input logic          clk,        // clock
    input logic          rst,        // reset
    input logic  input_signal,
	output logic [15:0]  data_out    // pseudo-random output
);

logic [16:1]     sreg;

always_ff @ (posedge clk, posedge rst)
    if (rst)
        sreg <= 16'b1;
    else 
    	sreg <= {sreg[15:1], sreg[2] ^ sreg[3] ^ sreg[5] ^ sreg[16] ^ input_signal};

assign data_out = sreg;
endmodule 

