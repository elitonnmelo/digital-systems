----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 09:50:44 PM
-- Design Name: 
-- Module Name: flipflop_type_d - Behavioral
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

entity flipflop_type_D is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : inout STD_LOGIC;
           qb : inout STD_LOGIC);
end flipflop_type_D;
architecture Behavioral of flipflop_type_D is

begin
    process
    begin
    wait until clk'event and clk='1';        
        if (clk = '0' and d = '0') then
            q <= q;
            qb <= not(q);
        elsif (clk = '0' and d = '1') then
            q <= q;
            qb <= not(q);
        elsif (clk = '1' and d = '0') then
            q <= '0';
            qb <= '1';
        elsif (clk = '1' and d = '1') then
            q <= '1';
            qb <= '0';
    end if;
    end process;
end Behavioral;