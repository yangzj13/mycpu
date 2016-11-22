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
			-- registers data
			reg1_data_i : in STD_LOGIC_VECTOR(15 downto 0);
			reg2_data_i : in STD_LOGIC_VECTOR(15 downto 0);
			rx_o : out STD_LOGIC_VECTOR(15 downto 0);
			ry_o : out STD_LOGIC_VECTOR(15 downto 0);
			-- registers addr
			reg1_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			reg2_addr_o : out STD_LOGIC_VECTOR(3 downto 0);
			-- controll signals
			mem_to_reg : out STD_LOGIC; --ֱ��д��Ĵ���(0)/��ȡRAM(1)
			reg_write : out STD_LOGIC; --�Ƿ�д��Ĵ���
			reg_dst : out STD_LOGIC_VECTOR(3 downto 0); -- Ŀ�ļĴ�����ַ����չΪ4λ��
			alu_op : out STD_LOGIC_VECTOR(3 downto 0)
			-- TODO: other controll signals
		);
end controller;

architecture Behavioral of controller is

begin
	
process(rst, inst_i)
begin
	if (rst = '0') then
		mem_to_reg <= '0';
		reg_write <= '0';
		reg_dst <= "0000";
		alu_op <= "0000";
	else
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
				case inst_i(4 downto 0) is
					--AND
					when "01100" =>
						reg_dst(2 downto 0) <= inst_i(10 downto 8);
						alu_op <= "0010";
					--OR
					when "01101" =>
						reg_dst(2 downto 0) <= inst_i(10 downto 8);
						alu_op <= "0011";
					--CMP
					when "01010" =>
					--SLLV
					when "00100" => 
					--SLLA
					when "00011" =>
					--MFPC/JR
					when "00000" =>
						case inst_i(7 downto 5) is
							--JR
							when "000" =>
							--MFPC
							when "010" =>
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
			--when ""
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
			--when "" =>
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

process (reg1_data_i, reg2_data_i)
begin
	rx_o <= reg1_data_i;
	ry_o <= reg2_data_i;
end process;

end Behavioral;

