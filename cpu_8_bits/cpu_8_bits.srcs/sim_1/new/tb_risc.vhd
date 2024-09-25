----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2024 05:40:24 PM
-- Design Name: 
-- Module Name: tb_risc - Behavioral
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

entity tb_risc is
    --Port ();
end tb_risc;

architecture Behavioral of tb_risc is
    signal clk, rst : std_logic := '0';
    signal phase: std_logic_vector(2 downto 0);
    signal data: std_logic_vector(7 downto 0);

begin
    
    dut: entity work.risc
    port map(
    clk => clk,
    rst => rst,
    phase => phase,
    data => data
    );
   
    clk <= not clk after 10 ns;
estimulos :
process
begin

    data <= "00000000";
    phase <= "000" ;
    wait for 100 ns;
    
    data <= "01001000";
    phase <= "001" ;
    wait for 100 ns;
    
     data <= "01100000";
    phase <= "010" ;
    wait for 100 ns;
    
    data <= "01001000";
    phase <= "011" ;
    wait for 100 ns;
    
    data <= "01111000";
    phase <= "100" ;
    wait for 100 ns;
    
     data <= "01111000";
    phase <= "101" ;
    wait for 100 ns;
    
     data <= "01111000";
    phase <= "110" ;
    wait for 100 ns;
end process;
    

end Behavioral;
