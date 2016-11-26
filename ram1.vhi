
-- VHDL Instantiation Created from source file ram1.vhd -- 01:16:38 11/27/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_ram1: ram1 PORT MAP(
		ram1_en => ,
		ram1_we => ,
		ram1_oe => ,
		ram1_addr => ,
		ram1_data_r => ,
		ram1_data_w => 
	);


