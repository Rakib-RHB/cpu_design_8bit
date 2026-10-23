-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub_8bit is

  port (A, B: in STD_LOGIC_VECTOR(7 downto 0); SUB: in STD_LOGIC; Y: out STD_LOGIC_VECTOR(7 downto 0));
end add_sub_8bit;

architecture Structural of add_sub_8bit is
  signal BX: STD_LOGIC_VECTOR(7 downto 0);
begin
  -- Two's complement: A + (B XOR SUB) + SUB. Carry discarded.
  G: for I in 0 to 7 generate
  U: entity work.xor_gate port map (B(I), SUB, BX(I));
  end generate;
  ADD: entity work.adder_8bit port map (A, BX, SUB, Y, open);

end Structural;
