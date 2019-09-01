%Outputs optimal gear ratio for the motor

%Motor to optimize (gear ratio must be 1)
m=motor("Redline", 1);

%Torque at the desired operating point (Nm)
torque=39.22;

%Speed at the desired operating point (RPM)
speed=.5*60;

%Battery voltage
voltage=11.7;

%Don't change anything below this comment
syms x;

current1=.5;
torque1=0;
speed1=7000;
current2=2.1;
torque2=570*.0000980665;
speed2=5900;

ki=(torque1-torque2)/(current1-current2);
T0=ki*current1-torque1;
R=24/((current1-current2)/(speed1-speed2)*speed1*-1+current1);
kv=-R*(current1-current2)/(speed1-speed2);

ki=m.ki;
T0=m.t0;
R=m.r;
kv=m.kv;

fun=@(x) (torque/x/ki+T0/ki)*((torque/x/ki+T0/ki)*R+kv*speed*x);
upperbound=vpasolve((torque/x/ki+T0/ki)*R+kv*speed*x==voltage);
if isreal(upperbound(2))
    fminbnd(fun,torque/(voltage*ki/R-T0),double(upperbound(2)))
else
    "Not suitable"
end