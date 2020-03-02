-- Authors: Connor Van Meter & Alex Salois
-- EELE 468
-- HW_4

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity yo_block is

  generic (W_bits   : positive;
           F_bits   : positive);

  port (clock   : in std_logic;
  	    reset   : in std_logic;
	      y_in    : in  unsigned(W_bits - 1 downto 0);
 	      x	      : in  unsigned(W_bits - 1 downto 0);
	      yo_n   : out unsigned(W_bits - 1 downto 0));
end entity;

architecture yo_block_arch of yo_block is

  signal Z         : unsigned(W_bits - 1 downto 0);
  signal beta      : std_logic_vector(W_bits - 1 downto 0);
  signal alpha     : unsigned(W_bits - 1 downto 0);
  signal a_temp1   : unsigned(W_bits - 1 downto 0);
  signal a_temp2   : unsigned(W_bits - 1 downto 0);
  signal x_beta    : unsigned(W_bits - 1 downto 0);
  signal x_alpha   : unsigned(W_bits - 1 downto 0);

  constant three : unsigned(3*W_bits - 1 downto 0) := (3*F_bits + 1 downto 3*F_bits => '1', others => '0');

  begin
    
  process (clock, reset)
  begin
    if(reset = '0') then
	yo_n <= "0";
    elsif(rising_edge(clock)) then
    beta <= W_bits - F_bits - Z - 1;
    
        if((beta mod 2) = 0) then -- beta is even
        --alpha = -2*beta + 0.5*beta
        --left shift is multiplaction, right shift is division
        a_temp1 <= shift_left(unsigned(beta), 1);
        a_temp2 <= shift_right(unsigned(beta), 1);
        alpha <= -a_temp1 + a_temp2;
    
        else --beta is odd
        --alpha = -2*beta + 0.5*beta + 0.5
        a_temp1 <= shift_left(unsigned(beta), 1);
        a_temp2 <= shift_right(unsigned(beta), 1);
        alpha <= a_temp1 + a_temp2 + 

        end if;

    	
    end if;
  end process;

  process (clock, reset)
  begin
    if(reset = '0') then
	--out_n <= "0";
    elsif(rising_edge(clock)) then
      y_relay_0 <= y_in;
	    y_relay_1 <= y_relay_0;
	    y_relay_2 <= y_relay_1;
	    y_relay_3 <= y_relay_2;
	    x_relay_0 <= x;

    end if;
  end process;

end architecture;