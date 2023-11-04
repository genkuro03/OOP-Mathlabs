classdef Shape < matlab.mixin.Heterogeneous
    properties
        Name
        Area
    end
    
    methods
        function obj = Shape(name) %Constructor
            if nargin > 0
                obj.Name = name;
            else
                obj.Name = '';  %default action if name is void
            end
        end
        
        function Display(obj)   %Display function to show fields
            fprintf('Shape Name: %s\n', obj.Name);
            fprintf('Area: %f\n', obj.Area);
        end
    end

    methods (Static)    %Static functions
        function CalculateStatistics(input)
            n = numel(input);   %Finds how many elements
            list = zeros(1,n);  %Creates vector

            for i = 1:n %For each element...
                list(i) = input(i).Area; %Assign each element to the area of each shape in list
            end
            meanArea = mean(list);  %Mean, median, std
            medianArea = median(list);
            stdDevArea = std(list);
            
            fprintf('Statistics for the Areas of Shapes:\n');   %Showcase data
            fprintf('Mean Area: %f\n', meanArea);
            fprintf('Median Area: %f\n', medianArea);
            fprintf('Standard Deviation of Areas: %f\n', stdDevArea);
        end
    end

end
