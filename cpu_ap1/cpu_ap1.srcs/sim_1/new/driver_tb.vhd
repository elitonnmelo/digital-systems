
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity driver_tb is
end driver_tb;

architecture Behavioral of driver_tb is
    constant N: integer:=8;
    
    signal s_data_in: std_logic_vector(N-1 downto 0);
    signal s_data_en: std_logic := '0';
    signal s_data_out: std_logic_vector(N-1 downto 0);
begin

DUT: entity work.drive
     generic map(N => 8)
     port map( data_in =>s_data_in,
               data_en =>s_data_en,
               data_out =>s_data_out);
  
  testes:process
  begin
  
  s_data_en <= '0';
  s_data_in <= "00000111";
  
  wait for 200 ns;
  
  s_data_en <= '1';
  s_data_in <= "00011111";
  
  wait for 200 ns;
   
  end process;  
   
 end Behavioral;