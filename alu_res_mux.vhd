----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:55 11/23/2016 
-- Design Name: 
-- Module Name:    alu_res_mux - Behavioral 
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
-- use constants.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_res_mux is
	port(
			alu_res_i : in STD_LOGIC_VECTOR(15 downto 0);
			alu_flag_i : in STD_LOGIC_VECTOR(3 downto 0);
			res_flag_i : in STD_LOGIC_VECTOR(2 downto 0);
			ex_res_o : out STD_LOGIC_VECTOR(15 downto 0)
			);
end alu_res_mux;

architecture Behavioral of alu_res_mux is

begin

process(alu_res_i, alu_flag_i, res_flag_i)
begin
	case res_flag_i is
		--alu
		when "000" =>
			ex_res_o <= alu_res_i;
		--eq
		when "101" =>
			ex_res_o(15 downto 1) <= "000000000000000";
			ex_res_o(0) <= not alu_flag_i(2);
		--sl
		when "110" =>
			ex_res_o(15 downto 1) <= "000000000000000";
			ex_res_o(0) <= alu_flag_i(1) xor alu_flag_i(0);
		when others =>
			ex_res_o <= alu_res_i;
	end case;
end process;

end Behavioral;

