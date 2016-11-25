----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:55:06 11/22/2016 
-- Design Name: 
-- Module Name:    forwarding_unit - Behavioral 
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

entity forwarding_unit is
    Port ( 
			rst : in STD_LOGIC;
			mem_data : in  STD_LOGIC_VECTOR (15 downto 0);
           	mem_reg : in  STD_LOGIC_VECTOR (3 downto 0);
			  
           	wb_data : in  STD_LOGIC_VECTOR (15 downto 0);
           	wb_reg : in  STD_LOGIC_VECTOR (3 downto 0);
           
			rx_cur : in  STD_LOGIC_VECTOR (3 downto 0);
           	ry_cur : in  STD_LOGIC_VECTOR (3 downto 0);
           
			data_A : out  STD_LOGIC_VECTOR (15 downto 0);
           	data_B : out  STD_LOGIC_VECTOR (15 downto 0);
           	select_data_A : out  STD_LOGIC;
           	select_data_B : out  STD_LOGIC;

           	branch_reg : in STD_LOGIC_VECTOR(3 downto 0);
           	branch_data : out STD_LOGIC_VECTOR(15 downto 0);
           	branch_sel : out STD_LOGIC
           	);
end forwarding_unit;

architecture Behavioral of forwarding_unit is

begin
	process(rst,mem_data,mem_reg,wb_data,wb_reg, rx_cur, ry_cur)
	begin
		if (rst = '0') then
			select_data_A <= '0';
			data_A <= x"0000";
		else
			if((wb_reg = rx_cur) and (wb_reg /= "0000")) or ((mem_reg = rx_cur) and (mem_reg /= "0000")) then
				if(mem_reg = rx_cur) then
					data_A <= mem_data;
					select_data_A <='1';
				else
					data_A <= wb_data;
					select_data_A <='1';
				end if;
			else
				select_data_A <= '0';
				data_A <= x"0000";
			end if;
		end if;
	end process;
	
	process(rst, mem_data,mem_reg,wb_data,wb_reg, rx_cur, ry_cur)
	begin		
		if (rst = '0') then
			select_data_B <= '0';
			data_B <= x"0000";
		else
			if((wb_reg = ry_cur) and (wb_reg /= "0000")) or ((mem_reg = ry_cur) and (mem_reg /= "0000")) then
				if(mem_reg = ry_cur) then
					data_B <= mem_data;
					select_data_B <='1';
				else
					data_B <= wb_data;
					select_data_B <='1';
				end if;
			else
				select_data_B <= '0';
				data_B <= x"0000";
			end if;
		end if;
	end process;

	process(rst, branch_reg, mem_data, mem_reg, wb_data, wb_reg)
	begin
		if (rst = '0') then
			branch_sel <= '0';
			branch_data <= x"0000";
		else
			if((wb_reg = branch_reg) and (wb_reg /= "0000")) or ((mem_reg = branch_reg) and (mem_reg /= "0000")) then
				if (mem_reg = branch_reg) then
					branch_sel <= '1';
					branch_data <= mem_data;
				else 
					branch_sel <= '1';
					branch_data <= wb_data;
				end if;
			else 
				branch_sel <= '0';
				branch_data <= x"0000";
			end if;
		end if;
	end process;

end Behavioral;

