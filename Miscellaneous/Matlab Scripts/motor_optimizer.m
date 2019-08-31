%Outputs optimal gear ratio for the motor

%Only change this line (Gear ratio should always be 1)
m=motor("Redline", 1);

%Seriously, don't touch any thing else
syms x;

T1=4.4746;
omega=1/(pi*.3048)*60;

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

fun=@(x) (T1/x/ki+T0/ki)*((T1/x/ki+T0/ki)*R+kv*omega*x);
upperbound=vpasolve((T1/x/ki+T0/ki)*R+kv*omega*x==23.4);
if isreal(upperbound(2))
    fminbnd(fun,T1/(23.4*ki/R-T0),double(upperbound(2)))
else
    "Not suitable"
end