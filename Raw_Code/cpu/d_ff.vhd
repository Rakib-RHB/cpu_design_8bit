-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff is

  port (CLK, D: in STD_LOGIC; Q: out STD_LOGIC);
end d_ff;

architecture Behavioral of d_ff is

begin
  -- Edge-triggered storage primitive; combinational logic is NOR-derived.
  process(CLK) begin
    if rising_edge(CLK) then Q <= D; end if;
  end process;
end Behavioral;
