----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:36:57 05/08/2019 
-- Design Name: 
-- Module Name:    x7seg_top - Behavioral 
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

entity x7seg_top is
	port(mclk: in std_logic;
			btn:in std_logic;
			a_to_g: out std_logic_vector (6 downto 0);
			an: out std_logic_vector (3 downto 0);
			dp: out std_logic);
end x7seg_top;

architecture Behavioral of x7seg_top is
		component x7seg is
				port(x: in std_logic_vector(15 downto 0);
					clk: in std_logic;
					clr: in std_logic;
					a_to_g: out std_logic_vector(6 downto 0);
					an: out std_logic_vector(3 downto 0);
					dp: out std_logic);
		end component;
		signal x: std_logic_vector(15 downto 0);
begin
		x<=x"1234";
		x1: x7seg port map
		(x=>x, clk=>mclk, clr=>btn, a_to_g=>a_to_g,an=>an,dp=>dp);
end Behavioral;

