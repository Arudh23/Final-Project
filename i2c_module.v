/* Inter Integrated Circuit Communication Protocol*/
`timescale 1ns/1ns
/* module master_device(ADDR,RX,TX,CLK);
input[7:0] ADDR;
input RX;
output reg TX;
output reg CLK;
reg[7:0] DATA;
integer i=0;
always(@ADDR)
begin 
    for(i=0;i<8;i=i+1)
    begin
        CLK=0;#10;
        TX=ADDR[i];
        CLK=1;10;
    end
    for(i=0;i<8;i=i+1)
    begin
        CLK=0;#10;
        CLK=1;#10;
        DATA[i]=RX;
    end
end
endmodule 
*/
module slave_devices(TX,RX,CLK);
input RX,CLK;
output reg TX;//TX=0

reg[7:0]ADDR; //Address Bits
reg[7:0]DATA; //Data bits
reg[7:0]ADDR_COMPARE=8'd0;// Register to compare slave address with user address
reg[3:0] counter=0; // To keep track of Clock Pulses

always@(posedge CLK)
begin
    if(counter<8)
    begin
        // load value from RX in tb into ADDR Compare
        ADDR_COMPARE[counter]=RX;
    end
    else
    begin
        if(ADDR_COMPARE==ADDR)
        begin
            TX=DATA[counter-8];
        end
    end
    counter=counter+1; // Incrementing Counter 
end
endmodule