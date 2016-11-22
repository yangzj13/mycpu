----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:10 11/22/2016 
-- Design Name: 
-- Module Name:    extend - Behavioral 
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

entity extend is
	port(
		extend_i : in STD_LOGIC_VECTOR(3 downto 0);
		inst_i : in STD_LOGIC_VECTOR(15 downto 0);
		imm_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
end extend;

architecture Behavioral of extend is

begin

process(extend_i, inst_i)
variable front : STD_LOGIC;
begin
	if (extend_i(0) = '0') then
		front := '0';
	else 
		case extend_i(2 downto 1) is
			--'7--0'
			when "00" =>
				front := inst_i(7);
			--'4--0'
			when "01" =>
				front := inst_i(4); 
			--'10--0'
			when "10" =>
				front := inst_i(10);
			--'4--2'
			when "11" =>
				front := inst_i(4);
			when others =>
				front := '0';
		end case;
	end if;

	if (extend_i(3) = '1') then
		imm_o <= (others => front);
		case extend_i(2 downto 1) is
			--'7--0'
			when "00" =>
				imm_o(7 downto 0) <= inst_i(7 downto 0);
			--'4--0'
			when "01" =>
				imm_o(4 downto 0) <= inst_i(4 downto 0);
			--'10--0'
			when "10" =>
				imm_o(10 downto 0) <= inst_i(10 downto 0);
			--'4--2'
			when "11" =>
				imm_o(2 downto 0) <= inst_i(4 downto 2);
			when others =>
				imm_o <= x"0000";
		end case;
	else
		imm_o <= x"0000";
	end if;
end process;

end Behavioral;

