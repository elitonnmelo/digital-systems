----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2024 04:34:47 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
end testbench;

architecture Behavioral of testbench is

component testbench is
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           w : in STD_LOGIC;
           y1 : inout STD_LOGIC;
           y2 : inout STD_LOGIC;
           z : out STD_LOGIC); 
    end component;

        signal clk: std_logic := '0';
        signal rst: STD_LOGIC := '0';
        signal w: std_logic := '0';
        signal y1: std_logic;    
        signal y2: std_logic;
        signal z: std_logic := '0';
        constant clock_periodo:time:= 100 ns;
    
    begin
        clk<= not clk after clock_periodo/2;
        
        DUT: entity work.circuito_fsm port map(clk, rst, w, y1, y2, z);
    estimulos:process
    begin
  
    rst <= '1';
    wait for clock_periodo/2;
    rst <= '0';
    wait for clock_periodo/2;
    w <= '0';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '0';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '0';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
    w <= '0';
    wait for clock_periodo;
    w <= '1';
    wait for clock_periodo;
 
--    y1<='0';
--    y2<='0';
--    w <= '0';
--    w <= '1';
--    wait for clock_periodo;
--    --teste2
--    y1<='0';
--    y2<='1';
--    w <= '1';
--    w <= '0';
    
--    wait for clock_periodo;
--    --teste3
--    y1<='1';
--    y2<='0';
--    w <= '0';
--    w <= '1';
--    wait for clock_periodo;
--    --teste4
--    y1<='1';
--    y2<='1';
--    w <= '0';
--    w <= '1';
--    wait for clock_periodo;
    
    
    end process;
end Behavioral;
