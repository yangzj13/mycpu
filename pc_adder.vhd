----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:07 11/21/2016 
-- Design Name: 
-- Module Name:    pc_adder - Behavioral 
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

entity pc_adder is
port(
		pc_i : in STD_LOGIC_VECTOR(15 downto 0);
		pc_o : out STD_LOGIC_VECTOR(15 downto 0)
	);
end pc_adder;

architecture Behavioral of pc_adder is
begin

process
begin
	pc_o <= pc_i + x"0001";
end process;

end Behavioral;

