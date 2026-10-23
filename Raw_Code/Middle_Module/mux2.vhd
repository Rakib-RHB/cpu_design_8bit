-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is

  port (A, B, S: in STD_LOGIC; Y: out STD_LOGIC);
end mux2;

architecture Structural of mux2 is
  signal NS, T0, T1: STD_LOGIC;
begin
  U1: entity work.not_gate port map (S, NS);
  U2: entity work.and_gate port map (A, NS, T0);
  U3: entity work.and_gate port map (B, S, T1);
  U4: entity work.or_gate port map (T0, T1, Y);

end Structural;
