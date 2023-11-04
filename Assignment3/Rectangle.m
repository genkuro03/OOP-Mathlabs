classdef Rectangle < Shape & ColorMixin
    properties
        Length
        Width
    end
    
    methods
        function obj = Rectangle(length, width, color) %Constructor
            obj@Shape('Rectangle'); %Calls shape constructor
            obj@ColorMixin(color);  %Calls color constructor
            obj.Length = length;
            obj.Width = width;
            obj = obj.CalculateArea(); %Calls calculateArea helper
        end
        
        function rectangle = CalculateArea(obj) %Helper
            obj.Area = obj.Length * obj.Width;
            rectangle = obj;    %Updates obj reference 
        end
        function Display(obj)   %Overloaded Display functinon
            fprintf('The area of a %s Rectangle with a length of %.2f units and a width of %.2f units is %.2f square units.\n', ...
                obj.Color, obj.Length, obj.Width, obj.Area);
        end
        function Draw(obj)
            x = [-obj.Length / 2, obj.Length / 2, obj.Length / 2, -obj.Length / 2, -obj.Length / 2];    %Sets the vertices for rectangle
            y = [-obj.Width / 2, -obj.Width / 2, obj.Width / 2, obj.Width / 2, -obj.Width / 2];
    
            fill(x, y, obj.Color);  %Fills rectangle with specified color

            axis equal; %"Square view"
            axis([-obj.Length / 2 - 1, obj.Length / 2 + 1, -obj.Width / 2 - 1, obj.Width / 2 + 1]); %Centers rectangle

            %Titles / Labels 
            title(sprintf('%s Rectangle', obj.Color));  
            xlabel('X-coordinate');
            ylabel('Y-coordinate');

            %Properties / Characteristics
            propertiesText = sprintf('Length: %.2f\nWidth: %.2f\nColor: %s', obj.Length, obj.Width, obj.Color);
            areaText = sprintf('Area: %.2f square units', obj.Area);
            text(0, -obj.Width / 2 - 0.5, propertiesText, 'HorizontalAlignment', 'center');
            text(0, obj.Width / 2 + 0.2, areaText, 'HorizontalAlignment', 'center');
        end
    end
end
