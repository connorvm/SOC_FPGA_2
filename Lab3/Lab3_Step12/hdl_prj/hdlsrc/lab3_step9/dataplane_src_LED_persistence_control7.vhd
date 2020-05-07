-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_LED_persistence_control7.vhd
-- Created: 2020-05-07 17:28:03
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_LED_persistence_control7
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/LED_Driver/LED_persistence_control7
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_src_LED_persistence_control7 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        LED_trigger                       :   IN    std_logic;
        LED_persistence                   :   IN    std_logic_vector(14 DOWNTO 0);  -- sfix15
        Enable_out5                       :   IN    std_logic;
        LED_control                       :   OUT   std_logic
        );
END dataplane_src_LED_persistence_control7;


ARCHITECTURE rtl OF dataplane_src_LED_persistence_control7 IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT dataplane_src_Chart
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          LED_trigger                     :   IN    std_logic;
          count_reached                   :   IN    std_logic;
          LED_signal                      :   OUT   std_logic;
          counter_reset                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_src_Chart
    USE ENTITY work.dataplane_src_Chart(rtl);

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL LED_persistence_signed           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL enb_gated_1                      : std_logic;
  SIGNAL Chart_out2                       : std_logic;
  SIGNAL Chart_out2_last_value            : std_logic;
  SIGNAL Chart_out2_1                     : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL Relational_Operator_1_cast       : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Chart_out1                       : std_logic;
  SIGNAL Chart_out1_1                     : std_logic;
  SIGNAL Chart_out1_last_value            : std_logic;

BEGIN
  u_Chart : dataplane_src_Chart
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb_gated,
              LED_trigger => LED_trigger,
              count_reached => Relational_Operator_relop1,
              LED_signal => Chart_out1,
              counter_reset => Chart_out2_1
              );

  enb_gated <= Enable_out5 AND enb;

  LED_persistence_signed <= signed(LED_persistence);

  enb_gated_1 <= Enable_out5 AND enb;

  out1_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Chart_out2_last_value <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Chart_out2_last_value <= Chart_out2;
      END IF;
    END IF;
  END PROCESS out1_bypass_process;


  
  Chart_out2 <= Chart_out2_last_value WHEN Enable_out5 = '0' ELSE
      Chart_out2_1;

  Logical_Operator_out1 <= Chart_out2 OR LED_trigger;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 25
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0000#, 15);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated_1 = '1' THEN
        IF Logical_Operator_out1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#0000#, 15);
        ELSIF HDL_Counter_out1 >= to_unsigned(16#0019#, 15) THEN 
          HDL_Counter_out1 <= to_unsigned(16#0000#, 15);
        ELSE 
          HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#0001#, 15);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Relational_Operator_1_cast <= signed(resize(HDL_Counter_out1, 16));
  
  Relational_Operator_relop1 <= '1' WHEN resize(LED_persistence_signed, 16) <= Relational_Operator_1_cast ELSE
      '0';

  out0_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Chart_out1_last_value <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Chart_out1_last_value <= Chart_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Chart_out1_1 <= Chart_out1_last_value WHEN Enable_out5 = '0' ELSE
      Chart_out1;

  LED_control <= Chart_out1_1;

END rtl;

