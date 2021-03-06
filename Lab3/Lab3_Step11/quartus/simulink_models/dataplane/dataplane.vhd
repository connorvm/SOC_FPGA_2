-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane.vhd
-- Created: 2020-04-22 15:45:05
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane
-- Source Path: dataplane
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        avalon_sink_valid                 :   IN    std_logic;  -- ufix1
        avalon_sink_data                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        avalon_sink_channel               :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        avalon_sink_error                 :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        register_control_left_gain        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        register_control_right_gain       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        register_control_max_reset_threshold :   IN    std_logic_vector(17 DOWNTO 0);  -- ufix18
        register_control_LED_persistence  :   IN    std_logic_vector(14 DOWNTO 0);  -- ufix15
        avalon_source_valid               :   OUT   std_logic;  -- ufix1
        avalon_source_data                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        avalon_source_channel             :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        avalon_source_error               :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        LED                               :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END dataplane;


ARCHITECTURE rtl OF dataplane IS

  -- Component Declarations
  COMPONENT dataplane_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          avalon_sink_valid               :   IN    std_logic;  -- ufix1
          avalon_sink_data                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          avalon_sink_channel             :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          avalon_sink_error               :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          register_control_left_gain      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          register_control_right_gain     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          register_control_max_reset_threshold :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
          register_control_LED_persistence :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          ce_out                          :   OUT   std_logic;  -- ufix1
          avalon_source_valid             :   OUT   std_logic;  -- ufix1
          avalon_source_data              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          avalon_source_channel           :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          avalon_source_error             :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          LED                             :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_reset_sync
    USE ENTITY work.dataplane_reset_sync(rtl);

  FOR ALL : dataplane_dut
    USE ENTITY work.dataplane_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL avalon_source_valid_sig          : std_logic;  -- ufix1
  SIGNAL avalon_source_data_sig           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL avalon_source_channel_sig        : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL avalon_source_error_sig          : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL LED_sig                          : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  u_dataplane_reset_sync_inst : dataplane_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_cm,  -- ufix1
              reset_out => reset
              );

  u_dataplane_dut_inst : dataplane_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              avalon_sink_valid => avalon_sink_valid,  -- ufix1
              avalon_sink_data => avalon_sink_data,  -- sfix32_En28
              avalon_sink_channel => avalon_sink_channel,  -- ufix2
              avalon_sink_error => avalon_sink_error,  -- ufix2
              register_control_left_gain => register_control_left_gain,  -- sfix32_En28
              register_control_right_gain => register_control_right_gain,  -- sfix32_En28
              register_control_max_reset_threshold => register_control_max_reset_threshold,  -- sfix18
              register_control_LED_persistence => register_control_LED_persistence,  -- sfix15
              ce_out => ce_out_sig,  -- ufix1
              avalon_source_valid => avalon_source_valid_sig,  -- ufix1
              avalon_source_data => avalon_source_data_sig,  -- sfix32_En28
              avalon_source_channel => avalon_source_channel_sig,  -- ufix2
              avalon_source_error => avalon_source_error_sig,  -- ufix2
              LED => LED_sig  -- ufix8
              );

  dut_enable <= '1';

  reset_cm <=  NOT IPCORE_RESETN;

  avalon_source_valid <= avalon_source_valid_sig;

  avalon_source_data <= avalon_source_data_sig;

  avalon_source_channel <= avalon_source_channel_sig;

  avalon_source_error <= avalon_source_error_sig;

  LED <= LED_sig;

END rtl;

