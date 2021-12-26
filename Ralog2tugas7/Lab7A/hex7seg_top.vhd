----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:17 05/08/2019 
-- Design Name: 
-- Module Name:    hex7seg_top - Behavioral 
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

entity hex7seg_top is
port(sw :in std_logic_vector(3 downto 0);
		a_to_g : out std_logic_vector(6 downto 0);
		an : out std_logic_vector(3 downto 0);
		dp:out std_logic);
end hex7seg_top;

architecture Behavioral of hex7seg_top is
	component hex7segb is 
	port(
		x:in std_logic_vector (3 downto 0);
		a_to_g:out std_logic_vector(6 downto 0)
	);
	end component;
begin
	an <= "0000";
	dp <= '1';
	d4:hex7segb port map(
	x=>sw,
	a_to_g=>a_to_g
	);

end Behavioral;

