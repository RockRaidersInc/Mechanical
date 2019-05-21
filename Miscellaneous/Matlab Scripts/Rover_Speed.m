%% URC Rover Speed Estimates
%Science data needs to be collected from areas within a .8 km radius. Up to
%6 sites may be required to visit. 

clear, clc

tic

max_radius = .8;

iterations = 900000;

minutes_20 = zeros(1, iterations);
minutes_30 = zeros(1, iterations);
distance_counter = zeros(1, iterations);

for j = 1:iterations
    
    number_sites = randi([1 6], 1, 1);
    
    dig_time = number_sites * 60;
    %If (.4, .4) is the origin of the circle, x and y values will range from 0
    %to .8.
    distance = rand(1, number_sites);

    check = true;
    while(check)
        for i = 1:number_sites
           if(distance(i) > .8)
                while(distance(i) > .8)
                    distance(i) = rand();
                end
           end
        end
        check = false;
    end

    total_distance = sum(distance);
    
    distance_counter(j) = total_distance;
    
    speed_1 = (total_distance*1000) ./ (20 * 60 - dig_time);
    speed_2 = (total_distance*1000) ./ (30 * 60 - dig_time);
    
    minutes_20(j) = speed_1;
    minutes_30(j) = speed_2;
end

    %Average speed for 20 minutes
    average_1 = sum(minutes_20) ./ iterations;
    %Average speed for 30 minutes
    average_2 = sum(minutes_30) ./ iterations;
    %Average distance
    average_distance = sum(distance_counter) ./ iterations;
    
    disp('Necessary speeds for the rover assuming a random number of sites within a .8 km circle and assuming no time lost in data collection.')
    disp(' ')
    disp('Average speed for 20 minutes in meters/second:')
    disp(average_1)
    disp('Average speed for 30 minutes in meters/second:')
    disp(average_2)
    disp('Average distance in km:')
    disp(average_distance)

toc