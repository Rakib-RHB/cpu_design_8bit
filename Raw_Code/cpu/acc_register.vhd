-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_register is

  port (CLK, RESET, LOAD: in STD_LOGIC; D: in STD_LOGIC_VECTOR(7 downto 0); Q: out STD_LOGIC_VECTOR(7 downto 0));
end acc_register;

architecture Structural of acc_register is

begin
  REG: entity work.reg_8bit port map (CLK, RESET, LOAD, D, Q);

end Structural;
