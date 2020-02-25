-- Authors: Connor Van Meter & Alex Salois
-- EELE 468
-- HW_4

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity newton_iteration is

  generic (W_bits   : positive := 8;
           F_bits   : positive := 4);

  port (clock     : in std_logic;
  	reset     : in std_logic;
	  y_current : in  unsigned(W_bits - 1 downto 0);
	  x	  : in  unsigned(W_bits - 1 downto 0);
	  output_n    : out unsigned(W_bits - 1 downto 0));
end entity;

architecture newton_iteration_arch of newton_iteration is

  signal y_o	   : unsigned(W_bits - 1 downto 0);
  signal y_next	 : unsigned(4*W_bits - 1 downto 0);
  signal temp	   : unsigned(2*W_bits - 1 downto 0);
  signal top	   : unsigned(4*W_bits - 1 downto 0);

  begin

    --y_(n+1) = (y_n(3 -x(y_n)^2))/2

  process (clock, reset)
   begin
    if(reset = '0') then
	output_n <= "0";
    elsif(rising_edge(clock)) then

     --output <= ((y_current(3 - x*(y_current * y_current)))/2)(W_bits - 1 downto 0);
     temp <= y_current * y_current;
     --top  <= y_current * (3 - (x * temp));
     --y_next <= top / 2;
     --output <= y_next(W_bits - 1 downto 0);

    end if;
  end process;

  process (clock, reset)
   begin
    if(reset = '0') then
	output_n <= "0";
    elsif(rising_edge(clock)) then

     --output <= ((y_current(3 - x*(y_current * y_current)))/2)(W_bits - 1 downto 0);
     --temp <= y_current * y_current;
     top  <= y_current * (3 - (x * temp));
     --y_next <= top / 2;
     --output <= y_next(W_bits - 1 downto 0);

    end if;
  end process;

  process (clock, reset)
   begin
    if(reset = '0') then
	output_n <= "0";
    elsif(rising_edge(clock)) then

     --output <= ((y_current(3 - x*(y_current * y_current)))/2)(W_bits - 1 downto 0);
     --temp <= y_current * y_current;
     --top  <= y_current * (3 - (x * temp));
     y_next <= top / 2;
     --output <= y_next(W_bits - 1 downto 0);

    end if;
  end process;

  process (clock, reset)
   begin
    if(reset = '0') then
	output_n <= "0";
    elsif(rising_edge(clock)) then

     --output <= ((y_current(3 - x*(y_current * y_current)))/2)(W_bits - 1 downto 0);
     --temp <= y_current * y_current;
     --top  <= y_current * (3 - (x * temp));
     --y_next <= top / 2;
     output_n <= y_next(W_bits - 1 downto 0);

    end if;
  end process;


end architecture;