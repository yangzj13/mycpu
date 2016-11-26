----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:08 11/24/2016 
-- Design Name: 
-- Module Name:    pc_mux - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_mux is
	port(
		pc_mux_sel_i : in STD_LOGIC;
		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
		pc_branch_i : in STD_LOGIC_VECTOR(15 downto 0);
		pc_mux_o : out STD_LOGIC_VECTOR(15 downto 0)
		);
end pc_mux;

architecture Behavioral of pc_mux is

begin

process(pc_mux_sel_i, pc_branch_i, pc_i)
begin
	case pc_mux_sel_i is
		when '0' =>
			pc_mux_o <= pc_i + 1;
		when '1' =>
			pc_mux_o <= pc_branch_i + 1;
		when others =>
			pc_mux_o <= pc_i + 1;
	end case;
end process;

end Behavioral;

