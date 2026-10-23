-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is

  port (A, B: in STD_LOGIC; SUM, COUT: out STD_LOGIC);
end half_adder;

architecture Structural of half_adder is

begin
  U1: entity work.xor_gate port map (A, B, SUM);
  U2: entity work.and_gate port map (A, B, COUT);

end Structural;
