`timescale 1ns/1ns
`include "i2c_module.v"
module i2c_tb;
reg RX=0;
reg CLK=0;

wire TX;

slave_devices UUT(.TX(TX),.RX(RX),.CLK(CLK)); 
initial begin
    $dumpfile("i2c_tb.vcd");
    $dumpvars(0,i2c_tb);
    UUT.ADDR=8'b01001101;
    UUT.DATA=8'h5D;
    RX=1;#10;CLK=0;#10;CLK=1;#10;
    RX=0;#10;CLK=0;#10;CLK=1;#10;
    RX=1;#10;CLK=0;#10;CLK=1;#10;
    RX=1;#10;CLK=0;#10;CLK=1;#10;
    RX=0;#10;CLK=0;#10;CLK=1;#10;
    RX=0;#10;CLK=0;#10;CLK=1;#10;
    RX=1;#10;CLK=0;#10;CLK=1;#10;
    RX=0;#10;CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;
    CLK=0;#10;CLK=1;#10;  
end
endmodule