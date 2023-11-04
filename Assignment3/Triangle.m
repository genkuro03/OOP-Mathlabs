classdef Triangle < Shape & ColorMixin 
    properties
        Base
        Height
    end

    methods
        function obj = Triangle(base, height, color)
            obj@Shape('Triangle'); %Calls "Shape" constructor passing "Triangle" as name
            obj@ColorMixin(color); %Calls ColorMixin constructor
            obj.Base = base;       %Assigns field vals to args
            obj.Height = height;
            obj = obj.CalculateArea(); %Calls helper function
        end

        function triangle = CalculateArea(obj)  %Helper function to calculateArea
            obj.Area = 0.5 * obj.Base * obj.Height;
            triangle = obj; %Updates the object w/ area
        end
        function Display(obj) %Spits out data for Triangle
            fprintf('The area of a %s triangle with a base of %.2f units and a height of %.2f units is %.2f square units.\n', ...
                obj.Color, obj.Base, obj.Height, obj.Area);
        end
        function Draw(obj)
            x = [0, obj.Base / 2, -obj.Base / 2, 0]; %Sets the vertices for the Triangle
            y = [obj.Height, 0, 0, obj.Height]; 
            
            fill(x, y, obj.Color); %Fills Triangle with it's color

            axis equal;     %Sets the "view" to be a square of x range ((-obj.base/2-1) - (obj.base/2+1))
            axis([-obj.Base / 2 - 1, obj.Base / 2 + 1, -1, obj.Height + 1]);    %y range = (-1 - height+1) 
        
            % Add title and labels
            title(sprintf('%s Triangle', obj.Color));
            xlabel('X-coordinate');
            ylabel('Y-coordinate');
        
            % Display properties and area of the shape
            propertiesText = sprintf('Base: %.2f\nHeight: %.2f\nColor: %s', obj.Base, obj.Height, obj.Color);
            areaText = sprintf('Area: %.2f square units', obj.Area);
            text(0, -1, propertiesText, 'HorizontalAlignment', 'center');
            text(0, obj.Height + 0.2, areaText, 'HorizontalAlignment', 'center');
        end
    end
end
