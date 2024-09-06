library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity MUX_4X1 is
    Port(X0, X1, X2 : in integer range 0 to 9;
         SEL : in std_logic_vector(1 downto 0);
         Y : out integer range 0 to 9);
end MUX_4X1;

architecture Behavioral of MUX_4X1 is
begin

process(X0, X1, X2, SEL)
begin
  case SEL is
    when "00" => Y <= X0;
    when "01" => Y <= X1;
    when "10" => Y <= X2;
    when others => Y <= 0;
  end case;
end process;
end Behavioral;