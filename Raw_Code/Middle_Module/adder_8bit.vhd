-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit is

  port (A, B: in STD_LOGIC_VECTOR(7 downto 0); CIN: in STD_LOGIC; SUM: out STD_LOGIC_VECTOR(7 downto 0); COUT: out STD_LOGIC);
end adder_8bit;

architecture Structural of adder_8bit is
  signal C4: STD_LOGIC;
begin
  LO: entity work.adder_4bit port map (A(3 downto 0), B(3 downto 0), CIN, SUM(3 downto 0), C4);
  HI: entity work.adder_4bit port map (A(7 downto 4), B(7 downto 4), C4, SUM(7 downto 4), COUT);

end Structural;
