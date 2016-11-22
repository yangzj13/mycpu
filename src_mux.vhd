----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:18 11/22/2016 
-- Design Name: 
-- Module Name:    src_mux - Behavioral 
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
--use constants.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity src_mux is
	port(
		a_src_i : in STD_LOGIC_VECTOR(1 downto 0);
		b_src_i : in STD_LOGIC_VECTOR(1 downto 0);
		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
		rx_i : in STD_LOGIC_VECTOR(15 downto 0);
		ry_i : in STD_LOGIC_VECTOR(15 downto 0);
		imm_i : in STD_LOGIC_VECTOR(15 downto 0);
		a_o : out STD_LOGIC_VECTOR(15 downto 0);
		b_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
end src_mux;

architecture Behavioral of src_mux is

constant src_r : std_logic_vector := "00";
constant src_pc : std_logic_vector := "01";
constant src_0 : std_logic_vector := "10";
constant src_imm : std_logic_vector := "11";

begin
	process(a_src_i, pc_i, rx_i, imm_i)
	begin
		case a_src_i is
			when src_r => a_o <= rx_i;
			when src_pc => a_o <= pc_i;
			when src_0 => a_o <= x"0000";
			when src_imm => a_o <= imm_i;
			when others => a_o <= x"0000";
		end case;
	end process;

	process(b_src_i, pc_i, ry_i, imm_i)
	begin
		case b_src_i is
			when src_r => b_o <= ry_i;
			when src_pc => b_o <= pc_i;
			when src_0 => b_o <= x"0000";
			when src_imm => b_o <= imm_i;
			when others => b_o <= x"0000";
		end case;
	end process;

end Behavioral;

