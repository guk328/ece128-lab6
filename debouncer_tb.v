`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;
    reg RAW, CLK;
    wire CLEAN;
    
    debouncer DUT(.RAW(RAW), .CLK(CLK), .CLEAN(CLEAN));
    
    always #5 CLK = ~CLK;
    
    initial begin
        $display("RAW    |    CLEAN");
        $monitor("%b    |    %b", RAW, CLEAN);
        CLK = 1'b0; RAW = 1'b0; #10; //start low so CLEAN isnt x
        RAW = 1'b0; #10; // RAW stays low, counter and CLEAN stay 0
        RAW = 1'b0; #10;
        RAW = 1'b1; #10; // bounces of 1, 2, 3 highs, clean stays 0
        RAW = 1'b0; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b0; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b0; #10;
        RAW = 1'b1; #10;//hold 12 highs, CLEAN rises on 8th and stays 1
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b0; #10; //re;ease, CLEAN immediately drops
        RAW = 1'b0; #10;
        RAW = 1'b0; #10;
        RAW = 1'b1; #10;//quick bounces after release and CLEAN stays 0
        RAW = 1'b0; #10;
        RAW = 1'b1; #10;
        RAW = 1'b0; #10;
        RAW = 1'b1; #10; //hold again, CLEAN rises again
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b1; #10;
        RAW = 1'b0; #10; //release again, CLEAN drops
        RAW = 1'b0; #10;
        RAW = 1'b0; #10;
        #20 $finish;
    end
endmodule