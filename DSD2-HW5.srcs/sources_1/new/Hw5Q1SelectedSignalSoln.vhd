library ieee;
use ieee.std_logic_1164.all;

entity Hw5Q1SelectedSignalSoln is
	port (
		w : in std_logic_vector(2 downto 0);
		f : out std_logic
	);
end entity Hw5Q1SelectedSignalSoln;

architecture behave of Hw5Q1SelectedSignalSoln is

begin
	with w select
		f <= '0' when "001",
			 '0' when "110",
			 '1' when others;	
end architecture behave;