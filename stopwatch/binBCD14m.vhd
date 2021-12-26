----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:09 05/13/2019 
-- Design Name: 
-- Module Name:    binBCD14 - Behavioral 
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

entity binBCD14m is
	Port ( m : in  STD_LOGIC_VECTOR (13 downto 0);           
			mn : out  STD_LOGIC_VECTOR (16 downto 0));
end binBCD14m;

architecture Behavioral of binBCD14m is

begin
		process(m)
				variable z : STD_LOGIC_VECTOR (32 downto 0);
		begin
				for i in 0 to 32 loop
						z(i) := '0';
				end loop;
				z(16 downto 3) := m; 
				for i in 0 to 10 loop	
						if z(17 downto 14) > 4 then 
								z(17 downto 14) := z(17 downto 14) + 3; 
						end if;
						if z(21 downto 18) > 4 then 
								z(21 downto 18) := z(21 downto 18) + 3; 
						end if; 	
						if z(25 downto 22) > 4 then 
								z(25 downto 22) := z(25 downto 22) + 3; 
						end if;							
						if z(29 downto 26) > 4 then 
								z(29 downto 26) := z(29 downto 26) + 3; 
						end if; 	
						z(32 downto 1) := z(31 downto 0);
					end loop;
					mn <= z(30 downto 14);
				end process;	
end Behavioral;
