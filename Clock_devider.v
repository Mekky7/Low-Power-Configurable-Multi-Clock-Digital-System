module CLK_DIVIDER (I_ref_clk,I_rst_n,I_clk_en,I_div_ratio,o_div_clk);
input [7:0] I_div_ratio ;
input I_rst_n,I_ref_clk,I_clk_en;
output o_div_clk;
reg temp,toggle;
reg [7:0] count;
wire temp_final ;
wire CLK_DIV_EN;
wire done;
wire [7:0] rest;
always @(posedge I_ref_clk or negedge I_rst_n) begin
   if(!I_rst_n)
   begin
    temp <=0;
    count <=0;
   end else if (CLK_DIV_EN) begin
   begin
  
     if(!done)
     begin 
       if(I_div_ratio[0]==0)
   begin
   if(count <= ({1'b0,I_div_ratio[7:1]}-1) )
    begin
    temp <= 1 ;
    count <= count +1;
    end else begin
    temp <= 0 ;
    count <= count +1;       
    end  
   end  else 
    if(count <= ({1'b0,rest[7:1]}-1) )
    begin
    temp <= 1 ;
    count <= count +1;
    end else begin
    temp <= 0 ;
    count <= count +1;       
    end  
     end else begin
    count <= 0;  
     end
   end 
   end
   end 
always @(posedge I_ref_clk or negedge I_rst_n) begin
   if(!I_rst_n)
   begin
     toggle<=0; 
   end else begin
      toggle<=!toggle;
   end
end
assign temp_final=(I_div_ratio==2)? toggle :temp;
assign done = (count == (I_div_ratio -1));
assign rest={1'b0,(I_div_ratio - 1)};
assign CLK_DIV_EN = I_clk_en && ( I_div_ratio != 0) 
&& ( I_div_ratio != 1);
///////////////
assign o_div_clk =(CLK_DIV_EN)? temp_final:I_ref_clk;
endmodule