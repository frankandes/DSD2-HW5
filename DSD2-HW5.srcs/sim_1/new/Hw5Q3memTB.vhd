library ieee;
use ieee.std_logic_1164.all;
use work.Hw5Q3pkgSoln.all;

entity Hw5Q3memTB is
end Hw5Q3memTB;

architecture tb of Hw5Q3memTB is
    signal addr : std_logic_vector (a_width-1 downto 0) := (others => '0');
    signal din : std_logic_vector (d_width-1 downto 0) := (others => '0');
    signal clk, we : std_logic := '0';
    signal dout : std_logic_vector (d_width-1 downto 0) := (others => '0');
begin

    dut : entity work.Hw5Q3mem
        port map (addr => addr, din => din, clk => clk, we => we, dout => dout);

    clk <= not clk after clk_per/2;

    stimuli : process
    begin
        we <= '0';
        addr <= "000";
        wait for 10 ns;
        assert (x"FE" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FE";
        wait for 10 ns;

        -- code to read and check location 1
        addr <= "001";
        wait for 10 ns;
        assert (x"FE" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FE";
        wait for 10 ns;

        -- code to read and check location 6
        addr <= "110";
        wait for 10 ns;
        assert (x"FE" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FE";
        wait for 10 ns;

        wait until clk = '0';
        we <= '1';
        addr <= "000";
        din <= x"FF";

        wait until clk = '0';
        addr <= "100";

        wait until clk = '0';
        addr <= "110";

        -- code to read and check location 0
        wait until clk = '0';
        addr <= "000";
        wait for 10 ns;
        assert (x"FF" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FF";
        wait for 10 ns;

        -- read and check location 4
        addr <= "100";
        wait for 10 ns;
        assert (x"FF" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FF";
        wait for 10 ns;

        -- read and check location 6
        addr <= "110";
        wait for 10 ns;
        assert (x"FF" = dout) report "error in result. dout is " &
        to_hstring (dout) & " and should be = FF";
        wait for 10 ns;

        wait;
    end process;
end tb;
