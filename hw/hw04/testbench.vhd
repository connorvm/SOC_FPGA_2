-- Authors: Connor Van Meter & Alex Salois
-- EELE 468

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity testbench is
  PORT ( count : BUFFER bit_vector(8 downto 1));
end; 

architecture testbench_arch of testbench is
component newton_iteration is
  generic (W_bits   : positive;
           F_bits   : positive);
  port (y_current : in  unsigned(W_bits - 1 downto 0);
	x	  : in  unsigned(W_bits - 1 downto 0);
	output    : out unsigned(W_bits - 1 downto 0));
end component;

signal y_current_sig : unsigned(7 downto 0) := "00000001"; -- y_current = 1
signal x_sig	     : unsigned(7 downto 0) := "00000010"; -- x = 2
signal output_sig    : unsigned(7 downto 0) := "00000000";

-----------------------------------------------------------------------------
  -- Testbench Internal Signals
-----------------------------------------------------------------------------
file file_VECTORS : text;
file file_RESULTS : text;

constant c_WIDTH : natural := 4;

  begin

dut : newton_iteration
   generic map(W_bits => 8,
               F_bits => 4)
   port map(
      y_current => y_current_sig,
      x		=> x_sig,
      output    => output_sig);

------------------------------------------------------------------------------------------------------------
---- Process to read in .txt file. Taken from https://www.nandland.com/vhdl/examples/example-file-io.html --
------------------------------------------------------------------------------------------------------------
--
--process
--      variable line_input     : line;
--      variable output_line    : line;
--      variable v_ADD_TERM : std_logic_vector(7 downto 0);
--      variable space     : character;
--       
--    begin
--   
--      file_open(file_VECTORS, "input_vectors.txt",  read_mode);
--      file_open(file_RESULTS, "outputs.txt", write_mode);
--   
--      while not endfile(file_VECTORS) loop
--        readline(file_VECTORS, line_input);
--        read(line_input, v_ADD_TERM);
--        --read(line_input, space);           -- read in the space character
--   
--        -- Pass the variable to a signal to allow the ripple-carry to use it
--        input_sig <= v_ADD_TERM;
--   
--        wait for 60 ns;
--   
--        write(output_line, output_sig);
--        writeline(file_RESULTS, output_line);
--      end loop;
--   
--      file_close(file_VECTORS);
--      file_close(file_RESULTS);
--       
--      wait;
--    end process;


end architecture;