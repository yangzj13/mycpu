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
static const char *ng0 = "C:/Users/Bob/Documents/xilinx/cpu208/stall_controller.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);


static void work_a_3612765511_3212880686_p_0(char *t0)
{
    char t9[16];
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 4192);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB17;

LAB18:    t1 = (unsigned char)0;

LAB19:    if (t1 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 4256);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB15:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t4 = *((unsigned char *)t6);
    t5 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t1, t4);
    t2 = (t0 + 2472U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t15 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t5, t14);
    t2 = (t0 + 2632U);
    t8 = *((char **)t2);
    t19 = *((unsigned char *)t8);
    t24 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t15, t19);
    t2 = (t0 + 4320);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t16 = (t11 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t24;
    xsi_driver_first_trans_fast_port(t2);
    t2 = (t0 + 4112);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t11 = (t0 + 1352U);
    t16 = *((char **)t11);
    t11 = (t0 + 6600U);
    t17 = (t0 + 1672U);
    t18 = *((char **)t17);
    t17 = (t0 + 6632U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t11, t18, t17);
    if (t19 == 1)
        goto LAB11;

LAB12:    t20 = (t0 + 1512U);
    t21 = *((char **)t20);
    t20 = (t0 + 6616U);
    t22 = (t0 + 1672U);
    t23 = *((char **)t22);
    t22 = (t0 + 6632U);
    t24 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t21, t20, t23, t22);
    t15 = t24;

LAB13:    if (t15 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 4192);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 6632U);
    t7 = (t0 + 6694);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 3;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (3 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t14 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t6, t2, t7, t9);
    t1 = t14;
    goto LAB7;

LAB8:    xsi_set_current_line(57, ng0);
    t25 = (t0 + 4192);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    *((unsigned char *)t29) = (unsigned char)3;
    xsi_driver_first_trans_fast(t25);
    goto LAB9;

LAB11:    t15 = (unsigned char)1;
    goto LAB13;

LAB14:    xsi_set_current_line(65, ng0);
    t11 = (t0 + 1352U);
    t16 = *((char **)t11);
    t11 = (t0 + 6600U);
    t17 = (t0 + 1992U);
    t18 = *((char **)t17);
    t17 = (t0 + 6648U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t11, t18, t17);
    if (t19 == 1)
        goto LAB23;

LAB24:    t20 = (t0 + 1512U);
    t21 = *((char **)t20);
    t20 = (t0 + 6616U);
    t22 = (t0 + 1992U);
    t23 = *((char **)t22);
    t22 = (t0 + 6648U);
    t24 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t21, t20, t23, t22);
    t15 = t24;

LAB25:    if (t15 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 4256);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB21:    goto LAB15;

LAB17:    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t2 = (t0 + 6648U);
    t7 = (t0 + 6698);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 3;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (3 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t14 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t6, t2, t7, t9);
    t1 = t14;
    goto LAB19;

LAB20:    xsi_set_current_line(66, ng0);
    t25 = (t0 + 4256);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    *((unsigned char *)t29) = (unsigned char)3;
    xsi_driver_first_trans_fast(t25);
    goto LAB21;

LAB23:    t15 = (unsigned char)1;
    goto LAB25;

}


extern void work_a_3612765511_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3612765511_3212880686_p_0};
	xsi_register_didat("work_a_3612765511_3212880686", "isim/test_sopc_isim_beh.exe.sim/work/a_3612765511_3212880686.didat");
	xsi_register_executes(pe);
}
