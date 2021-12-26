----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:34 05/13/2019 
-- Design Name: 
-- Module Name:    mod10cnt - Behavioral 
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

entity mod10cnt is
		Port ( clr : in  STD_LOGIC;           
				clk : in  STD_LOGIC;          
				q : out  STD_LOGIC_VECTOR (13 downto 0);
				m : out  STD_LOGIC_VECTOR (13 downto 0));
				
end mod10cnt;

architecture Behavioral of mod10cnt is
	signal count :STD_LOGIC_VECTOR (13 downto 0);
	signal countm :STD_LOGIC_VECTOR (13 downto 0);
begin
	process(clk,clr)
	begin
		if clr = '1' then 
					count <= (others => '0');
					countm <= countm + 1;
		elsif clk' event and clk = '1' then
				if conv_integer(count) = 59 then 
					count <= (others => '0');
					countm <= countm + 1;
				else
					count <= count + 1;
				end if;
		
		end if;	
	end process;
	q <= count;
	m <= countm;
end Behavioral;
