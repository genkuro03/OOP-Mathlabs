classdef ColorMixin
    properties
        Color
    end
    
    methods
        function obj = ColorMixin(color)%Constructor
            if nargin > 0
                obj.Color = color;
            else
                obj.Color = 'White'; %Sets default to white
            end
        end
        function color = GetColor(obj)  %Simple accessor to get color
            color = obj.Color;
        end
        function obj = SetColor(obj, newColor)  %Changes field to new color
            obj.Color = newColor;
        end
    end
end
