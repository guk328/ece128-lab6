`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////


module moore(p1, clk, rst, fsm_out);
    input p1, clk, rst;
    output reg fsm_out;
    //state variable
    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011,
              s4 = 3'b100;
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
            if(p1)
            ns=s1;
            else
            ns=s0;
            end
            
            s1:begin
            if(p1)
            ns=s2;
            else
            ns=s0;
            end
            
            s2:begin
            if(p1)
            ns=s2;
            else
            ns=s3;
            end
            
            s3:begin
            if(p1)
            ns=s1;
            else
            ns=s4;
            end
            
            s4:begin
            if(p1)
            ns=s1;
            else
            ns=s0;
            end
            
            default:ns=s0;
            endcase
    end
    
    //combinational logic to determine output
    always @(cs)
    begin
        case(cs)
        s0: fsm_out=1'b0;
        s1: fsm_out=1'b0;
        s2: fsm_out=1'b0;
        s3: fsm_out=1'b0;
        s4: fsm_out=1'b1;
        default: fsm_out=1'b0;
        endcase
    end
        
              
endmodule
