-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detect_8bit is

  port (A: in STD_LOGIC_VECTOR(7 downto 0); Z: out STD_LOGIC);
end zero_detect_8bit;

architecture Structural of zero_detect_8bit is
  signal T: STD_LOGIC_VECTOR(8 downto 0);
begin
  T(0) <= '0';
  G: for I in 0 to 7 generate
  U: entity work.or_gate port map (T(I), A(I), T(I+1));
  end generate;
  INV: entity work.not_gate port map (T(8), Z);

end Structural;
