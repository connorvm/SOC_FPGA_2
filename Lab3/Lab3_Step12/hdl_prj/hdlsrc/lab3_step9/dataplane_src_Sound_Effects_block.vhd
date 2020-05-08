-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_Sound_Effects_block.vhd
-- Created: 2020-05-07 19:03:26
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_Sound_Effects_block
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Right Channel Processing/Sound Effects
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dataplane_src_Sound_Effects_block IS
  PORT( Data_In                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Gain                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Data_Out                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END dataplane_src_Sound_Effects_block;


ARCHITECTURE rtl OF dataplane_src_Sound_Effects_block IS

  -- Signals
  SIGNAL Data_In_signed                   : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Gain_signed                      : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_out1                     : signed(63 DOWNTO 0);  -- sfix64_En56
  SIGNAL Data_Type_Conversion_out1        : signed(31 DOWNTO 0);  -- sfix32_En28

  ATTRIBUTE multstyle : string;

BEGIN
  Data_In_signed <= signed(Data_In);

  Gain_signed <= signed(Gain);

  Product_out1 <= Data_In_signed * Gain_signed;

  Data_Type_Conversion_out1 <= Product_out1(59 DOWNTO 28);

  Data_Out <= std_logic_vector(Data_Type_Conversion_out1);

END rtl;

