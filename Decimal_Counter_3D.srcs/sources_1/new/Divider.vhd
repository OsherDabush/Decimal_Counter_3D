library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity Divider is
    Port(CLK100MHZ : in std_logic;
         RESET     : in std_logic;
         CLK5HZ    : out std_logic;  -- Divisor = ( system frequency / ( 2 * desired clock frequency ) )
         CLK500HZ  : out std_logic); -- Divisor = ( system frequency / ( 2 * desired clock frequency ) )
end Divider;

architecture Behavioral of Divider is
constant DIV_5HZ   : unsigned(31 downto 0) := x"00989680"; -- x"00989680" = 10,000,000
constant DIV_500HZ : unsigned(31 downto 0) := x"000186A0"; -- x"000186A0" = 100,000
signal RESET_RDY   : std_logic := '1';
signal t1, t2      : std_logic := '0';
begin

process(CLK100MHZ)  
variable CNT_5HZ   : unsigned(31 downto 0) := (others=>'0');
variable CNT_500HZ : unsigned(31 downto 0) := (others=>'0');
begin
  if rising_edge(CLK100MHZ) then
    CNT_500HZ := CNT_500HZ + 1;
    CNT_5HZ := CNT_5HZ + 1;
    if(RESET = '1') then
      if(RESET_RDY = '1') then
        RESET_RDY <= '0';
        CNT_500HZ := (others=>'0');
        CNT_5HZ := (others=>'0');
        t1 <= '0';
        t2 <= '0';
      end if;
    else
      RESET_RDY <= '1';
    end if;
  end if;
  if(CNT_500HZ = DIV_500HZ) then
    t1 <= NOT t1;
    CNT_500HZ := (others=>'0');
  end if;
  if(CNT_5HZ = DIV_5HZ) then
    t2 <= NOT t2;
    CNT_5HZ := (others=>'0');
  end if;
end process;

CLK500HZ <= t1;
CLK5HZ   <= t2;

end Behavioral;