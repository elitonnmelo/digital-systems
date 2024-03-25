----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2024 02:19:34 PM
-- Design Name: 
-- Module Name: fsm_mealy - Behavioral
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

entity fsm_mealy is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           w : in STD_LOGIC;
           y1 : inout STD_LOGIC;
           y2 : inout STD_LOGIC;
           r1_in  : out STD_LOGIC;
           r1_out : out STD_LOGIC; 
           r2_in  : out STD_LOGIC;
           r2_out : out STD_LOGIC;
           r3_in  : out STD_LOGIC;
           r3_out : out STD_LOGIC;
           z : out STD_LOGIC);
           
end fsm_mealy;

architecture Behavioral of fsm_mealy is

begin
    process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                y1 <= '0';
                y2 <= '0';
            elsif (clk'event and clk = '1') then
                    y1 <= y1;
                    y2 <= y2;
                    y1 <= (not(y2)) and (not(y2)) and w;
                    y2 <= y1;
            end if;
        end if;
        
    end process;
    
    r1_in <= (not(y1)) and (not(y2));
    r1_out <= y2 and (not(y1));
    r2_in <= y2 and (not(y1));
    r2_out <= y1 and (not(y2));
    r3_in <= y1 and (not(y2));
    r3_out <= (not(y1)) and (not(y2));
    z <= (not(y1)) and (not(y2));
    
end Behavioral;
