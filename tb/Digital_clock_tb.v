`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 22:08:37
// Design Name: 
// Module Name: Digital_clock_tb
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


module Digital_clock_tb;
    reg rst,clk;
    reg [4:0] alarm_hr;
    reg [5:0] alarm_min;
    reg alarm_enable;
    wire alarm;
    wire [5:0]sec;
    wire [5:0]min;
    wire [4:0]hrs;
    
    DigitalClock uut(.rst(rst),.clk(clk),.alarm_hr(alarm_hr),
    .alarm_min(alarm_min),.alarm_enable(alarm_enable),.alarm(alarm),
    .sec(sec),.min(min),.hrs(hrs));
    
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;        //Initializing
        alarm_enable = 0;
        alarm_hr = 0;
        alarm_min = 0;

        #10;
        rst = 0;

        #100;
        alarm_hr = 0;
        alarm_min = 6'd2;  // alarm at 00:02min
        alarm_enable = 1;

        #140000
        $finish; 
    end
    
    
    initial begin
        $monitor("Time = %02d:%02d:%02d | Alarm = %b",
                 hrs, min, sec, alarm);
    end
    
endmodule
