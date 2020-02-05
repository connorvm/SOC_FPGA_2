-- Authors: Connor Van Meter & Alex Salois
-- EELE 468

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity newton_iteration is

  generic (W_bits   : positive := 8;
           F_bits   : positive := 4);

  port (y_current : in  unsigned(W_bits - 1 downto 0);
	x	  : in  unsigned(W_bits - 1 downto 0);
	output    : out unsigned(W_bits - 1 downto 0));
end entity;

architecture newton_iteration_arch of newton_iteration is

  --signal input     : unsigned(7 downto 0);
  --signal output    : unsigned(7 downto 0);
  signal y_o	   : unsigned(W_bits - 1 downto 0);
  --signal x  	   : unsigned(W_bits - 1 downto 0);
  signal y_next	   : unsigned(4*W_bits - 1 downto 0);
  --signal y_current : unsigned(W_bits - 1 downto 0);
  signal temp	   : unsigned(2*W_bits - 1 downto 0);
  signal top	   : unsigned(4*W_bits - 1 downto 0);

  begin

    --y_(n+1) = (y_n(3 -x(y_n)^2))/2

   process(y_o, x)
    begin

    temp <= y_current * y_current;
    top  <= y_current * (3 - (x * temp));
    y_next <= top / 2;
    output <= y_next(W_bits - 1 downto 0);

   end process;

--    input  <= unsigned(input_vector);
--    output <= input + "00000001";
--    output_vector <= std_logic_vector(output);

end architecture;