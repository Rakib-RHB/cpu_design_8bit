-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu is

  port (CLK, RESET: in STD_LOGIC; Q: out STD_LOGIC_VECTOR(7 downto 0); Z: out STD_LOGIC; PC: out STD_LOGIC_VECTOR(3 downto 0));
end cpu;

architecture Structural of cpu is
  signal PC_INT: STD_LOGIC_VECTOR(3 downto 0);
  signal INSTR: STD_LOGIC_VECTOR(11 downto 0);
  signal ACC, RESULT: STD_LOGIC_VECTOR(7 downto 0);
  signal SEL: STD_LOGIC_VECTOR(1 downto 0);
  signal Z_INT, ZERO_RESULT, ACC_LOAD, Z_LOAD, JUMP: STD_LOGIC;
begin
  PC_BLOCK: entity work.program_counter port map (CLK, RESET, JUMP, INSTR(3 downto 0), PC_INT);
  ROM_BLOCK: entity work.program_rom port map (PC_INT, INSTR);
  CONTROL_BLOCK: entity work.control_unit port map (INSTR(11 downto 8), Z_INT, SEL, ACC_LOAD, Z_LOAD, JUMP);
  ALU_BLOCK: entity work.alu port map (ACC, INSTR(7 downto 0), SEL, RESULT);
  ZERO_BLOCK: entity work.zero_detect_8bit port map (RESULT, ZERO_RESULT);
  ACC_BLOCK: entity work.acc_register port map (CLK, RESET, ACC_LOAD, RESULT, ACC);
  Z_BLOCK: entity work.z_register port map (CLK, RESET, Z_LOAD, ZERO_RESULT, Z_INT);
  Q <= ACC; Z <= Z_INT; PC <= PC_INT;
end Structural;
