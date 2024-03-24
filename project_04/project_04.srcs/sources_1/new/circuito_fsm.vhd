----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2024 10:30:36 PM
-- Design Name: 
-- Module Name: circuito_fsm - Behavioral
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

entity circuito_fsm is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           w : in STD_LOGIC;
           y1 : inout STD_LOGIC;
           y2 : inout STD_LOGIC;
           z : out STD_LOGIC);
end circuito_fsm;

architecture Behavioral of circuito_fsm is
 
begin
    process(clk, rst)
    begin
        if(rising_edge(clk))then
            if (rst = '1') then
                y1 <= '0';
                y2 <= '0';
            elsif(clk'event and clk = '1' ) then
                y1 <= y1;
                y2 <= y2;
                y1 <= (not(y2)) and w and (not(y1));
                y2 <= (y2 or y1) and w;
                
            end if;
        end if;              
    end process;
    z <= y2;
--    process(clk, rst)
--    begin
--        if(clk'event and clk = '1' ) then
--            if (clk = '0' and y1 = '0') then
--                y1 <= y1;
--            elsif (clk = '0' and y1 = '1') then
--                y1 <= y1;
--            elsif (clk = '1' and y1 = '0') then
--                y1 <= '0';
--            elsif (clk = '1' and y1 = '1') then
--                y1 <= '1';
--            end if;
--        end if;
--   end process;
   
--   process(clk, rst)
--   begin
--        if(clk'event and clk = '1'  and rst = '0') then
--            if (clk = '0' and y2 = '0') then
--                y2 <= y2;
--            elsif (clk = '0' and y2 = '1') then
--                y2 <= y2;
--            elsif (clk = '1' and y2 = '0') then
--                y2 <= '0';
--            elsif (clk = '1' and y2 = '1') then
--                y2 <= '1';
--            end if;
--        end if;
--    end process;
   
end Behavioral;
