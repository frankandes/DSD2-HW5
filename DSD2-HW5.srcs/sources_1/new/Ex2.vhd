----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Frank Andes
-- 
-- Create Date: 02/25/2023 03:22:25 PM
-- Module Name: Ex2 - Behavioral
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ex2 is
    Port ( 
        A : in std_logic_vector (2 downto 0);
        Y : out std_logic
    );
end Ex2;

architecture Behavioral of Ex2 is
begin
    process(A) is begin
        case A is
            when "010" => Y <= '1';
            when "100" => Y <= '1';
            when "101" => Y <= '1';
            when "111" => Y <= '1';
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;
