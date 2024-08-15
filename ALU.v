module sixteen_bit_ALU(A,B,RST,EN,ALU_FUN,CLK,ALU_OUT,OUT_Valid);
input [7:0]A,B;
input CLK,EN,RST;
input [3:0]ALU_FUN;
output reg OUT_Valid;
output reg [15:0] ALU_OUT;
reg [15:0] result;

always @(*) begin
case (ALU_FUN)
'b0000: begin
result=A+B;

end  
'b0001: begin
result=A-B;

end 
'b0010: begin
result=A*B;
end 
'b0011: begin
result=A/B;
end   
'b0100: begin
result=A&B;
end 
'b0101: begin
result=A|B;
end 
'b0110: begin
result=~(A&B);
end 
'b0111: begin
result=~(A|B);
end 
'b1000: begin
result=A^B;
end 
'b1001: begin
result=A~^B;
end 
'b1010: begin
if(A==B)
begin
result=1;
end else  begin
result=0;
end
end 
'b1011: begin
if(A>B)
begin
result=2;
end else  begin
result=0;
end
end
'b1100: begin
if(A<B)
begin
result=3;
end else  begin
result=0;
end
end
'b1101: begin
result=A >> 1;
end
'b1110: begin
result=A << 0;
end
 default: begin
 result=0;
    end
endcase 
end

always @(posedge CLK or negedge RST ) begin
if (!RST) begin
 ALU_OUT <= 0;
OUT_Valid <=0;    
end else begin
if(EN)
begin
ALU_OUT <= result;
OUT_Valid <=1;   
end  else begin
 OUT_Valid <=0;     
end    
end
end
endmodule