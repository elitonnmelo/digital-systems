library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



entity tb_cpu is
end tb_cpu;

architecture Behavioral of tb_cpu is
constant N: integer:=16;
constant PERIOD : time := 10 ns;

signal tb_clk : std_logic := '0'; -- deve ser inicializado
signal tb_rst : std_logic;

 signal ROM_en  :  std_logic :='0';             
 signal ROM_addr : std_logic_vector(N-1 downto 0); 
 signal IR_data : std_logic_vector (N-1 downto 0);
                                            
 --Memória dados                            
signal ram_din: std_logic_vector(N-1 downto 0);
signal ram_dout: std_logic_vector(N-1 downto 0);
signal ram_addr: std_logic_vector(N-1 downto 0);
signal RAM_we  : std_logic;                    

--Debug                                    
signal dbg_r0: std_logic_vector(N-1 downto 0);
signal dbg_r1: std_logic_vector(N-1 downto 0);
signal dbg_r2: std_logic_vector(N-1 downto 0);
signal dbg_r3: std_logic_vector(N-1 downto 0);
signal dbg_r4: std_logic_vector(N-1 downto 0);
signal dbg_r5: std_logic_vector(N-1 downto 0);
signal dbg_r6: std_logic_vector(N-1 downto 0);
signal dbg_r7: std_logic_vector(N-1 downto 0);
signal dbg_ir: std_logic_vector(N-1 downto 0);
signal dbg_state: std_logic_vector(3 downto 0);

begin

DUT: entity work.cpu
    generic map (N =>16)
     port map( clk       =>   tb_clk,
               rst       =>   tb_rst,
               --ROM_en    =>   ROM_en,
               ROM_addr  =>   ROM_addr,
               --IR_data   =>   IR_data,
           
               --ram_din   =>  ram_din,
               --ram_dout  =>  ram_dout, 
               ram_addr  =>  ram_addr,
               RAM_we    =>  RAM_we,   
            
               dbg_r0    =>  dbg_r0,   
               dbg_r1    =>  dbg_r1,   
               dbg_r2    =>  dbg_r2,   
               dbg_r3    =>  dbg_r3,   
               dbg_r4    =>  dbg_r4,   
               dbg_r5    =>  dbg_r5,   
               dbg_r6    =>  dbg_r6,   
               dbg_r7    =>  dbg_r7,   
               dbg_ir    =>  dbg_ir,   
               dbg_state =>  dbg_state
                   
               );

clock:
tb_clk <= not tb_clk after PERIOD/2; 

reset: 
process
       begin
         tb_rst <= '1';
         wait for 2*PERIOD;
         tb_rst <= '0';
         wait for 200*PERIOD;
      
end process;  

end Behavioral;
