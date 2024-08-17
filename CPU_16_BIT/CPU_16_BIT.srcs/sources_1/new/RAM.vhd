
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    Generic (N:integer :=16);
    port (clk : in std_logic;
          RAM_we   : in std_logic;
          ram_addr : in std_logic_vector(N-1 downto 0);
          ram_din  : in std_logic_vector(N-1 downto 0);
          ram_dout : out std_logic_vector(N-1 downto 0));
end RAM;

architecture syn of RAM is
    type ram_type is array (2**N-1 downto 0) of std_logic_vector (N-1 downto 0);
    signal RAM : ram_type:= ( others => (others => '0'));
    
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (ram_we = '1') then
                RAM(to_integer(unsigned(ram_addr))) <= ram_din;
            end if;
        end if;
    end process;

    ram_dout <= RAM(to_integer(unsigned(ram_addr)));

end syn;

					
				