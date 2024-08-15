module RX_div_ratio_calc (
Prescale,RX_DIV_RATIO
);
input [5:0] Prescale;
output reg [3:0] RX_DIV_RATIO;

always @(*) begin
   case (Prescale)
   32: RX_DIV_RATIO = 1;
   16: RX_DIV_RATIO = 2;
   8 : RX_DIV_RATIO = 4;
   4 : RX_DIV_RATIO = 8;
    default: begin
        RX_DIV_RATIO = 1;
    end
   endcase 
end
endmodule