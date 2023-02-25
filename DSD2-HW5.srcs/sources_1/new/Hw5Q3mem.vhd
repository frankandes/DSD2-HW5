library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Hw5Q3pkgSoln.all;

entity Hw5Q3mem is 
    port (
    addr: in std_logic_vector (a_width -1 downto 0);
    din: in std_logic_vector (d_width -1 downto 0);
    clk, we: in std_logic;
    dout: out std_logic_vector (d_width -1 downto 0)
    );
end entity Hw5Q3mem;

architecture obehavior of Hw5Q3mem is

    signal mem : mem_type(0 to (a_width**2)-1)(d_width-1 downto 0) := (x"FE", x"0F",others => x"01");
    
begin

    process (clk, we) is begin
        if (rising_edge(clk) and we = '1') then
            mem(to_integer(unsigned(addr))) <= din;
        end if;
    end process;

    dout <= mem(to_integer(unsigned(addr)));

end obehavior;

