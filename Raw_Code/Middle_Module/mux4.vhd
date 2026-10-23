-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is

  port (A, B, C, D: in STD_LOGIC; S: in STD_LOGIC_VECTOR(1 downto 0); Y: out STD_LOGIC);
end mux4;

architecture Structural of mux4 is
  signal T0, T1: STD_LOGIC;
begin
  U1: entity work.mux2 port map (A, B, S(0), T0);
  U2: entity work.mux2 port map (C, D, S(0), T1);
  U3: entity work.mux2 port map (T0, T1, S(1), Y);

end Structural;
