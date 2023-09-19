classdef ComparisonGroupPF_BS < ComparisonGroupPF
	%ComparisonGroupPF_BS is the base element to plot a binodal superglobal group comparison figure.
	% It is a subclass of <a href="matlab:help ComparisonGroupPF">ComparisonGroupPF</a>.
	%
	% ComparisonGroupPF_BS manages the basic functionalities to plot of a binodal superglobal group comparison figure.
	%
	% The list of ComparisonGroupPF_BS properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure binodal superglobal group comparison figure.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure binodal superglobal group comparison figure.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure binodal superglobal group comparison figure.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure binodal superglobal group comparison figure.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure binodal superglobal group comparison figure.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure binodal superglobal group comparison figure.
	%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure comparison figure.
	%  <strong>10</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>11</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>12</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>13</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>14</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
	%  <strong>15</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
	%  <strong>16</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure graph is deleted.
	%  <strong>17</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
	%  <strong>18</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
	%  <strong>19</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
	%  <strong>20</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
	%  <strong>21</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
	%  <strong>22</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
	%  <strong>23</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
	%  <strong>24</strong> <strong>CP</strong> 	CP (metadata, item) is the group comparison.
	%  <strong>25</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the group comparison figure value and stores it.
	%  <strong>26</strong> <strong>H_AREA</strong> 	H_AREA (evanescent, handle) is the handle for the group comparison confidence area.
	%  <strong>27</strong> <strong>ST_AREA</strong> 	ST_AREA (figure, item) determines the area settings.
	%  <strong>28</strong> <strong>LISTENER_ST_AREA</strong> 	LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.
	%  <strong>29</strong> <strong>H_LINE_DIFF</strong> 	H_LINE_DIFF (evanescent, handle) is the handle for the group comparison line.
	%  <strong>30</strong> <strong>ST_LINE_DIFF</strong> 	ST_LINE_DIFF (figure, item) determines the line settings.
	%  <strong>31</strong> <strong>LISTENER_ST_LINE_DIFF</strong> 	LISTENER_ST_LINE_DIFF (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
	%  <strong>32</strong> <strong>H_LINE_CIL</strong> 	H_LINE_CIL (evanescent, handle) is the handle for the lower confidence interval of the group comparison line.
	%  <strong>33</strong> <strong>ST_LINE_CIL</strong> 	ST_LINE_CIL (figure, item) determines the line settings.
	%  <strong>34</strong> <strong>LISTENER_ST_LINE_CIL</strong> 	LISTENER_ST_LINE_CIL (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
	%  <strong>35</strong> <strong>H_LINE_CIU</strong> 	H_LINE_CIU (evanescent, handle) is the handle for the upper confidence interval of the group comparison line.
	%  <strong>36</strong> <strong>ST_LINE_CIU</strong> 	ST_LINE_CIU (figure, item) determines the line settings.
	%  <strong>37</strong> <strong>LISTENER_ST_LINE_CIU</strong> 	LISTENER_ST_LINE_CIU (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
	%  <strong>38</strong> <strong>H_TITLE</strong> 	H_TITLE (evanescent, handle) is the axis title.
	%  <strong>39</strong> <strong>ST_TITLE</strong> 	ST_TITLE (figure, item) determines the title settings.
	%  <strong>40</strong> <strong>H_XLABEL</strong> 	H_XLABEL (evanescent, handle) is the axis x-label.
	%  <strong>41</strong> <strong>ST_XLABEL</strong> 	ST_XLABEL (figure, item) determines the x-label settings.
	%  <strong>42</strong> <strong>H_YLABEL</strong> 	H_YLABEL (evanescent, handle) is the axis y-label.
	%  <strong>43</strong> <strong>ST_YLABEL</strong> 	ST_YLABEL (figure, item) determines the y-label settings.
	%  <strong>44</strong> <strong>NODES</strong> 	NODES (figure, rvector) are the node numbers of the binodal group comparison figure.
	%
	% ComparisonGroupPF_BS methods (constructor):
	%  ComparisonGroupPF_BS - constructor
	%
	% ComparisonGroupPF_BS methods:
	%  set - sets values of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns the value of a property and memorizes it
	%             (for RESULT, QUERY, and EVANESCENT properties)
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% ComparisonGroupPF_BS methods (display):
	%  tostring - string with information about the panel binodal superglobal group comparison figure
	%  disp - displays information about the panel binodal superglobal group comparison figure
	%  tree - displays the tree of the panel binodal superglobal group comparison figure
	%
	% ComparisonGroupPF_BS methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel binodal superglobal group comparison figure are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel binodal superglobal group comparison figure
	%
	% ComparisonGroupPF_BS methods (save/load, Static):
	%  save - saves BRAPH2 panel binodal superglobal group comparison figure as b2 file
	%  load - loads a BRAPH2 panel binodal superglobal group comparison figure from a b2 file
	%
	% ComparisonGroupPF_BS method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel binodal superglobal group comparison figure
	%
	% ComparisonGroupPF_BS method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel binodal superglobal group comparison figure
	%
	% ComparisonGroupPF_BS methods (inspection, Static):
	%  getClass - returns the class of the panel binodal superglobal group comparison figure
	%  getSubclasses - returns all subclasses of ComparisonGroupPF_BS
	%  getProps - returns the property list of the panel binodal superglobal group comparison figure
	%  getPropNumber - returns the property number of the panel binodal superglobal group comparison figure
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditioned default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% ComparisonGroupPF_BS methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% ComparisonGroupPF_BS methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% ComparisonGroupPF_BS methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% ComparisonGroupPF_BS methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatTag - returns the tag of a format
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% To print full list of constants, click here <a href="matlab:metaclass = ?ComparisonGroupPF_BS; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">ComparisonGroupPF_BS constants</a>.
	%
	%
	% See also ComparisonGroup.
	
	properties (Constant) % properties
		NODES = 44; %CET: Computational Efficiency Trick
		NODES_TAG = 'NODES';
		NODES_CATEGORY = 8;
		NODES_FORMAT = 12;
	end
	methods % constructor
		function pf = ComparisonGroupPF_BS(varargin)
			%ComparisonGroupPF_BS() creates a panel binodal superglobal group comparison figure.
			%
			% ComparisonGroupPF_BS(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% ComparisonGroupPF_BS(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of ComparisonGroupPF_BS properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure binodal superglobal group comparison figure.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure binodal superglobal group comparison figure.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure binodal superglobal group comparison figure.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure binodal superglobal group comparison figure.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure binodal superglobal group comparison figure.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure binodal superglobal group comparison figure.
			%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure comparison figure.
			%  <strong>10</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>11</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>12</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>13</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>14</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
			%  <strong>15</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
			%  <strong>16</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure graph is deleted.
			%  <strong>17</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
			%  <strong>18</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
			%  <strong>19</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
			%  <strong>20</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
			%  <strong>21</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
			%  <strong>22</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
			%  <strong>23</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
			%  <strong>24</strong> <strong>CP</strong> 	CP (metadata, item) is the group comparison.
			%  <strong>25</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the group comparison figure value and stores it.
			%  <strong>26</strong> <strong>H_AREA</strong> 	H_AREA (evanescent, handle) is the handle for the group comparison confidence area.
			%  <strong>27</strong> <strong>ST_AREA</strong> 	ST_AREA (figure, item) determines the area settings.
			%  <strong>28</strong> <strong>LISTENER_ST_AREA</strong> 	LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.
			%  <strong>29</strong> <strong>H_LINE_DIFF</strong> 	H_LINE_DIFF (evanescent, handle) is the handle for the group comparison line.
			%  <strong>30</strong> <strong>ST_LINE_DIFF</strong> 	ST_LINE_DIFF (figure, item) determines the line settings.
			%  <strong>31</strong> <strong>LISTENER_ST_LINE_DIFF</strong> 	LISTENER_ST_LINE_DIFF (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
			%  <strong>32</strong> <strong>H_LINE_CIL</strong> 	H_LINE_CIL (evanescent, handle) is the handle for the lower confidence interval of the group comparison line.
			%  <strong>33</strong> <strong>ST_LINE_CIL</strong> 	ST_LINE_CIL (figure, item) determines the line settings.
			%  <strong>34</strong> <strong>LISTENER_ST_LINE_CIL</strong> 	LISTENER_ST_LINE_CIL (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
			%  <strong>35</strong> <strong>H_LINE_CIU</strong> 	H_LINE_CIU (evanescent, handle) is the handle for the upper confidence interval of the group comparison line.
			%  <strong>36</strong> <strong>ST_LINE_CIU</strong> 	ST_LINE_CIU (figure, item) determines the line settings.
			%  <strong>37</strong> <strong>LISTENER_ST_LINE_CIU</strong> 	LISTENER_ST_LINE_CIU (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
			%  <strong>38</strong> <strong>H_TITLE</strong> 	H_TITLE (evanescent, handle) is the axis title.
			%  <strong>39</strong> <strong>ST_TITLE</strong> 	ST_TITLE (figure, item) determines the title settings.
			%  <strong>40</strong> <strong>H_XLABEL</strong> 	H_XLABEL (evanescent, handle) is the axis x-label.
			%  <strong>41</strong> <strong>ST_XLABEL</strong> 	ST_XLABEL (figure, item) determines the x-label settings.
			%  <strong>42</strong> <strong>H_YLABEL</strong> 	H_YLABEL (evanescent, handle) is the axis y-label.
			%  <strong>43</strong> <strong>ST_YLABEL</strong> 	ST_YLABEL (figure, item) determines the y-label settings.
			%  <strong>44</strong> <strong>NODES</strong> 	NODES (figure, rvector) are the node numbers of the binodal group comparison figure.
			%
			% See also Category, Format.
			
			pf = pf@ComparisonGroupPF(varargin{:});
		end
	end
	methods (Static) % inspection
		function pf_class = getClass()
			%GETCLASS returns the class of the panel binodal superglobal group comparison figure.
			%
			% CLASS = ComparisonGroupPF_BS.GETCLASS() returns the class 'ComparisonGroupPF_BS'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel binodal superglobal group comparison figure PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('ComparisonGroupPF_BS') returns 'ComparisonGroupPF_BS'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			
			pf_class = 'ComparisonGroupPF_BS';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel binodal superglobal group comparison figure.
			%
			% LIST = ComparisonGroupPF_BS.GETSUBCLASSES() returns all subclasses of 'ComparisonGroupPF_BS'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel binodal superglobal group comparison figure PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('ComparisonGroupPF_BS') returns all subclasses of 'ComparisonGroupPF_BS'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'ComparisonGroupPF_BS' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel binodal superglobal group comparison figure.
			%
			% PROPS = ComparisonGroupPF_BS.GETPROPS() returns the property list of panel binodal superglobal group comparison figure
			%  as a row vector.
			%
			% PROPS = ComparisonGroupPF_BS.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel binodal superglobal group comparison figure PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('ComparisonGroupPF_BS'[, CATEGORY]) returns the property list of 'ComparisonGroupPF_BS'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2];
				case 2 % Category.METADATA
					prop_list = [5 6 24];
				case 3 % Category.PARAMETER
					prop_list = 3;
				case 4 % Category.DATA
					prop_list = 4;
				case 6 % Category.QUERY
					prop_list = [9 10 14 15 16 17 25];
				case 7 % Category.EVANESCENT
					prop_list = [8 13 19 20 21 23 26 28 29 31 32 34 35 37 38 40 42];
				case 8 % Category.FIGURE
					prop_list = [12 18 22 27 30 33 36 39 41 43 44];
				case 9 % Category.GUI
					prop_list = [7 11];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel binodal superglobal group comparison figure.
			%
			% N = ComparisonGroupPF_BS.GETPROPNUMBER() returns the property number of panel binodal superglobal group comparison figure.
			%
			% N = ComparisonGroupPF_BS.GETPROPNUMBER(CATEGORY) returns the property number of panel binodal superglobal group comparison figure
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel binodal superglobal group comparison figure PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('ComparisonGroupPF_BS') returns the property number of 'ComparisonGroupPF_BS'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 44;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 2;
				case 2 % Category.METADATA
					prop_number = 3;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 7;
				case 7 % Category.EVANESCENT
					prop_number = 17;
				case 8 % Category.FIGURE
					prop_number = 11;
				case 9 % Category.GUI
					prop_number = 2;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel binodal superglobal group comparison figure/error.
			%
			% CHECK = ComparisonGroupPF_BS.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(ComparisonGroupPF_BS, PROP) checks whether PROP exists for ComparisonGroupPF_BS.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%  Element.EXISTSPROP(ComparisonGroupPF_BS, PROP) throws error if PROP does NOT exist for ComparisonGroupPF_BS.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 44 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for ComparisonGroupPF_BS.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel binodal superglobal group comparison figure/error.
			%
			% CHECK = ComparisonGroupPF_BS.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(ComparisonGroupPF_BS, TAG) checks whether TAG exists for ComparisonGroupPF_BS.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%  Element.EXISTSTAG(ComparisonGroupPF_BS, TAG) throws error if TAG does NOT exist for ComparisonGroupPF_BS.
			%   Error id: [BRAPH2:ComparisonGroupPF_BS:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'CP'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE_DIFF'  'ST_LINE_DIFF'  'LISTENER_ST_LINE_DIFF'  'H_LINE_CIL'  'ST_LINE_CIL'  'LISTENER_ST_LINE_CIL'  'H_LINE_CIU'  'ST_LINE_CIU'  'LISTENER_ST_LINE_CIU'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL'  'NODES' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for ComparisonGroupPF_BS.'] ...
					)
			end
		end
		function prop = getPropProp(pointer)
			%GETPROPPROP returns the property number of a property.
			%
			% PROP = Element.GETPROPPROP(PROP) returns PROP, i.e., the 
			%  property number of the property PROP.
			%
			% PROP = Element.GETPROPPROP(TAG) returns the property number 
			%  of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PROPERTY = PF.GETPROPPROP(POINTER) returns property number of POINTER of PF.
			%  PROPERTY = Element.GETPROPPROP(ComparisonGroupPF_BS, POINTER) returns property number of POINTER of ComparisonGroupPF_BS.
			%  PROPERTY = PF.GETPROPPROP(ComparisonGroupPF_BS, POINTER) returns property number of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'CP'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE_DIFF'  'ST_LINE_DIFF'  'LISTENER_ST_LINE_DIFF'  'H_LINE_CIL'  'ST_LINE_CIL'  'LISTENER_ST_LINE_CIL'  'H_LINE_CIU'  'ST_LINE_CIU'  'LISTENER_ST_LINE_CIU'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL'  'NODES' })); % tag = pointer %CET: Computational Efficiency Trick
			else % numeric
				prop = pointer;
			end
		end
		function tag = getPropTag(pointer)
			%GETPROPTAG returns the tag of a property.
			%
			% TAG = Element.GETPROPTAG(PROP) returns the tag TAG of the 
			%  property PROP.
			%
			% TAG = Element.GETPROPTAG(TAG) returns TAG, i.e. the tag of 
			%  the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  TAG = PF.GETPROPTAG(POINTER) returns tag of POINTER of PF.
			%  TAG = Element.GETPROPTAG(ComparisonGroupPF_BS, POINTER) returns tag of POINTER of ComparisonGroupPF_BS.
			%  TAG = PF.GETPROPTAG(ComparisonGroupPF_BS, POINTER) returns tag of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				comparisongrouppf_bs_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'CP'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE_DIFF'  'ST_LINE_DIFF'  'LISTENER_ST_LINE_DIFF'  'H_LINE_CIL'  'ST_LINE_CIL'  'LISTENER_ST_LINE_CIL'  'H_LINE_CIU'  'ST_LINE_CIU'  'LISTENER_ST_LINE_CIU'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL'  'NODES' };
				tag = comparisongrouppf_bs_tag_list{pointer}; % prop = pointer
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the category of the
			%  property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the category of the
			%  property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = PF.GETPROPCATEGORY(POINTER) returns category of POINTER of PF.
			%  CATEGORY = Element.GETPROPCATEGORY(ComparisonGroupPF_BS, POINTER) returns category of POINTER of ComparisonGroupPF_BS.
			%  CATEGORY = PF.GETPROPCATEGORY(ComparisonGroupPF_BS, POINTER) returns category of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongrouppf_bs_category_list = { 1  1  3  4  2  2  9  7  6  6  9  8  7  6  6  6  6  8  7  7  7  8  7  2  6  7  8  7  7  8  7  7  8  7  7  8  7  7  8  7  8  7  8  8 };
			prop_category = comparisongrouppf_bs_category_list{prop};
		end
		function prop_format = getPropFormat(pointer)
			%GETPROPFORMAT returns the format of a property.
			%
			% FORMAT = Element.GETPROPFORMAT(PROP) returns the
			%  format of the property PROP.
			%
			% FORMAT = Element.GETPROPFORMAT(TAG) returns the
			%  format of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  FORMAT = PF.GETPROPFORMAT(POINTER) returns format of POINTER of PF.
			%  FORMAT = Element.GETPROPFORMAT(ComparisonGroupPF_BS, POINTER) returns format of POINTER of ComparisonGroupPF_BS.
			%  FORMAT = PF.GETPROPFORMAT(ComparisonGroupPF_BS, POINTER) returns format of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongrouppf_bs_format_list = { 2  2  8  2  2  2  4  18  4  4  8  20  18  4  4  4  4  8  18  19  18  8  18  8  1  18  8  18  18  8  18  18  8  18  18  8  18  18  8  18  8  18  8  12 };
			prop_format = comparisongrouppf_bs_format_list{prop};
		end
		function prop_description = getPropDescription(pointer)
			%GETPROPDESCRIPTION returns the description of a property.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(PROP) returns the
			%  description of the property PROP.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(TAG) returns the
			%  description of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PF.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(ComparisonGroupPF_BS, POINTER) returns description of POINTER of ComparisonGroupPF_BS.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(ComparisonGroupPF_BS, POINTER) returns description of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongrouppf_bs_description_list = { 'NAME (constant, string) is the name of the panel figure binodal superglobal group comparison figure.'  'DESCRIPTION (constant, string) is the description of the panel figure binodal superglobal group comparison figure.'  'TEMPLATE (parameter, item) is the template of the panel figure binodal superglobal group comparison figure.'  'ID (data, string) is a few-letter code for the panel figure binodal superglobal group comparison figure.'  'LABEL (metadata, string) is an extended label of the panel figure binodal superglobal group comparison figure.'  'NOTES (metadata, string) are some specific notes about the panel figure binodal superglobal group comparison figure.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the figure comparison figure.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel.'  'HIDE (query, logical) hides the figure containing the panel.'  'DELETE (query, logical) resets the handles when the panel figure graph is deleted.'  'CLOSE (query, logical) closes the figure containing the panel.'  'ST_POSITION (figure, item) determines the panel position.'  'H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.'  'H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.'  'H_AXES (evanescent, handle) is the handle for the axes.'  'ST_AXIS (figure, item) determines the axis settings.'  'LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.'  'CP (metadata, item) is the group comparison.'  'SETUP (query, empty) calculates the group comparison figure value and stores it.'  'H_AREA (evanescent, handle) is the handle for the group comparison confidence area.'  'ST_AREA (figure, item) determines the area settings.'  'LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.'  'H_LINE_DIFF (evanescent, handle) is the handle for the group comparison line.'  'ST_LINE_DIFF (figure, item) determines the line settings.'  'LISTENER_ST_LINE_DIFF (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.'  'H_LINE_CIL (evanescent, handle) is the handle for the lower confidence interval of the group comparison line.'  'ST_LINE_CIL (figure, item) determines the line settings.'  'LISTENER_ST_LINE_CIL (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.'  'H_LINE_CIU (evanescent, handle) is the handle for the upper confidence interval of the group comparison line.'  'ST_LINE_CIU (figure, item) determines the line settings.'  'LISTENER_ST_LINE_CIU (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.'  'H_TITLE (evanescent, handle) is the axis title.'  'ST_TITLE (figure, item) determines the title settings.'  'H_XLABEL (evanescent, handle) is the axis x-label.'  'ST_XLABEL (figure, item) determines the x-label settings.'  'H_YLABEL (evanescent, handle) is the axis y-label.'  'ST_YLABEL (figure, item) determines the y-label settings.'  'NODES (figure, rvector) are the node numbers of the binodal group comparison figure.' };
			prop_description = comparisongrouppf_bs_description_list{prop};
		end
		function prop_settings = getPropSettings(pointer)
			%GETPROPSETTINGS returns the settings of a property.
			%
			% SETTINGS = Element.GETPROPSETTINGS(PROP) returns the
			%  settings of the property PROP.
			%
			% SETTINGS = Element.GETPROPSETTINGS(TAG) returns the
			%  settings of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SETTINGS = PF.GETPROPSETTINGS(POINTER) returns settings of POINTER of PF.
			%  SETTINGS = Element.GETPROPSETTINGS(ComparisonGroupPF_BS, POINTER) returns settings of POINTER of ComparisonGroupPF_BS.
			%  SETTINGS = PF.GETPROPSETTINGS(ComparisonGroupPF_BS, POINTER) returns settings of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 44 % ComparisonGroupPF_BS.NODES
					prop_settings = Format.getFormatSettings(12);
				case 3 % ComparisonGroupPF_BS.TEMPLATE
					prop_settings = 'ComparisonGroupPF_BS';
				otherwise
					prop_settings = getPropSettings@ComparisonGroupPF(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = ComparisonGroupPF_BS.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonGroupPF_BS.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(ComparisonGroupPF_BS, POINTER) returns the default value of POINTER of ComparisonGroupPF_BS.
			%  DEFAULT = PF.GETPROPDEFAULT(ComparisonGroupPF_BS, POINTER) returns the default value of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 44 % ComparisonGroupPF_BS.NODES
					prop_default = Format.getFormatDefault(12, ComparisonGroupPF_BS.getPropSettings(prop));
				case 1 % ComparisonGroupPF_BS.NAME
					prop_default = 'ComparisonGroupPF_BS';
				case 2 % ComparisonGroupPF_BS.DESCRIPTION
					prop_default = 'ComparisonGroupPF_BS manages the basic functionalities to plot of a binodal superglobal group comparison figure.';
				case 3 % ComparisonGroupPF_BS.TEMPLATE
					prop_default = Format.getFormatDefault(8, ComparisonGroupPF_BS.getPropSettings(prop));
				case 4 % ComparisonGroupPF_BS.ID
					prop_default = 'ComparisonGroupPF_BS ID';
				case 5 % ComparisonGroupPF_BS.LABEL
					prop_default = 'ComparisonGroupPF_BS label';
				case 6 % ComparisonGroupPF_BS.NOTES
					prop_default = 'ComparisonGroupPF_BS notes';
				otherwise
					prop_default = getPropDefault@ComparisonGroupPF(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = ComparisonGroupPF_BS.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonGroupPF_BS.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(ComparisonGroupPF_BS, POINTER) returns the conditioned default value of POINTER of ComparisonGroupPF_BS.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(ComparisonGroupPF_BS, POINTER) returns the conditioned default value of POINTER of ComparisonGroupPF_BS.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			prop_default = ComparisonGroupPF_BS.conditioning(prop, ComparisonGroupPF_BS.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PF.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PF.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PF.
			%  CHECK = Element.CHECKPROP(ComparisonGroupPF_BS, PROP, VALUE) checks VALUE format for PROP of ComparisonGroupPF_BS.
			%  CHECK = PF.CHECKPROP(ComparisonGroupPF_BS, PROP, VALUE) checks VALUE format for PROP of ComparisonGroupPF_BS.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:ComparisonGroupPF_BS:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: BRAPH2:ComparisonGroupPF_BS:WrongInput
			%  Element.CHECKPROP(ComparisonGroupPF_BS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonGroupPF_BS.
			%   Error id: BRAPH2:ComparisonGroupPF_BS:WrongInput
			%  PF.CHECKPROP(ComparisonGroupPF_BS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonGroupPF_BS.
			%   Error id: BRAPH2:ComparisonGroupPF_BS:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('ComparisonGroupPF_BS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = ComparisonGroupPF_BS.getPropProp(pointer);
			
			switch prop
				case 44 % ComparisonGroupPF_BS.NODES
					check = Format.checkFormat(12, value, ComparisonGroupPF_BS.getPropSettings(prop));
				case 3 % ComparisonGroupPF_BS.TEMPLATE
					check = Format.checkFormat(8, value, ComparisonGroupPF_BS.getPropSettings(prop));
				otherwise
					if prop <= 43
						check = checkProp@ComparisonGroupPF(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupPF_BS:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' ComparisonGroupPF_BS.getPropTag(prop) ' (' ComparisonGroupPF_BS.getFormatTag(ComparisonGroupPF_BS.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pf, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case 25 % ComparisonGroupPF_BS.SETUP
					warning([BRAPH2.STR ':ComparisonGroupPF_BS'], [BRAPH2.STR ':ComparisonGroupPF_BS \nThis functionality is not implemented yet.\nYou can contact the BRAPH2 developers and ask for it, \nor, even better, implement it yourself and share it with the community!'])
					value = [];
					
				otherwise
					if prop <= 43
						value = calculateValue@ComparisonGroupPF(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
		end
	end
end