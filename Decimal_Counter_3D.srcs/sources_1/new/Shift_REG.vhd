library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity Shift_REG is
    Port(CLK500HZ : in std_logic;
         RESET    : in std_logic;
         ANODE    : out std_logic_vector(2 downto 0));
end Shift_REG;

architecture Behavioral of Shift_REG is
signal RESET_RDY_P : std_logic;
begin

process(CLK500HZ)
variable T : unsigned(2 downto 0) := "011";
variable RESET_RDY : std_logic := '1';
begin
  if rising_edge(CLK500HZ) then
    if(RESET = '1') then
      T := "110";
    else
      T := (T(1 downto 0) & T(2));
    end if;
    ANODE <= std_logic_vector(T);
    RESET_RDY := NOT RESET;
  end if;
  RESET_RDY_P <= RESET_RDY;
end process;
end Behavioral;
