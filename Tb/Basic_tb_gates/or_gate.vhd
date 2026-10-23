-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is

  port (A, B: in STD_LOGIC; Y: out STD_LOGIC);
end or_gate;

architecture Structural of or_gate is
  signal N: STD_LOGIC;
begin
  U1: entity work.nor_gate port map (A, B, N);
  U2: entity work.not_gate port map (N, Y);

end Structural;
