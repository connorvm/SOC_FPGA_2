-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_ip_src_Min.vhd
-- Created: 2020-05-07 10:46:00
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_ip_src_Min
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/Normalize_Signal/Min/Min
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.dataplane_ip_src_dataplane_pkg.ALL;

ENTITY dataplane_ip_src_Min IS
  PORT( in0                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        in1                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        out0                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END dataplane_ip_src_Min;


ARCHITECTURE rtl OF dataplane_ip_src_Min IS

  -- Signals
  SIGNAL Min_muxout                       : vector_of_std_logic_vector32(0 TO 1);  -- ufix32 [2]
  SIGNAL Min_muxout_1                     : vector_of_signed32(0 TO 1);  -- sfix32_En28 [2]
  SIGNAL Min_stage1_val                   : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  Min_muxout(0) <= in0;
  Min_muxout(1) <= in1;

  outputgen: FOR k IN 0 TO 1 GENERATE
    Min_muxout_1(k) <= signed(Min_muxout(k));
  END GENERATE;

  ---- Tree min implementation ----
  ---- Tree min stage 1 ----
  
  Min_stage1_val <= Min_muxout_1(0) WHEN Min_muxout_1(0) <= Min_muxout_1(1) ELSE
      Min_muxout_1(1);

  out0 <= std_logic_vector(Min_stage1_val);

END rtl;

