----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Frank Andes
-- 
-- Create Date: 02/25/2023 04:11:57 PM
-- Design Name: 
-- Module Name: Ex3 - Package
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Hw5Q3pkgSoln is
constant a_width: positive := 3;
constant d_width: positive := 8;
-- add a constant d_width and set it to 8

type mem_type is array (natural range <>) of std_logic_vector;
constant clk_per: time := 20 ns;
end package Hw5Q3pkgSoln;