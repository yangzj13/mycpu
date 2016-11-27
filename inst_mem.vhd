----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:58 11/22/2016 
-- Design Name: 
-- Module Name:    inst_mem - Behavioral 
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

entity inst_mem is
	port(
	rst : in STD_LOGIC;
	clk : in STD_LOGIC;

	inst_addr_i : in STD_LOGIC_VECTOR(15 downto 0);
	inst_i : in STD_LOGIC_VECTOR(15 downto 0);
	inst_o : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_en : out STD_LOGIC;
	ram2_we : out STD_LOGIC;
	ram2_oe : out STD_LOGIC;
	ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_data_o : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_hr : out STD_LOGIC;
	mem_read_en : in STD_LOGIC;
	mem_addr : in STD_LOGIC_VECTOR(15 downto 0);
	mem_write_en : in STD_LOGIC;
	mem_write_data : in STD_LOGIC_VECTOR(15 downto 0);
	stall_req_if : out STD_LOGIC
);
end inst_mem;

architecture Behavioral of inst_mem is

begin
	ram2_we <= not mem_write_en or not clk;
	process(clk, rst ,inst_i, inst_addr_i, mem_read_en, mem_addr, mem_write_en, mem_write_data)
	begin
		if (rst = '0') then
			ram2_en <= '1';
			ram2_oe <= '1';
			ram2_addr <= x"0000";
			--inst_i <= x"0000";
			inst_o <= x"0000";
			ram2_hr <= '0';
			ram2_data_o <= (others => '0');
			stall_req_if <= '0';
		else
			ram2_en <= '0';
			if (mem_read_en = '1') then
				stall_req_if <= '1';
				ram2_oe <= '0';
				ram2_addr <= mem_addr;
				ram2_data_o <= (others => 'Z');
				inst_o <= inst_i;
				ram2_hr <= '1';
			elsif (mem_write_en = '1') then
				stall_req_if <= '1';
				ram2_oe <= '1';
				ram2_addr <= mem_addr;
				ram2_data_o <= mem_write_data;
				inst_o <= (others => '0');
				ram2_hr <= '0';
			else
				ram2_addr <= inst_addr_i;
				ram2_oe <= '0';
				ram2_data_o <= (others => 'Z');
				ram2_hr <= '1';
				inst_o <= inst_i;
				stall_req_if <= '0';
			end if;
		end if;
	end process;

end Behavioral;

