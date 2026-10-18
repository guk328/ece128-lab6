`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////

module moore_tb;
    reg p1, clk, rst;
    wire fsm_out;
    moore DUT(.p1(p1), .clk(clk), .rst(rst), .fsm_out(fsm_out));
    
    always #5 clk = ~clk;
    initial begin
        $display("p1    rst    |    fsm_out");
        $monitor("%b    %b    |    %b", p1, rst, fsm_out);
                clk = 1'b0; rst = 1'b1; p1 = 1'b0; #10;  // reset on, starts in s0
        rst = 1'b0; p1 = 1'b0; #10;  // 0 start + stays in s0
        rst = 1'b0; p1 = 1'b1; #10;  // 1 then 0 and s1 goes to s0
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;  // 1100 detects
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;  // 1101 near miss no detect
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b1; #10;  // 1100 detects
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b1; #10;  // extra 1 stays in s2 then 00 detects
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b1; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b0; #10;
        rst = 1'b0; p1 = 1'b0; #10;  // s4 goes to s0 on a 0
        #20 $finish;
    end
endmodule