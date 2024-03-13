----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 11:22:44 PM
-- Design Name: 
-- Module Name: testbench_half_adder - Behavioral
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

entity testbench_half_adder is

end testbench_half_adder;

architecture Behavioral of testbench_half_adder is
    component testbench_half_adder is
        port(
           clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           q : out STD_LOGIC;
           c : out STD_LOGIC
        );    
    end component;

    signal clk: std_logic := '0';
        signal a: std_logic := '0';
        signal b: std_logic;
        signal q: std_logic;
        signal c: std_logic;
        constant clock_periodo:time:= 100 ns;
    
    begin
        clk<= not clk after clock_periodo/2;
        
        DUT: entity work.half_adder port map(clk,a, b, q, c);
    estimulos:process
    begin
       
        --teste1
        a<='0';
        b<='0';
        wait for clock_periodo;
        --teste2
        a<='0';
        b<='1';
        wait for clock_periodo;
        --teste3
        a<='1';
        b<='0';
        wait for clock_periodo;
        --teste4
        a<='1';
        b<='1';
        wait for clock_periodo;
    
    end process;

end Behavioral;
