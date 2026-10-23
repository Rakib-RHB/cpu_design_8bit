-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z_register is

  port (CLK, RESET, LOAD: in STD_LOGIC; D: in STD_LOGIC; Z: out STD_LOGIC);
end z_register;

architecture Structural of z_register is

begin
  REG: entity work.reg_1bit generic map (RESET_VALUE => '1')
    port map (CLK, RESET, LOAD, D, Z);
end Structural;
