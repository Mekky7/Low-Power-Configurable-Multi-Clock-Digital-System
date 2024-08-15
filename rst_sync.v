module rst_syn (CLK,RST,SYNC_RST);
input CLK ,RST;
output reg SYNC_RST;
parameter NUM_STAGES = 2;
reg [NUM_STAGES-1:0] temp;
integer i;
always @(posedge CLK or negedge RST ) begin
if(!RST)
begin
 SYNC_RST <=0;
 temp     <=0;   
end else begin
 temp[0] <=1;
 for(i=1;i<NUM_STAGES;i=i+1)
 begin
    temp[i] <= temp[i-1];
 end   
 SYNC_RST<= temp [NUM_STAGES-1] ;
end   
end
endmodule