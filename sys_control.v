module SYS_CTRL (ALU_OUT,OUT_Valid,RX_P_DATA,RX_D_VLD
,RdData,RdData_Valid,CLK,RST,EN,ALU_FUN,CLK_EN,Address,
WrEN,RdEn,WrData,TX_P_Data,TX_D_VLD,clk_div_en,F_FULL
);
input CLK,RST,OUT_Valid,RdData_Valid,RX_D_VLD;
input [15:0] ALU_OUT;
input [7:0] RX_P_DATA;
input [7:0] RdData;
input F_FULL;
output reg [3:0] ALU_FUN;
output reg  EN,CLK_EN,WrEN,RdEn,clk_div_en,TX_D_VLD;
output reg [3:0] Address;
output reg [7:0] WrData;
output reg [7:0] TX_P_Data;
reg [3:0] NS;
reg [3:0] CS;
localparam IDLE = 0 ;
localparam WAIT_ALU_SECOND_OUT=1;
localparam RF_Wr_ADDR=2;
localparam RF_Wr_DATA=3;
localparam RF_RD_ADDR=4;
localparam GET_OPRAND_A=5;
localparam GET_OPRAND_B=6;
localparam GET_ALU_FUN=7;
localparam WAIT_RF_OUT=8;
localparam WAIT_ALU__FIRST_OUT=9;
localparam SEND_DATA=10;
/////Internal_signals
reg [3:0] temp_add_stored;
reg [3:0] temp_add;
//state_transition_logic
always @(posedge CLK or negedge RST) begin
  if (!RST) begin
    CS <= IDLE;
    temp_add_stored <= 0;
  end else begin 
    CS <= NS;
  if(CS == RF_Wr_ADDR)
  begin
    temp_add_stored <= temp_add;
  end
  end  
end

///////////NEXT_STATE_LOGIC && OUTPUT_LOGIC
always @(*) begin
 case (CS)
  IDLE:begin
    TX_P_Data = 0;
    Address   = 0;
    ALU_FUN   = 0;
    EN        = 0;
    CLK_EN    = 0;
    WrEN      = 0;
    RdEn      = 0;
    TX_D_VLD  = 0;
    clk_div_en = 1;
    temp_add  = 0;
    WrData = 0;
    if (RX_D_VLD) begin
   case (RX_P_DATA)
8'hAA: begin
    NS =RF_Wr_ADDR;
end
8'hBB: begin
    NS =RF_RD_ADDR;
end 
8'hCC: begin
    NS =GET_OPRAND_A;
end  
8'hDD: begin
    NS =GET_ALU_FUN;
end     
    default: begin
    NS =IDLE;
    end
endcase   
    end else begin
        NS = CS;
    end
  end

  RF_Wr_ADDR:begin
    TX_P_Data = 0;
    Address   = 0;
    ALU_FUN   = 0;
    EN        = 0;
    CLK_EN    = 0;
    WrEN      = 0;
    RdEn      = 0;
    TX_D_VLD  = 0;
    clk_div_en = 1;
    WrData = 0;
    if (RX_D_VLD) begin
   temp_add = RX_P_DATA[3:0];
   NS =   RF_Wr_DATA;   
    end else begin
        NS = CS;
        temp_add=0;
    end
  end
  
    RF_Wr_DATA:begin
    temp_add =  0;
    TX_P_Data = 0;
    Address   = 0;
    ALU_FUN   = 0;
    EN        = 0;
    CLK_EN    = 0;
    RdEn      = 0;
    TX_D_VLD  = 0;
    clk_div_en = 1;
    WrData = 0;
    WrEN =  0;
    if (RX_D_VLD && !F_FULL) begin
   Address = temp_add_stored;
   WrData = RX_P_DATA;
   WrEN = 1;
   NS = IDLE;
    end else begin
        NS = CS;
    end
  end

   RF_RD_ADDR:
   begin
    temp_add =  0;
    TX_P_Data = 0;
    Address   = 0;
    ALU_FUN   = 0;
    EN        = 0;
    CLK_EN    = 0;
    RdEn      = 0;
    WrEN      = 0;
    TX_D_VLD  = 0;
    clk_div_en = 1;
    WrData = 0;
    
    if(RX_D_VLD)
    begin
    Address = RX_P_DATA [3:0];
    RdEn =1; 
    NS = WAIT_RF_OUT;
    end  else begin
      NS = CS;
    end
   end

   WAIT_RF_OUT: begin ///may cause error 
        temp_add =  0;
        TX_P_Data = 0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 0;
        RdEn      = 0;
        WrEN      = 0;
        TX_D_VLD  = 0;
        clk_div_en = 1;
        WrData     = 0;
      if (RdData_Valid) begin
       TX_P_Data =RdData;
       TX_D_VLD =1;
       NS = IDLE;
      end else begin
        NS = CS;
      end
   end

   GET_OPRAND_A: begin
        temp_add =  0;
        TX_P_Data = 0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 0;
        RdEn      = 0;
        WrEN      = 0;
        TX_D_VLD  = 0;
        clk_div_en = 1;
        WrData     = 0;
    if (RX_D_VLD && !F_FULL) begin
      Address = 0;
      WrEN =1;
      WrData =RX_P_DATA;
      NS =GET_OPRAND_B;
    end else begin
      NS = CS;
    end
   end
    
   GET_OPRAND_B: begin
        temp_add =  0;
        TX_P_Data = 0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 0;
        RdEn      = 0;
        WrEN      = 0;
        TX_D_VLD  = 0;
        clk_div_en = 1;
        WrData     = 0;
    if (RX_D_VLD && ! F_FULL) begin
      Address = 1;
      WrEN =1;
      WrData =RX_P_DATA;
      NS =GET_ALU_FUN;
    end else begin
      NS = CS;
    end
   end

   

   GET_ALU_FUN: begin
        temp_add =  0;
        TX_P_Data = 0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 1;
        RdEn      = 0;
        WrEN      = 0;
        TX_D_VLD  = 0;
        clk_div_en = 1;
        WrData     = 0;
    if (RX_D_VLD) begin
      ALU_FUN = RX_P_DATA [3:0];
      NS = WAIT_ALU__FIRST_OUT;
      EN =1;
    end else begin
      NS = CS;
    end
   end
WAIT_ALU__FIRST_OUT: begin
        temp_add =  0;
        TX_P_Data = 0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 1; // check here
        CLK_EN    = 1;
        RdEn      = 0;
        WrEN      = 0;
        TX_D_VLD  = 0;
        clk_div_en = 1;
        WrData     = 0;
    if (OUT_Valid) begin
      TX_P_Data = ALU_OUT[7:0];
      TX_D_VLD  = 1;
      NS = WAIT_ALU_SECOND_OUT;
    end else begin
      NS = CS;
    end
   end
   
   WAIT_ALU_SECOND_OUT: begin
        temp_add =  0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 1;
        RdEn      = 0;
        WrEN      = 0;
        clk_div_en = 1;
        WrData     = 0;
      TX_P_Data = ALU_OUT[15:8];
      TX_D_VLD  = 1;
      NS = IDLE;
    end
    default: begin
      temp_add =  0;
        Address   = 0;
        ALU_FUN   = 0;
        EN        = 0;
        CLK_EN    = 0;
        RdEn      = 0;
        WrEN      = 0;
        clk_div_en = 1;
        WrData     = 0;
      TX_P_Data = 0;
      TX_D_VLD  = 0;
      NS = IDLE;
    end
 endcase   
end
endmodule