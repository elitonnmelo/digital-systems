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

entity testebench_fliflop_D is

end testebench_fliflop_D;

architecture Behavioral of testebench_fliflop_D is
    component gate_xnor is
        port(
            clk: in std_logic;
            --en : in std_logic;
            d: in std_logic;
            q: inout std_logic;
            qb: inout std_logic
        );    
    end component;

        signal clk: std_logic := '0';
        --signal en: std_logic := '0';
        signal d: std_logic := '0';
        signal q: std_logic;    
        signal qb: std_logic;
        constant clock_periodo:time:= 100 ns;
    
    begin
        clk<= not clk after clock_periodo/2;
        
        DUT: entity work.flipflop_type_D port map(clk, d, q, qb);
    estimulos:process
    begin
       
        --teste1
        d<='0';
        wait for clock_periodo;
        --teste2
        d<='1';
        wait for clock_periodo;
    
    end process;

end Behavioral;