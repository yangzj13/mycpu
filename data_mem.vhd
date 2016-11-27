----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:00 11/22/2016 
-- Design Name: 
-- Module Name:    data_mem - Behavioral 
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

entity data_mem is
	port(	
		rst : in STD_LOGIC;
		clk : in STD_LOGIC;

		mem_to_reg : in STD_LOGIC;
		
		mem_read : in STD_LOGIC;
		mem_write : in STD_LOGIC;

		addr_i : in STD_LOGIC_VECTOR(15 downto 0);
		data_i : in STD_LOGIC_VECTOR(15 downto 0);
		data_o : out STD_LOGIC_VECTOR(15 downto 0);
		
		--sw_reg_addr : out STD_LOGIC_VECTOR(3 downto 0);
		sw_reg_data : in STD_LOGIC_VECTOR(15 downto 0);

		ram1_en : out STD_LOGIC;
		ram1_we : out STD_LOGIC;
		ram1_oe : out STD_LOGIC;
		ram1_addr : out STD_LOGIC_VECTOR(15 downto 0);
		ram1_data_in : in STD_LOGIC_VECTOR(15 downto 0);
		ram1_data_out : out STD_LOGIC_VECTOR(15 downto 0);
		ram1_hr : out STD_LOGIC
		--ram1_data : inout STD_LOGIC_VECTOR(15 downto 0)

		--ram2_en : out STD_LOGIC;
		--ram2_we : out STD_LOGIC;
		--ram2_oe : out STD_LOGIC;
		--ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
		--ram2_data : inout STD_LOGIC_VECTOR(15 downto 0)
	);
end data_mem;

architecture Behavioral of data_mem is
		
begin
	ram1_we <= not mem_write or not clk; 
	process(clk, rst, mem_read, mem_write, data_i, addr_i, sw_reg_data, ram1_data_in)
	begin
		--if (rst = '0') then
		--	data_o <= x"0000";
		--elsif (falling_edge(clk)) then
		--	data_o <= data_i;
		--end if;
		if (rst = '0') then
			data_o <= x"0000";
			ram1_en <= '1';
			ram1_oe <= '1';
			ram1_data_out <= x"0000";
			ram1_hr <= '0';
		else
			if (mem_read = '1') then
				ram1_en <= '0';
				ram1_oe <= '0';
				data_o <= ram1_data_in;
				ram1_addr <= addr_i;
				ram1_data_out <= (others => 'Z');
				ram1_hr <= '1';
			elsif (mem_write = '1') then
				ram1_en <= '0';
				ram1_oe <= '1';
				ram1_addr <= addr_i;
				ram1_hr <= '0';
				ram1_data_out <= sw_reg_data;
			else
				ram1_en <= '1';
				data_o <= data_i;
			end if;
		end if;
	end process;

end Behavioral;

