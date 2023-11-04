classdef EquilateralTriangle < Triangle
    properties
        SideLength
    end

    methods
        function obj = EquilateralTriangle(sideLength, color) %Constructor
            obj@Triangle(sideLength, 0, color); %Creates skeleton of triangle
            obj.SideLength = sideLength;    %Assigns sidelength field
            obj.Name = 'Equilateral Triangle';  %Hard codes name
            obj = obj.CalculateHeight();    %Calls helper function to get height
            obj = obj.CalculateArea();      %Calls parent function CalculateArea
        end

        function eqTriangle = CalculateHeight(obj)  %Helper fucntion to calc. height
            obj.Height = obj.SideLength * sqrt(3) / 2;
            eqTriangle = obj;   %Updates eq. Trig obj.
        end
        function Display(obj)   %Overloaded display
            fprintf('The area of a %s equilateral triangle with a side length of %.2f units is approximately %.2f square units.\n', ...
                obj.Color, obj.SideLength, obj.Area);
        end
    end
end
