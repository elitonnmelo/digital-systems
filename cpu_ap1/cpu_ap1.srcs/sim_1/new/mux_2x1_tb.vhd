library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1_tb is
end mux_2x1_tb;

architecture Behavioral of mux_2x1_tb is
    constant N: integer:=5;
    
    signal s_in0: std_logic_vector(N-1 downto 0);
    signal s_in1: std_logic_vector(N-1 downto 0);
    signal s_sel: std_logic := '0';
    signal s_mux_out: std_logic_vector(N-1 downto 0);
begin

DUT: entity work.mux_2x1
     generic map(N => 5)
     port map( in0 =>s_in0,
               in1 =>s_in1,
               sel =>s_sel,
               mux_out =>s_mux_out);
  
  testes:process
  begin
  
  s_sel <= '0';
  s_in0 <= "00000";
  s_in1 <= "00011";
  
  wait for 200 ns;
  
  s_sel <= '1';
  s_in0 <= "11111";
  s_in1 <= "00000";
  
   wait for 200 ns;
  end process;   

end Behavioral;
