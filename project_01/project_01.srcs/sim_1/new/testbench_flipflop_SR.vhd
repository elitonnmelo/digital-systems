----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 10:00:45 PM
-- Design Name: 
-- Module Name: testbench_fliflop_type_d - Behavioral
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

entity testbench_flipflop_SR is

end testbench_flipflop_SR;

architecture Behavioral of testbench_flipflop_SR is
    component gate_xnor is
        port(
            clk: in std_logic;
            s: in std_logic;
            r: inout std_logic;
            q: inout std_logic
        );    
    end component;

    signal clk: std_logic := '0';
        signal s: std_logic := '0';
        signal r: std_logic;
        signal q: std_logic;
        constant clock_periodo:time:= 100 ns;
    
    begin
        clk<= not clk after clock_periodo/2;
        
        DUT: entity work.flipflop_type_SR port map(clk,s, r, q);
    estimulos:process
    begin
       
        --teste1
        s<='0';
        r<='0';
        wait for clock_periodo;
        --teste2
        s<='0';
        r<='1';
        wait for clock_periodo;
        --teste3
        s<='1';
        r<='0';
        wait for clock_periodo;
        --teste4
        s<='1';
        r<='1';
        wait for clock_periodo;
    
    end process;

end Behavioral;

