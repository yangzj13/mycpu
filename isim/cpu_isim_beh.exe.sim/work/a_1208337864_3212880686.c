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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/controller.vhd";



static void work_a_1208337864_3212880686_p_0(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int t13;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    char *t21;
    int t22;
    char *t23;
    int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 15);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 7869);
    t13 = xsi_mem_cmp(t5, t1, 5U);
    if (t13 == 1)
        goto LAB6;

LAB9:    t7 = (t0 + 7874);
    t14 = xsi_mem_cmp(t7, t1, 5U);
    if (t14 == 1)
        goto LAB7;

LAB10:
LAB8:    xsi_set_current_line(140, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(141, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(142, ng0);
    t1 = (t0 + 7942);
    t5 = (t0 + 4904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(143, ng0);
    t1 = (t0 + 7946);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);

LAB5:
LAB3:    t1 = (t0 + 4680);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 4776);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 7861);
    t5 = (t0 + 4904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 7865);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB6:    xsi_set_current_line(69, ng0);
    t9 = (t0 + 4776);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 4904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 5032);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 10);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 5032);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 7);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 5096);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 4);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 7879);
    t13 = xsi_mem_cmp(t5, t1, 5U);
    if (t13 == 1)
        goto LAB13;

LAB20:    t7 = (t0 + 7884);
    t14 = xsi_mem_cmp(t7, t1, 5U);
    if (t14 == 1)
        goto LAB14;

LAB21:    t9 = (t0 + 7889);
    t19 = xsi_mem_cmp(t9, t1, 5U);
    if (t19 == 1)
        goto LAB15;

LAB22:    t16 = (t0 + 7894);
    t20 = xsi_mem_cmp(t16, t1, 5U);
    if (t20 == 1)
        goto LAB16;

LAB23:    t18 = (t0 + 7899);
    t22 = xsi_mem_cmp(t18, t1, 5U);
    if (t22 == 1)
        goto LAB17;

LAB24:    t23 = (t0 + 7904);
    t25 = xsi_mem_cmp(t23, t1, 5U);
    if (t25 == 1)
        goto LAB18;

LAB25:
LAB19:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 7923);
    t3 = (3U != 3U);
    if (t3 == 1)
        goto LAB34;

LAB35:    t5 = (t0 + 4904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 7926);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);

LAB12:    goto LAB5;

LAB7:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 4904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 4);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 4904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 5032);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 5096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 10);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 5032);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 7);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 5096);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 1);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 7930);
    t13 = xsi_mem_cmp(t5, t1, 2U);
    if (t13 == 1)
        goto LAB37;

LAB40:    t7 = (t0 + 7932);
    t14 = xsi_mem_cmp(t7, t1, 2U);
    if (t14 == 1)
        goto LAB38;

LAB41:
LAB39:
LAB36:    goto LAB5;

LAB11:;
LAB13:    xsi_set_current_line(79, ng0);
    t26 = (t0 + 1352U);
    t27 = *((char **)t26);
    t28 = (15 - 10);
    t29 = (t28 * 1U);
    t30 = (0 + t29);
    t26 = (t27 + t30);
    t31 = (t0 + 4904);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t26, 3U);
    xsi_driver_first_trans_delta(t31, 1U, 3U, 0LL);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 7909);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB12;

LAB14:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 10);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 4904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_delta(t5, 1U, 3U, 0LL);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 7913);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB12;

LAB15:    goto LAB12;

LAB16:    goto LAB12;

LAB17:    goto LAB12;

LAB18:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t10 = (15 - 7);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t5 = (t0 + 7917);
    t13 = xsi_mem_cmp(t5, t1, 3U);
    if (t13 == 1)
        goto LAB28;

LAB31:    t7 = (t0 + 7920);
    t14 = xsi_mem_cmp(t7, t1, 3U);
    if (t14 == 1)
        goto LAB29;

LAB32:
LAB30:
LAB27:    goto LAB12;

LAB26:;
LAB28:    goto LAB27;

LAB29:    goto LAB27;

LAB33:;
LAB34:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB35;

LAB37:    xsi_set_current_line(119, ng0);
    t9 = (t0 + 7934);
    t16 = (t0 + 4968);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t21 = (t18 + 56U);
    t23 = *((char **)t21);
    memcpy(t23, t9, 4U);
    xsi_driver_first_trans_fast_port(t16);
    goto LAB36;

LAB38:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 7938);
    t5 = (t0 + 4968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB36;

LAB42:;
}

static void work_a_1208337864_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;

LAB0:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5160);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5224);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 4696);
    *((int *)t1) = 1;

LAB1:    return;
}


extern void work_a_1208337864_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1208337864_3212880686_p_0,(void *)work_a_1208337864_3212880686_p_1};
	xsi_register_didat("work_a_1208337864_3212880686", "isim/cpu_isim_beh.exe.sim/work/a_1208337864_3212880686.didat");
	xsi_register_executes(pe);
}
