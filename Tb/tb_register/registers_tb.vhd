library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity registers_tb is end registers_tb;
architecture Behavioral of registers_tb is
  signal CLK,RESET,LOAD,D1,Q0,Q1: STD_LOGIC:='0';
  signal D8,Q8: STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');

begin
  R0: entity work.reg_1bit port map (CLK,RESET,LOAD,D1,Q0);
  R1: entity work.reg_1bit generic map ('1') port map (CLK,RESET,LOAD,D1,Q1);
  R8: entity work.reg_8bit port map (CLK,RESET,LOAD,D8,Q8);
  process
    procedure TICK is begin CLK<='0'; wait for 2 ns; CLK<='1'; wait for 2 ns; CLK<='0'; wait for 2 ns; end procedure;
  begin
    RESET<='1'; LOAD<='1'; D1<='1'; D8<=x"FF"; TICK;
    assert Q0='0' and Q1='1' and Q8=x"00" severity failure;
    RESET<='0'; TICK;
    assert Q0='1' and Q1='1' and Q8=x"FF" severity failure;
    LOAD<='0'; D1<='0'; D8<=x"00"; TICK;
    assert Q0='1' and Q1='1' and Q8=x"FF" severity failure;
    LOAD<='1'; TICK;
    assert Q0='0' and Q1='0' and Q8=x"00" severity failure;
    report "PASS: register load, hold and reset values/priority" severity note; wait;
  end process;
end Behavioral;
