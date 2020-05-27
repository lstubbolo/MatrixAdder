library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity out32 is
    Port (
        clk     :   in  STD_LOGIC;
        reset   :   in  STD_LOGIC   := '0';
        enable  :   in  STD_LOGIC   := '0';
        count   :   in  integer     := 0;
        
        A_0,  A_1,  A_2,  A_3, 
        A_4,  A_5,  A_6,  A_7, 
        A_8,  A_9,  A_10, A_11, 
        A_12, A_13, A_14, A_15      : in STD_LOGIC_VECTOR(15 downto 0);
        
        B_0,  B_1,  B_2,  B_3,
        B_4,  B_5,  B_6,  B_7, 
        B_8,  B_9,  B_10, B_11, 
        B_12, B_13, B_14, B_15      : in STD_LOGIC_VECTOR(15 downto 0);
        
        C_out   :   out STD_LOGIC_VECTOR(31 downto 0)  
    );
end out32;

architecture Behavioral of out32 is

signal output   :   STD_LOGIC_VECTOR(31 downto 0);
--signal count    :   integer := 0;

begin

C_out <= output;

CALCULATE: process(clk, reset, enable) is
begin
if rising_edge(clk) then

    if  reset = '1' then 
        output  <= x"00000000";
--        count   <= 0;
    
    elsif enable = '0' then
        output <= output;
    
    else
        case count is
        
            when 0 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_0) * signed(B_0));
                --count <= --count + 1;
            
            when 1 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_1) * signed(B_1));
                --count <= --count + 1;
            
            when 2 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_2) * signed(B_2));
                --count <= --count + 1;
            
            when 3 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_3) * signed(B_3));
                --count <= --count + 1;
            
            when 4 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_4) * signed(B_4));
                --count <= --count + 1;
            
            when 5 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_5) * signed(B_5));
                --count <= --count + 1;
            
            when 6 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_6) * signed(B_6));
                --count <= --count + 1;
            
            when 7 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_7) * signed(B_7));
                --count <= --count + 1;
            
            when 8 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_8) * signed(B_8));
                --count <= --count + 1;
            
            when 9 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_9) * signed(B_9));
                --count <= --count + 1;
            
            when 10 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_10) * signed(B_10));
                --count <= --count + 1;
            
            when 11 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_11) * signed(B_11));
                --count <= --count + 1;
            
            when 12 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_12) * signed(B_12));
                --count <= --count + 1;
            
            when 13 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_13) * signed(B_13));
                --count <= --count + 1;
            
            when 14 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_14) * signed(B_14));
                --count <= --count + 1;
            
            when 15 => output <= STD_LOGIC_VECTOR(
                signed(output) + signed(A_15) * signed(B_15));
                --count <= --count + 1;
                    
            when others => output <= output;
        end case;
    end if;
end if;
end process;




end Behavioral;













