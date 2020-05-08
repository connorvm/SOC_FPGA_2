-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lab3_step9\dataplane_src_Chart.vhd
-- Created: 2020-05-07 19:55:04
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dataplane_src_Chart
-- Source Path: lab3_step9/dataplane/Avalon Data Processing/Left Channel Processing/Signal Energy Monitor/LED_Driver/LED_persistence_control/Chart
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.dataplane_src_dataplane_pkg.ALL;

ENTITY dataplane_src_Chart IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        LED_trigger                       :   IN    std_logic;
        count_reached                     :   IN    std_logic;
        LED_signal                        :   OUT   std_logic;
        counter_reset                     :   OUT   std_logic
        );
END dataplane_src_Chart;


ARCHITECTURE rtl OF dataplane_src_Chart IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL is_Chart                         : T_state_type_is_Chart;  -- uint8
  SIGNAL is_Chart_next                    : T_state_type_is_Chart;  -- enum type state_type_is_Chart (2 enums)

BEGIN
  Chart_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      is_Chart <= IN_LED_off;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        is_Chart <= is_Chart_next;
      END IF;
    END IF;
  END PROCESS Chart_process;

  Chart_output : PROCESS (LED_trigger, count_reached, is_Chart)
  BEGIN
    is_Chart_next <= is_Chart;
    CASE is_Chart IS
      WHEN IN_LED_off =>
        LED_signal <= '0';
        counter_reset <= '1';
        IF LED_trigger = '1' THEN 
          is_Chart_next <= IN_LED_on;
          LED_signal <= '1';
          counter_reset <= '0';
        END IF;
      WHEN OTHERS => 
        --case IN_LED_on:
        LED_signal <= '1';
        counter_reset <= '0';
        IF count_reached = '1' THEN 
          is_Chart_next <= IN_LED_off;
          LED_signal <= '0';
          counter_reset <= '1';
        END IF;
    END CASE;
  END PROCESS Chart_output;


END rtl;

