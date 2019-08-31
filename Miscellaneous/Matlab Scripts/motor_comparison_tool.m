%Battery Voltage
V=23.4;

%Slope (determines torque)
slope=10;

%Motor definitions
%Put all motors you want to compare
%Defined as (model, gear ratio)
%Acceptable model names: Redline, CIM, Mini CIM, 775pro, BAG
motors = [
    motor("Redline", 81)
];


%Dont change anything else
%--------------------------------------------------------------------------

clf
torque=getTorque(slope);
speeds=cell(size(motors));
currents=cell(size(motors));

hold on

for i=1:size(speeds)
    ki=motors(i).ki;
    kv=motors(i).kv;
    r=motors(i).r;
    t0=motors(i).t0;
    gr=motors(i).gear_ratio;
    current=torque/gr/ki+t0/ki;
    if current <= V/r
        speeds{i}=0;
        currents{i}=current*current*r/V;
        while 1
            speed=speeds{i}(end)+.001;
            RPM=speed/(.3048*pi)*60*gr;
            voltage=r*current+kv*RPM;
            if voltage>V
                break;
            end
            speeds{i}=[speeds{i}, speed];
            currents{i}=[currents{i}, current*voltage/V];
        end
    else
        speeds{i}=0;
        currents{i}=0;
    end
    plot(speeds{i}, 4*currents{i})
    names=cell(size(motors));
    for i=1:size(names)
        names{i}=strcat(motors(i).model, " w/ ", num2str(motors(i).gear_ratio), ":1");
    end
    legend(names,'Location','southeast');
    graph_title=strcat("Performance at ", num2str(slope), " degree slope");
    title(graph_title)
    xlabel('Speed (m/s)') 
    ylabel('Total current draw (A)') 
end

function t = getTorque(angle)
    if angle==0
        t=1.5511;
    elseif angle==10
        t=4.4746;
    elseif angle==15
        t=6.0722;
    elseif angle==30
        t=10.611;
    elseif angle==45
        t=14.533;
    elseif angle==60
        t=17.57;
    end
end