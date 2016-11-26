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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/pc_mux.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_3998048205_3212880686_p_0(char *t0)
{
    char t4[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    static char *nl0[] = {&&LAB5, &&LAB5, &&LAB3, &&LAB4, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5};

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(51, ng0);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 4748U);
    t7 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t4, t6, t5, 1);
    t8 = (t4 + 12U);
    t9 = *((unsigned int *)t8);
    t10 = (1U * t9);
    t11 = (16U != t10);
    if (t11 == 1)
        goto LAB6;

LAB7:    t12 = (t0 + 3072);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB4:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4764U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t4, t2, t1, 1);
    t6 = (t4 + 12U);
    t9 = *((unsigned int *)t6);
    t10 = (1U * t9);
    t3 = (16U != t10);
    if (t3 == 1)
        goto LAB8;

LAB9:    t7 = (t0 + 3072);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4748U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t4, t2, t1, 1);
    t6 = (t4 + 12U);
    t9 = *((unsigned int *)t6);
    t10 = (1U * t9);
    t3 = (16U != t10);
    if (t3 == 1)
        goto LAB10;

LAB11:    t7 = (t0 + 3072);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB6:    xsi_size_not_matching(16U, t10, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(16U, t10, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(16U, t10, 0);
    goto LAB11;

}


extern void work_a_3998048205_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3998048205_3212880686_p_0};
	xsi_register_didat("work_a_3998048205_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_3998048205_3212880686.didat");
	xsi_register_executes(pe);
}
