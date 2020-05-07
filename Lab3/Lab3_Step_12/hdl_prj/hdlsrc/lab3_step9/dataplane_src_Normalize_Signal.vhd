-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_Normalize_Signal.vhd
-- Created: 2020-05-07 10:47:49
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_Normalize_Signal
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/Normalize_Signal
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_src_Normalize_Signal IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Signal_Sink                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Max_Reset_Threshold               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18
        Enable_out5                       :   IN    std_logic;
        Normalized_Signal_Energy          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END dataplane_src_Normalize_Signal;


ARCHITECTURE rtl OF dataplane_src_Normalize_Signal IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT dataplane_src_MinMax
    PORT( in0                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          in1                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          out0                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT dataplane_src_Min
    PORT( in0                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          in1                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          out0                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : dataplane_src_MinMax
    USE ENTITY work.dataplane_src_MinMax(rtl);

  FOR ALL : dataplane_src_Min
    USE ENTITY work.dataplane_src_Min(rtl);

  -- Signals
  SIGNAL Constant1_out1                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Max_Reset_Threshold_signed       : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(17 DOWNTO 0);  -- ufix18
  SIGNAL Relational_Operator_1_cast       : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL enb_gated_1                      : std_logic;
  SIGNAL Signal_Sink_signed               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product1_mul_temp                : signed(63 DOWNTO 0);  -- sfix64_En56
  SIGNAL Product1_out1                    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Constant_out1                    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL enb_gated_2                      : std_logic;
  SIGNAL Delay_out1                       : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL MinMax_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MinMax_out1_signed               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL enb_gated_3                      : std_logic;
  SIGNAL Enabled_Delay_delOut             : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Enabled_Delay_ectrl              : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Enabled_Delay_out1               : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Enabled_Delay_last_value         : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Compare_To_Zero1_out1            : std_logic;
  SIGNAL Switch1_out1                     : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Math_Function_out1               : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Product_mul_temp                 : signed(63 DOWNTO 0);  -- sfix64_En52
  SIGNAL Product_out1                     : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Min_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_MinMax : dataplane_src_MinMax
    PORT MAP( in0 => std_logic_vector(Product1_out1),  -- sfix32_En28
              in1 => std_logic_vector(Delay_out1),  -- sfix32_En28
              out0 => MinMax_out1  -- sfix32_En28
              );

  u_Min : dataplane_src_Min
    PORT MAP( in0 => std_logic_vector(Constant1_out1),  -- sfix32_En28
              in1 => std_logic_vector(Product_out1),  -- sfix32_En28
              out0 => Min_out1  -- sfix32_En28
              );

  Constant1_out1 <= to_signed(268435456, 32);

  Max_Reset_Threshold_signed <= signed(Max_Reset_Threshold);

  enb_gated <= Enable_out5 AND enb;

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00000#, 18);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        IF Relational_Operator_relop1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#00000#, 18);
        ELSE 
          HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#00001#, 18);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Relational_Operator_1_cast <= signed(resize(HDL_Counter_out1, 19));
  
  Relational_Operator_relop1 <= '1' WHEN resize(Max_Reset_Threshold_signed, 19) <= Relational_Operator_1_cast ELSE
      '0';

  enb_gated_1 <= Enable_out5 AND enb;

  Signal_Sink_signed <= signed(Signal_Sink);

  Product1_mul_temp <= Signal_Sink_signed * Signal_Sink_signed;
  Product1_out1 <= Product1_mul_temp(59 DOWNTO 28);

  Constant_out1 <= to_signed(0, 32);

  enb_gated_2 <= Enable_out5 AND enb;

  MinMax_out1_signed <= signed(MinMax_out1);

  
  Switch_out1 <= MinMax_out1_signed WHEN Relational_Operator_relop1 = '0' ELSE
      Constant_out1;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated_2 = '1' THEN
        Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  enb_gated_3 <= Enable_out5 AND enb;

  
  Enabled_Delay_ectrl <= Enabled_Delay_delOut WHEN Relational_Operator_relop1 = '0' ELSE
      Delay_out1;

  Enabled_Delay_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Enabled_Delay_delOut <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated_3 = '1' THEN
        Enabled_Delay_delOut <= Enabled_Delay_ectrl;
      END IF;
    END IF;
  END PROCESS Enabled_Delay_lowered_process;


  Enabled_Delay_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Enabled_Delay_last_value <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated_1 = '1' THEN
        Enabled_Delay_last_value <= Enabled_Delay_out1;
      END IF;
    END IF;
  END PROCESS Enabled_Delay_bypass_process;


  
  Enabled_Delay_out1 <= Enabled_Delay_last_value WHEN Relational_Operator_relop1 = '0' ELSE
      Enabled_Delay_delOut;

  
  Compare_To_Zero1_out1 <= '1' WHEN Enabled_Delay_out1 = to_signed(0, 32) ELSE
      '0';

  
  Switch1_out1 <= Enabled_Delay_out1 WHEN Compare_To_Zero1_out1 = '0' ELSE
      Constant1_out1;

  Math_Function_output : PROCESS (Switch1_out1)
    VARIABLE c : signed(53 DOWNTO 0);
    VARIABLE div_temp : signed(53 DOWNTO 0);
  BEGIN
    IF Switch1_out1 = to_signed(0, 32) THEN 
      c := signed'("011111111111111111111111111111111111111111111111111111");
    ELSE 
      div_temp := signed'("010000000000000000000000000000000000000000000000000000") / Switch1_out1;
      c := div_temp;
    END IF;
    IF (c(53) = '0') AND (c(52 DOWNTO 31) /= "0000000000000000000000") THEN 
      Math_Function_out1 <= X"7FFFFFFF";
    ELSIF (c(53) = '1') AND (c(52 DOWNTO 31) /= "1111111111111111111111") THEN 
      Math_Function_out1 <= X"80000000";
    ELSE 
      Math_Function_out1 <= c(31 DOWNTO 0);
    END IF;
  END PROCESS Math_Function_output;


  Product_mul_temp <= Math_Function_out1 * Product1_out1;
  Product_out1 <= Product_mul_temp(55 DOWNTO 24);

  Normalized_Signal_Energy <= Min_out1;

END rtl;

