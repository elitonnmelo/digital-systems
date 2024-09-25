----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2024 04:40:47 PM
-- Design Name: 
-- Module Name: risc - Behavioral
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

entity risc is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           phase: in std_logic_vector(2 downto 0);
           data: in std_logic_vector(7 downto 0)
           );
end risc;

architecture Behavioral of risc is
constant PERIOD : time := 10 ns;
constant N: integer:=8;

signal s_wr : std_logic;
signal s_rd : std_logic;
signal s_sel : std_logic;
signal s_ld_ir : std_logic;
signal s_ld_ac : std_logic;
signal no_halt : std_logic;
signal s_inc_pc : std_logic;
signal s_ld_pc : std_logic;
signal s_data_e : std_logic;
signal s_a_is_zero : std_logic;
signal s_pc_addr : std_logic;
signal s_ac_out : std_logic;
signal s_ir_out : std_logic_vector(N-1 downto 0);
signal s_pc_out : std_logic_vector(4 downto 0);
signal s_in_a: std_logic_vector(N-1 downto 0);
signal s_in_b: std_logic_vector(N-1 downto 0);
signal s_alu_out: std_logic_vector(N-1 downto 0);
signal s_op_code: std_logic_vector(2 downto 0) := (others => '0');
signal s_addr: std_logic_vector(4 downto 0);
signal s_data: std_logic_vector(N-1 downto 0);
signal s_phase: std_logic_vector(2 downto 0);
signal s_driver_inst : std_logic_vector(N-1 downto 0);
begin
s_phase <= phase;
s_data<= data;
ULA: entity work.ula
     generic map(N => 8)
     port map( 
     in_a => s_in_a,
     in_b => s_driver_inst,
     op_code => s_op_code,
     alu_out => s_alu_out,
     a_is_zero => s_a_is_zero     
     );
    
RAM: entity work.ram
     generic map(N => 8)
     port map(
     clk => clk,
     wr => s_wr,
     addr => s_addr,
     rd => s_rd,
     data => s_data);
       
FSM: entity work.fsm
     port map(
     zero => s_a_is_zero,
     phase => s_phase,
     opcode => s_op_code,
     sel => s_sel,
     rd => s_rd,
     ld_ir => s_ld_ir,
     halt => no_halt,
     inc_pc => s_inc_pc,
     ld_ac => s_ld_ac,
     wr => s_wr,
     ld_pc => s_ld_pc,
     data_e => s_data_e);
     
IR: entity work.registrador
    generic map(N => 8)
    port map(
    clk => clk,
    rst => rst,
    load => s_ld_ir,
    data_in => s_data,
    data_out => s_ir_out);

PC: entity work.counter
    generic map(N => 5)
    port map(
    clk            => clk,
    rst           => rst,
    load           => s_ld_pc,
    enab           => s_inc_pc,
    cnt_in         => s_ir_out(4 downto 0),
    cnt_out        =>s_pc_out
    );
    
--INC PC

AC: entity work.registrador
    generic map(N => 8)
    port map(
    clk => clk,
    rst => rst,
    load => s_ld_ac,
    data_in => s_alu_out,
    data_out => s_in_a);
          
         
DRIVE:  entity work.driver
    generic map(N => 8)
    port map(
    data_en   =>  s_ld_ir ,
    data_in   =>  s_alu_out ,
    data_out  =>  s_driver_inst
);

mux:  entity work.multiplexor
    generic map(N => 5)
    port map(
     in0        =>  s_ir_out(4 downto 0)     ,
     in1        =>  s_pc_out     ,
     sel        =>  s_sel     ,
     mux_out    =>  s_addr 
);

end Behavioral;
