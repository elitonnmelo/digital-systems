
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IO is
    Generic (N:integer :=16);
    port (clk : in std_logic;
          IO_we   : in std_logic;
          IO_addr : in std_logic_vector(N-1 downto 0);
          INPUT  : in std_logic_vector(N-1 downto 0);
          OUTPUT : out std_logic_vector(N-1 downto 0));
end IO;

architecture syn of IO is
    type IO_type is array (2**N-1 downto 0) of std_logic_vector (N-1 downto 0);
    signal IO : IO_type:= ( others => (others => '0'));
    
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (IO_we = '1') then
                IO(to_integer(unsigned(IO_addr))) <= INPUT;
            end if;
        end if;
    end process;

    OUTPUT <= IO(to_integer(unsigned(IO_addr)));

end syn;

		
				