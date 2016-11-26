
-- VHDL Instantiation Created from source file data_mem.vhd -- 00:53:43 11/27/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT data_mem
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		mem_to_reg : IN std_logic;
		mem_read : IN std_logic;
		mem_write : IN std_logic;
		addr_i : IN std_logic_vector(15 downto 0);
		data_i : IN std_logic_vector(15 downto 0);
		sw_reg_data : IN std_logic_vector(15 downto 0);
		ram1_data_in : IN std_logic_vector(15 downto 0);          
		data_o : OUT std_logic_vector(15 downto 0);
		ram1_en : OUT std_logic;
		ram1_we : OUT std_logic;
		ram1_oe : OUT std_logic;
		ram1_addr : OUT std_logic_vector(15 downto 0);
		ram1_data_out : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_data_mem: data_mem PORT MAP(
		rst => ,
		clk => ,
		mem_to_reg => ,
		mem_read => ,
		mem_write => ,
		addr_i => ,
		data_i => ,
		data_o => ,
		sw_reg_data => ,
		ram1_en => ,
		ram1_we => ,
		ram1_oe => ,
		ram1_addr => ,
		ram1_data_in => ,
		ram1_data_out => 
	);


