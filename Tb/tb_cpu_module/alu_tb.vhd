library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alu_tb is end alu_tb;
architecture Behavioral of alu_tb is
  signal A,B,Y: STD_LOGIC_VECTOR(7 downto 0);
  signal S: STD_LOGIC_VECTOR(1 downto 0);

begin
  UUT: entity work.alu port map (A,B,S,Y);
  process
    variable EXPECTED: integer;
  begin
    for OP in 0 to 3 loop
      S <= STD_LOGIC_VECTOR(to_unsigned(OP,2));
      for AV in 0 to 255 loop
        A <= STD_LOGIC_VECTOR(to_unsigned(AV,8));
        for BV in 0 to 255 loop
          B <= STD_LOGIC_VECTOR(to_unsigned(BV,8)); wait for 1 ns;
          case OP is
            when 0 => EXPECTED := BV;
            when 1 => EXPECTED := (AV+BV) mod 256;
            when 2 => EXPECTED := (AV-BV) mod 256;
            when others => EXPECTED := (AV*2) mod 256;
          end case;
          assert Y = STD_LOGIC_VECTOR(to_unsigned(EXPECTED,8))
            report "ALU mismatch" severity failure;
        end loop;
      end loop;
    end loop;
    report "PASS: 262144 exhaustive ALU cases" severity note; wait;
  end process;
end Behavioral;
