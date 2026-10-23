library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity cpu_tb is end cpu_tb;
architecture Behavioral of cpu_tb is
  signal CLK: STD_LOGIC := '0';
  signal RESET: STD_LOGIC := '1';
  signal Q: STD_LOGIC_VECTOR(7 downto 0);
  signal Z: STD_LOGIC;
  signal PC: STD_LOGIC_VECTOR(3 downto 0);
  signal DONE: boolean := false;
  type INT_ARRAY is array(natural range <>) of integer;
  constant ACC_EXPECT: INT_ARRAY(0 to 8) := (0,2,1,1,0,0,33,66,67);
  constant PC_EXPECT: INT_ARRAY(0 to 8) := (0,1,2,3,4,7,8,9,10);
  constant Z_EXPECT: STD_LOGIC_VECTOR(0 to 8) := "100011000";

begin
  UUT: entity work.cpu port map (CLK, RESET, Q, Z, PC);
  CLOCK_PROCESS: process begin
    while not DONE loop
      CLK <= '0'; wait for 10 ns;
      CLK <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;
  STIMULUS: process begin
    -- Exactly one reset rising edge, followed by eight executed instructions.
    for CYCLE in 0 to 8 loop
      wait until rising_edge(CLK); wait for 1 ns;
      assert Q = STD_LOGIC_VECTOR(to_unsigned(ACC_EXPECT(CYCLE),8))
        report "ACC mismatch at cycle " & integer'image(CYCLE) severity failure;
      assert PC = STD_LOGIC_VECTOR(to_unsigned(PC_EXPECT(CYCLE),4))
        report "PC mismatch at cycle " & integer'image(CYCLE) severity failure;
      assert Z = Z_EXPECT(CYCLE)
        report "Z mismatch at cycle " & integer'image(CYCLE) severity failure;
      report "Cycle " & integer'image(CYCLE) & ": ACC=" & integer'image(to_integer(unsigned(Q))) &
        " Z=" & STD_LOGIC'image(Z) & " next-PC=" & integer'image(to_integer(unsigned(PC))) severity note;
      if CYCLE = 0 then RESET <= '0'; end if;
    end loop;
    report "PASS: Appendix B Set 6; Q=0x43, Z=0, PC=10" severity note;
    DONE <= true; wait;
  end process;
end Behavioral;
