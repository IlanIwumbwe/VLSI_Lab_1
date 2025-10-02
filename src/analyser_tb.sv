`timescale 1ns/1ps
module analyser_tb;
    logic rst;
    logic clk;
    logic input_signal;
    logic [15:0] data_out;

    // instantiate the DUT
    analyser dut (
        .clk(clk),
        .rst(rst),
        .input_signal(input_signal),
        .data_out(data_out)
    );

    initial begin
        $display("Start lfsr4 testbench ....");
        clk = 1'b0;
        rst = 1'b1;
        input_signal = 1'b0;
        #1 clk = 1'b1;
        #1 clk = 1'b0;
	#1 rst = 1'b0;

	// clock generator
    	for (int i=0; i<20; i++) begin
        	#1 clk = 1'b1;
        	#1 clk = 1'b0;
            #1 input_signal = i;
	end
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, analyser_tb, dut);
    end
endmodule