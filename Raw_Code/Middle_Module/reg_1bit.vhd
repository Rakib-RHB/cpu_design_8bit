-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_1bit is
  generic (RESET_VALUE: STD_LOGIC := '0');
  port (CLK, RESET, LOAD, D: in STD_LOGIC; Q: out STD_LOGIC);
end reg_1bit;

architecture Structural of reg_1bit is
  signal QI, ENABLED, NEXT_D: STD_LOGIC;
begin
  ENABLE_MUX: entity work.mux2 port map (QI, D, LOAD, ENABLED);
  RESET_MUX: entity work.mux2 port map (ENABLED, RESET_VALUE, RESET, NEXT_D);
  FF: entity work.d_ff port map (CLK, NEXT_D, QI);
  Q <= QI;
end Structural;
