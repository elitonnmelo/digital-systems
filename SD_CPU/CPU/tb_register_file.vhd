
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity tb_register_file is
end tb_register_file;

architecture Behavioral of tb_register_file is
 constant PERIOD : time := 10 ns;
 constant N: integer:=16;
 
signal tb_clk : std_logic := '0'; -- deve ser inicializado
signal tb_rst : std_logic;

signal s_rd_din:  std_logic_vector(N-1 downto 0);
signal s_rd_sel: std_logic_vector(2 downto 0);
signal s_rd_wr:   std_logic;
signal s_rm_dout: std_logic_vector(N-1 downto 0);
signal s_rm_sel: std_logic_vector(2 downto 0);
signal s_rn_dout: std_logic_vector(N-1 downto 0);
signal s_rn_sel: std_logic_vector(2 downto 0);

begin

DUT: entity work.register_file
     generic map(N => 16)
     port map( clk =>tb_clk,
               rst => tb_rst, 
               Rd_din => s_rd_din,
               Rd_sel => s_rd_sel,
               Rd_wr => s_rd_wr,
               Rm_dout => s_rm_dout,
               Rm_sel => s_rm_sel,
               Rn_dout => s_rn_dout,
               Rn_sel => s_rn_sel
     );


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
  
  ---write R0
  s_rd_sel <= "000";
  s_rd_din <= X"1001";
  s_rd_wr <= '1';
  wait for PERIOD;
  
  ---write R2
  s_rd_sel <= "010";
  s_rd_din <= X"2222";
  s_rd_wr <= '1';
  wait for PERIOD;
  
  ---write R5
  s_rd_sel <= "101";
  s_rd_din <= X"5555";
  s_rd_wr <= '1';
  wait for PERIOD;
 
  ---write R7
  s_rd_sel <= "111";
  s_rd_din <= X"7777";
  s_rd_wr <= '1';
  wait for PERIOD;
  
  
  --read all
  s_rd_wr <= '0';

  for i in 0 to 3 loop
      s_rm_sel <= conv_std_logic_vector(i, 3);
      s_rn_sel <= conv_std_logic_vector(i+4, 3);
      wait for PERIOD;
  end loop;


  

end process;


end Behavioral;
