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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
		clk_mem : in STD_LOGIC;
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
		ram1_hr : out STD_LOGIC;
		--ram1_data : inout STD_LOGIC_VECTOR(15 downto 0)
		
		mem_read_en : out STD_LOGIC;
		mem_addr : out STD_LOGIC_VECTOR(15 downto 0);
		mem_write_en : out STD_LOGIC;
		mem_write_data : out STD_LOGIC_VECTOR(15 downto 0);
		inst_i : in STD_LOGIC_VECTOR(15 downto 0);
		
		rdn: out std_logic;
		wrn: out std_logic;
		data_ready: in std_logic;
		tbre: in std_logic;
		tsre: in std_logic
	);
end data_mem;

architecture Behavioral of data_mem is
		
signal IsUartWrite: std_logic;
signal UartReadyLoad: std_logic;
signal UartFallRead: std_logic;
signal UartOut : std_logic_vector(15 downto 0);
signal ram1_write_mode : std_logic;

signal ALUOutMask: std_logic_vector(15 downto 0);
signal MemOutMask: std_logic_vector(15 downto 0);
signal InstOutMask: std_logic_vector(15 downto 0);
signal UartOutMask: std_logic_vector(15 downto 0);

begin
	ram1_we <= not ram1_write_mode or not clk; 
	wrn <= not IsUartWrite or clk;
	rdn <= clk or not UartReadyLoad;

	UartOut(15 downto 2) <= (others => '0');
	with data_ready select
		UartOut(1) <= '1' when '1',
		              '0' when others;
	with tbre and tsre select
		UartOut(0) <= '1' when '1',
		              '0' when others;

	data_o <= (data_i and ALUOutMask) or (ram1_data_in and MemOutMask) or (inst_i and InstOutMask) or (UartOut and UartOutMask);
		
	
	process(clk,rst)
	begin
		--if (rst = '0') then
		--	data_o <= x"0000";
		--elsif (falling_edge(clk)) then
		--	data_o <= data_i;
		--end if;
		if (rst = '0') then
			--data_o <= x"0000";
			ram1_en <= '1';
			ram1_oe <= '1';
			ram1_data_out <= x"0000";
			ram1_hr <= '0';
			mem_read_en <= '0';
			mem_write_en <= '0';
			mem_addr <= (others => '0');
			mem_write_data <= (others => '0');
			ram1_write_mode <= '0';
			uartReadyLoad <= '0';
			isuartwrite <= '0';
		elsif (FALLING_EDGE(clk)) then
		   
			if (mem_read = '1') then
				IsUartWrite <= '0';
				ram1_write_mode <= '0';
				if (addr_i(15) = '0') then --RAM2
					mem_read_en <= '1';
					mem_addr <= addr_i;
					mem_write_en <= '0';
					mem_write_data <= (others => '0');
					
					InstOutMask <= (others => '1');
					ALUOutMask <= (others => '0');
					MemOutMask <= (others => '0');
					UartOutMask <= (others => '0');
					
					ram1_en <= '1';
					ram1_oe <= '1';
					UartReadyLoad <= '0';
				elsif (addr_i(15 downto 0) = x"BF00" OR addr_i(15 downto 0) = x"BF01") then --COM
					case addr_i(3 downto 0) is
						when x"0" => --COM data
							UartReadyLoad <= '1';
							ram1_en <= '1';
							ram1_oe <= '1';
							ram1_data_out <= (others => 'Z');
							ram1_hr <= '1';

							InstOutMask <= (others => '0');
							ALUOutMask <= (others => '0');
							MemOutMask <= (others => '1');
							UartOutMask <= (others => '0');

							mem_read_en <= '0';
							mem_write_en <= '0';
							mem_addr <= (others => '0');
							mem_write_data <= (others => '0');
						when x"1" => --COM state
							UartReadyLoad <= '0';
							ram1_en <= '1';
							ram1_oe <= '1';
							ram1_data_out <= (others => 'Z');
							ram1_hr <= '1';
							mem_read_en <= '0';
							mem_write_en <= '0';
							mem_addr <= (others => '0');
							mem_write_data <= (others => '0');
							
							InstOutMask <= (others => '0');
							ALUOutMask <= (others => '0');
							MemOutMask <= (others => '0');
							UartOutMask <= (others => '1');
							
						when others =>
					end case;
				else --RAM1
					mem_read_en <= '0';
					mem_addr <= (others => '0');
					mem_write_en <= '0';
					mem_write_data <= (others => '0');
					
					ram1_en <= '0';
					ram1_oe <= '0';

					InstOutMask <= (others => '0');
					ALUOutMask <= (others => '0');
					MemOutMask <= (others => '1');
					UartOutMask <= (others => '0');

					ram1_addr <= addr_i;
					ram1_data_out <= (others => 'Z');
					ram1_hr <= '1';
					uartReadyLoad <= '0';
				end if;
			elsif (mem_write = '1') then
				InstOutMask <= (others => '0');
				ALUOutMask <= (others => '1');
				MemOutMask <= (others => '0');
				UartOutMask <= (others => '0');
				UartReadyLoad <= '0';
				if (addr_i(15) = '0') then --RAM2
					ram1_write_mode <= '0';
					mem_read_en <= '0';
					mem_write_en <= '1';
					mem_addr <= addr_i;
					mem_write_data <= sw_reg_data;
					ram1_en <= '0';
					ram1_oe <= '1';
					ram1_addr <= addr_i;
					ram1_hr <= '0';
					ram1_data_out <= sw_reg_data;
					IsUartWrite <= '0';
					
				elsif (addr_i(15 downto 0) = x"BF00") then --COM
					case addr_i(3 downto 0) is
						when x"0" => --COM data
							IsUartWrite <= '1';
							ram1_en <= '1';
							ram1_write_mode <= '0';
							
							ram1_data_out(15 downto 8) <= (others => '0');
							ram1_data_out(7 downto 0) <= sw_reg_data(7 downto 0);
							ram1_hr <= '0';
							mem_read_en <= '0';
							mem_write_en <= '0';
							mem_addr <= (others => '0');
							mem_write_data <= (others => '0');
							
							
							
						when others =>
						
					end case;
				else --RAM1
					isUartWrite <= '0';
					ram1_write_mode <= '1';
					
					mem_read_en <= '0';
					mem_write_en <= '0';
					mem_addr <= (others => '0');
					mem_write_data <= (others => '0');
					
					ram1_en <= '0';
					ram1_addr <= addr_i;
					ram1_hr <= '0';
					ram1_data_out <= sw_reg_data;
				end if;
			else
				InstOutMask <= (others => '0');
				ALUOutMask <= (others => '1');
				MemOutMask <= (others => '0');
				UartOutMask <= (others => '0');
				
				ram1_en <= '1';
				--data_o <= data_i;
				UartReadyLoad <= '0';
				ram1_write_mode <= '0';
				isuartwrite <= '0';
				mem_read_en <= '0';
				mem_write_en <= '0';
				
			end if;
		end if;
	end process;

end Behavioral;

