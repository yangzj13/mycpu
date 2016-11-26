/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/ram2.vhd";



static void work_a_2328576589_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    int t14;
    int t15;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    int t32;
    char *t33;
    int t35;
    char *t36;
    int t38;
    char *t39;
    int t41;
    char *t42;
    int t44;
    char *t45;
    int t47;
    char *t48;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t11 = (t4 == (unsigned char)2);
    if (t11 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3152);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 5019);
    t6 = (t0 + 3232);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1512U);
    t6 = *((char **)t1);
    t1 = (t0 + 5035);
    t14 = xsi_mem_cmp(t1, t6, 16U);
    if (t14 == 1)
        goto LAB11;

LAB25:    t8 = (t0 + 5051);
    t15 = xsi_mem_cmp(t8, t6, 16U);
    if (t15 == 1)
        goto LAB12;

LAB26:    t10 = (t0 + 5067);
    t17 = xsi_mem_cmp(t10, t6, 16U);
    if (t17 == 1)
        goto LAB13;

LAB27:    t18 = (t0 + 5083);
    t20 = xsi_mem_cmp(t18, t6, 16U);
    if (t20 == 1)
        goto LAB14;

LAB28:    t21 = (t0 + 5099);
    t23 = xsi_mem_cmp(t21, t6, 16U);
    if (t23 == 1)
        goto LAB15;

LAB29:    t24 = (t0 + 5115);
    t26 = xsi_mem_cmp(t24, t6, 16U);
    if (t26 == 1)
        goto LAB16;

LAB30:    t27 = (t0 + 5131);
    t29 = xsi_mem_cmp(t27, t6, 16U);
    if (t29 == 1)
        goto LAB17;

LAB31:    t30 = (t0 + 5147);
    t32 = xsi_mem_cmp(t30, t6, 16U);
    if (t32 == 1)
        goto LAB18;

LAB32:    t33 = (t0 + 5163);
    t35 = xsi_mem_cmp(t33, t6, 16U);
    if (t35 == 1)
        goto LAB19;

LAB33:    t36 = (t0 + 5179);
    t38 = xsi_mem_cmp(t36, t6, 16U);
    if (t38 == 1)
        goto LAB20;

LAB34:    t39 = (t0 + 5195);
    t41 = xsi_mem_cmp(t39, t6, 16U);
    if (t41 == 1)
        goto LAB21;

LAB35:    t42 = (t0 + 5211);
    t44 = xsi_mem_cmp(t42, t6, 16U);
    if (t44 == 1)
        goto LAB22;

LAB36:    t45 = (t0 + 5227);
    t47 = xsi_mem_cmp(t45, t6, 16U);
    if (t47 == 1)
        goto LAB23;

LAB37:
LAB24:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5451);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);

LAB10:    goto LAB3;

LAB7:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t12 = *((unsigned char *)t5);
    t13 = (t12 == (unsigned char)3);
    t3 = t13;
    goto LAB9;

LAB11:    xsi_set_current_line(52, ng0);
    t48 = (t0 + 5243);
    t50 = (t0 + 3232);
    t51 = (t50 + 56U);
    t52 = *((char **)t51);
    t53 = (t52 + 56U);
    t54 = *((char **)t53);
    memcpy(t54, t48, 16U);
    xsi_driver_first_trans_fast_port(t50);
    goto LAB10;

LAB12:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 5259);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB13:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 5275);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB14:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 5291);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB15:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 5307);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB16:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 5323);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB17:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 5339);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB18:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 5355);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB19:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 5371);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB20:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 5387);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB21:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 5403);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB22:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 5419);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB23:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 5435);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB38:;
}


extern void work_a_2328576589_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2328576589_3212880686_p_0};
	xsi_register_didat("work_a_2328576589_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_2328576589_3212880686.didat");
	xsi_register_executes(pe);
}
