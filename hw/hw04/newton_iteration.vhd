-- Authors: Connor Van Meter & Alex Salois
-- EELE 468

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity newton_iteration is

  generic (W_bits   : positive := 12;
           F_bits   : positive := 4);

  port (input_vector  : in  std_logic_vector (7 downto 0);
	output_vector : out std_logic_vector (7 downto 0));
end entity;

architecture newton_iteration_arch of newton_iteration is

  signal input : unsigned(7 downto 0);
  signal output : unsigned(7 downto 0);

  begin

    input  <= unsigned(input_vector);
    output <= input + "00000001";
    output_vector <= std_logic_vector(output);

end architecture;