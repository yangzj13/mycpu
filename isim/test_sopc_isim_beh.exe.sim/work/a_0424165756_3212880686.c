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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/extend.vhd";



static void work_a_0424165756_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (0 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (3 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 4797);
    t3 = xsi_mem_cmp(t9, t1, 2U);
    if (t3 == 1)
        goto LAB6;

LAB11:    t11 = (t0 + 4799);
    t13 = xsi_mem_cmp(t11, t1, 2U);
    if (t13 == 1)
        goto LAB7;

LAB12:    t14 = (t0 + 4801);
    t16 = xsi_mem_cmp(t14, t1, 2U);
    if (t16 == 1)
        goto LAB8;

LAB13:    t17 = (t0 + 4803);
    t19 = xsi_mem_cmp(t17, t1, 2U);
    if (t19 == 1)
        goto LAB9;

LAB14:
LAB10:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;

LAB5:
LAB3:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (3 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB16;

LAB18:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (3 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 4829);
    t7 = 1;
    if (3U == 3U)
        goto LAB32;

LAB33:    t7 = 0;

LAB34:    if (t7 != 0)
        goto LAB30;

LAB31:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 4848);
    t9 = (t0 + 3032);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t1, 16U);
    xsi_driver_first_trans_fast_port(t9);

LAB17:    t1 = (t0 + 2952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t9 = (t0 + 1648U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((unsigned char *)t9) = (unsigned char)2;
    goto LAB3;

LAB6:    xsi_set_current_line(53, ng0);
    t20 = (t0 + 1192U);
    t21 = *((char **)t20);
    t22 = (7 - 15);
    t23 = (t22 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t20 = (t21 + t25);
    t7 = *((unsigned char *)t20);
    t26 = (t0 + 1648U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    *((unsigned char *)t26) = t7;
    goto LAB5;

LAB7:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (4 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t9 = (t0 + 1648U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((unsigned char *)t9) = t7;
    goto LAB5;

LAB8:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (10 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t9 = (t0 + 1648U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((unsigned char *)t9) = t7;
    goto LAB5;

LAB9:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (4 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t9 = (t0 + 1648U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((unsigned char *)t9) = t7;
    goto LAB5;

LAB15:;
LAB16:    xsi_set_current_line(69, ng0);
    t9 = xsi_get_transient_memory(16U);
    memset(t9, 0, 16U);
    t10 = t9;
    t11 = (t0 + 1648U);
    t12 = *((char **)t11);
    t28 = *((unsigned char *)t12);
    memset(t10, t28, 16U);
    t11 = (t0 + 3032);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 16U);
    xsi_driver_first_trans_fast_port(t11);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (3 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 4805);
    t3 = xsi_mem_cmp(t9, t1, 2U);
    if (t3 == 1)
        goto LAB20;

LAB25:    t11 = (t0 + 4807);
    t13 = xsi_mem_cmp(t11, t1, 2U);
    if (t13 == 1)
        goto LAB21;

LAB26:    t14 = (t0 + 4809);
    t16 = xsi_mem_cmp(t14, t1, 2U);
    if (t16 == 1)
        goto LAB22;

LAB27:    t17 = (t0 + 4811);
    t19 = xsi_mem_cmp(t17, t1, 2U);
    if (t19 == 1)
        goto LAB23;

LAB28:
LAB24:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 4813);
    t9 = (t0 + 3032);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t1, 16U);
    xsi_driver_first_trans_fast_port(t9);

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(73, ng0);
    t20 = (t0 + 1192U);
    t21 = *((char **)t20);
    t23 = (15 - 7);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t20 = (t21 + t25);
    t26 = (t0 + 3032);
    t27 = (t26 + 56U);
    t29 = *((char **)t27);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t20, 8U);
    xsi_driver_first_trans_delta(t26, 8U, 8U, 0LL);
    goto LAB19;

LAB21:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (15 - 4);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3032);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t1, 5U);
    xsi_driver_first_trans_delta(t9, 11U, 5U, 0LL);
    goto LAB19;

LAB22:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (15 - 10);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3032);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t1, 11U);
    xsi_driver_first_trans_delta(t9, 5U, 11U, 0LL);
    goto LAB19;

LAB23:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (15 - 4);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3032);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t1, 3U);
    xsi_driver_first_trans_delta(t9, 13U, 3U, 0LL);
    goto LAB19;

LAB29:;
LAB30:    xsi_set_current_line(87, ng0);
    t14 = (t0 + 4832);
    t17 = (t0 + 3032);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t26 = *((char **)t21);
    memcpy(t26, t14, 16U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB17;

LAB32:    t23 = 0;

LAB35:    if (t23 < 3U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t11 = (t1 + t23);
    t12 = (t9 + t23);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB33;

LAB37:    t23 = (t23 + 1);
    goto LAB35;

}


extern void work_a_0424165756_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0424165756_3212880686_p_0};
	xsi_register_didat("work_a_0424165756_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_0424165756_3212880686.didat");
	xsi_register_executes(pe);
}
