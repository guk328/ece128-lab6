`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////

module mealyoverlapping(p1, clk, rst, fsm_out);

    input p1,clk,rst;
    output reg fsm_out;
    //state variable
    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011;
    //registers
    reg [2:0] cs,ns;
    
    //state transitions
    always @(posedge clk)
        begin
            if(rst==1)
            cs<=s0;
            else
            cs<=ns;
        end
    //ns determination logic (combinational)
    always @(cs,p1)
        begin
            case(cs)
            s0:begin
            if (p1)
            begin
            ns= s1;
            fsm_out = 1'b0;
            end
            else
            begin
            ns=s0;
            fsm_out=1'b0;
            end
            end
            
            s1:begin
            if(p1)
            begin
            ns=s2;
            fsm_out=1'b0;
            end
            else
            begin
            ns=s0;
            fsm_out=1'b0;
            end
            end
            
            s2:begin
            if(p1)
            begin
            ns=s2;
            fsm_out=1'b0;
            end
            else
            begin
            ns=s3;
            fsm_out=1'b0;
            end
            end
            
            s3:begin
            if(p1)
            begin
            ns=s1;
            fsm_out=1'b1;
            end
            else
            begin
            ns=s0;
            fsm_out=1'b0;
            end
            end
            
            default:begin
            ns=s0;
            fsm_out=1'b0;
            end
            endcase
    end
              
endmodule