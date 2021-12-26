----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:07:25 05/12/2019 
-- Design Name: 
-- Module Name:    x7segb - Behavioral 
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

entity x7segb is
	port(x:in std_logic_vector (15 downto 0);
			clk: in std_logic;
			clr: in std_logic;
			a_to_g: out std_logic_vector (6 downto 0);
			an: out std_logic_vector (3 downto 0);
			dp: out std_logic);
end x7segb;

architecture Behavioral of x7segb is
		signal s: std_logic_vector (1 downto 0);
		signal digit: std_logic_vector (3 downto 0);
		signal aen: std_logic_vector (3 downto 0);
		signal clkdiv: std_logic_vector (20 downto 0);

begin
		s<=clkdiv(20 downto 19);
		dp<='1';
		
		-- set aen (3 downto 0) for leading blenks
		aen(3) <= x(15) or x(14) or x(13) or x(12);
		aen(2) <= x(15) or x(14) or x(13) or x(12) or x(11) or x(10) or x(9) or x(8);
		aen(1) <= x(15) or x(14) or x(13) or x(12) or x(11) or x(10) or x(9) or x(8) or x(7) or x(6) or x(5) or x(4);
		aen(0) <='1'; --digit 0 always on
		
		-- quad 4 to 1 mux
		process(s,x)
		begin
				case s is
						when "00" => digit <= x(3 downto 0);
						when "01" => digit <= x(7 downto 4);
						when "10" => digit <= x(11 downto 8);
						when others => digit <= x(15 downto 12);
				end case;
		end process;
		
		-- 7-segment decoder: hex7seg
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
		
		
		process(s,aen)
		begin
				an<="1111";
				if aen(conv_integer(s))='1' then
						an(conv_integer(s))<='0';
				end if;
		end process;
		
		
		process(clk,clr)
		begin
				if clr='1' then
						clkdiv <=(others =>'0');
				elsif clk' event and clk ='1' then
						clkdiv <= clkdiv + 1;
				end if;
		end process;


end Behavioral;

