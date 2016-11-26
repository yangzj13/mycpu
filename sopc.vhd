----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:11 11/22/2016 
-- Design Name: 
-- Module Name:    sopc - Behavioral 
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

entity sopc is
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC
	);
end sopc;

architecture Behavioral of sopc is

component cpu
port(
	rst : in  STD_LOGIC;
    clk : in  STD_LOGIC;
	
	--ram1
	ram1_en : out STD_LOGIC;
	ram1_we : out STD_LOGIC;
	ram1_oe : out STD_LOGIC;
	ram1_addr : out STD_LOGIC_VECTOR(15 downto 0);
	ram1_data_r : in STD_LOGIC_VECTOR(15 downto 0);
	ram1_data_w : out STD_LOGIC_VECTOR(15 downto 0);
	-- ram1_data : inout STD_LOGIC_VECTOR(15 downto 0)
	
	-- ram2
	ram2_en : out STD_LOGIC;
	ram2_we : out STD_LOGIC;
	ram2_oe : out STD_LOGIC;
	ram2_addr : out STD_LOGIC_VECTOR(15 downto 0);
	ram2_data : in STD_LOGIC_VECTOR(15 downto 0)
	-- ram2_data : inout STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component ram2
port(
	ram2_en : in STD_LOGIC;
	ram2_we : in STD_LOGIC;
	ram2_oe : in STD_LOGIC;
	ram2_addr : in STD_LOGIC_VECTOR(15 downto 0);
	ram2_data : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

COMPONENT ram1
PORT(
	ram1_en : IN std_logic;
	ram1_we : IN std_logic;
	ram1_oe : IN std_logic;
	ram1_addr : IN std_logic_vector(15 downto 0);
	ram1_data_w : IN std_logic_vector(15 downto 0);          
	ram1_data_r : OUT std_logic_vector(15 downto 0)
	);
END COMPONENT;

signal ram2_en :  STD_LOGIC;
signal ram2_we :  STD_LOGIC;
signal ram2_oe :  STD_LOGIC;
signal ram2_addr : STD_LOGIC_VECTOR(15 downto 0);
signal ram2_data : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_en :  STD_LOGIC;
signal ram1_we :  STD_LOGIC;
signal ram1_oe :  STD_LOGIC;
signal ram1_addr : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_r : STD_LOGIC_VECTOR(15 downto 0);
signal ram1_data_w : STD_LOGIC_VECTOR(15 downto 0);
begin

u1 : cpu
port map(
	rst => rst,
	clk => clk,
	ram2_oe => ram2_oe,
	ram2_we => ram2_we,
	ram2_en => ram2_en,
	ram2_data => ram2_data,
	ram2_addr => ram2_addr,
	ram1_oe => ram1_oe,
	ram1_we => ram1_we,
	ram1_en => ram1_en,
	ram1_data_r => ram1_data_r,
	ram1_data_w => ram1_data_w,
	ram1_addr => ram1_addr
);

u2 : ram2
port map(
	
	ram2_oe => ram2_oe,
	ram2_we => ram2_we,
	ram2_en => ram2_en,
	ram2_data => ram2_data,
	ram2_addr => ram2_addr
);

Inst_ram1: ram1 PORT MAP(
	ram1_en => ram1_en,
	ram1_we => ram1_we,
	ram1_oe => ram1_oe,
	ram1_addr => ram1_addr,
	ram1_data_r => ram1_data_r,
	ram1_data_w => ram1_data_w
);

end Behavioral;

