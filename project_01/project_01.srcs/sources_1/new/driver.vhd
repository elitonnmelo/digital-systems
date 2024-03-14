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

entity driver is
        
    Port ( 
           clk : std_logic;
           a : in STD_LOGIC;
           q : inout STD_LOGIC);
           
end driver;

architecture Behavioral of driver is

begin
    process
    begin
    wait until clk'event and clk='1';
        q <= a;
    
    end process;


end Behavioral;
 
