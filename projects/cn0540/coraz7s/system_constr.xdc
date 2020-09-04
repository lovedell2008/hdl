
# SPI interface

set_property -dict {PACKAGE_PIN  G15 IOSTANDARD LVCMOS33 IOB TRUE}                  [get_ports cn0540_spi_sclk]    ; ## CK_IO13
set_property -dict {PACKAGE_PIN  J18 IOSTANDARD LVCMOS33 IOB TRUE PULLTYPE PULLUP}  [get_ports cn0540_spi_miso]    ; ## CK_IO12
set_property -dict {PACKAGE_PIN  K18 IOSTANDARD LVCMOS33 IOB TRUE PULLTYPE PULLUP}  [get_ports cn0540_spi_mosi]    ; ## CK_IO11
set_property -dict {PACKAGE_PIN  U15 IOSTANDARD LVCMOS33}                           [get_ports cn0540_spi_cs]      ; ## CK_IO10

# reset and GPIO signals

set_property -dict {PACKAGE_PIN  M18 IOSTANDARD LVCMOS33}                           [get_ports cn0540_shutdown]    ; ## CK_IO9
set_property -dict {PACKAGE_PIN  R14 IOSTANDARD LVCMOS33}                           [get_ports cn0540_reset_adc]   ; ## CK_IO7
set_property -dict {PACKAGE_PIN  V18 IOSTANDARD LVCMOS33}                           [get_ports cn0540_csb_aux]     ; ## CK_IO5
set_property -dict {PACKAGE_PIN  V17 IOSTANDARD LVCMOS33}                           [get_ports cn0540_sw_ff]       ; ## CK_IO4
set_property -dict {PACKAGE_PIN  T15 IOSTANDARD LVCMOS33}                           [get_ports cn0540_drdy_aux]    ; ## CK_IO3
set_property -dict {PACKAGE_PIN  V13 IOSTANDARD LVCMOS33}                           [get_ports cn0540_blue_led]    ; ## CK_IO1
set_property -dict {PACKAGE_PIN  U14 IOSTANDARD LVCMOS33}                           [get_ports cn0540_yellow_led]  ; ## CK_IO0

# syncronization and timing

set_property -dict {PACKAGE_PIN  R17 IOSTANDARD LVCMOS33}                           [get_ports cn0540_sync_in]     ; ## CK_IO6
set_property -dict {PACKAGE_PIN  T14 IOSTANDARD LVCMOS33}                           [get_ports cn0540_drdy]        ; ## CK_IO2

set_property -dict {PACKAGE_PIN  P16 IOSTANDARD LVCMOS33}                           [get_ports cn0540_scl]         ; ## CK_SCL
set_property -dict {PACKAGE_PIN  P15 IOSTANDARD LVCMOS33}                           [get_ports cn0540_sda]         ; ## CK_SDA

# relax the timing between the SDO FIFO and shift-register
set_multicycle_path 2 -setup -from [get_pins -hierarchical -filter {NAME=~*/i_sdo_fifo/i_mem/m_ram_reg/CLKARDCLK}] -to [get_pins -hierarchical -filter {NAME=~*/data_sdo_shift_reg[*]/D}]
set_multicycle_path 1 -hold -from [get_pins -hierarchical -filter {NAME=~*/i_sdo_fifo/i_mem/m_ram_reg/CLKARDCLK}] -to [get_pins -hierarchical -filter {NAME=~*/data_sdo_shift_reg[*]/D}]

## Dedicated XADC Analog Inputs
set_property -dict { PACKAGE_PIN K9    IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vp_vn_p }]; #VP_0 Sch=xadc_v_p
set_property -dict { PACKAGE_PIN L10   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vp_vn_n }]; #VN_0 Sch=xadc_v_n

## ChipKit Outer Analog Header - as Single-Ended Analog Inputs
## NOTE: These ports can be used as single-ended analog inputs with voltages from 0-3.3V (ChipKit analog pins A0-A5) or as digital I/O.
## WARNING: Do not use both sets of constraints at the same time!
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux1_p }]; #IO_L3P_T0_DQS_AD1P_35 Sch=ck_an_p[0]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux1_n }]; #IO_L3N_T0_DQS_AD1N_35 Sch=ck_an_n[0]
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux9_p }]; #IO_L5P_T0_AD9P_35 Sch=ck_an_p[1]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux9_n }]; #IO_L5N_T0_AD9N_35 Sch=ck_an_n[1]
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux6_p }]; #IO_L20P_T3_AD6P_35 Sch=ck_an_p[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux6_n }]; #IO_L20N_T3_AD6N_35 Sch=ck_an_n[2]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux15_p }]; #IO_L24P_T3_AD15P_35 Sch=ck_an_p[3]
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux15_n }]; #IO_L24N_T3_AD15N_35 Sch=ck_an_n[3]
set_property -dict { PACKAGE_PIN J20   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux5_p }]; #IO_L17P_T2_AD5P_35 Sch=ck_an_p[4]
set_property -dict { PACKAGE_PIN H20   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux5_n }]; #IO_L17N_T2_AD5N_35 Sch=ck_an_n[4]
set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux13_p }]; #IO_L18P_T2_AD13P_35 Sch=ck_an_p[5]
set_property -dict { PACKAGE_PIN G20   IOSTANDARD LVCMOS33 } [get_ports { cn0540_xadc_vaux13_n }]; #IO_L18N_T2_AD13N_35 Sch=ck_an_n[5]
