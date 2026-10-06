`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2026 06:48:35
// Design Name: 
// Module Name: DigitalClock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DigitalClock(
    input rst,clk,
    input [4:0] alarm_hr,
    input [5:0] alarm_min,
    input alarm_enable,
    output reg alarm,
    output reg [5:0]sec,
    output reg [5:0]min,
    output reg [4:0]hrs
    );
    always @(posedge clk or posedge rst) begin
        if(rst)
            alarm <= 0;
        else if(alarm_enable)
            alarm <= (hrs == alarm_hr && min == alarm_min);
        else
            alarm <= 0;
    end
           
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            hrs <=0;
            min <=0;
            sec <=0;
        end       
        else begin
            
            if(sec < 59)
                sec <= sec + 1;
            else 
                sec <= 0;
            if(sec == 59) begin
                if(min<59)
                    min <= min + 1;
                else
                    min <= 0;
            end
            if(min == 59 && sec == 59) begin
                if(hrs<23)
                    hrs <= hrs + 1;
                else
                    hrs<=0;
            end
        end
    end
endmodule
