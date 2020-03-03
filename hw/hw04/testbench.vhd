-- Authors: Connor Van Meter & Alex Salois
-- EELE 468

library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use IEEE.std_logic_textio.all;

entity testbench is
end entity;

architecture testbench_arch of testbench is

constant t_clk_per : time := 10 ns;
constant W         : integer := 20;
constant F         : integer := 16;
constant c_WIDTH   : natural := 4;

component newton_iteration is
  generic (W_bits   : positive;
           F_bits   : positive);

  port (clock 	  : in std_logic;
	reset	  : in std_logic;
	y_in      : in  unsigned(W_bits - 1 downto 0);
	x	  : in  unsigned(W_bits - 1 downto 0);
	out_n     : out unsigned(W_bits - 1 downto 0));
end component;

signal clock_TB      : std_logic := '1';
signal reset_TB      : std_logic := '1';
signal y_current_sig : unsigned(W - 1 downto 0) := (F + 1 => '1', others => '0');
signal x_sig	     : unsigned(W - 1 downto 0) := (F + 1 => '1', others => '0');
signal output_sig    : unsigned(W - 1 downto 0) := (others => '0');

-----------------------------------------------------------------------------
  -- Testbench Internal Signals
-----------------------------------------------------------------------------
file file_VECTORS : text;
file file_RESULTS : text;


begin

dut : newton_iteration
   generic map(W_bits => W,
               F_bits => F)
   port map(
      clock     => clock_TB,
      reset    	=> reset_TB,
      y_in      => y_current_sig,
      x		=> x_sig,
      out_n    	=> output_sig);
CLOCK_STIM : process
 begin
   clock_TB <= not clock_TB; wait for 0.5*t_clk_per; 
 end process;
-----------------------------------------------      
RESET_STIM : process
 begin
--   reset_TB <= '0'; wait for 1.5*t_clk_per; 
   reset_TB <= '1'; wait; 
end process;


------------------------------------------------------------------------------------------------------------
---- Process to read in .txt file. Taken from https://www.nandland.com/vhdl/examples/example-file-io.html --
------------------------------------------------------------------------------------------------------------
process
      variable line_input     : line;
      variable output_line    : line;
      variable v_ADD_TERM     : std_logic_vector(W - 1 downto 0);
      variable space          : character;

    begin

      file_open(file_VECTORS, "input_vectors_20.txt",  read_mode);
      file_open(file_RESULTS, "outputs_20_16.txt", write_mode);

      while not endfile(file_VECTORS) loop
        readline(file_VECTORS, line_input);
        read(line_input, v_ADD_TERM);

        x_sig <= unsigned(v_ADD_TERM);

        wait for t_clk_per;

        write(output_line, std_logic_vector(output_sig));
        writeline(file_RESULTS, output_line);
      end loop;

      file_close(file_VECTORS);
      file_close(file_RESULTS);

      wait;
    end process;


end architecture;