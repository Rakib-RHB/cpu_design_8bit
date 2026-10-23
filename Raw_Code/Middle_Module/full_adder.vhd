-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is

  port (A, B, CIN: in STD_LOGIC; SUM, COUT: out STD_LOGIC);
end full_adder;

architecture Structural of full_adder is
  signal S1, C1, C2: STD_LOGIC;
begin
  U1: entity work.half_adder port map (A, B, S1, C1);
  U2: entity work.half_adder port map (S1, CIN, SUM, C2);
  U3: entity work.or_gate port map (C1, C2, COUT);

end Structural;
