-- Authors: Connor Van Meter & Alex Salois
-- EELE 468
-- HW_4

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity newton_iteration is

  generic (W_bits   : positive; 
           F_bits   : positive);

  port (clock         : in std_logic;
  	reset         : in std_logic;
	y_in          : in  unsigned(W_bits - 1 downto 0);	 
 	x	      : in  unsigned(W_bits - 1 downto 0);
	out_n         : out unsigned(W_bits - 1 downto 0));
end entity;

architecture newton_iteration_arch of newton_iteration is

  signal y_relay_0 : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal x_relay_0 : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal out_0   : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal out_1   : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal out_2   : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal out_3   : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal Y_next  : unsigned(4*W_bits - 1 downto 0) := (others => '0');
  signal square  : unsigned(2*W_bits - 1 downto 0) := (others => '0');
  signal top	 : unsigned(4*W_bits - 1 downto 0) := (others => '0');

  begin
    --y_(n+1) = (y_n(3 -x(y_n)^2))/2
  process (clock, reset)
   begin
    if(reset = '0') then
	out_n <= "0";
    elsif(rising_edge(clock)) then
    	square 	<= y_in * y_in; -- square y_current
    	top  	<= y_relay_0 * (3 - (x_relay_0 * square));
     	y_next 	<= shift_right(top, 1); -- divide by 2
	out_0 	<= y_next(W_bits  -1 downto 0);
	out_1 	<= y_next(2*W_bits - F_bits -1 downto W_bits - F_bits);
	out_2 	<= y_next(3*W_bits - F_bits -1 downto 2*W_bits - F_bits);
	out_3 	<= y_next(4*W_bits - F_bits -1 downto 3*W_bits - F_bits);
    	out_n 	<= y_next(2*W_bits + F_bits -1 downto 1*W_bits + F_bits);

    end if;
  end process;

  process (clock, reset)
   begin 	
    if(reset = '0') then
	--out_n <= "0";
    elsif(rising_edge(clock)) then
    	y_relay_0 <= y_in;
	x_relay_0 <= x;

    end if;
  end process;

end architecture;