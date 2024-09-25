library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity ula is
    generic(N: integer := 8);
    port ( in_a : in std_logic_vector(N-1 downto 0);
           in_b : in std_logic_vector(N-1 downto 0);
           op_code : in std_logic_vector(2 downto 0);
           alu_out : out std_logic_vector(N-1 downto 0);
           a_is_zero : out std_logic);
end ula;

architecture ula_arch of ula is
    signal s_sum_in: std_logic_vector(N-1 downto 0);
begin
    with op_code select
        alu_out <= in_a when "000",
                   in_a when "001",
                   s_sum_in when "010",
                   (in_a and in_b) when "011",
                   (in_a xor in_b) when "100",
                   in_b when "101",
                   in_a when "110",
                   in_a when others;
                   
    s_sum_in <= in_a + in_b;
                
end ula_arch;