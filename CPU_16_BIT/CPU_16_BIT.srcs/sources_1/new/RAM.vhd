library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    Generic (N: integer := 16);
    port (clk         : in std_logic;
          RAM_we      : in std_logic;
          ram_addr    : in std_logic_vector(N-1 downto 0);
          ram_din     : in std_logic_vector(N-1 downto 0);
          ram_dout    : out std_logic_vector(N-1 downto 0);
          instruction : in std_logic_vector(N-1 downto 0));
end RAM;

architecture syn of RAM is
    type ram_type is array (2**N-1 downto 0) of std_logic_vector(N-1 downto 0);
    type stack_type is array (3 downto 0) of std_logic_vector(N-1 downto 0);
    signal RAM : ram_type := (others => (others => '0'));
    signal STACK : stack_type := (others => (others => '0'));
    signal sp : integer range 0 to 3 := 0;  -- Ponteiro da pilha
    signal stack_dout : std_logic_vector(N-1 downto 0) := (others => '0');
    
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (RAM_we = '1') then
                if (instruction(15 downto 11) = "00000" and instruction(1 downto 0) = "01") then
                    -- PUSH
                    if sp < 7 then
                
                        STACK(sp) <= ram_din;
                        sp <= sp + 1;
                        
                    end if;

                elsif (instruction(15 downto 11) = "00000" and instruction(1 downto 0) = "10") then
                    -- POP
                    if sp > 0 then
                        
                        stack_dout <= STACK(sp+1);
                        sp <= sp - 1;
                    end if;
                else
                    -- RAM
                    RAM(to_integer(unsigned(ram_addr))) <= ram_din;
                end if;
            end if;
        end if;
    end process;

    -- Saída RAM
    ram_dout <= stack_dout when (instruction(15 downto 11) = "00000" and instruction(1 downto 0) = "10") else
                RAM(to_integer(unsigned(ram_addr)));

end syn;
