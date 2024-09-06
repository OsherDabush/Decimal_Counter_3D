library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity Anode_Encoder is
    Port(ANODE : in std_logic_vector(2 downto 0);
         SEL   : out std_logic_vector(1 downto 0));
end Anode_Encoder;

architecture Behavioral of Anode_Encoder is
begin

process(ANODE)
begin
  case ANODE is 
    when "110" => SEL <= "00";
    when "101" => SEL <= "01";
    when "011" => SEL <= "10";
    when others => SEL <= "XX";
  end case;
end process;
end Behavioral;