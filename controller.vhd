----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:20 11/21/2016 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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

entity controller is
		port(
			rst : in STD_LOGIC;
			pc_i : in STD_LOGIC_VECTOR(15 downto 0);
			inst_i : in STD_LOGIC_VECTOR(15 downto 0);
			-- registers addr
			reg1_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			reg2_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			-- controll signals
			mem_to_reg : out STD_LOGIC; 
			reg_write : out STD_LOGIC;
			reg_dst : out STD_LOGIC_VECTOR(3 downto 0);
			alu_op : out STD_LOGIC_VECTOR(3 downto 0);
			extend_o : out STD_LOGIC_VECTOR(3 downto 0);
			a_src_o : out STD_LOGIC_VECTOR(1 downto 0);
			b_src_o : out STD_LOGIC_VECTOR(1 downto 0);
			
			-- TODO: other controll signals
			
			--Add   To change T reg
			res_flag_o : out STD_LOGIC_VECTOR(2 downto 0)
		);
end controller;

architecture Behavioral of controller is

constant res_alu : std_logic_vector := "000";
constant res_eq : std_logic_vector := "101";  
constant res_sl : std_logic_vector := "110";  

begin
	
process(rst, inst_i)
begin
	if (rst = '0') then
		mem_to_reg <= '0';
		reg_write <= '0';
		reg_dst <= "0000";
		alu_op <= "0000";
		extend_o <= "0000";
		a_src_o <= "00";
		b_src_o <= "00";
		res_flag_o <= res_alu;
	else
		res_flag_o <= res_alu;  --¨ª¦Ì¨¤¨¢¡ê????¨¨??¨¨?????0
		case inst_i(15 downto 11) is
			-- AND/OR/CMP/JR/MFPC/SLLV/SLTU
			when "11101" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg1_addr_o(3) <= '1';
				reg2_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
				reg2_addr_o(2 downto 0) <= inst_i(7 downto 5);
				extend_o <= "0000";
				case inst_i(4 downto 0) is
					--AND
					when "01100" =>
						reg_dst(2 downto 0) <= inst_i(10 downto 8);
						alu_op <= "0010";
						a_src_o <= "00";
						b_src_o <= "00";
					--OR
					when "01101" =>
						reg_dst(2 downto 0) <= inst_i(10 downto 8);
						alu_op <= "0011";
						a_src_o <= "00";
						b_src_o <= "00";
					--CMP
					when "01010" =>
						reg_dst <= "0001";
						alu_op <= "0100";
						a_src_o <= "00";
						b_src_o <= "00";
						res_flag_o <= res_eq;
					--SLLV
					when "00100" => 
						reg_dst(2 downto 0) <= inst_i(7 downto 5);
						alu_op <= "0110";
						a_src_o <= "00";
						b_src_o <= "00";
						-- rx ¨®? ry ¦Ì??3D¨°¨®?????¦Ì??¨¤¡¤¡ä
						reg1_addr_o(2 downto 0) <= inst_i(7 downto 5);
						reg2_addr_o(2 downto 0) <= inst_i(10 downto 8);
					--SLTU
					when "00011" =>
						reg_dst <= "0001";
						alu_op <= "0001";
						a_src_o <= "00";
						b_src_o <= "00";
						res_flag_o <= res_sl;
					--MFPC/JR
					when "00000" =>
						case inst_i(7 downto 5) is
							--JR
							when "000" =>
							--MFPC
							when "010" =>
								mem_to_reg <= '0';
								reg_write <= '1';
								reg_dst(3) <= '1';
								reg_dst(2 downto 0) <= inst_i(10 downto 8);
								reg1_addr_o <= "0000";
								reg2_addr_o <= "0000";
								extend_o <= "0000";
								a_src_o <= "01";
								b_src_o <= "00";
								alu_op <= "0000";
							when others =>
							
						end case;
					--ERROR
					when others =>
						reg_dst(2 downto 0) <= "111";
						alu_op <= "0000";
				end case;
			-- ADDU/SUBU
			when "11100" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg_dst(2 downto 0) <= inst_i(4 downto 2);
				reg1_addr_o(3) <= '1';
				reg2_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
				reg2_addr_o(2 downto 0) <= inst_i(7 downto 5);
				a_src_o <= "00";
				b_src_o <= "00";
				extend_o <= "0000";
				case inst_i(1 downto 0) is
					--ADDU
					when "01" =>
						alu_op <= "0000";
					--SUBU
					when "11" =>
						alu_op <= "0001";
					--ERROR
					when others =>
				end case;
			-- ADDIU
			when "01001" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg_dst(2 downto 0) <= inst_i(10 downto 8);
				reg1_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
				reg2_addr_o <= "0000";
				extend_o <= "1001";
				a_src_o <= "00";
				b_src_o <= "11";
				alu_op <= "0000";
			-- ADDIU3
			when "01000" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg_dst(2 downto 0) <= inst_i(7 downto 5);
				reg1_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
				reg2_addr_o <= "0000";
				-- imm 0+[3-0]
				extend_o <= "1011";
				a_src_o <= "00";
				b_src_o <= "11";
				alu_op <= "0000";
			-- ADDSP / BTEQZ / MTSP
			when "01100" =>
				case inst_i(10 downto 8) is
					--ADDSP
					when "011" =>
						mem_to_reg <= '0';
						reg_write <= '1';
						--Reg SP
						reg_dst <= "0100";
						reg1_addr_o <= "0100";
						reg2_addr_o <= "0000";
						extend_o <= "1001";
						a_src_o <= "00";
						b_src_o <= "11";
						alu_op <= "0000";
					--BTEQZ
					when "000" =>
						
					--MTSP
					when "100" =>
						mem_to_reg <= '0';
						reg_write <= '1';
						reg_dst <= "0100";
						reg1_addr_o(3) <= '1';
						reg1_addr_o(2 downto 0) <= inst_i(7 downto 5);
						reg2_addr_o <= "0000";
						extend_o <= "0000";
						a_src_o <= "00";
						b_src_o <= "10";
						alu_op <= "0000";
					--ERROR
					when others =>
				end case;
			--LI
			when "01101" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg_dst(2 downto 0) <= inst_i(10 downto 8);
				reg1_addr_o <= "0000";
				reg2_addr_o <= "0000";
				extend_o <= "1000";
				a_src_o <= "00";
				b_src_o <= "11";
				alu_op <= "0000";
			-- MFIH / MTIH
			when "11110" =>
				case inst_i(7 downto 0) is
					--MFIH
					when "00000000" =>
						mem_to_reg <= '0';
						reg_write <= '1';
						reg_dst(3) <= '1';
						reg_dst(2 downto 0) <= inst_i(10 downto 8);
						reg1_addr_o <= "0010";
						reg2_addr_o <= "0000";
						extend_o <= "0000";
						a_src_o <= "00";
						b_src_o <= "00";
						alu_op <= "0000";
					--MTIH
					when "00000001" =>
						mem_to_reg <= '0';
						reg_write <= '1';
						reg_dst <= "0010";
						reg1_addr_o(3) <= '1';
						reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
						reg2_addr_o <= "0000";
						extend_o <= "0000";
						a_src_o <= "00";
						b_src_o <= "00";
						alu_op <= "0000";
					--ERROR
					when others =>
				end case;
			-- SLL / SRA / SRL
			when "00110" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg_dst(3) <= '1';
				reg_dst(2 downto 0) <= inst_i(10 downto 8);
				reg1_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(7 downto 5);
				reg2_addr_o <= "0000";
				a_src_o <= "00";
				b_src_o <= "11";
				if(inst_i(4 downto 2) = "000") then 
					extend_o <= "0111";
				else
					extend_o <= "1110";
				end if;
				case inst_i(1 downto 0) is
					--SLL
					when "00" =>
						alu_op <= "0110";
					--SRA
					when "11" =>
						alu_op <= "1000";
					--SRL	
					when "10" =>
						alu_op <= "0111";
					--ERROR
					when others =>
				end case;
			--CMPI
			when "01110" =>
				mem_to_reg <= '0';
				reg_write <= '1';
				reg1_addr_o(3) <= '1';
				reg1_addr_o(2 downto 0) <= inst_i(10 downto 8);
				reg2_addr_o <= "0000";
				extend_o <= "1001";
				reg_dst <= "0001";
				alu_op <= "0001";
				a_src_o <= "00";
				b_src_o <= "00";
				res_flag_o <= res_eq;
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
			when others =>
				mem_to_reg <= '0';
				reg_write <= '0';
				reg_dst <= "0000";
				alu_op <= "0000";
		end case;
	end if;
end process;

end Behavioral;