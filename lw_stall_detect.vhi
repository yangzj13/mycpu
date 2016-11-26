
-- VHDL Instantiation Created from source file lw_stall_detect.vhd -- 00:38:37 11/26/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT lw_stall_detect
	PORT(
		reg_1 : IN std_logic_vector(3 downto 0);
		reg_2 : IN std_logic_vector(3 downto 0);
		reg_w : IN std_logic_vector(3 downto 0);
		mem_read : IN std_logic;          
		stall_req_lw : OUT std_logic
		);
	END COMPONENT;

	Inst_lw_stall_detect: lw_stall_detect PORT MAP(
		reg_1 => ,
		reg_2 => ,
		reg_w => ,
		mem_read => ,
		stall_req_lw => 
	);


