module data_sync (unsync_bus,bus_enable,CLK,RST,enable_pulse,sync_bus);
parameter NUM_STAGES = 2;
parameter BUS_WIDTH =  8; 
input [BUS_WIDTH-1:0] unsync_bus;
input CLK,RST,bus_enable;
output reg enable_pulse;
output reg [BUS_WIDTH-1:0] sync_bus;
reg [NUM_STAGES-1:0] temp;
wire [BUS_WIDTH-1 : 0] sync_bus_comb;
wire enable_pulse_comb;
reg Q;
integer i;
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        temp <= 0;
        Q <= 0;
        enable_pulse <= 0;
        sync_bus <= 0 ;
    end else begin
        temp[0] <=bus_enable;
        for(i=1;i<NUM_STAGES;i=i+1)
         begin  temp[i] <= temp[i-1]; end   
         Q<= temp [NUM_STAGES-1] ;
         sync_bus <= sync_bus_comb;
         enable_pulse <= enable_pulse_comb;
    end
end
assign enable_pulse_comb = ((!Q)&&(temp[NUM_STAGES-1]));
assign sync_bus_comb =(enable_pulse_comb)? unsync_bus:sync_bus;
endmodule