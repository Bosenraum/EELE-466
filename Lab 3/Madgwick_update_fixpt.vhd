-- -------------------------------------------------------------
-- 

-- File Name: C:\EE466\AJR\Lab 3\hdl_coder_Madgwick_update\codegen\Madgwick_update\hdlsrc\Madgwick_update_fixpt.vhd
-- Created: 2018-02-09 13:26:31
-- 
-- Generated by MATLAB 9.3, MATLAB Coder 3.4 and HDL Coder 3.11
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- r0                            ce_out        1
-- r1                            ce_out        1
-- r2                            ce_out        1
-- r3                            ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Madgwick_update_fixpt
-- Source Path: Madgwick_update_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Madgwick_update_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        q0                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q1                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En13
        q2                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q3                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        qdot1_1                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qdot2_1                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qdot3_1                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qdot4_1                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        s0                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        s1                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        s2                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        s3                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        beta                              :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En17
        sampletime                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En22
        ce_out                            :   OUT   std_logic;
        r0                                :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        r1                                :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        r2                                :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        r3                                :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
        );
END Madgwick_update_fixpt;


ARCHITECTURE rtl OF Madgwick_update_fixpt IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL beta_unsigned                    : unsigned(13 DOWNTO 0);  -- ufix14_En17
  SIGNAL s0_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL qdot1_1_signed                   : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp                              : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_1                            : unsigned(27 DOWNTO 0);  -- ufix28_En31
  SIGNAL tmp_2                            : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_3                            : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_4                            : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL sampletime_unsigned              : unsigned(13 DOWNTO 0);  -- ufix14_En22
  SIGNAL q0_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL tmp_5                            : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL multiplier_cast                  : signed(14 DOWNTO 0);  -- sfix15_En22
  SIGNAL multiplier_mul_temp              : signed(28 DOWNTO 0);  -- sfix29_En29
  SIGNAL tmp_6                            : signed(27 DOWNTO 0);  -- sfix28_En29
  SIGNAL tmp_7                            : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_8                            : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_9                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL r0_tmp                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL s1_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL qdot2_1_signed                   : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_10                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_11                           : unsigned(27 DOWNTO 0);  -- ufix28_En31
  SIGNAL tmp_12                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_13                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_14                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL q1_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En13
  SIGNAL tmp_15                           : signed(31 DOWNTO 0);  -- sfix32_En29
  SIGNAL multiplier_cast_1                : signed(14 DOWNTO 0);  -- sfix15_En22
  SIGNAL multiplier_mul_temp_1            : signed(28 DOWNTO 0);  -- sfix29_En29
  SIGNAL tmp_16                           : signed(27 DOWNTO 0);  -- sfix28_En29
  SIGNAL tmp_17                           : signed(31 DOWNTO 0);  -- sfix32_En29
  SIGNAL tmp_18                           : signed(31 DOWNTO 0);  -- sfix32_En29
  SIGNAL tmp_19                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL r1_tmp                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL s2_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL qdot3_1_signed                   : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_20                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_21                           : unsigned(27 DOWNTO 0);  -- ufix28_En31
  SIGNAL tmp_22                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_23                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_24                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL q2_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL tmp_25                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL multiplier_cast_2                : signed(14 DOWNTO 0);  -- sfix15_En22
  SIGNAL multiplier_mul_temp_2            : signed(28 DOWNTO 0);  -- sfix29_En29
  SIGNAL tmp_26                           : signed(27 DOWNTO 0);  -- sfix28_En29
  SIGNAL tmp_27                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_28                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_29                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL r2_tmp                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL s3_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL qdot4_1_signed                   : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_30                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_31                           : unsigned(27 DOWNTO 0);  -- ufix28_En31
  SIGNAL tmp_32                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_33                           : signed(39 DOWNTO 0);  -- sfix40_En31
  SIGNAL tmp_34                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL q3_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL tmp_35                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL multiplier_cast_3                : signed(14 DOWNTO 0);  -- sfix15_En22
  SIGNAL multiplier_mul_temp_3            : signed(28 DOWNTO 0);  -- sfix29_En29
  SIGNAL tmp_36                           : signed(27 DOWNTO 0);  -- sfix28_En29
  SIGNAL tmp_37                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_38                           : signed(30 DOWNTO 0);  -- sfix31_En29
  SIGNAL tmp_39                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL r3_tmp                           : signed(13 DOWNTO 0);  -- sfix14_En12

BEGIN
  beta_unsigned <= unsigned(beta);

  s0_unsigned <= unsigned(s0);

  -- HDL code generation from MATLAB function: Madgwick_update_fixpt
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  --                                                                          %
  -- 
  --           Generated by MATLAB 9.3 and Fixed-Point Designer 6.0           %
  -- 
  --                                                                          %
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  -- Apply feedback step
  -- 
  -- 'Madgwick_update_fixpt:9' fm = get_fimath();
  -- 
  -- 'Madgwick_update_fixpt:10' qDot1 = fi(qDot1_1, 1, 14, 7, fm);
  qdot1_1_signed <= signed(qdot1_1);

  -- 'Madgwick_update_fixpt:15' qDot1 = fi(qDot1 - beta * s0, 1, 14, 7, fm);
  tmp <= resize(qdot1_1_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' 
    & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);

  tmp_1 <= beta_unsigned * s0_unsigned;

  tmp_2 <= signed(resize(tmp_1, 40));

  tmp_3 <= tmp - tmp_2;

  tmp_4 <= tmp_3(37 DOWNTO 24);

  sampletime_unsigned <= unsigned(sampletime);

  q0_unsigned <= unsigned(q0);

  -- Integrate rate of change of quaternion to yield quaternion
  -- 
  -- 'Madgwick_update_fixpt:21' r0 = fi(q0 + qDot1 * sampleTime, 1, 14, 12, fm);
  tmp_5 <= signed(resize(q0_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' 
    & '0' & '0' & '0', 31));

  multiplier_cast <= signed(resize(sampletime_unsigned, 15));
  multiplier_mul_temp <= tmp_4 * multiplier_cast;
  tmp_6 <= multiplier_mul_temp(27 DOWNTO 0);

  tmp_7 <= resize(tmp_6, 31);

  tmp_8 <= tmp_5 + tmp_7;

  tmp_9 <= tmp_8(30 DOWNTO 17);

  enb <= clk_enable;

  r0_reg_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      r0_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        r0_tmp <= tmp_9;
      END IF;
    END IF;
  END PROCESS r0_reg_process;


  r0 <= std_logic_vector(r0_tmp);

  s1_unsigned <= unsigned(s1);

  -- 'Madgwick_update_fixpt:11' qDot2 = fi(qDot2_1, 1, 14, 7, fm);
  qdot2_1_signed <= signed(qdot2_1);

  -- 'Madgwick_update_fixpt:16' qDot2 = fi(qDot2 - beta * s1, 1, 14, 7, fm);
  tmp_10 <= resize(qdot2_1_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & 
    '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);

  tmp_11 <= beta_unsigned * s1_unsigned;

  tmp_12 <= signed(resize(tmp_11, 40));

  tmp_13 <= tmp_10 - tmp_12;

  tmp_14 <= tmp_13(37 DOWNTO 24);

  q1_unsigned <= unsigned(q1);

  -- 'Madgwick_update_fixpt:22' r1 = fi(q1 + qDot2 * sampleTime, 1, 14, 12, fm);
  tmp_15 <= signed(resize(q1_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' 
    & '0' & '0' & '0' & '0', 32));

  multiplier_cast_1 <= signed(resize(sampletime_unsigned, 15));
  multiplier_mul_temp_1 <= tmp_14 * multiplier_cast_1;
  tmp_16 <= multiplier_mul_temp_1(27 DOWNTO 0);

  tmp_17 <= resize(tmp_16, 32);

  tmp_18 <= tmp_15 + tmp_17;

  tmp_19 <= tmp_18(30 DOWNTO 17);

  r1_reg_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      r1_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        r1_tmp <= tmp_19;
      END IF;
    END IF;
  END PROCESS r1_reg_process;


  r1 <= std_logic_vector(r1_tmp);

  s2_unsigned <= unsigned(s2);

  -- 'Madgwick_update_fixpt:12' qDot3 = fi(qDot3_1, 1, 14, 7, fm);
  qdot3_1_signed <= signed(qdot3_1);

  -- 'Madgwick_update_fixpt:17' qDot3 = fi(qDot3 - beta * s2, 1, 14, 7, fm);
  tmp_20 <= resize(qdot3_1_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & 
    '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);

  tmp_21 <= beta_unsigned * s2_unsigned;

  tmp_22 <= signed(resize(tmp_21, 40));

  tmp_23 <= tmp_20 - tmp_22;

  tmp_24 <= tmp_23(37 DOWNTO 24);

  q2_unsigned <= unsigned(q2);

  -- 'Madgwick_update_fixpt:23' r2 = fi(q2 + qDot3 * sampleTime, 1, 14, 12, fm);
  tmp_25 <= signed(resize(q2_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' 
    & '0' & '0' & '0', 31));

  multiplier_cast_2 <= signed(resize(sampletime_unsigned, 15));
  multiplier_mul_temp_2 <= tmp_24 * multiplier_cast_2;
  tmp_26 <= multiplier_mul_temp_2(27 DOWNTO 0);

  tmp_27 <= resize(tmp_26, 31);

  tmp_28 <= tmp_25 + tmp_27;

  tmp_29 <= tmp_28(30 DOWNTO 17);

  r2_reg_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      r2_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        r2_tmp <= tmp_29;
      END IF;
    END IF;
  END PROCESS r2_reg_process;


  r2 <= std_logic_vector(r2_tmp);

  s3_unsigned <= unsigned(s3);

  -- 'Madgwick_update_fixpt:13' qDot4 = fi(qDot4_1, 1, 14, 7, fm);
  qdot4_1_signed <= signed(qdot4_1);

  -- 'Madgwick_update_fixpt:18' qDot4 = fi(qDot4 - beta * s3, 1, 14, 7, fm);
  tmp_30 <= resize(qdot4_1_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & 
    '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);

  tmp_31 <= beta_unsigned * s3_unsigned;

  tmp_32 <= signed(resize(tmp_31, 40));

  tmp_33 <= tmp_30 - tmp_32;

  tmp_34 <= tmp_33(37 DOWNTO 24);

  q3_unsigned <= unsigned(q3);

  -- 'Madgwick_update_fixpt:24' r3 = fi(q3 + qDot4 * sampleTime, 1, 14, 12, fm);
  tmp_35 <= signed(resize(q3_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' 
    & '0' & '0' & '0', 31));

  multiplier_cast_3 <= signed(resize(sampletime_unsigned, 15));
  multiplier_mul_temp_3 <= tmp_34 * multiplier_cast_3;
  tmp_36 <= multiplier_mul_temp_3(27 DOWNTO 0);

  tmp_37 <= resize(tmp_36, 31);

  tmp_38 <= tmp_35 + tmp_37;

  tmp_39 <= tmp_38(30 DOWNTO 17);

  r3_reg_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      r3_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        r3_tmp <= tmp_39;
      END IF;
    END IF;
  END PROCESS r3_reg_process;


  r3 <= std_logic_vector(r3_tmp);

  ce_out <= clk_enable;

END rtl;

