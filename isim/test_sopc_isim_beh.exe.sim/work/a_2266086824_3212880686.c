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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/src_mux.vhd";



static void work_a_2266086824_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2448U);
    t3 = *((char **)t1);
    t4 = xsi_mem_cmp(t3, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t1 = (t0 + 2568U);
    t5 = *((char **)t1);
    t6 = xsi_mem_cmp(t5, t2, 2U);
    if (t6 == 1)
        goto LAB4;

LAB9:    t1 = (t0 + 2688U);
    t7 = *((char **)t1);
    t8 = xsi_mem_cmp(t7, t2, 2U);
    if (t8 == 1)
        goto LAB5;

LAB10:    t1 = (t0 + 2808U);
    t9 = *((char **)t1);
    t10 = xsi_mem_cmp(t9, t2, 2U);
    if (t10 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 6972);
    t3 = (t0 + 4456);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t9 = (t7 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 4360);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1512U);
    t11 = *((char **)t1);
    t1 = (t0 + 4456);
    t12 = (t1 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4456);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 6956);
    t3 = (t0 + 4456);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t9 = (t7 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB6:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4456);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:;
}

static void work_a_2266086824_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2448U);
    t3 = *((char **)t1);
    t4 = xsi_mem_cmp(t3, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t1 = (t0 + 2568U);
    t5 = *((char **)t1);
    t6 = xsi_mem_cmp(t5, t2, 2U);
    if (t6 == 1)
        goto LAB4;

LAB9:    t1 = (t0 + 2688U);
    t7 = *((char **)t1);
    t8 = xsi_mem_cmp(t7, t2, 2U);
    if (t8 == 1)
        goto LAB5;

LAB10:    t1 = (t0 + 2808U);
    t9 = *((char **)t1);
    t10 = xsi_mem_cmp(t9, t2, 2U);
    if (t10 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 7004);
    t3 = (t0 + 4520);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t9 = (t7 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 4376);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1672U);
    t11 = *((char **)t1);
    t1 = (t0 + 4520);
    t12 = (t1 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4520);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 6988);
    t3 = (t0 + 4520);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t9 = (t7 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB6:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4520);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:;
}


extern void work_a_2266086824_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2266086824_3212880686_p_0,(void *)work_a_2266086824_3212880686_p_1};
	xsi_register_didat("work_a_2266086824_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_2266086824_3212880686.didat");
	xsi_register_executes(pe);
}
