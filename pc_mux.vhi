
-- VHDL Instantiation Created from source file pc_mux.vhd -- 00:38:20 11/26/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pc_mux
	PORT(
		pc_mux_sel_i : IN std_logic;
		pc_i : IN std_logic_vector(15 downto 0);
		pc_branch_i : IN std_logic_vector(15 downto 0);          
		pc_mux_o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_pc_mux: pc_mux PORT MAP(
		pc_mux_sel_i => ,
		pc_i => ,
		pc_branch_i => ,
		pc_mux_o => 
	);


