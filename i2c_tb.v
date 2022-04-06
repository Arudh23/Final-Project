`timescale 1ns/1ns
`include "i2c_module.v"

module i2c_tb;
reg RX=0;
reg CLK=0;

wire TX0, TX1, TX2, TX3;

slave_devices UUT0(.TX(TX0), .RX(RX), .CLK(CLK));
slave_devices UUT1(.TX(TX1), .RX(RX), .CLK(CLK));
slave_devices UUT2(.TX(TX2), .RX(RX), .CLK(CLK));
slave_devices UUT3(.TX(TX3), .RX(RX), .CLK(CLK));

reg[7:0] device_select=8'b0;
integer i=0;
initial begin
    $dumpfile("i2c_tb.vcd");
    $dumpvars(0,i2c_tb);
    UUT0.ADDR=8'h1A;
    UUT0.DATA=8'h5D;

    UUT1.ADDR=8'h1B;
    UUT1.DATA=8'h3F;

    UUT2.ADDR=8'h2A;
    UUT2.DATA=8'h41;

    UUT3.ADDR=8'h2B;
    UUT3.DATA=8'h6C;

    device_select=UUT0.ADDR;
    for(i=0;i<8;i=i+1)
    begin
        RX=device_select[i]; #10;CLK=0;#10;CLK=1;#10;
    end
    for( i=0;i<8;i=i+1)
    begin
        #10;CLK=0;#10;CLK=1;#10;
    end

    device_select=UUT1.ADDR;
    for( i=0;i<8;i=i+1)
    begin
        RX=device_select[i]; #10;CLK=0;#10;CLK=1;#10;
    end
    for( i=0;i<8;i=i+1)
    begin
        #10;CLK=0;#10;CLK=1;#10;
    end

    device_select=UUT2.ADDR;
    for( i=0;i<8;i=i+1)
    begin
        RX=device_select[i]; #10;CLK=0;#10;CLK=1;#10;
    end
    for( i=0;i<8;i=i+1)
    begin
        #10;CLK=0;#10;CLK=1;#10;
    end

    device_select=UUT3.ADDR;
    for( i=0;i<8;i=i+1)
    begin
        RX=device_select[i]; #10;CLK=0;#10;CLK=1;#10;
    end
    for( i=0;i<8;i=i+1)
    begin
        #10;CLK=0;#10;CLK=1;#10;
    end
 
end
endmodule