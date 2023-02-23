library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Hw5Q1SelectedSignalSolnTB is
end Hw5Q1SelectedSignalSolnTB;

architecture tb of Hw5Q1SelectedSignalSolnTB is
    signal w: std_logic_vector(2 downto 0) := (others => '0');
    signal f: std_logic;
    constant fans: std_logic_vector(0 to 7) := "10111101";
begin
    dut: entity work.Hw5Q1SelectedSignalSoln
    port map (w => w, f => f);

    stimulus: process
    begin
    -- this test bench style uses a loop that is nice when checking
    -- functions that relate easily with a truth table.
    -- i will always be an integer. To convert it to a 3 bit std_logic_vector we use
    -- std_logic_vector(to_unsigned(i, 3)) where the 3 tells the function you want 3 bits.
    -- The conversion first goes to unsigned so negative values are avoided.
    for i in 0 to 7 loop
        w <= std_logic_vector(to_unsigned(i, 3));
        wait for 10 ns; -- don't forget the wait before checking the outputs.
        assert f = fans(i)
            report "error, f should be " & std_logic'image(fans(i)) & " not f = " & std_logic'image(f);
        wait for 10 ns;
    end loop;
    wait;
end process;
end tb;