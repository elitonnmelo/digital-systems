
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity drive is
Generic (N: integer := 8);
    Port ( 
           data_in : in std_logic_vector(n-1 downto 0);
           data_en : in STD_LOGIC;
           data_out : out std_logic_vector(n-1 downto 0));
end drive;

architecture Behavioral of drive is

begin
    process(data_en)
    begin
        if ( data_en = '1') then
            data_out <= data_in;
        else 
            data_out <= (others => 'Z');
        end if;
    end process;

end Behavioral;
