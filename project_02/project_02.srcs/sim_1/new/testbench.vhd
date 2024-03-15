library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    
    component fsm_moore is
        Port ( 
            clock : in std_logic;
            rst   : in std_logic;    
            w     : in std_logic;
            z     : out std_logic
         );
    end component;
    
    signal clock: std_logic := '0';
    signal rst: std_logic := '1';
    signal w: std_logic:='0';
    signal z: std_logic:='0';
    constant clock_periodo:time:= 100 ns;
    
begin
     clock<= not clock after clock_periodo/2;
     
     DUT: entity work.fsm_moore(rtl) port map(
     clock => clock,
     rst => rst,
     w => w,
     z => z);
    
    
    process 
    begin
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 0 1 0 0 1 1 0
        wait for clock_periodo/2;
        rst <= '1';
        --w <= '0'; --inicializações para reset
        wait for clock_periodo;
        rst <= '0';
        wait for clock_periodo;
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
