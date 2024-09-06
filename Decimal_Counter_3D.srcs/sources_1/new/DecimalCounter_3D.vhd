library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity DecimalCounter_3D is
    Port(CLK100MHZ : in std_logic;
         RESET     : in std_logic;
         TOP_COUNT : in std_logic_vector(3 downto 0);
         SEVEN_SEG : out std_logic_vector(6 downto 0);
         ANODES    : out std_logic_vector(2 downto 0);
         LED       : out std_logic;
         AN_3      : out std_logic);  
end DecimalCounter_3D;

architecture Behavioral of DecimalCounter_3D is

component Divider is
    Port(CLK100MHZ : in std_logic;
         RESET     : in std_logic;
         CLK5HZ    : out std_logic;  -- Divisor = (system frequency / ( 2 * desired clock frequency))
         CLK500HZ  : out std_logic); -- Divisor = (system frequency / ( 2 * desired clock frequency))
end component;

component Counter is
    Port(CLK5HZ          : in std_logic;
         RESET           : in std_logic;
         EN              : in std_logic;
         CLR             : in std_logic;
         Top_Count       : in std_logic_vector(3 downto 0);
         Top_Count_Reach : out std_logic;
         Reach9          : out std_logic;
         Q               : buffer integer range 0 to 9);
end component;

component Shift_REG is
    Port(CLK500HZ : in std_logic;
         RESET    : in std_logic;
         ANODE    : out std_logic_vector(2 downto 0));
end component;

component Anode_Encoder is
    Port(ANODE : in std_logic_vector(2 downto 0);
         SEL   : out std_logic_vector(1 downto 0));
end component;

component MUX_4X1 is
    Port(X0, X1, X2 : in integer range 0 to 9;
         SEL        : in std_logic_vector(1 downto 0);
         Y          : out integer range 0 to 9);
end component;

component COM_Logic is
    Port(T0, T1, T2 : in std_logic;
         R0, R1     : in std_logic;
         EN1, EN2   : out std_logic;
         CLR_ALL    : out std_logic);
end component;

component SEG_Decoder is
    Port(X : in integer range 0 to 9;
         Y : out std_logic_vector(6 downto 0));
end component;

signal CLK5, CLK500 : std_logic;
signal AN           : std_logic_vector(2 downto 0);
signal S            : std_logic_vector(1 downto 0);
signal T0, T1, T2   : std_logic;
signal EN1, EN2     : std_logic;
signal R0, R1       : std_logic;
signal CLR_ALL      : std_logic;
signal D0, D1, D2   : integer range 0 to 9;
signal I            : integer range 0 to 9;
begin

AN_3 <= '1';
ANODES <= AN;
LED <= (T0 AND T1 AND T2);

DIV: Divider port map(CLK100MHZ=>CLK100MHZ,
                      RESET=>RESET,
                      CLK5HZ=>CLK5,
                      CLK500HZ=>CLK500);

CNT0: Counter port map(CLK5HZ=>CLK5,
                       RESET=>RESET,
                       EN=>'1',
                       CLR=>CLR_ALL,
                       Top_Count=>TOP_COUNT,
                       Top_Count_Reach=>T0,
                       Reach9=>R0,
                       Q=>D0);
             
CNT1: Counter port map(CLK5HZ=>CLK5,
                       RESET=>RESET,
                       EN=>EN1,
                       CLR=>CLR_ALL,
                       Top_Count=>TOP_COUNT,
                       Top_Count_Reach=>T1,
                       Reach9=>R1,
                       Q=>D1);

CNT2: Counter port map(CLK5HZ=>CLK5,
                       RESET=>RESET,
                       EN=>EN2,
                       CLR=>CLR_ALL,
                       Top_Count=>TOP_COUNT,
                       Top_Count_Reach=>T2,
                       Reach9=>open,
                       Q=>D2);

CLC: COM_Logic port map(T0=>T0,
                        T1=>T1,
                        T2=>T2,
                        R0=>R0,
                        R1=>R1,
                        EN1=>EN1,
                        EN2=>EN2,
                        CLR_ALL=>CLR_ALL);

S_R: Shift_REG port map(CLK500HZ=>CLK500,
                         RESET=>RESET,
                         ANODE=>AN);
                         
AN_ENCODER: Anode_Encoder port map(ANODE=>AN,
                                   SEL=>S);                    

MUX: MUX_4X1 port map(X0=>D0,
                      X1=>D1,
                      X2=>D2,
                      SEL=>S,
                      Y=>I);

S_D: SEG_Decoder port map(X=>I,
                          Y=>SEVEN_SEG);

end Behavioral;