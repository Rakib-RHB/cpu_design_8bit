-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is

  port (A, B: in STD_LOGIC; Y: out STD_LOGIC);
end xor_gate;

architecture Structural of xor_gate is
  signal N1, N2, N3, NX: STD_LOGIC;
begin
  U1: entity work.nor_gate port map (A, B, N1);
  U2: entity work.nor_gate port map (A, N1, N2);
  U3: entity work.nor_gate port map (B, N1, N3);
  U4: entity work.nor_gate port map (N2, N3, NX);
  U5: entity work.not_gate port map (NX, Y);

end Structural;
