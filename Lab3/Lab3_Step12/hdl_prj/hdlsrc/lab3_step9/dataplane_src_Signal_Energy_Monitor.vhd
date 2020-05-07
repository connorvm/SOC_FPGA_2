-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_Signal_Energy_Monitor.vhd
-- Created: 2020-05-07 17:28:03
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_Signal_Energy_Monitor
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_src_Signal_Energy_Monitor IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Signal_Sink                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Max_Reset_Threshold               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
        LED_persistence                   :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
        Enable_out5                       :   IN    std_logic;
        Normalized_Signal_Energy          :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END dataplane_src_Signal_Energy_Monitor;


ARCHITECTURE rtl OF dataplane_src_Signal_Energy_Monitor IS

  -- Component Declarations
  COMPONENT dataplane_src_Normalize_Signal
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Signal_Sink                     :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Max_Reset_Threshold             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
          Enable_out5                     :   IN    std_logic;
          Normalized_Signal_Energy        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_Driver
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Normalized_Signal               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_Signals                     :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_src_Normalize_Signal
    USE ENTITY work.dataplane_src_Normalize_Signal(rtl);

  FOR ALL : dataplane_src_LED_Driver
    USE ENTITY work.dataplane_src_LED_Driver(rtl);

  -- Signals
  SIGNAL Normalize_Signal_out1            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL y                                : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  u_Normalize_Signal : dataplane_src_Normalize_Signal
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Signal_Sink => Signal_Sink,  -- sfix32_En28
              Max_Reset_Threshold => Max_Reset_Threshold,  -- sfix18
              Enable_out5 => Enable_out5,
              Normalized_Signal_Energy => Normalize_Signal_out1  -- sfix32_En28
              );

  u_LED_Driver : dataplane_src_LED_Driver
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Normalized_Signal => Normalize_Signal_out1,  -- sfix32_En28
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_Signals => y  -- uint8
              );

  Normalized_Signal_Energy <= y;

END rtl;

