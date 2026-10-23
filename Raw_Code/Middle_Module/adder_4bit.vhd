-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bit is

  port (A, B: in STD_LOGIC_VECTOR(3 downto 0); CIN: in STD_LOGIC; SUM: out STD_LOGIC_VECTOR(3 downto 0); COUT: out STD_LOGIC);
end adder_4bit;

architecture Structural of adder_4bit is
  signal C: STD_LOGIC_VECTOR(4 downto 0);
begin
  C(0) <= CIN; COUT <= C(4);
  G: for I in 0 to 3 generate
  U: entity work.full_adder port map (A(I), B(I), C(I), SUM(I), C(I+1));
  end generate;
end Structural;
