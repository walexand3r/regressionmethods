%M = csvread('Life Expectancy Data_2015_only.csv','R1','C2')
T = readtable('Life Expectancy Data_2015_only.csv');
A = table2array(T(3:end,3:end))