----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 02:32:42 PM
-- Design Name: 
-- Module Name: gate_or - Behavioral
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

entity gate_nand is
        
    Port ( 
           clk : std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           q : out STD_LOGIC);
           
end gate_nand;

architecture Behavioral of gate_nand is

begin
    process
    begin
    wait until clk'event and clk='1';        
    if (a = '0' and b = '0') then
            q <= '1';
        elsif (a = '0' and b = '1') then
            q <= '1';
        
        elsif (a = '1' and b = '0') then
            q <= '1';
        
        elsif (a = '1' and b = '1') then
            q <= '0';
    end if;
    
    end process;


end Behavioral;
