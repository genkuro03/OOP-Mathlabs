classdef Circle < Shape & ColorMixin
    properties
        Radius
    end
    
    methods
        function obj = Circle(radius, color)    %Constructor
            obj@Shape('Circle');    %Calls shape constructor
            obj@ColorMixin(color);  %Calls colormixin constructor
            obj.Radius = radius;
            obj = obj.CalculateArea();  %Calls helper
        end
        
        function circle = CalculateArea(obj)    %Helper
            obj.Area = pi * obj.Radius^2;
            circle = obj;   %updates obj reference with new obj.
        end
        
        function Display(obj)   %Overloaded display function
            fprintf('The area of a %s circle with a radius of %.2f units is approximately %.2f square units.\n', ...
                obj.Color, obj.Radius, obj.Area);
        end

        function Draw(obj)
            c = linspace(0, 2 * pi, 100); %Array holding 100 elements equally spaced from 0 - 2pi
            xunit = obj.Radius * cos(c);    %Calculates a vertice for each of the elements above 
            yunit = obj.Radius * sin(c);    
    
            fill(xunit, yunit, obj.Color);  %Fills the circle

            axis equal; %Grabs a square view
            axis([-obj.Radius-1, obj.Radius+1, -obj.Radius-1, obj.Radius+1]);   %1 unit + radius

            %Titles / Labels
            title(sprintf('%s Circle', obj.Color)); 
            xlabel('X-coordinate');
            ylabel('Y-coordinate');

            %Properties / Characteristics of circle
            propertiesText = sprintf('Radius: %.2f\nColor: %s', obj.Radius, obj.Color);
            areaText = sprintf('Area: %.2f square units', obj.Area);
            text(0, -obj.Radius - 0.5, propertiesText, 'HorizontalAlignment', 'center');
            text(0, obj.Radius + 0.2, areaText, 'HorizontalAlignment', 'center');
        end

    end
end
