`timescale 1ns/1ps
`include "bist_topmodule.v"
module bist_tb;
    reg clk;
    reg rst;
    reg [1:0] mode;
    wire [15:0] led;

//Instantiation
bist_topmodule dut(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .led(led)
    );

//Clock Generation
initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    //$dumpfile("waveform.vcd");
    //$dumpvars;
    rst = 1'b1;
    #10;
    rst = 1'b0;
    #10
    mode = 2'b01;
    #1000000000;
    mode = 2'b10;
    #1000000000;
    mode = 2'b11;
    #1000000000;
    mode = 2'b00;
    #1000000000 $finish;
end

endmodule