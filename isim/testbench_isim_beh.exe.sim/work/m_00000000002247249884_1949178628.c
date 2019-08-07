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
static const char *ng0 = "C:/Users/USER/Desktop/VSCPu/VerySimpleCPU/testbench.v";
static int ng1[] = {1, 0};
static int ng2[] = {10, 0};
static int ng3[] = {0, 0};
static int ng4[] = {600, 0};
static const char *ng5 = "Concent of address 101 is %d";
static int ng6[] = {101, 0};



static void Initial_11_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);

LAB4:    xsi_set_current_line(12, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(13, ng0);

LAB5:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 3088);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(14, ng0);
    t3 = (t0 + 2200);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t7) == 0)
        goto LAB7;

LAB9:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t4 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t4) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB12;

LAB11:    t22 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 2200);
    xsi_vlogvar_assign_value(t24, t4, 0, 0, 1);
    goto LAB5;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB12:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t4) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB11;

LAB13:    goto LAB1;

}

static void Initial_18_1(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);

LAB4:    xsi_set_current_line(19, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(20, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5676);
    *((int *)t8) = t7;

LAB5:    t9 = (t0 + 5676);
    if (*((int *)t9) > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(22, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t2 + 4);
    t4 = *((unsigned int *)t3);
    t5 = (~(t4));
    t6 = *((unsigned int *)t2);
    t7 = (t6 & t5);
    t8 = (t0 + 5680);
    *((int *)t8) = t7;

LAB9:    t9 = (t0 + 5680);
    if (*((int *)t9) > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 5708);
    t3 = *((char **)t2);
    t8 = ((((char*)(t3))) + 56U);
    t9 = *((char **)t8);
    t10 = (t0 + 5740);
    t11 = *((char **)t10);
    t12 = ((((char*)(t11))) + 72U);
    t13 = *((char **)t12);
    t15 = (t0 + 5772);
    t16 = *((char **)t15);
    t17 = ((((char*)(t16))) + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng6)));
    xsi_vlog_generic_get_array_select_value(t14, 32, t9, t13, t18, 2, 1, t19, 32, 1);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t14, 32);
    xsi_set_current_line(24, ng0);
    xsi_vlog_finish(1);

LAB1:    return;
LAB6:    xsi_set_current_line(20, ng0);
    t10 = (t0 + 3848);
    *((int *)t10) = 1;
    t11 = (t0 + 3560);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(21, ng0);
    t12 = ((char*)((ng3)));
    t13 = (t0 + 2360);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 1000LL);
    t2 = (t0 + 5676);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB5;

LAB10:    xsi_set_current_line(22, ng0);
    t10 = (t0 + 3864);
    *((int *)t10) = 1;
    t11 = (t0 + 3560);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    t2 = (t0 + 5680);
    t7 = *((int *)t2);
    *((int *)t2) = (t7 - 1);
    goto LAB9;

}


extern void work_m_00000000002247249884_1949178628_init()
{
	static char *pe[] = {(void *)Initial_11_0,(void *)Initial_18_1};
	xsi_register_didat("work_m_00000000002247249884_1949178628", "isim/testbench_isim_beh.exe.sim/work/m_00000000002247249884_1949178628.didat");
	xsi_register_executes(pe);
}
