-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is

  port (A: in STD_LOGIC; Y: out STD_LOGIC);
end not_gate;

architecture Structural of not_gate is

begin
  U1: entity work.nor_gate port map (A, A, Y);

end Structural;
