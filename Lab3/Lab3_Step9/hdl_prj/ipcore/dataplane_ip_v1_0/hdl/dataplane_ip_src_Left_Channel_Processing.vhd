-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_ip_src_Left_Channel_Processing.vhd
-- Created: 2020-04-22 15:35:29
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_ip_src_Left_Channel_Processing
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_ip_src_Left_Channel_Processing IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Left_Data_In                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Left_Gain                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Max_Reset_Threshold               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
        LED_persistence                   :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
        Enable                            :   IN    std_logic;
        Left_Data_Out                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        LED                               :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END dataplane_ip_src_Left_Channel_Processing;


ARCHITECTURE rtl OF dataplane_ip_src_Left_Channel_Processing IS

  -- Component Declarations
  COMPONENT dataplane_ip_src_Sound_Effects
    PORT( Data_In                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Gain                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Data_Out                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT dataplane_ip_src_Signal_Energy_Monitor
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Signal_Sink                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Max_Reset_Threshold             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          Normalized_Signal_Energy        :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_ip_src_Sound_Effects
    USE ENTITY work.dataplane_ip_src_Sound_Effects(rtl);

  FOR ALL : dataplane_ip_src_Signal_Energy_Monitor
    USE ENTITY work.dataplane_ip_src_Signal_Energy_Monitor(rtl);

  -- Signals
  SIGNAL Sound_Effects_out1               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sound_Effects_out1_signed        : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Sound_Effects_out1_bypass        : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Sound_Effects_out1_last_value    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL y                                : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  u_Sound_Effects : dataplane_ip_src_Sound_Effects
    PORT MAP( Data_In => Left_Data_In,  -- sfix32_En28
              Gain => Left_Gain,  -- sfix32_En28
              Data_Out => Sound_Effects_out1  -- sfix32_En28
              );

  u_Signal_Energy_Monitor : dataplane_ip_src_Signal_Energy_Monitor
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Signal_Sink => Left_Data_In,  -- sfix32_En28
              Max_Reset_Threshold => Max_Reset_Threshold,  -- sfix18
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable,
              Normalized_Signal_Energy => y  -- uint8
              );

  Sound_Effects_out1_signed <= signed(Sound_Effects_out1);

  Left_Data_Out_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Sound_Effects_out1_last_value <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Sound_Effects_out1_last_value <= Sound_Effects_out1_bypass;
      END IF;
    END IF;
  END PROCESS Left_Data_Out_bypass_process;


  
  Sound_Effects_out1_bypass <= Sound_Effects_out1_last_value WHEN Enable = '0' ELSE
      Sound_Effects_out1_signed;

  Left_Data_Out <= std_logic_vector(Sound_Effects_out1_bypass);

  LED <= y;

END rtl;

