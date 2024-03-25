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

entity testbench2 is
end testbench2;

architecture Behavioral of testbench2 is

component testbench2 is
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           w : in STD_LOGIC;
           y1 : inout STD_LOGIC;
           y2 : inout STD_LOGIC;
           r1_in: std_logic;
           r1_out: std_logic;
           r2_in: std_logic;
           r2_out: std_logic;
           r3_in: std_logic;
           r3_out: std_logic;
           z : out STD_LOGIC); 
    end component;

        signal clk: std_logic := '0';
        signal rst: STD_LOGIC := '0';
        signal w: std_logic := '0';
        signal y1: std_logic;    
        signal y2: std_logic;
        signal r1_in: std_logic := '0';
        signal r1_out: std_logic := '0';
        signal r2_in: std_logic := '0';
        signal r2_out: std_logic := '0';
        signal r3_in: std_logic := '0';
        signal r3_out: std_logic := '0';
        signal z: std_logic := '0';
        constant clock_periodo:time:= 100 ns;
    
    begin
        clk<= not clk after clock_periodo/2;
       
        DUT: entity work.fsm_mealy port map(clk, rst, w, y1, y2, r1_in, r1_out, r2_in, r2_out, r3_in, r3_out, z);
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
    end process;
end Behavioral;
