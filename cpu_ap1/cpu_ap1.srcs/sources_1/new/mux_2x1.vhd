library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1 is
    Generic (N: integer := 5);
    Port ( in0  : in STD_LOGIC_VECTOR (N-1 downto 0);
           in1  : in STD_LOGIC_VECTOR (N-1 downto 0);
           sel  : in STD_LOGIC;
           mux_out  : out STD_LOGIC_VECTOR (N-1 downto 0));
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin
   mux_out <= in1 when sel = '1' else in0;

end Behavioral;