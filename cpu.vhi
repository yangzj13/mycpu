
-- VHDL Instantiation Created from source file cpu.vhd -- 18:27:48 11/24/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT cpu
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		ram1_data : IN std_logic_vector(15 downto 0);
		ram2_data : IN std_logic_vector(15 downto 0);          
		ram1_en : OUT std_logic;
		ram1_we : OUT std_logic;
		ram1_oe : OUT std_logic;
		ram1_addr : OUT std_logic_vector(15 downto 0);
		ram2_en : OUT std_logic;
		ram2_we : OUT std_logic;
		ram2_oe : OUT std_logic;
		ram2_addr : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_cpu: cpu PORT MAP(
		rst => ,
		clk => ,
		ram1_en => ,
		ram1_we => ,
		ram1_oe => ,
		ram1_addr => ,
		ram1_data => ,
		ram2_en => ,
		ram2_we => ,
		ram2_oe => ,
		ram2_addr => ,
		ram2_data => 
	);


