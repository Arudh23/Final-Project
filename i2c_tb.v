`timescale 1ns/1ns
`include "i2c_module.v"

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

/* wire TX0, TX1, TX2, TX3;

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
 
end */
