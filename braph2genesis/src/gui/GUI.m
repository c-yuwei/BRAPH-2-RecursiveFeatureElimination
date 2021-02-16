classdef GUI
    properties (Access=protected)
        el % element to be visualized
        
        name % app name
        
        x0 % widow left corner
        y0 % widow lower corner
        width % window width
        height % window height
    end
    properties (Constant)
        BKGCOLOR = [.98 .98 .98]
        
        MSG_YES = 'Yes'
        MSG_NO = 'No'
    end
    methods (Static)
        function c = ACCELERATOR()
            %ACCELERATOR defines the accelerator.
            %
            % C = ACCELERATOR() returns the corresponding accelerator depending
            % on whether the version is for Apple Mac OS X or for Win/Unix.
            %
            % See also GUI, ismac.
            
            if ismac  % Mac
                c = 'Cmd';
            else  % Win/Unix
                c = 'Crtl';
            end
        end
        function w = SCREEN_WIDTH()
            %SCREEN_WIDTH defines the screen width
            %
            % W = SCREEN_WIDTH() returns the width of the screen.
            %
            % See also SCREEN_HEIGHT.
            
            screensize = get(0, 'screensize');
            w = screensize(3);
        end
        function h = SCREEN_HEIGHT()
            %SCREEN_HEIGHT defines the screen height.
            %
            % W = SCREEN_HEIGHT() returns the height of the screen.
            %
            % See also SCREEN_WIDTH.
            
            screensize = get(0, 'screensize');
            h = screensize(4);
        end
        function close(AppName, f)
            %CLOSE closes GUI figure.
            %
            % CLOSE(APPNAME,F) promts the user to choose whether to close the
            % GUI figure F with name APPNAME. If the user answers positively,
            % the GUI figure closes. F can also be a vector of figures.
            
            selection = questdlg(['Do you want to close ' AppName '?'], ...
                ['Close ' AppName], ...
                GUI.MSG_YES, GUI.MSG_NO, GUI.MSG_YES);
            switch selection
                case GUI.MSG_YES
                    delete(f)
                case GUI.MSG_NO
                    return
            end
        end
    end
    methods % constructor
        function gui = GUI(el, varargin)
            gui.el = el;
            
            % parameters
            if el.existsTag('ID')
                gui.name = get_from_varargin([el.getClass() ' - ' el.get('ID')], 'x0', varargin);
            else
                gui.name = get_from_varargin(el.getClass(), 'x0', varargin);
            end
            
            gui.x0 = get_from_varargin(.02, 'x0', varargin);
            gui.y0 = get_from_varargin(.10, 'y0', varargin);
            gui.width = get_from_varargin(.60, 'width', varargin);
            gui.height = get_from_varargin(.80, 'height', varargin);
            
            % initializes GUI
            f = figure( ...
                'Visible', 'off', ...
                'NumberTitle', 'off', ...
                'Name', [gui.name ' - ' BRAPH2.STR], ...
                'Units', 'normalized', ...
                'Position', [gui.x0 gui.y0 gui.width gui.height], ...
                'DockControls', 'off', ...
                'Color', GUI.BKGCOLOR, ...
                'CloseRequestFcn', ['GUI.close(''' gui.name ''', gcf)'] ...
                );
            
            % properties
            
            % details
            
            % shows GUI
            set(f, 'Visible', 'on')
        end
    end
end