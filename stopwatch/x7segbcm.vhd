----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:09 05/13/2019 
-- Design Name: 
-- Module Name:    x7segbc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x7segbcm is
port( xm  : in std_logic_vector (15 downto 0); 
		cclk : in std_logic; 
		clr : in std_logic; 
		a_to_g : out std_logic_vector(6 downto 0); 
		an : out std_logic_vector (3 downto 0); 
		dp : out std_logic 
		); 
end x7segbcm;

architecture Behavioral of x7segbcm is
signal s :  std_logic_vector(1 downto 0); 
signal digit : std_logic_vector(3 downto 0); 
signal aen : std_logic_vector(3 downto 0);

begin
	dp <= '1' ;
	aen(3) <= xm(15) or xm(14) or xm(13) or xm(12);
	aen(2) <= xm(15) or xm(14) or xm(13) or xm(12) 
				or xm(11) or xm(10) or xm(9) or xm(8); 
	aen(1) <= xm(15) or xm(14) or xm(13) or xm(12) 
				or xm(11) or xm(10) or xm(9) or xm(8) 
				or xm(7) or xm(6) or xm(5) or xm(4); 
	aen(0) <= '1' ;

	process(s,xm) 
	begin
	case s is 
		when "00" => digit <= xm(3 downto 0); 
		when "01" => digit <= xm(7 downto 4); 
		when "10" => digit <= xm(11 downto 8); 
		when others => digit <= xm(15 downto 12); 
	end case;
	end process;
	
	
	process(digit) 
	begin 
	case digit is 
		when x"0" => a_to_g<= "0000001"; -- 0 
		when x"1" => a_to_g<= "1001111"; -- 1 
		when x"2" => a_to_g <= "0010010"; -- 2 
		when x"3" => a_to_g <= "0000110"; -- 3 
		when x"4" => a_to_g <= "1001100"; -- 4 
		when x"5" => a_to_g <= "0100100"; -- 5 
		when x"6" => a_to_g <= "0100000"; -- 6 
		when x"7" => a_to_g <= "0001111"; -- 7 
		when x"8" => a_to_g <= "0000000"; -- 8 
		when x"9" => a_to_g <= "0000100"; -- 9 
		when x"A" => a_to_g <= "0001000"; -- a 
		when x"B" => a_to_g <= "1100000"; -- b 
		when x"C" => a_to_g <= "0110001"; -- c 
		when x"D" => a_to_g <= "1000010"; -- d
		when x"E" => a_to_g <= "0110000"; -- e 
		when others => a_to_g <= "0111000"; -- f 
	end case; 
	end process;
	process(s,aen)
	begin
	an <= "1111"; 
	if aen(conv_integer(s))='1' then 
		an(conv_integer(s))<='0' ;
	end if; 
	end process;

	process(cclk, clr) 
	begin 
	if clr='1' then 
		s <= "00"; 
	elsif cclk' event and cclk='1' then 
		s <= s + 1; 
	end if; 
	end process; 

end Behavioral;