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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/branch_test.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0149387133_3212880686_p_0(char *t0)
{
    char t25[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned char t28;

LAB0:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 4576);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7364);
    t6 = xsi_mem_cmp(t1, t2, 3U);
    if (t6 == 1)
        goto LAB3;

LAB10:    t4 = (t0 + 7367);
    t7 = xsi_mem_cmp(t4, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB11:    t8 = (t0 + 7370);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB12:    t11 = (t0 + 7373);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB13:    t14 = (t0 + 7376);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB14:    t17 = (t0 + 7379);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB15:
LAB9:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 7494);
    t3 = (t0 + 4704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 4432);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(67, ng0);
    t20 = (t0 + 4640);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t20);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 7382);
    t3 = (t0 + 4704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 7152U);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 7200U);
    t5 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t25, t2, t1, t4, t3);
    t8 = (t25 + 12U);
    t26 = *((unsigned int *)t8);
    t27 = (1U * t26);
    t28 = (16U != t27);
    if (t28 == 1)
        goto LAB17;

LAB18:    t9 = (t0 + 4704);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 7168U);
    t3 = (t0 + 7398);
    t5 = (t25 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 0;
    t8 = (t5 + 4U);
    *((int *)t8) = 15;
    t8 = (t5 + 8U);
    *((int *)t8) = 1;
    t6 = (15 - 0);
    t26 = (t6 * 1);
    t26 = (t26 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t26;
    t28 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t25);
    if (t28 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 7414);
    t3 = (t0 + 4704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB20:    goto LAB2;

LAB6:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 7168U);
    t3 = (t0 + 7430);
    t5 = (t25 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 0;
    t8 = (t5 + 4U);
    *((int *)t8) = 15;
    t8 = (t5 + 8U);
    *((int *)t8) = 1;
    t6 = (15 - 0);
    t26 = (t6 * 1);
    t26 = (t26 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t26;
    t28 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t2, t1, t3, t25);
    if (t28 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 7446);
    t3 = (t0 + 4704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 7168U);
    t3 = (t0 + 7462);
    t5 = (t25 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 0;
    t8 = (t5 + 4U);
    *((int *)t8) = 15;
    t8 = (t5 + 8U);
    *((int *)t8) = 1;
    t6 = (15 - 0);
    t26 = (t6 * 1);
    t26 = (t26 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t26;
    t28 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t25);
    if (t28 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 7478);
    t3 = (t0 + 4704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB30:    goto LAB2;

LAB8:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4704);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t8 = *((char **)t5);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB16:;
LAB17:    xsi_size_not_matching(16U, t27, 0);
    goto LAB18;

LAB19:    xsi_set_current_line(80, ng0);
    t8 = (t0 + 4640);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 7152U);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 7200U);
    t5 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t25, t2, t1, t4, t3);
    t8 = (t25 + 12U);
    t26 = *((unsigned int *)t8);
    t27 = (1U * t26);
    t28 = (16U != t27);
    if (t28 == 1)
        goto LAB22;

LAB23:    t9 = (t0 + 4704);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB20;

LAB22:    xsi_size_not_matching(16U, t27, 0);
    goto LAB23;

LAB24:    xsi_set_current_line(91, ng0);
    t8 = (t0 + 4640);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 7152U);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 7200U);
    t5 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t25, t2, t1, t4, t3);
    t8 = (t25 + 12U);
    t26 = *((unsigned int *)t8);
    t27 = (1U * t26);
    t28 = (16U != t27);
    if (t28 == 1)
        goto LAB27;

LAB28:    t9 = (t0 + 4704);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB25;

LAB27:    xsi_size_not_matching(16U, t27, 0);
    goto LAB28;

LAB29:    xsi_set_current_line(102, ng0);
    t8 = (t0 + 4640);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 7152U);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t3 = (t0 + 7200U);
    t5 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t25, t2, t1, t4, t3);
    t8 = (t25 + 12U);
    t26 = *((unsigned int *)t8);
    t27 = (1U * t26);
    t28 = (16U != t27);
    if (t28 == 1)
        goto LAB32;

LAB33:    t9 = (t0 + 4704);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 4512);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB30;

LAB32:    xsi_size_not_matching(16U, t27, 0);
    goto LAB33;

}


extern void work_a_0149387133_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0149387133_3212880686_p_0};
	xsi_register_didat("work_a_0149387133_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_0149387133_3212880686.didat");
	xsi_register_executes(pe);
}
