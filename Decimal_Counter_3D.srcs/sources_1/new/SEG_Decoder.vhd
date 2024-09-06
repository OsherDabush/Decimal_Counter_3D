library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity SEG_Decoder is
    Port(X : in integer range 0 to 9;
         Y : out std_logic_vector(6 downto 0));
end SEG_Decoder;

architecture Behavioral of SEG_Decoder is
begin

process(X)
begin
  case X is 
    when 0 => Y <= "0000001";
    when 1 => Y <= "1001111";
    when 2 => Y <= "0010010";
    when 3 => Y <= "0000110";
    when 4 => Y <= "1001100";
    when 5 => Y <= "0100100";
    when 6 => Y <= "0100000";
    when 7 => Y <= "0001111";
    when 8 => Y <= "0000000";
    when 9 => Y <= "0000100";
  end case;
end process;    
end Behavioral;