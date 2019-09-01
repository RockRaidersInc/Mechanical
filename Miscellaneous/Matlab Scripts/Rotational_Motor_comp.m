%Battery Voltage
V=11.7;

%Motor definitions
%Put all motors you want to compare
%Defined as (model, gear ratio)
%Acceptable model names: Redline, CIM, Mini CIM, 775pro, BAG
motors = [
    motor("Redline", 566)
    motor("CIM", 154)
    motor("Mini CIM", 155)
];

%Torque resisting turning (Nm)
torque=39.22;


%Dont change anything else
%--------------------------------------------------------------------------

clf
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
            speed=speeds{i}(end)+.1;
            RPM=speed/360*60*gr;
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
    plot(speeds{i}, currents{i})
    names=cell(size(motors));
    for i=1:size(names)
        names{i}=strcat(motors(i).model, " w/ ", num2str(motors(i).gear_ratio), ":1");
    end
    legend(names,'Location','southeast');
    graph_title=strcat("Turning Performance");
    title(graph_title)
    xlabel('Speed (degrees/s)') 
    ylabel('Current draw (A)') 
end