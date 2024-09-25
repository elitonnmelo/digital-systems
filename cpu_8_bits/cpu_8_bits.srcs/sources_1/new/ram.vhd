
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
    Generic (N:integer :=8);
    port (clk : in std_logic;
          wr   : in std_logic;
          addr : in std_logic_vector(4 downto 0);
          rd  : in std_logic;
          data : inout std_logic_vector(N-1 downto 0));
end ram;

architecture syn of ram  is
    type ram_type is array (2**N-1 downto 0) of std_logic_vector (N-1 downto 0);
    signal RAM : ram_type:= ( others => (others => '0'));
    
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (wr = '1' and rd = '0') then
                RAM(to_integer(unsigned(addr))) <= data;
            elsif (rd = '1' and wr = '0') then 
                 data <= RAM(to_integer(unsigned(addr)));
            end if;   
        end if;
    end process;

end syn;

		
				