-- Authors: Connor Van Meter & Alex Salois
-- EELE 468
-- Lab01

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;

entity yo_block is

  generic (W_bits   : positive;
           F_bits   : positive);

  port (clock : in std_logic;
  	reset : in std_logic;
        x     : in  unsigned(W_bits - 1 downto 0);
        yo_n  : out unsigned(W_bits - 1 downto 0));
end entity;

architecture yo_block_arch of yo_block is

   component ROM is
	port(
		address		: IN STD_LOGIC_VECTOR (F_bits DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
   end component;

  signal Z             : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal beta          : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal int_beta      : integer;
  signal alpha         : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal a_temp1       : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal a_temp2       : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal x_beta        : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal x_alpha       : unsigned(W_bits - 1 downto 0) := (others => '0');
  signal x_beta_lookup : unsigned(W_bits - 1 downto 0) := (others => '0');  
  signal address_sig   : std_logic_vector(F_bits downto 0) := (others => '0');
  signal q_sig         : std_logic_vector(W_bits - 1 downto 0) := (others => '0');
  signal temp1	       : unsigned(2 * W_bits - 1 downto 0) := (others => '0');
  signal temp2	       : unsigned(2 * W_bits downto 0) := (others => '0');

  begin
    
  ROM_inst : ROM 
	port map(address	 => address_sig,
		 clock	 => clock,
		 q	 => q_sig);

  process (clock, reset)
  begin
    if(reset = '0') then
	yo_n <= "0";
    elsif(rising_edge(clock)) then
    beta <= W_bits - F_bits - Z - 1;
    int_beta <= to_integer(beta);
        if((int_beta mod 2) = 0) then -- beta is even
        --alpha = -2*beta + 0.5*beta
        --left shift is multiplaction, right shift is division
        a_temp1 <= shift_left(unsigned(beta), 1);
        a_temp2 <= shift_right(unsigned(beta), 1);
        alpha <= a_temp2 + a_temp1;
    
        else --beta is odd
        --alpha = -2*beta + 0.5*beta + 0.5
        a_temp1 <= shift_left(unsigned(beta), 1);
        a_temp2 <= shift_right(unsigned(beta), 1);
        alpha <= a_temp2 - a_temp1 + to_unsigned(integer(0.5), 1);

        end if;

        --find x_alpha by shifting input x by alhpa-bits
        --left shift
        x_alpha <= x sll 1;

        --find x_beta by shifting input x by beta-bits
        --right shift
        x_beta <= x srl 1;

        --Get x_beta^(-3/2) via a lookup table
	--Use the fractional bits of x_beta as the address
	address_sig <= std_logic_vector(x_beta(F_bits downto 0));
        x_beta_lookup <= unsigned(q_sig);

        --Compute yo_n, depending on pos or neg beta--
        if((beta mod 2) = 0) then -- beta is even
        --yo_n = x_alpha*(x_beta^(-3/2))
	temp1 <= x_alpha * x_beta_lookup;
        yo_n <= temp1(W_bits - 1 downto 0);
        
        else --beta is odd
        --yo_n = x_alpha*(x_beta^(-3/2))*(2^(-1/2))
	temp2 <= x_alpha * x_beta_lookup * to_unsigned(integer(0.70710678118), 1);
        yo_n <= temp2(W_bits - 1 downto 0);
        
        end if;

    	
    end if;
  end process;

end architecture;