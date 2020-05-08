-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_LED_Driver.vhd
-- Created: 2020-05-07 19:55:04
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_LED_Driver
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/LED_Driver
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_src_LED_Driver IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Normalized_Signal                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        LED_persistence                   :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
        Enable_out5                       :   IN    std_logic;
        LED_Signals                       :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END dataplane_src_LED_Driver;


ARCHITECTURE rtl OF dataplane_src_LED_Driver IS

  -- Component Declarations
  COMPONENT dataplane_src_LED_persistence_control
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control2
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control3
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control4
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control5
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control6
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT dataplane_src_LED_persistence_control7
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          LED_persistence                 :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
          Enable_out5                     :   IN    std_logic;
          LED_control                     :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_src_LED_persistence_control
    USE ENTITY work.dataplane_src_LED_persistence_control(rtl);

  FOR ALL : dataplane_src_LED_persistence_control1
    USE ENTITY work.dataplane_src_LED_persistence_control1(rtl);

  FOR ALL : dataplane_src_LED_persistence_control2
    USE ENTITY work.dataplane_src_LED_persistence_control2(rtl);

  FOR ALL : dataplane_src_LED_persistence_control3
    USE ENTITY work.dataplane_src_LED_persistence_control3(rtl);

  FOR ALL : dataplane_src_LED_persistence_control4
    USE ENTITY work.dataplane_src_LED_persistence_control4(rtl);

  FOR ALL : dataplane_src_LED_persistence_control5
    USE ENTITY work.dataplane_src_LED_persistence_control5(rtl);

  FOR ALL : dataplane_src_LED_persistence_control6
    USE ENTITY work.dataplane_src_LED_persistence_control6(rtl);

  FOR ALL : dataplane_src_LED_persistence_control7
    USE ENTITY work.dataplane_src_LED_persistence_control7(rtl);

  -- Signals
  SIGNAL Normalized_Signal_signed         : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Constant_out1                    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL LED_signal                       : std_logic;
  SIGNAL Constant1_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL LED_signal_1                     : std_logic;
  SIGNAL Constant2_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator4_relop1      : std_logic;
  SIGNAL LED_signal_2                     : std_logic;
  SIGNAL Constant3_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator5_relop1      : std_logic;
  SIGNAL LED_signal_3                     : std_logic;
  SIGNAL Constant4_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator6_relop1      : std_logic;
  SIGNAL LED_signal_4                     : std_logic;
  SIGNAL Constant5_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator7_relop1      : std_logic;
  SIGNAL LED_signal_5                     : std_logic;
  SIGNAL Constant6_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator3_relop1      : std_logic;
  SIGNAL LED_signal_6                     : std_logic;
  SIGNAL Constant7_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL LED_signal_7                     : std_logic;
  SIGNAL Bit_Concat_out1                  : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  u_LED_persistence_control : dataplane_src_LED_persistence_control
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal
              );

  u_LED_persistence_control1 : dataplane_src_LED_persistence_control1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator1_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_1
              );

  u_LED_persistence_control2 : dataplane_src_LED_persistence_control2
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator4_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_2
              );

  u_LED_persistence_control3 : dataplane_src_LED_persistence_control3
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator5_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_3
              );

  u_LED_persistence_control4 : dataplane_src_LED_persistence_control4
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator6_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_4
              );

  u_LED_persistence_control5 : dataplane_src_LED_persistence_control5
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator7_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_5
              );

  u_LED_persistence_control6 : dataplane_src_LED_persistence_control6
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator3_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_6
              );

  u_LED_persistence_control7 : dataplane_src_LED_persistence_control7
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              LED_trigger => Relational_Operator2_relop1,
              LED_persistence => LED_persistence,  -- sfix15
              Enable_out5 => Enable_out5,
              LED_control => LED_signal_7
              );

  Normalized_Signal_signed <= signed(Normalized_Signal);

  Constant_out1 <= to_signed(234881024, 32);

  
  Relational_Operator_relop1 <= '1' WHEN Normalized_Signal_signed > Constant_out1 ELSE
      '0';

  Constant1_out1 <= to_signed(201326592, 32);

  
  Relational_Operator1_relop1 <= '1' WHEN Normalized_Signal_signed > Constant1_out1 ELSE
      '0';

  Constant2_out1 <= to_signed(167772160, 32);

  
  Relational_Operator4_relop1 <= '1' WHEN Normalized_Signal_signed > Constant2_out1 ELSE
      '0';

  Constant3_out1 <= to_signed(134217728, 32);

  
  Relational_Operator5_relop1 <= '1' WHEN Normalized_Signal_signed > Constant3_out1 ELSE
      '0';

  Constant4_out1 <= to_signed(100663296, 32);

  
  Relational_Operator6_relop1 <= '1' WHEN Normalized_Signal_signed > Constant4_out1 ELSE
      '0';

  Constant5_out1 <= to_signed(67108864, 32);

  
  Relational_Operator7_relop1 <= '1' WHEN Normalized_Signal_signed > Constant5_out1 ELSE
      '0';

  Constant6_out1 <= to_signed(33554432, 32);

  
  Relational_Operator3_relop1 <= '1' WHEN Normalized_Signal_signed > Constant6_out1 ELSE
      '0';

  Constant7_out1 <= to_signed(0, 32);

  
  Relational_Operator2_relop1 <= '1' WHEN Normalized_Signal_signed > Constant7_out1 ELSE
      '0';

  Bit_Concat_out1 <= unsigned'(LED_signal & LED_signal_1 & LED_signal_2 & LED_signal_3 & LED_signal_4 & LED_signal_5 & LED_signal_6 & LED_signal_7);

  LED_Signals <= std_logic_vector(Bit_Concat_out1);

END rtl;

