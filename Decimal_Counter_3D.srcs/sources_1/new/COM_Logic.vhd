library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity COM_Logic is
    Port(T0, T1, T2 : in std_logic;
         R0, R1     : in std_logic;
         EN1, EN2   : out std_logic;
         CLR_ALL    : out std_logic);
end COM_Logic;

architecture Behavioral of COM_Logic is
begin

process(T0, T1, T2, R0, R1)
begin
  if(R0 = '1') then
    EN1 <= '1';
  else
    EN1 <= '0';
  end if;
  if(R0 = '1' and R1 = '1') then
    EN2 <= '1';
  else
    EN2 <= '0';
  end if;
  CLR_ALL <= (T0 AND T1 AND T2);
end process;
end Behavioral;