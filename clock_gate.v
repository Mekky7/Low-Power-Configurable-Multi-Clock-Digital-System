module clock_gating (clk,EN,gated_clk);
 input clk,EN;
 reg stored_en;
 output gated_clk;
 always @(*) begin
   if(!clk)
   begin
    stored_en =EN;
   end 
 end
 assign gated_clk = (stored_en & clk);
endmodule