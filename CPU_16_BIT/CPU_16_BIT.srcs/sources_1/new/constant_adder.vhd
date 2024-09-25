library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity constant_adder is
Generic (N: integer:=16;
         VAL: integer:=2);
   Port ( I0 : in STD_LOGIC_VECTOR (15 downto 0);
          O0 : out STD_LOGIC_VECTOR (15 downto 0);
          zero : in STD_LOGIC;
          carry : in STD_LOGIC;
          Immed : in STD_LOGIC_VECTOR (15 downto 0));
          
end constant_adder;

architecture Behavioral of constant_adder is

begin   --I0 => s_pc_dout, O0 => s_pc_din




O0 <=          (I0 + VAL + Immed) when (I0(N-1 downto 11) = "00001" and I0(1 downto 0) = "00") else                                 --JMP
               (I0 + VAL + Immed) when (I0(N-1 downto 11) = "00001" and I0(1 downto 0) = "01" and zero = '1' and carry = '0') else  --JEQ
               (I0 + VAL + Immed) when (I0(N-1 downto 11) = "00001" and I0(1 downto 0) = "10" and zero = '0' and carry = '1') else  --JLT
               (I0 + VAL + Immed) when (I0(N-1 downto 11) = "00001" and I0(1 downto 0) = "11" and zero = '0' and carry = '0') else  --JGT  
                I0 + VAL;

end Behavioral;