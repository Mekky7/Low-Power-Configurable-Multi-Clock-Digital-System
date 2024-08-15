module eight_by_sixteen_Register_file(WrData,Address,WrEn,RdEn,
oprand_A,oprand_B,uart_config,CLK,RST,RdData,Rd_D_Vid,Div_ratio);
input CLK,RST;
input WrEn,RdEn;
input [3:0]Address;
input [7:0] WrData;
output reg [7:0]RdData;
output  [7:0]oprand_A;
output  [7:0]oprand_B;
output  [7:0]uart_config;
output  [7:0]Div_ratio;
output reg Rd_D_Vid;
reg [7:0] reg_f [15:0];
always @(posedge CLK or negedge RST) begin
if(!RST) begin
reg_f[0]<=0;
reg_f[1]<=0;
reg_f[2]<=8'b10000001;
reg_f[3]<=32;
reg_f[4]<=0;
reg_f[5]<=0;
reg_f[6]<=0;
reg_f[7]<=0;
reg_f[8]<=0;
reg_f[9]<=0;
reg_f[10]<=0;
reg_f[11]<=0;
reg_f[12]<=0;
reg_f[13]<=0;
reg_f[14]<=0;
reg_f[15]<=0;
RdData<=0; 
Rd_D_Vid <= 0;  
end else if (WrEn && !RdEn) begin    
reg_f[Address] <= WrData;
Rd_D_Vid <=0;
end   else if (!WrEn && RdEn) begin
RdData<=reg_f[Address];  
Rd_D_Vid <=1;  
end else begin
Rd_D_Vid <=0;
end
end    
assign oprand_A = reg_f[0];
assign oprand_B = reg_f[1];
assign uart_config = reg_f[2];
assign Div_ratio = reg_f[3];
endmodule