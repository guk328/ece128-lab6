`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////


module mealyoverlapping_tb;
    reg p1, clk, rst;
    wire fsm_out;
    
    mealyoverlapping DUT(.p1(p1), .clk(clk), .rst(rst), .fsm_out(fsm_out));
    always #5 clk = ~clk;
    
    initial begin
        $display("p1    rst     |   fsm_out");
        $monitor("%b     %b      |   %b", p1, rst, fsm_out);
        clk = 1'b0; rst = 1'b1; p1 = 1'b0; #10; // reset on and starts in s0
        rst = 1'b0; p1 = 1'b1; #10; // 1101 detects
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b1; #10;//overlap, shares last 1 and detects again
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10; // back to s0 and stays in s0
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10; // 1100 near miss (np detect)
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10; // detects again after miss
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b1; #10; // 1 1 1 0 1, extra 1 stays in s2, still detects
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        #20 $finish;
    end
endmodule
