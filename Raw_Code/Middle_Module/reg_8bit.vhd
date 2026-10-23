-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8bit is

  port (CLK, RESET, LOAD: in STD_LOGIC; D: in STD_LOGIC_VECTOR(7 downto 0); Q: out STD_LOGIC_VECTOR(7 downto 0));
end reg_8bit;

architecture Structural of reg_8bit is

begin
  G: for I in 0 to 7 generate
  U: entity work.reg_1bit port map (CLK, RESET, LOAD, D(I), Q(I));
  end generate;
end Structural;
