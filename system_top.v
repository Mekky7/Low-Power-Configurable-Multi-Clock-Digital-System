module SYS_TOP (REF_CLK,RST,UART_CLK,RX_IN,TX_OUT,
PAR_ERR,STP_ERR);
input  REF_CLK,RST,UART_CLK,RX_IN;
output STP_ERR;
output PAR_ERR;
output TX_OUT;
wire F_FULL;
wire RD_INC;
wire [7:0] RX_P_DATA;
wire [7:0] SYNC_RX_P_DATA;
wire SYC_RX_D_VLD;
wire [7:0] uart_config;
wire TX_D_VLD;
wire RST,OUT_Valid,RdData_Valid,RX_D_VLD;
wire [15:0] ALU_OUT;
wire [7:0] RdData;
wire [3:0] ALU_FUN;
wire  EN,CLK_EN,WrEN,RdEn,clk_div_en;
wire [3:0] Address;
wire [7:0] WrData;
wire [7:0] TX_P_Data;
wire [7:0] oprand_A,oprand_B;
wire ALU_CLK;
wire REF_RST;
wire UART_RST;
wire [7:0] FIFO_RD_DATA;
wire Busy;
wire [7:0] Div_ratio;
wire [3:0] RX_DIV_RATIO;
wire TX_CLK;
wire RX_CLK;
SYS_CTRL SYSTEM_Control_BLOCK (
    .F_FULL(F_FULL),
    .ALU_OUT(ALU_OUT),         // ALU Output
    .OUT_Valid(OUT_Valid),     // ALU Output Valid signal
    .RX_P_DATA(SYNC_RX_P_DATA),     // Received Parallel Data
    .RX_D_VLD(SYC_RX_D_VLD),       // Received Data Valid signal
    .RdData(RdData),           // Read Data
    .RdData_Valid(RdData_Valid),// Read Data Valid signal
    .CLK(REF_CLK),             // Reference Clock
    .RST(RST),                 // Reset
    .EN(EN),                   // Enable
    .ALU_FUN(ALU_FUN),         // ALU Function
    .CLK_EN(CLK_EN),           // Clock Enable
    .Address(Address),         // Address
    .WrEN(WrEN),               // Write Enable
    .RdEn(RdEn),               // Read Enable
    .WrData(WrData),           // Write Data
    .TX_P_Data(TX_P_Data),     // Transmit Parallel Data
    .TX_D_VLD(TX_D_VLD),       // Transmit Data Valid signal
    .clk_div_en(clk_div_en)    // Clock Divider Enable
);


sixteen_bit_ALU ALU_BLOCK (
    .A(oprand_A),     // Operand A
    .B(oprand_B),     // Operand B
    .RST(RST),        // Reset
    .EN(EN),          // Enable
    .ALU_FUN(ALU_FUN),// ALU Function
    .CLK(ALU_CLK),    // Clock signal
    .ALU_OUT(ALU_OUT),// ALU Output
    .OUT_Valid(OUT_Valid) // Output Valid signal
);

eight_by_sixteen_Register_file RF_BLOCK (
    .WrData(WrData),         // Write Data
    .Address(Address),       // Address
    .WrEn(WrEN),             // Write Enable
    .RdEn(RdEn),             // Read Enable
    .oprand_A(oprand_A),     // Operand A
    .oprand_B(oprand_B),     // Operand B
    .uart_config(uart_config), // UART Configuration
    .CLK(REF_CLK),               // Clock signal
    .RST(REF_RST),               // Reset
    .RdData(RdData),         // Read Data
    .Rd_D_Vid(RdData_Valid), // Read Data Valid signal
    .Div_ratio(Div_ratio)
);

clock_gating clock_gating_block (.clk(REF_CLK),.EN(CLK_EN),.gated_clk(ALU_CLK));
rst_syn rst_sync_for_ref_clk (.CLK(REF_CLK),.RST(RST),.SYNC_RST(REF_RST));
rst_syn rst_sync_for_UART_clk (.CLK(UART_CLK),.RST(RST),.SYNC_RST(UART_RST));
data_sync data_synchroniser (.unsync_bus(RX_P_DATA),.bus_enable(RX_D_VLD),.CLK(REF_CLK),.RST(REF_RST),
.enable_pulse(SYC_RX_D_VLD),.sync_bus(SYNC_RX_P_DATA));
CLK_DIVIDER clock_divider_for_TX_clock (.I_ref_clk(UART_CLK),.I_rst_n(UART_RST),.I_clk_en(1'b1),
.I_div_ratio(Div_ratio),.o_div_clk(TX_CLK));

CLK_DIVIDER clock_divider_for_RX_clock (.I_ref_clk(UART_CLK),.I_rst_n(UART_RST),.I_clk_en(1'b1),
.I_div_ratio({4'b0,RX_DIV_RATIO}),.o_div_clk(RX_CLK));

RX_div_ratio_calc Prescale_mux (
.Prescale(uart_config[7:2]),.RX_DIV_RATIO(RX_DIV_RATIO)
);
top_RX_module RX (.RX_IN(RX_IN),
.Prescale(uart_config[7:2]),
.PAR_EN(uart_config[0]),.PAR_TYP(uart_config[1]),
.CLK(RX_CLK),
.RST(UART_RST),.P_DATA(RX_P_DATA),.DATA_VALID(RX_D_VLD),
.stp_err(STP_ERR),.par_err(PAR_ERR));

UART_TX TX (.CLK(TX_CLK),.RST(UART_RST),.PAR_TYP(uart_config[1]),
.PAR_EN(uart_config[0]),.P_DATA(FIFO_RD_DATA),
.DATA_VALID(!F_EMPTY),.TX_OUT(TX_OUT),.Busy(Busy));

PULSE_GEN PULSE_GENerator (
	 .clk(TX_CLK),    
	 .rst_n(UART_RST),  
     .enable(Busy),
     .pulse(RD_INC)	
);

FIFO_TOP FIFO (.W_CLK(REF_CLK),
.W_RST(REF_RST),.W_INC(TX_D_VLD),
.R_CLK(TX_CLK),.R_RST(UART_RST),.R_INC(RD_INC),
.WR_DATA(TX_P_Data),.RD_DATA(FIFO_RD_DATA),.FULL(F_FULL),.EMPTY(F_EMPTY)
);
endmodule