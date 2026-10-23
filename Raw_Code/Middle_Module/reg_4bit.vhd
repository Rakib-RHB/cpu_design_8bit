-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_4bit is

  port (CLK, RESET, LOAD: in STD_LOGIC; D: in STD_LOGIC_VECTOR(3 downto 0); Q: out STD_LOGIC_VECTOR(3 downto 0));
end reg_4bit;

architecture Structural of reg_4bit is

begin
  G: for I in 0 to 3 generate
  U: entity work.reg_1bit port map (CLK, RESET, LOAD, D(I), Q(I));
  end generate;
end Structural;
