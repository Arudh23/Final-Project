/* Inter Integrated Circuit Communication Protocol*/
`timescale 1ns/1ns
/* module master_device(addr,TX,RX,CLK);
input RX;
output TX,CLK;
endmodule 
*/
module slave_devices(TX,RX,CLK);
input RX,CLK;
output reg TX=0;

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