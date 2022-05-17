//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2022 11:35:10
// Design Name: 
// Module Name: finalprojtb
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
`timescale 1ns/1ns
`include "finalprojtb.v"
module i2c_tb;
// reg RX=0;
// reg CLK=0;
reg[7:0]ADDR;
wire ADDR_TX;
wire INPUTDATA;
wire SCLK;
wire [3:0]SLAVEOUT;
assign INPUTDATA=|SLAVEOUT;
master_device UUTM0(.ADDR(ADDR),.TX(ADDR_TX),.IN_DATA(INPUTDATA),.SCLK(SCLK));
slave_devices UUTS0(.OUT(SLAVEOUT[0]),.RX(ADDR_TX),.SCLK(SCLK));
slave_devices UUTS1(.OUT(SLAVEOUT[1]),.RX(ADDR_TX),.SCLK(SCLK));
slave_devices UUTS2(.OUT(SLAVEOUT[2]),.RX(ADDR_TX),.SCLK(SCLK));
slave_devices UUTS3(.OUT(SLAVEOUT[3]),.RX(ADDR_TX),.SCLK(SCLK));

    initial begin
        $dumpfile("i2c.vcd");
        $dumpvars(0,i2c_tb);

        UUTS0.ADDR=8'h1A;
        UUTS0.DATA=8'h5D;

        UUTS1.ADDR=8'h1B;
        UUTS1.DATA=8'h3F;

        UUTS2.ADDR=8'h2A;
        UUTS2.DATA=8'h41;

        UUTS3.ADDR=8'h2B;
        UUTS3.DATA=8'h6C;

        ADDR=UUTS0.ADDR;#500;
        ADDR=UUTS1.ADDR;#500;
        ADDR=UUTS2.ADDR;#500;
        ADDR=UUTS3.ADDR;#500;

    end
endmodule
