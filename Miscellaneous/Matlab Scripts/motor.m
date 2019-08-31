classdef motor
    properties
        model
        gear_ratio
        ki
        kv
        t0
        r
    end
    methods
        function obj = motor(name, gearbox)
            obj.model=name;
            obj.gear_ratio=gearbox;
            if name=="Redline"
                %optimal gear ratio = 116
                obj.ki=0.006045535887;
                obj.kv=0.00059266374222873;
                obj.t0=0.0191;
                obj.r=0.11224;
            elseif name=="New Redline"
                %optimal gear ratio = 
                obj.ki=0.005853;
                obj.kv=0.00058985;
                obj.t0=0.022278;
                obj.r=0.0922266;
            elseif name=="CIM"
                %optimal gear ratio = 34
                obj.ki=0.0188;
                obj.kv=0.002205;
                obj.t0=0.05076;
                obj.r=0.0915646;
            elseif name=="Mini CIM"
                %optimal gear ratio = 43
                obj.ki=0.0163;
                obj.kv=0.0019863;
                obj.t0=0.0487;
                obj.r=0.13424;
            elseif name=="775pro"
                %optimal gear ratio = 173
                obj.ki=0.00532675263675;
                obj.kv=0.000637;
                obj.t0=0.0037234528;
                obj.r=0.0898;
            elseif name=="BAG"
                %optimal gear ratio = 123
                obj.ki=0.00848;
                obj.kv=0.00087948;
                obj.t0=0.015266;
                obj.r=0.228;
            elseif name=="RS-550"
                %optimal gear ratio = 159
                %https://www.robotshop.com/en/rs-550-motor-19300rpm-12v-6249oz-in.html
                obj.ki=0.00584;
                obj.kv=0.00061152;
                obj.t0=0.008176763636;
                obj.r=0.14117647;
            elseif name=="9015"
                %optimal gear ratio = 155
                obj.ki=0.0068441;
                obj.kv=0.000735873827434;
                obj.t0=0.0082123;
                obj.r=0.1882478;
            elseif name=="Brushless"
                %optimal gear ratio = 155
                obj.ki=0.0252;
                obj.kv=0.002078;
                obj.t0=0.0453488;
                obj.r=0.1142857;
            elseif name=="24V"
                %optimal gear ratio = 155
                obj.ki=0.8095;
                obj.kv=0.16574;
                obj.t0=0.131;
                obj.r=1.846;
            elseif name=="am-2161"
                obj.ki=0.009382;
                obj.kv=0.0010344;
                obj.t0=0.0168878375;
                obj.r=.1384;
            elseif name=="IG42" % 8.963-10.835
                obj.ki=0.033925881081081;
                obj.kv=0.003294990723562;
                obj.t0=0.016962940540541;
                obj.r=1.870129870129870;
            elseif name=="IG52" % 3.994-4.834
                obj.ki=0.059296325581395;
                obj.kv=0.005787997756590;
                obj.t0=0.041507427906977;
                obj.r=1.211441390914189;
            elseif name=="Devantech" % 1/3
                obj.ki=0.831568343893329;
                obj.kv=0.161377084454008;
                obj.t0=0.415784171946665;
                obj.r=1.846153846153846;
            elseif name=="DP20-10" %5.313-6.422 (3)
                %https://www.electrocraft.com/products/pmdc/DP20/
                obj.ki=.07062;
                obj.kv=.0074;
                obj.t0=0.028334;
                obj.r=3.05;
            elseif name=="DP20-15" %6.822-11.138 (3)
                %https://www.electrocraft.com/products/pmdc/DP20/
                obj.ki=.06708;
                obj.kv=.007;
                obj.t0=0.0249;
                obj.r=3.05;
            elseif name=="DP20-20" %3.797-4.609 (3)
                %https://www.electrocraft.com/products/pmdc/DP20/
                obj.ki=.0918;
                obj.kv=.0093;
                obj.t0=0.05158;
                obj.r=3.05;
            elseif name=="DP25-30" %2.283-2.78
                %https://www.electrocraft.com/products/pmdc/DP25/
                obj.ki=.06285;
                obj.kv=.0066;
                obj.t0=0.10245;
                obj.r=.6;
            elseif name=="DP25-35" %3.989-4.929 (3)
                %https://www.electrocraft.com/products/pmdc/DP25/
                obj.ki=.06638;
                obj.kv=.007;
                obj.t0=0.1201;
                obj.r=3.0;
            elseif name=="DP25-45" %3.633-4.411 (3)
                %https://www.electrocraft.com/products/pmdc/DP25/
                obj.ki=.09321;
                obj.kv=.0097;
                obj.t0=0.05514;
                obj.r=3.0;
            elseif name=="DP30-60" %2.681-3.257
                %https://www.electrocraft.com/products/pmdc/DP30/
                obj.ki=.125;
                obj.kv=.0131;
                obj.t0=0.0763;
                obj.r=3.0;
            elseif name=="DP30-75" %1.415-1.766
                %https://www.electrocraft.com/products/pmdc/DP30/
                obj.ki=.1716;
                obj.kv=.018;
                obj.t0=0.5384;
                obj.r=3.0;
            elseif name=="DP30-85" %1.264-1.537
                %https://www.electrocraft.com/products/pmdc/DP30/
                obj.ki=.25845;
                obj.kv=.0271;
                obj.t0=0.17515;
                obj.r=3.0;
            elseif name=="MP36" %1.181-1.494 (16.44/3)
                %https://www.electrocraft.com/products/gearmotors/MP36/
                obj.ki=.05918;
                obj.kv=.0062;
                obj.t0=1.343;
                obj.r=.3;
            elseif name=="MPP36" %1.21-1.534 (16.97/3)
                %https://www.electrocraft.com/products/gearmotors/MPP36/
                obj.ki=.0568;
                obj.kv=.00595;
                obj.t0=1.59;
                obj.r=.3;
            elseif name=="MPS32-183" %1.216-1.518
                %https://www.electrocraft.com/products/gearmotors/MPS32/
                obj.ki=.0424;
                obj.kv=.00444;
                obj.t0=.6413;
                obj.r=.136;
            elseif name=="MPS32-150" %.977-1.222
                %https://www.electrocraft.com/products/gearmotors/MPS32/
                obj.ki=.0528;
                obj.kv=.00553;
                obj.t0=.893;
                obj.r=.141;
            elseif name=="MPS32-124" %.903-1.134
                %https://www.electrocraft.com/products/gearmotors/MPS32/
                obj.ki=.0633;
                obj.kv=.00663;
                obj.t0=1.14469;
                obj.r=.182;
            elseif name=="Hansen114-12" %.793-1.39
                %https://www.hansen-motor.com/products/dc-motors/Series114-4_1-4inDCGearMotor/
                obj.ki=0.341308338611110;
                obj.kv=0.055384615384615;
                obj.t0=0.068261667722222;
                obj.r=3.692307692307693;
            elseif name=="Hansen116-4-16-12" %.281-.693
                %https://www.hansen-motor.com/products/dc-motors/Series116-4_1-6inDCSpurGearMotor/
                obj.ki=0.786858632857139;
                obj.kv=0.094915254237288;
                obj.t0=0.078685863285714;
                obj.r=12.203389830508472;
            elseif name=="Hansen116-4-32-12" %.648-1.147
                %https://www.hansen-motor.com/products/dc-motors/Series116-4_1-6inDCSpurGearMotor/
                obj.ki=0.533539471851849;
                obj.kv=0.065494238932686;
                obj.t0=0.106707894370370;
                obj.r=5.385081867798664;
            elseif name=="Hansen116-4-48-12" %.922-1.362
                %https://www.hansen-motor.com/products/dc-motors/Series116-4_1-6inDCSpurGearMotor/
                obj.ki=0.372336369393938;
                obj.kv=0.049717514124294;
                obj.t0=0.074467273878788;
                obj.r=3.163841807909604;
            elseif name=="Hansen116-9-48-27" %.384-.463
                %https://www.hansen-motor.com/products/dc-motors/Series116-9_1-6inDCPlanetaryGearMotor-Plastic/
                obj.ki=0.928089669523805;
                obj.kv=0.113821138211382;
                obj.t0=0.371235867809522;
                obj.r=3.089430894308943;
            elseif name=="AME 218" %.163-.197 (1/3)
                %http://www.robotmarketplace.com/products/0-218-1004.html
                obj.ki=0.611423974255833;
                obj.kv=0.219299406321398;
                obj.t0=0.917135961383749;
                obj.r=0.736761320030698;
            else
                error("Invalid motor model")
            end
        end
    end
end