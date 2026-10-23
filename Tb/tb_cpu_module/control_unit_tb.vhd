library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity control_unit_tb is end control_unit_tb;
architecture Behavioral of control_unit_tb is
  signal OP: STD_LOGIC_VECTOR(3 downto 0);
  signal Z,AL,ZL,J: STD_LOGIC;
  signal S: STD_LOGIC_VECTOR(1 downto 0);

begin
  UUT: entity work.control_unit port map (OP,Z,S,AL,ZL,J);
  process
    variable LD,JP: STD_LOGIC;
    variable SEL: integer;
  begin
    for O in 0 to 15 loop
      for FLAG in 0 to 1 loop
        OP <= STD_LOGIC_VECTOR(to_unsigned(O,4));
        if FLAG=0 then Z<='0'; else Z<='1'; end if;
        LD:='0'; JP:='0'; SEL:=0;
        case O is
          when 1 => LD:='1'; SEL:=0;
          when 2 => LD:='1'; SEL:=1;
          when 3 => LD:='1'; SEL:=2;
          when 8 => LD:='1'; SEL:=3;
          when 12 => if FLAG=1 then JP:='1'; end if;
          when others => null;
        end case;
        wait for 1 ns;
        assert AL=LD and ZL=LD and J=JP and S=STD_LOGIC_VECTOR(to_unsigned(SEL,2))
          report "Control decode mismatch" severity failure;
      end loop;
    end loop;
    report "PASS: all 16 opcodes, both Z values; unassigned opcodes NOP" severity note; wait;
  end process;
end Behavioral;
