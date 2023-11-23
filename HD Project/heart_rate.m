clc; clear all; close all;

s = daq.createSession('ni')
s.DurationInSeconds = 5;  
s.Rate = 500;              
s.addAnalogInputChannel('myDAQ1','ai0','Voltage');

while(1)

data = startForeground(s);
[b,a] = butter(6,0.6);
dataOut = filtfilt(b,a,data);  


findpeaks(dataOut,'MinPeakHeight',1.2,'MinPeakDistance',200);
[peaks,locs] = findpeaks(dataOut,'MinPeakHeight',1.2,'MinPeakDistance',200);
totalpeaks = numel(locs);
distance = max(locs)-min(locs);
D_s = distance/s.Rate;
P_s = D_s/totalpeaks;
BPM = round(60/P_s) - 12 
%Difference compared with realistic result

end