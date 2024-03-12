----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 03:00:19 PM
-- Design Name: 
-- Module Name: gate_and - Behavioral
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

entity gate_xnor is
    Port ( clk : std_logic;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           q : out STD_LOGIC);
end gate_xnor;

architecture Behavioral of gate_xnor is

begin
    process
    begin
    wait until clk'event and clk='1';        
        if (a = '0' and b = '0') then
            q <= '1';
        elsif (a = '0' and b = '1') then
            q <= '0';
        
        elsif (a = '1' and b = '0') then
            q <= '0';
        
        elsif (a = '1' and b = '1') then
            q <= '1';
    end if;
    
    end process;


end Behavioral;
