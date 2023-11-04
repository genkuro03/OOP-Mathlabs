choices = {'Circle', 'Rectangle', 'Triangle', 'Exit'};  %Creates array of "choices"
choice = menu('Shape Selection:', choices); %Gives user a menu to choose from, storing answer in choice

while choice ~= 4   %Continues until "exit"
    switch choice   
        case 1  %Circle
        prompt = 'Enter the radius of the circle:';
        dlg_title = 'Circle Input';
        num_lines = 1;
        default_answer = {'1.0'};  % Default radius
        user_input = inputdlg(prompt, dlg_title, num_lines, default_answer);    %Gives the user a pop-up, asking for radius

        if isempty(user_input)  %Checks if any input
            disp('User canceled input.');
        else
            radius = str2double(user_input{1}); %Stores radius into a temp val
            color_prompt = 'Enter the color of the circle:';
            color = inputdlg(color_prompt, dlg_title, num_lines, {'White'});    %Now asks user for color (default white)

            if isempty(color)   %Checks if empty
                disp('User canceled input.');
            else
                color = color{1};   %Stores color into temp val
                circle = Circle(radius, color); %Creates circle w/ properties given
                circle.Draw();  %Draws Circle
            end
        end
    break;
    
    case 2
        prompt = 'Enter the length of the rectangle:';  
        dlg_title = 'Rectangle Input';
        num_lines = 1;
        default_answer = {'2.0'};  % Default length
        user_input = inputdlg(prompt, dlg_title, num_lines, default_answer);    %Asks user for length in pop-up 

        if isempty(user_input)  %Checks for no input
            disp('User canceled input.');
        else
            length = str2double(user_input{1}); %Converts input to double and store
            width_prompt = 'Enter the width of the rectangle:'; 
            width = inputdlg(width_prompt, dlg_title, num_lines, {'2.0'});  %Ask user for a width

            if isempty(width)   %Checks if width is empty
                disp('User canceled input.');
            else
                width = str2double(width{1});   %Stores width after conversion
                color_prompt = 'Enter the color of the rectangle:';
                color = inputdlg(color_prompt, dlg_title, num_lines, {'White'});    %asks user for color

                if isempty(color)   %Checks if any input
                    disp('User canceled input.');
                else
                    color = color{1};   %Stores color
                    rectangle = Rectangle(length, width, color);    %Calls constructor
                    rectangle.Draw();   %Draws rectangle
                end
            end
        end
    break;

    case 3
        prompt = 'Enter the base of the triangle:';
        dlg_title = 'Triangle Input';
        num_lines = 1;
        default_answer = {'3.0'};  % Default base
        user_input = inputdlg(prompt, dlg_title, num_lines, default_answer);    %Asks user for base

        if isempty(user_input)  %Checks for no input
            disp('User canceled input.');
        else
            base = str2double(user_input{1});   %Stores base
            height_prompt = 'Enter the height of the triangle:';
            height = inputdlg(height_prompt, dlg_title, num_lines, {'1.0'});    %Asks for height

            if isempty(height)  %Checks no height
                disp('User canceled input.');
            else
                height = str2double(height{1}); %Stores height
                color_prompt = 'Enter the color of the triangle:';
                color = inputdlg(color_prompt, dlg_title, num_lines, {'White'});    %Asks for color

                if isempty(color)   %Checks no color
                    disp('User canceled input.');
                else
                    color = color{1};   %Stores color   
                    triangle = Triangle(base, height, color);   %Creates Triangle
                    triangle.Draw();    %Draws triangle
                end
            end
        end
        break;
        otherwise   %Inputting anything but 1-4 (even closing out XD)
        disp('Invalid choice.');
        break;
    end
end
