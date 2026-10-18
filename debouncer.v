`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////

module debouncer(input RAW,
                 input CLK,
                 output reg CLEAN);

    //internal counter and TC signal
    reg[24:0] counter;
    wire TC;
    //reset and increment counter
    always@(posedge CLK)
        begin
            if(~RAW)
            counter<= 25'b0;
            else
            counter <= counter + 25'b1;
        end
    assign TC = (counter==25'h1FFFFFF);
    //change output signal when counter reaches max
    always @(posedge CLK) begin
        if(~RAW)
        CLEAN<=1'b0;
        else if (TC)
        CLEAN<= 1'b1;
    end
endmodule