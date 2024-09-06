library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity Counter is
    Port(CLK5HZ          : in std_logic;
         RESET           : in std_logic;
         EN              : in std_logic;
         CLR             : in std_logic;
         Top_Count       : in std_logic_vector(3 downto 0);
         Top_Count_Reach : out std_logic;
         Reach9          : out std_logic;
         Q               : buffer integer range 0 to 9);
end Counter;

architecture Behavioral of Counter is
begin

process(CLK5HZ)
begin
  if rising_edge(CLK5HZ) then
    if(RESET = '1' or CLR = '1') then
      Q <= 0;
    elsif(EN = '1') then
      Q <= Q + 1;
      if(Q = 9) then
        Q <= 0;
      end if;
    end if;
  end if;
end process;

process(Q)
begin
  if(Q = 9) then
    Reach9 <= '1';
  else
    Reach9 <= '0';
  end if;
  if(Q = to_integer(unsigned(Top_Count))) then
    Top_Count_Reach <= '1';
  else
    Top_Count_Reach <= '0';
  end if;
end process;
end Behavioral;