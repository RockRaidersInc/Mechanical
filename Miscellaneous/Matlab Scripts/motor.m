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
                obj.ki=0.006045535887;
                obj.kv=0.00059266374222873;
                obj.t0=0.0191;
                obj.r=0.11224;
            elseif name=="CIM"
                obj.ki=0.0188;
                obj.kv=0.002205;
                obj.t0=0.05076;
                obj.r=0.0915646;
            elseif name=="Mini CIM"
                obj.ki=0.0163;
                obj.kv=0.0019863;
                obj.t0=0.0487;
                obj.r=0.13424;
            elseif name=="775pro"
                obj.ki=0.00532675263675;
                obj.kv=0.000637;
                obj.t0=0.0037234528;
                obj.r=0.0898;
            elseif name=="BAG"
                obj.ki=0.00848;
                obj.kv=0.00087948;
                obj.t0=0.015266;
                obj.r=0.228;
            else
                error("Invalid motor model")
            end
        end
    end
end