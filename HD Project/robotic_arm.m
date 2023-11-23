servo = daq.createSession('ni');  
sensor = daq.createSession('ni');  
addAnalogInputChannel(sensor,'myDAQ1','ai0','Voltage')
addAnalogOutputChannel(servo,'myDAQ1','ao0','Voltage')  
Threshold0 = 0.03;
sensor.DurationInSeconds = 1;    
sensor.Rate = 3000;                
% Threshold0 can be adjusted to observe clearly the motor motion
Motor_angle1 = 2; % Suppose this is to open the claw
Motor_angle2 = 8; % Suppose this is to close the claw
while(1)
   acquiredData = startForeground(sensor);
   stdData = std(acquiredData)
   if stdData < Threshold0
      outputSingleScan(servo,Motor_angle1);
   else
      outputSingleScan(servo,Motor_angle2);
 
   end    
end