----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 10:25:13 PM
-- Design Name: 
-- Module Name: flipflop_type_sr - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flipflop_type_SR is
    Port ( clk : in std_logic;
           s : in STD_LOGIC;
           r : in STD_LOGIC;
           q : inout STD_LOGIC);
end flipflop_type_SR;

architecture Behavioral of flipflop_type_SR is

    --signal tmp: std_logic := '0';

begin
    process
    begin
    wait until clk'event and clk='1';        
        if (s = '0' and r = '0') then
            q <= q;
        elsif (s = '0' and r = '1') then
            q <= '0';
        elsif (s = '1' and r = '0') then
            q <= '1';
        elsif (s = '1' and r = '1') then
            q <= 'Z'; -- Estado indeterminado
    end if;
    end process;


end Behavioral;