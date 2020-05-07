-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_MinMax.vhd
-- Created: 2020-04-22 15:45:02
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_MinMax
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/Normalize_Signal/MinMax/MinMax
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.dataplane_src_dataplane_pkg.ALL;

ENTITY dataplane_src_MinMax IS
  PORT( in0                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        in1                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        out0                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END dataplane_src_MinMax;


ARCHITECTURE rtl OF dataplane_src_MinMax IS

  -- Signals
  SIGNAL MinMax_muxout                    : vector_of_std_logic_vector32(0 TO 1);  -- ufix32 [2]
  SIGNAL MinMax_muxout_1                  : vector_of_signed32(0 TO 1);  -- sfix32_En28 [2]
  SIGNAL MinMax_stage1_val                : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  MinMax_muxout(0) <= in0;
  MinMax_muxout(1) <= in1;

  outputgen: FOR k IN 0 TO 1 GENERATE
    MinMax_muxout_1(k) <= signed(MinMax_muxout(k));
  END GENERATE;

  ---- Tree max implementation ----
  ---- Tree max stage 1 ----
  
  MinMax_stage1_val <= MinMax_muxout_1(0) WHEN MinMax_muxout_1(0) >= MinMax_muxout_1(1) ELSE
      MinMax_muxout_1(1);

  out0 <= std_logic_vector(MinMax_stage1_val);

END rtl;

