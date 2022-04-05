/* Inter Integrated Circuit Communication Protocol*/
`timescale 1ns/1ns
/* module master_device(addr,TX,RX,CLK);
input RX;
output TX,CLK;

endmodule 
*/

module slave_devices(TX,RX,CLK);
input RX,CLK;
output TX;

reg[7:0]ADDR;
reg[7:0]DATA;
reg[7:0]ADDR_COMPARE=8'd0;
reg[3:0] counter=0;

always@(posedge CLK)
begin
    if(counter<8)
    begin
        ADDR_COMPARE[counter]=RX;
    end
    counter=counter+1;
end
endmodule