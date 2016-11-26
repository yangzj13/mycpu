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
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

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
    t1 = (t0 + 4991);
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
    t1 = (t0 + 5007);
    t14 = xsi_mem_cmp(t1, t6, 16U);
    if (t14 == 1)
        goto LAB11;

LAB20:    t8 = (t0 + 5023);
    t15 = xsi_mem_cmp(t8, t6, 16U);
    if (t15 == 1)
        goto LAB12;

LAB21:    t10 = (t0 + 5039);
    t17 = xsi_mem_cmp(t10, t6, 16U);
    if (t17 == 1)
        goto LAB13;

LAB22:    t18 = (t0 + 5055);
    t20 = xsi_mem_cmp(t18, t6, 16U);
    if (t20 == 1)
        goto LAB14;

LAB23:    t21 = (t0 + 5071);
    t23 = xsi_mem_cmp(t21, t6, 16U);
    if (t23 == 1)
        goto LAB15;

LAB24:    t24 = (t0 + 5087);
    t26 = xsi_mem_cmp(t24, t6, 16U);
    if (t26 == 1)
        goto LAB16;

LAB25:    t27 = (t0 + 5103);
    t29 = xsi_mem_cmp(t27, t6, 16U);
    if (t29 == 1)
        goto LAB17;

LAB26:    t30 = (t0 + 5119);
    t32 = xsi_mem_cmp(t30, t6, 16U);
    if (t32 == 1)
        goto LAB18;

LAB27:
LAB19:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 5231);
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

LAB11:    goto LAB10;

LAB12:    xsi_set_current_line(56, ng0);
    t33 = (t0 + 5135);
    t35 = (t0 + 3232);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memcpy(t39, t33, 16U);
    xsi_driver_first_trans_fast_port(t35);
    goto LAB10;

LAB13:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 5151);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB14:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 5167);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB15:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 5183);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB16:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 5199);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB17:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 5215);
    t5 = (t0 + 3232);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB10;

LAB18:    goto LAB10;

LAB28:;
}


extern void work_a_2328576589_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2328576589_3212880686_p_0};
	xsi_register_didat("work_a_2328576589_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_2328576589_3212880686.didat");
	xsi_register_executes(pe);
}
