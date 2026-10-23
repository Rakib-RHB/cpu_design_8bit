library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity cpu_edge_tb is end cpu_edge_tb;
architecture Behavioral of cpu_edge_tb is
  signal CLK, RESET: STD_LOGIC := '0';
  signal Q: STD_LOGIC_VECTOR(7 downto 0);
  signal Z: STD_LOGIC;
  signal PC: STD_LOGIC_VECTOR(3 downto 0);

begin
  UUT: entity work.cpu port map (CLK,RESET,Q,Z,PC);
  process
    procedure TICK is begin
      CLK<='0'; wait for 5 ns; CLK<='1'; wait for 5 ns;
      CLK<='0'; wait for 5 ns;
    end procedure;
  begin
    RESET<='1'; TICK; RESET<='0';
    for I in 1 to 8 loop TICK; end loop;
    assert Q=x"43" and Z='0' and PC=x"A" severity failure;
    -- Reset must not take effect without a rising edge.
    RESET<='1'; wait for 2 ns;
    assert Q=x"43" and Z='0' and PC=x"A" report "Asynchronous reset detected" severity failure;
    RESET<='0'; wait for 2 ns;
    -- Unused ROM addresses are NOP, including PC rollover 15 -> 0.
    for I in 11 to 16 loop
      TICK;
      assert Q=x"43" and Z='0' and PC=STD_LOGIC_VECTOR(to_unsigned(I mod 16,4))
        report "NOP/PC rollover mismatch" severity failure;
    end loop;
    TICK;
    assert Q=x"02" and PC=x"1" severity failure;
    RESET<='1'; TICK;
    assert Q=x"00" and Z='1' and PC=x"0" report "Reset priority mismatch" severity failure;
    report "PASS: synchronous reset, reset priority, NOP hold and PC rollover" severity note; wait;
  end process;
end Behavioral;
