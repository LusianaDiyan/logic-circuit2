----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:44 05/08/2019 
-- Design Name: 
-- Module Name:    mux7seg_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux7seg_top is
	port ( btn : in std_logic_vector (3 downto 0);
			a_to_g : out std_logic_vector(6 downto 0);
			dp : out std_logic;
			an : out std_logic_vector (3 downto 0)
			);
end mux7seg_top;

architecture Behavioral of mux7seg_top is
	signal x :std_logic_vector(15 downto 0);
	signal s :std_logic_vector(1 downto 0);
	signal digit:std_logic_vector(3 downto 0);
begin
	x <= x"1234";
	an <= not btn;
	s(1) <= btn(2)or btn(3);
	s(0) <= btn(1) or btn(3);
	dp <= '1';
	process(s)
	begin
			case s is 
				when "00" => digit <= x (3 downto 0);
				when "01" => digit <= x (7 downto 4);
				when "10" => digit <= x (11 downto 8);
				when others => digit <= x (15 downto 12);
			end case;
	end process;
	
	process(digit)
	begin 
		case digit is
			when x"0" => a_to_g <= "0000001";
			when x"1" => a_to_g <= "1001111";
			when x"2" => a_to_g <= "0010010";
			when x"3" => a_to_g <= "0000110";
			when x"4" => a_to_g <= "1001100";
			when x"5" => a_to_g <= "0100100";
			when x"6" => a_to_g <= "0100000";
			when x"7" => a_to_g <= "0001111";
			when x"8" => a_to_g <= "0000000";
			when x"9" => a_to_g <= "0000100";
			when x"A" => a_to_g <= "0001000";
			when x"B" => a_to_g <= "1100000";
			when x"C" => a_to_g <= "0110001";
			when x"D" => a_to_g <= "1000010";
			when x"E" => a_to_g <= "0110000";
			when others => a_to_g <= "0111000";
		end case;
	end process;
end Behavioral;

