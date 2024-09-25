
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_misc.all;

entity fsm is
    generic(N : integer := 16);
    Port ( 
       zero     : in   std_logic;
       phase    : in   std_logic_vector(2 downto 0);
       opcode   : in   std_logic_vector(2 downto 0);
       sel      : out  std_logic;
       rd       : out  std_logic;
       ld_ir    : out  std_logic;
       halt     : out  std_logic;
       inc_pc   : out  std_logic;
       ld_ac    : out  std_logic;
       wr       : out  std_logic;
       ld_pc    : out  std_logic;
       data_e   : out  std_logic
       ); 
end fsm;

architecture Behavioral of fsm is
    signal next_state: std_logic_vector(2 downto 0) := "000";
begin
   process(phase)
   begin
        case(phase) is
           when "000" => next_state <= "001";
           when "001" => next_state <= "010";           
           when "010" => next_state <= "011";
           when "011" => next_state <= "100";
           when "100" => next_state <= "101";
           when "101" => next_state <= "110";
           when "110" => next_state <= "111";
           when "111" => next_state <= "000";
           when others => next_state <= "000";
       end case;   
   end process;
   
   process(next_state)
   begin
        case(phase) is
            when "000"  =>  
                sel     <=  '1';
                rd      <=  '0';
                ld_ir   <=  '0';
                halt    <=  '0';
                inc_pc  <=  '0';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';
            when "001" =>
                sel     <=  '1';
                rd      <=  '1';
                ld_ir   <=  '0';
                halt    <=  '0';
                inc_pc  <=  '0';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';
            when "010" =>
                sel     <=  '1';
                rd      <=  '1';
                ld_ir   <=  '1';
                halt    <=  '0';
                inc_pc  <=  '0';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';
            when "011" =>  
                sel     <=  '1';
                rd      <=  '1';
                ld_ir   <=  '1';
                halt    <=  '0';
                inc_pc  <=  '0';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';    
            when "100" =>
                sel     <=  '0';
                rd      <=  '0';
                ld_ir   <=  '0';
                halt    <=  'Z';
                inc_pc  <=  '1';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';         
            when "101" =>
                sel     <=  '0';
                if(opcode = "010" or opcode = "011" or opcode = "100" or opcode = "101") then
                rd      <=  '1';
                else
                  rd <= '0';
                end if;
                ld_ir   <=  '0';
                halt    <=  '0';
                inc_pc  <=  '0';
                ld_ac   <=  '0';
                wr      <=  '0';
                ld_pc   <=  '0';
                data_e  <=  '0';
            when "110" =>  
                sel     <=  '0';
                if(opcode = "010" or opcode = "011" or opcode = "100" or opcode = "101") then
                rd      <=  '1';
                else
                  rd <= '0';
                end if;
                ld_ir   <=  '0';
                halt    <=  '0';
                inc_pc <=   zero;
                ld_ac   <=  '0';
                wr      <=  '0';
                if(opcode = "111") then
                  ld_pc   <=  '1';
                else
                  ld_pc <= '0';
                end if;
                
                if(opcode = "110") then
                  data_e  <=  '1';
                else
                  data_e  <=  '0';
                end if;
            when "111" =>  
                sel     <=  '1';
                if(opcode = "010" or opcode = "011" or opcode = "100" or opcode = "101") then
                rd      <=  '1';
                else
                  rd <= '0';
                end if;
                ld_ir   <=  '0';
                halt    <=  '0';
                inc_pc  <=  '0';
                if(opcode = "010" or opcode = "011" or opcode = "100" or opcode = "101") then
                  ld_ac <=  '1';
                else
                  ld_ac <= '0';
                end if;
                
                if(opcode = "110") then
                  wr <= '1';
                else 
                  wr <= '0';
                end if;
                
                if(opcode = "111") then
                  ld_pc   <=  '1';
                else
                  ld_pc <= '0';
                end if;
                
                if(opcode = "110") then
                  data_e  <=  '1';
                else
                  data_e  <=  '0';
                end if;
         when others =>
        end case;   
   end process;

end Behavioral;