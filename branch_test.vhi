
-- VHDL Instantiation Created from source file branch_test.vhd -- 00:36:42 11/26/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT branch_test
	PORT(
		branch_ctr_i : IN std_logic_vector(2 downto 0);
		pc_i : IN std_logic_vector(15 downto 0);
		reg_data_i : IN std_logic_vector(15 downto 0);
		imm_i : IN std_logic_vector(15 downto 0);
		forward_sel : IN std_logic;
		forward_data : IN std_logic_vector(15 downto 0);
		ex_reg_dst : IN std_logic_vector(3 downto 0);          
		pc_mux_sel_o : OUT std_logic;
		pc_branch_o : OUT std_logic_vector(15 downto 0);
		forward_addr : OUT std_logic_vector(3 downto 0);
		stall_req_branch : OUT std_logic
		);
	END COMPONENT;

	Inst_branch_test: branch_test PORT MAP(
		branch_ctr_i => ,
		pc_i => ,
		reg_data_i => ,
		imm_i => ,
		pc_mux_sel_o => ,
		pc_branch_o => ,
		forward_sel => ,
		forward_data => ,
		forward_addr => ,
		ex_reg_dst => ,
		stall_req_branch => 
	);


