----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:50 11/24/2016 
-- Design Name: 
-- Module Name:    branch_test - Behavioral 
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

entity branch_test is
	port(
		branch_ctr_i : in STD_LOGIC_VECTOR(2 downto 0);
		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
		reg_addr_i : in STD_LOGIC_VECTOR(3 downto 0);
		reg_data_i : in STD_LOGIC_VECTOR(15 downto 0);
		imm_i : in STD_LOGIC_VECTOR(15 downto 0);
		pc_mux_sel_o : out STD_LOGIC;
		pc_branch_o : out STD_LOGIC_VECTOR(15 downto 0);

		forward_sel : in STD_LOGIC;
		forward_data : in STD_LOGIC_VECTOR(15 downto 0);
		forward_addr : out STD_LOGIC_VECTOR(3 downto 0);
		
		ex_reg_dst : in STD_LOGIC_VECTOR(3 downto 0);
		stall_req_branch : out STD_LOGIC
	);
end branch_test;

architecture Behavioral of branch_test is
signal reg_data : STD_LOGIC_VECTOR(15 downto 0);
begin
	
	with forward_sel select
		reg_data <= reg_data_i when '0',
					forward_data when '1',
					reg_data_i when others;
	forward_addr <= reg_addr_i;

process(branch_ctr_i, pc_i, reg_data_i, imm_i)
begin

	if (ex_reg_dst /= "0000" and ex_reg_dst = reg_addr_i) then
		stall_req_branch <= '1';
	else 
		stall_req_branch <= '0';
	end if;

	case branch_ctr_i is
		--not branch or jump
		when "000" =>
			pc_mux_sel_o <= '0';
			pc_branch_o <= x"0000";
		--B
		when "001" =>
			pc_mux_sel_o <= '1';
			pc_branch_o <= pc_i + imm_i;		
		--BEQZ
		when "010" =>
			if (reg_data_i = x"0000") then
				pc_mux_sel_o <= '1';
				pc_branch_o <= pc_i + imm_i;
			else 
				pc_mux_sel_o <= '0';
				pc_branch_o <= x"0000";
			end if;
		--BNEZ
		when "100" =>
			if (reg_data_i /= x"0000") then
				pc_mux_sel_o <= '1';
				pc_branch_o <= pc_i + imm_i;
			else 
				pc_mux_sel_o <= '0';
				pc_branch_o <= x"0000";
			end if;
		--BTEQZ
		when "101" =>
			if (reg_data_i = x"0000") then
				pc_mux_sel_o <= '1';
				pc_branch_o <= pc_i + imm_i;
			else 
				pc_mux_sel_o <= '0';
				pc_branch_o <= x"0000";
			end if;
		--JR
		when "111" =>
			pc_mux_sel_o <= '1';
			pc_branch_o <= reg_data_i;
		when others =>
			pc_mux_sel_o <= '0';
			pc_branch_o <= x"0000";
 	end case;
end process;

end Behavioral;

