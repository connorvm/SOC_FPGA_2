-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_ip_src_Avalon_Data_Processing.vhd
-- Created: 2020-04-22 15:35:29
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_ip_src_Avalon_Data_Processing
-- Source Path: lab3_step9/dataplane/Avalon Data Processing
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_ip_src_Avalon_Data_Processing IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        sink_data                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        sink_channel                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        left_gain                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        right_gain                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Max_Reset_Threshold               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
        LED_persistence                   :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
        Enable                            :   IN    std_logic;
        source_data                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        source_channel                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        LED                               :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END dataplane_ip_src_Avalon_Data_Processing;


ARCHITECTURE rtl OF dataplane_ip_src_Avalon_Data_Processing IS

  -- Component Declarations
  COMPONENT dataplane_ip_src_Left_Channel_Processing
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Left_Data_In                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Left_Gain                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Max_Reset_Threshold             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable                          :   IN    std_logic;
          Left_Data_Out                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          LED                             :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT dataplane_ip_src_Right_Channel_Processing
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Right_Data_In                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Right_Gain                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Enable                          :   IN    std_logic;
          Right_Data_Out                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_ip_src_Left_Channel_Processing
    USE ENTITY work.dataplane_ip_src_Left_Channel_Processing(rtl);

  FOR ALL : dataplane_ip_src_Right_Channel_Processing
    USE ENTITY work.dataplane_ip_src_Right_Channel_Processing(rtl);

  -- Signals
  SIGNAL sink_channel_unsigned            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Constant_out1_1       : std_logic;
  SIGNAL Left_Channel_Processing_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Left_Channel_Processing_out2     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL Left_Channel_Processing_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Compare_To_Constant1_out1_1      : std_logic;
  SIGNAL Right_Channel_Processing_out1    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Right_Channel_Processing_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL sink_data_signed                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1            : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1_bypass     : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1_last_value : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL sink_channel_bypass              : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL sink_channel_last_value          : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  u_Left_Channel_Processing : dataplane_ip_src_Left_Channel_Processing
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Left_Data_In => sink_data,  -- sfix32_En28
              Left_Gain => left_gain,  -- sfix32_En28
              Max_Reset_Threshold => Max_Reset_Threshold,  -- sfix18
              LED_persistence => LED_persistence,  -- sfix15
              Enable => Compare_To_Constant_out1_1,
              Left_Data_Out => Left_Channel_Processing_out1,  -- sfix32_En28
              LED => Left_Channel_Processing_out2  -- uint8
              );

  u_Right_Channel_Processing : dataplane_ip_src_Right_Channel_Processing
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Right_Data_In => sink_data,  -- sfix32_En28
              Right_Gain => right_gain,  -- sfix32_En28
              Enable => Compare_To_Constant1_out1_1,
              Right_Data_Out => Right_Channel_Processing_out1  -- sfix32_En28
              );

  sink_channel_unsigned <= unsigned(sink_channel);

  
  Compare_To_Constant_out1 <= '1' WHEN sink_channel_unsigned = to_unsigned(16#0#, 2) ELSE
      '0';

  Compare_To_Constant_out1_1 <= Compare_To_Constant_out1 AND Enable;

  Left_Channel_Processing_out1_signed <= signed(Left_Channel_Processing_out1);

  
  Compare_To_Constant1_out1 <= '1' WHEN sink_channel_unsigned = to_unsigned(16#1#, 2) ELSE
      '0';

  Compare_To_Constant1_out1_1 <= Compare_To_Constant1_out1 AND Enable;

  Right_Channel_Processing_out1_signed <= signed(Right_Channel_Processing_out1);

  sink_data_signed <= signed(sink_data);

  
  Multiport_Switch_out1 <= Left_Channel_Processing_out1_signed WHEN sink_channel_unsigned = to_unsigned(16#0#, 2) ELSE
      Right_Channel_Processing_out1_signed WHEN sink_channel_unsigned = to_unsigned(16#1#, 2) ELSE
      sink_data_signed;

  source_data_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Multiport_Switch_out1_last_value <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Multiport_Switch_out1_last_value <= Multiport_Switch_out1_bypass;
      END IF;
    END IF;
  END PROCESS source_data_bypass_process;


  
  Multiport_Switch_out1_bypass <= Multiport_Switch_out1_last_value WHEN Enable = '0' ELSE
      Multiport_Switch_out1;

  source_data <= std_logic_vector(Multiport_Switch_out1_bypass);

  source_channel_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sink_channel_last_value <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sink_channel_last_value <= sink_channel_bypass;
      END IF;
    END IF;
  END PROCESS source_channel_bypass_process;


  
  sink_channel_bypass <= sink_channel_last_value WHEN Enable = '0' ELSE
      sink_channel_unsigned;

  source_channel <= std_logic_vector(sink_channel_bypass);

  LED <= Left_Channel_Processing_out2;

END rtl;
