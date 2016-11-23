----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:39 11/23/2016 
-- Design Name: 
-- Module Name:    forward_mux - Behavioral 
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

entity forward_mux is
    Port ( origin_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           forward_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           select_forward_data : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end forward_mux;

architecture Behavioral of forward_mux is

begin
	process(origin_data_in,forward_data_in,select_forward_data)
	begin		
		if(select_forward_data = '1') then
			data_out <= forward_data_in;
		else
			data_out <= origin_data_in;
		end if;
	end process;

end Behavioral;

