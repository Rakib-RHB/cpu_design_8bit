-- Student ID: 22201096 | Set 6 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is

  port (OPCODE: in STD_LOGIC_VECTOR(3 downto 0); Z: in STD_LOGIC; ALU_SEL: out STD_LOGIC_VECTOR(1 downto 0); ACC_LOAD, Z_LOAD, PC_JUMP: out STD_LOGIC);
end control_unit;

architecture Structural of control_unit is
  signal N: STD_LOGIC_VECTOR(3 downto 0);
  signal T1A, T1B, T2A, T2B, T3A, T3B, T8A, T8B, T12A, T12B, D1, D2, D3, D8, D12, L0, L1, LD: STD_LOGIC;
begin
  -- One-hot equality decoders, built only from the reusable gates.
  GINV: for I in 0 to 3 generate
  U: entity work.not_gate port map (OPCODE(I), N(I));
  end generate;
  D1A: entity work.and_gate port map (N(3), N(2), T1A);
  D1B: entity work.and_gate port map (N(1), OPCODE(0), T1B);
  D1C: entity work.and_gate port map (T1A, T1B, D1);
  D2A: entity work.and_gate port map (N(3), N(2), T2A);
  D2B: entity work.and_gate port map (OPCODE(1), N(0), T2B);
  D2C: entity work.and_gate port map (T2A, T2B, D2);
  D3A: entity work.and_gate port map (N(3), N(2), T3A);
  D3B: entity work.and_gate port map (OPCODE(1), OPCODE(0), T3B);
  D3C: entity work.and_gate port map (T3A, T3B, D3);
  D8A: entity work.and_gate port map (OPCODE(3), N(2), T8A);
  D8B: entity work.and_gate port map (N(1), N(0), T8B);
  D8C: entity work.and_gate port map (T8A, T8B, D8);
  D12A: entity work.and_gate port map (OPCODE(3), OPCODE(2), T12A);
  D12B: entity work.and_gate port map (N(1), N(0), T12B);
  D12C: entity work.and_gate port map (T12A, T12B, D12);
  SEL0: entity work.or_gate port map (D2, D8, ALU_SEL(0));
  SEL1: entity work.or_gate port map (D3, D8, ALU_SEL(1));
  LOAD0: entity work.or_gate port map (D1, D2, L0);
  LOAD1: entity work.or_gate port map (D3, D8, L1);
  LOAD2: entity work.or_gate port map (L0, L1, LD);
  JUMP: entity work.and_gate port map (D12, Z, PC_JUMP);
  ACC_LOAD <= LD; Z_LOAD <= LD;
end Structural;
