@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Sep 06 14:32:58 +0300 2024
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 072ef5529a1e44a281f62518ff0fa54d --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Divider_TB_behav xil_defaultlib.Divider_TB -log elaborate.log"
call xelab  -wto 072ef5529a1e44a281f62518ff0fa54d --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Divider_TB_behav xil_defaultlib.Divider_TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0