-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is

  port (PC: in STD_LOGIC_VECTOR(3 downto 0); INSTR: out STD_LOGIC_VECTOR(11 downto 0));
end program_rom;

architecture Behavioral of program_rom is
  type ROM_TYPE is array(0 to 15) of STD_LOGIC_VECTOR(11 downto 0);
  constant ROM: ROM_TYPE := (
    0 => x"102", 1 => x"301", 2 => x"C07", 3 => x"301",
    4 => x"C07", 5 => x"2AA", 6 => x"2AA", 7 => x"121",
    8 => x"800", 9 => x"201", others => x"000");
begin
  -- Combinational read; guard startup metavalues without numeric conversion.
  process(PC) begin
    INSTR <= x"000";
    for I in 0 to 15 loop
      if PC = STD_LOGIC_VECTOR(to_unsigned(I, 4)) then INSTR <= ROM(I); end if;
    end loop;
  end process;
end Behavioral;
