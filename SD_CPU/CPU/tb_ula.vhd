
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



entity tb_ula is
end tb_ula;

architecture Behavioral of tb_ula is
constant PERIOD : time := 10 ns;
constant N: integer:=16;

signal tb_clk : std_logic := '0'; -- deve ser inicializado
signal tb_rst : std_logic;
signal s_A: std_logic_vector(N-1 downto 0);
signal s_B: std_logic_vector(N-1 downto 0);
signal s_Q: std_logic_vector(N-1 downto 0);
signal s_op: std_logic_vector(3 downto 0) := (others => '0');

begin

DUT: entity work.ula
     generic map(N => 16)
     port map( A =>s_A,
               B =>s_B,
               Q =>s_Q,
               op =>s_op);

clock:
tb_clk <= not tb_clk after PERIOD/2; 

reset: 
process
       begin
         tb_rst <= '1';
         wait for 2*PERIOD;
         --tb_mem_we <= '0';
         tb_rst <= '0';
         wait;
       end process reset;
       
test:
process
begin
  wait until tb_rst='0';
  
  s_A <= X"0005";
  s_B <= X"0002";
  wait for PERIOD;
  
  
  
  
  --test all operations
  for i in 4 to 10 loop
      s_op <= conv_std_logic_vector(i, 4);
      wait for PERIOD;
  end loop;   
  
      
end process;  

end Behavioral;
