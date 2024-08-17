library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    generic (N : integer := 16);
    port (
        clk       : in  std_logic;
        ROM_addr  : in  std_logic_vector(N-1 downto 0);
        ROM_en  : in std_logic;
        ROM_dout : out std_logic_vector(N-1 downto 0)
    );
end ROM;

architecture syn of ROM is
    type rom_type is array (64 downto 0) of std_logic_vector(N-1 downto 0);
        
    signal ROM : rom_type := (
        
        -- rd = r2; rm = r0; rn = r1
        32  => "1111111111111111", -- halt             HALT
        31  => "0010100000000111", -- [r0] = 7         STORE
        30  => "0010000000000100", -- [r0] = r1        STORE
        29  => "0001001000000000", -- mov r2,r0 ;      MOV
        28  => "0001100000000101", -- mov r0,5 ;       MOV
        27  => "0001101000000101", -- mov r2,5 ;       MOV
        26  => "0001100000000101", -- mov r0,5 ;       MOV 
        25  => "0011001000000000", -- r2 = [r0]        LOAD
        24  => "0000000000000000", -- nop              NOP
        23  => "1010001000000100", -- xor r2, r0, r1   ULA
        22  => "0001100100000010", -- mov r1, 2        MOV
        21  => "0001100000000101", -- mov r0,5 ;       MOV
        20  => "1001001000000000", -- not r2, r0       ULA
        19  => "0001100100000010", -- mov r1, 2        MOV
        18  => "0001100000000101", -- mov r0,5 ;       MOV
        17  => "0110001000000100", -- mul r2, r0, r1   ULA
        16  => "0001100100000010", -- mov r1, 2        MOV
        15  => "0001100000000101", -- mov r0,5 ;       MOV
        14  => "1000001000000100", -- orr r2, r0, r1   ULA
        13  => "0001100100000010", -- mov r1, 2        MOV
        12  => "0001100000000101", -- mov r0,5 ;       MOV
        11  => "0111001000000100", -- and r2, r0, r1   ULA
        10  => "0001100100000010", -- mov r1, 2        MOV
        9  => "0001100000000101", --  mov r0,5 ;       MOV
        8  => "0110001000000100", --  mul r2, r0, r1   ULA
        7  => "0001100100000010", --  mov r1, 2        MOV
        6  => "0001100000000101", --  mov r0,5 ;       MOV
        5  => "0101001000000100", --  sub r2, r0, r1   ULA
        4  => "0001100100000011", --  mov r1, 3        MOV
        3  => "0001100000000100", --  mov r0,4 ;       MOV
        2  => "0100001000000100", --  add r2, r0, r1   ULA
        1  => "0001100100000010", --  mov r1, 2        MOV
        0  => "0001100000000101", --  mov r0,5 ;       MOV
        
        others => x"0000"

    );
begin

    process (clk)
    begin
        if (clk'event and clk = '1') then
          if (ROM_en = '1') then
            ROM_dout <= ROM(to_integer(unsigned(ROM_addr)));
          end if;
        end if;
    end process;

end syn;