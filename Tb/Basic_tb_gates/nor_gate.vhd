-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is

  port (A, B: in STD_LOGIC; Y: out STD_LOGIC);
end nor_gate;

architecture Behavioral of nor_gate is

begin
  Y <= A nor B;
end Behavioral;
