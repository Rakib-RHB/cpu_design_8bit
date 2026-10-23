-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is

  port (ACC, OPERAND: in STD_LOGIC_VECTOR(7 downto 0); SEL: in STD_LOGIC_VECTOR(1 downto 0); RESULT: out STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Structural of alu is
  signal AR, SHIFTED: STD_LOGIC_VECTOR(7 downto 0);
  signal SUB_MODE, NS0: STD_LOGIC;
begin
  -- 00 LDI; 01 ADD; 10 SUB; 11 SHL. SHL discards bit 7.
  IS_SUB: entity work.and_gate port map (SEL(1), NS0, SUB_MODE);
  INV: entity work.not_gate port map (SEL(0), NS0);
  ARITH: entity work.add_sub_8bit port map (ACC, OPERAND, SUB_MODE, AR);
  SHIFTED <= ACC(6 downto 0) & '0';
  G: for I in 0 to 7 generate
  SELECT_RESULT: entity work.mux4 port map (OPERAND(I), AR(I), AR(I), SHIFTED(I), SEL, RESULT(I));
  end generate;
end Structural;
