-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is

  port (CLK, RESET, JUMP: in STD_LOGIC; TARGET: in STD_LOGIC_VECTOR(3 downto 0); PC: out STD_LOGIC_VECTOR(3 downto 0));
end program_counter;

architecture Structural of program_counter is
  signal CUR, PLUS_ONE, NEXT_PC: STD_LOGIC_VECTOR(3 downto 0);
begin
  INC: entity work.adder_4bit port map (CUR, "0000", '1', PLUS_ONE, open);
  G: for I in 0 to 3 generate
  MUX: entity work.mux2 port map (PLUS_ONE(I), TARGET(I), JUMP, NEXT_PC(I));
  end generate;
  REG: entity work.reg_4bit port map (CLK, RESET, '1', NEXT_PC, CUR);
  PC <= CUR;
end Structural;
