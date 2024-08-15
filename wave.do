onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/REF_CLK
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/RST
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/UART_CLK
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/RX_IN
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/STP_ERR
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/PAR_ERR
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/TX_OUT
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/farme
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/ref_frame
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/data_alu_1
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/data_alu_2
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/i
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/test_data
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/TX_CLK
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/case_index
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/correct_count
add wave -noupdate -expand -group TB_signals /FINAL_sys_tb/error_count
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/A
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/B
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/CLK
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/EN
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/RST
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/ALU_FUN
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/OUT_Valid
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/ALU_OUT
add wave -noupdate -group ALU /FINAL_sys_tb/DUT/ALU_BLOCK/result
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/I_div_ratio
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/I_rst_n
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/I_ref_clk
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/I_clk_en
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/o_div_clk
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/temp
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/toggle
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/count
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/temp_final
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/CLK_DIV_EN
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/done
add wave -noupdate -group RX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_RX_clock/rest
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/I_div_ratio
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/I_rst_n
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/I_ref_clk
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/I_clk_en
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/o_div_clk
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/temp
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/toggle
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/count
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/temp_final
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/CLK_DIV_EN
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/done
add wave -noupdate -group TX_CLOCK_DIVIDER /FINAL_sys_tb/DUT/clock_divider_for_TX_clock/rest
add wave -noupdate -group CLOCK_GATING /FINAL_sys_tb/DUT/clock_gating_block/clk
add wave -noupdate -group CLOCK_GATING /FINAL_sys_tb/DUT/clock_gating_block/EN
add wave -noupdate -group CLOCK_GATING /FINAL_sys_tb/DUT/clock_gating_block/stored_en
add wave -noupdate -group CLOCK_GATING /FINAL_sys_tb/DUT/clock_gating_block/gated_clk
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/unsync_bus
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/CLK
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/RST
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/bus_enable
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/enable_pulse
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/sync_bus
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/temp
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/sync_bus_comb
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/enable_pulse_comb
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/Q
add wave -noupdate -group DATA_SYNCH /FINAL_sys_tb/DUT/data_synchroniser/i
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/W_CLK
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/W_RST
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/W_INC
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/R_CLK
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/R_RST
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/R_INC
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/WR_DATA
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/FULL
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/EMPTY
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/RD_DATA
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/waddr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/raddr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/wptr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/rptr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/wq2_rptr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/rq2_wptr
add wave -noupdate -group FIFO /FINAL_sys_tb/DUT/FIFO/wCLKen
add wave -noupdate -group PRESCALE_MUX /FINAL_sys_tb/DUT/Prescale_mux/Prescale
add wave -noupdate -group PRESCALE_MUX /FINAL_sys_tb/DUT/Prescale_mux/RX_DIV_RATIO
add wave -noupdate -group PULSE_GENERATOR /FINAL_sys_tb/DUT/PULSE_GENerator/clk
add wave -noupdate -group PULSE_GENERATOR /FINAL_sys_tb/DUT/PULSE_GENerator/rst_n
add wave -noupdate -group PULSE_GENERATOR /FINAL_sys_tb/DUT/PULSE_GENerator/enable
add wave -noupdate -group PULSE_GENERATOR /FINAL_sys_tb/DUT/PULSE_GENerator/pulse
add wave -noupdate -group PULSE_GENERATOR /FINAL_sys_tb/DUT/PULSE_GENerator/enable_reg
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/CLK
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/RST
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/WrEn
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/RdEn
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/Address
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/WrData
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/RdData
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/oprand_A
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/oprand_B
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/uart_config
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/Div_ratio
add wave -noupdate -group REG_FILE /FINAL_sys_tb/DUT/RF_BLOCK/Rd_D_Vid
add wave -noupdate -group REF_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_ref_clk/CLK
add wave -noupdate -group REF_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_ref_clk/RST
add wave -noupdate -group REF_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_ref_clk/SYNC_RST
add wave -noupdate -group REF_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_ref_clk/temp
add wave -noupdate -group REF_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_ref_clk/i
add wave -noupdate -group UART_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_UART_clk/CLK
add wave -noupdate -group UART_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_UART_clk/RST
add wave -noupdate -group UART_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_UART_clk/SYNC_RST
add wave -noupdate -group UART_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_UART_clk/temp
add wave -noupdate -group UART_CLK_RST_SYNC /FINAL_sys_tb/DUT/rst_sync_for_UART_clk/i
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/CLK
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/RST
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/PAR_TYP
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/PAR_EN
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/RX_IN
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/Prescale
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/P_DATA
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/DATA_VALID
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/par_err
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/stp_err
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/dat_samp_en
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/enable
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/par_chk_en
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/strt_chk_en
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/stp_chk_en
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/strt_glitch
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/sampled_bit
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/deser_en
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/edge_cnt
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/bit_cnt
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/reset_count
add wave -noupdate -group RX /FINAL_sys_tb/DUT/RX/par_deassert
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/CLK
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RST
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/OUT_Valid
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RdData_Valid
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RX_D_VLD
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/ALU_OUT
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RX_P_DATA
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RdData
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/F_FULL
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/ALU_FUN
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/EN
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/CLK_EN
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/WrEN
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/RdEn
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/clk_div_en
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/TX_D_VLD
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/Address
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/WrData
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/TX_P_Data
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/NS
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/CS
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/temp_add_stored
add wave -noupdate -group SYSTEM_CONTROL /FINAL_sys_tb/DUT/SYSTEM_Control_BLOCK/temp_add
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/CLK
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/RST
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/PAR_TYP
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/PAR_EN
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/DATA_VALID
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/P_DATA
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/TX_OUT
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/Busy
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/ser_done
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/ser_en
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/FSM_en
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/ser_data
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/mux_sel
add wave -noupdate -group TX /FINAL_sys_tb/DUT/TX/par_bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5232091700 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 70
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {6510 us}
