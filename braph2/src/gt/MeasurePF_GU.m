classdef MeasurePF_GU < MeasurePF
	%MeasurePF_GU is the base element to plot a global unilayer measure.
	% It is a subclass of <a href="matlab:help MeasurePF">MeasurePF</a>.
	%
	% MeasurePF_GU manages the basic functionalities to plot of a global unilayer measure.
	%
	% The list of MeasurePF_GU properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure global unilayer measure.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure global unilayer measure.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure global unilayer measure.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure global unilayer measure.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure global unilayer measure.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure global unilayer measure.
	%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure measure.
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
	%  <strong>24</strong> <strong>M</strong> 	M (metadata, item) is the measure.
	%  <strong>25</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the measure value and stores it.
	%  <strong>26</strong> <strong>H_AREA</strong> 	H_AREA (evanescent, handle) is the handle for the measure area.
	%  <strong>27</strong> <strong>ST_AREA</strong> 	ST_AREA (figure, item) determines the area settings.
	%  <strong>28</strong> <strong>LISTENER_ST_AREA</strong> 	LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.
	%  <strong>29</strong> <strong>H_LINE</strong> 	H_LINE (evanescent, handle) is the handle for the measure line.
	%  <strong>30</strong> <strong>ST_LINE</strong> 	ST_LINE (figure, item) determines the line settings.
	%  <strong>31</strong> <strong>LISTENER_ST_LINE</strong> 	LISTENER_ST_LINE (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
	%  <strong>32</strong> <strong>H_TITLE</strong> 	H_TITLE (evanescent, handle) is the axis title.
	%  <strong>33</strong> <strong>ST_TITLE</strong> 	ST_TITLE (figure, item) determines the title settings.
	%  <strong>34</strong> <strong>H_XLABEL</strong> 	H_XLABEL (evanescent, handle) is the axis x-label.
	%  <strong>35</strong> <strong>ST_XLABEL</strong> 	ST_XLABEL (figure, item) determines the x-label settings.
	%  <strong>36</strong> <strong>H_YLABEL</strong> 	H_YLABEL (evanescent, handle) is the axis y-label.
	%  <strong>37</strong> <strong>ST_YLABEL</strong> 	ST_YLABEL (figure, item) determines the y-label settings.
	%
	% MeasurePF_GU methods (constructor):
	%  MeasurePF_GU - constructor
	%
	% MeasurePF_GU methods:
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
	% MeasurePF_GU methods (display):
	%  tostring - string with information about the panel figure global unilayer measure
	%  disp - displays information about the panel figure global unilayer measure
	%  tree - displays the tree of the panel figure global unilayer measure
	%
	% MeasurePF_GU methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel figure global unilayer measure are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel figure global unilayer measure
	%
	% MeasurePF_GU methods (save/load, Static):
	%  save - saves BRAPH2 panel figure global unilayer measure as b2 file
	%  load - loads a BRAPH2 panel figure global unilayer measure from a b2 file
	%
	% MeasurePF_GU method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel figure global unilayer measure
	%
	% MeasurePF_GU method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel figure global unilayer measure
	%
	% MeasurePF_GU methods (inspection, Static):
	%  getClass - returns the class of the panel figure global unilayer measure
	%  getSubclasses - returns all subclasses of MeasurePF_GU
	%  getProps - returns the property list of the panel figure global unilayer measure
	%  getPropNumber - returns the property number of the panel figure global unilayer measure
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
	% MeasurePF_GU methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MeasurePF_GU methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MeasurePF_GU methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MeasurePF_GU methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MeasurePF_GU; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MeasurePF_GU constants</a>.
	%
	%
	% See also Measure.
	
	methods % constructor
		function pf = MeasurePF_GU(varargin)
			%MeasurePF_GU() creates a panel figure global unilayer measure.
			%
			% MeasurePF_GU(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MeasurePF_GU(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of MeasurePF_GU properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure global unilayer measure.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure global unilayer measure.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure global unilayer measure.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure global unilayer measure.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure global unilayer measure.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure global unilayer measure.
			%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure measure.
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
			%  <strong>24</strong> <strong>M</strong> 	M (metadata, item) is the measure.
			%  <strong>25</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the measure value and stores it.
			%  <strong>26</strong> <strong>H_AREA</strong> 	H_AREA (evanescent, handle) is the handle for the measure area.
			%  <strong>27</strong> <strong>ST_AREA</strong> 	ST_AREA (figure, item) determines the area settings.
			%  <strong>28</strong> <strong>LISTENER_ST_AREA</strong> 	LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.
			%  <strong>29</strong> <strong>H_LINE</strong> 	H_LINE (evanescent, handle) is the handle for the measure line.
			%  <strong>30</strong> <strong>ST_LINE</strong> 	ST_LINE (figure, item) determines the line settings.
			%  <strong>31</strong> <strong>LISTENER_ST_LINE</strong> 	LISTENER_ST_LINE (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
			%  <strong>32</strong> <strong>H_TITLE</strong> 	H_TITLE (evanescent, handle) is the axis title.
			%  <strong>33</strong> <strong>ST_TITLE</strong> 	ST_TITLE (figure, item) determines the title settings.
			%  <strong>34</strong> <strong>H_XLABEL</strong> 	H_XLABEL (evanescent, handle) is the axis x-label.
			%  <strong>35</strong> <strong>ST_XLABEL</strong> 	ST_XLABEL (figure, item) determines the x-label settings.
			%  <strong>36</strong> <strong>H_YLABEL</strong> 	H_YLABEL (evanescent, handle) is the axis y-label.
			%  <strong>37</strong> <strong>ST_YLABEL</strong> 	ST_YLABEL (figure, item) determines the y-label settings.
			%
			% See also Category, Format.
			
			pf = pf@MeasurePF(varargin{:});
		end
	end
	methods (Static) % inspection
		function pf_class = getClass()
			%GETCLASS returns the class of the panel figure global unilayer measure.
			%
			% CLASS = MeasurePF_GU.GETCLASS() returns the class 'MeasurePF_GU'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel figure global unilayer measure PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('MeasurePF_GU') returns 'MeasurePF_GU'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('MeasurePF_GU')
			%  are less computationally efficient.
			
			pf_class = 'MeasurePF_GU';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel figure global unilayer measure.
			%
			% LIST = MeasurePF_GU.GETSUBCLASSES() returns all subclasses of 'MeasurePF_GU'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel figure global unilayer measure PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('MeasurePF_GU') returns all subclasses of 'MeasurePF_GU'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'MeasurePF_GU' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel figure global unilayer measure.
			%
			% PROPS = MeasurePF_GU.GETPROPS() returns the property list of panel figure global unilayer measure
			%  as a row vector.
			%
			% PROPS = MeasurePF_GU.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel figure global unilayer measure PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('MeasurePF_GU'[, CATEGORY]) returns the property list of 'MeasurePF_GU'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37];
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
					prop_list = [8 13 19 20 21 23 26 28 29 31 32 34 36];
				case 8 % Category.FIGURE
					prop_list = [12 18 22 27 30 33 35 37];
				case 9 % Category.GUI
					prop_list = [7 11];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel figure global unilayer measure.
			%
			% N = MeasurePF_GU.GETPROPNUMBER() returns the property number of panel figure global unilayer measure.
			%
			% N = MeasurePF_GU.GETPROPNUMBER(CATEGORY) returns the property number of panel figure global unilayer measure
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel figure global unilayer measure PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('MeasurePF_GU') returns the property number of 'MeasurePF_GU'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 37;
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
					prop_number = 13;
				case 8 % Category.FIGURE
					prop_number = 8;
				case 9 % Category.GUI
					prop_number = 2;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel figure global unilayer measure/error.
			%
			% CHECK = MeasurePF_GU.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(MeasurePF_GU, PROP) checks whether PROP exists for MeasurePF_GU.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%  Element.EXISTSPROP(MeasurePF_GU, PROP) throws error if PROP does NOT exist for MeasurePF_GU.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 37 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput'], ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MeasurePF_GU.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel figure global unilayer measure/error.
			%
			% CHECK = MeasurePF_GU.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(MeasurePF_GU, TAG) checks whether TAG exists for MeasurePF_GU.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%  Element.EXISTSTAG(MeasurePF_GU, TAG) throws error if TAG does NOT exist for MeasurePF_GU.
			%   Error id: [BRAPH2:MeasurePF_GU:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'M'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE'  'ST_LINE'  'LISTENER_ST_LINE'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput'], ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for MeasurePF_GU.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MeasurePF_GU, POINTER) returns property number of POINTER of MeasurePF_GU.
			%  PROPERTY = PF.GETPROPPROP(MeasurePF_GU, POINTER) returns property number of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'M'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE'  'ST_LINE'  'LISTENER_ST_LINE'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = Element.GETPROPTAG(MeasurePF_GU, POINTER) returns tag of POINTER of MeasurePF_GU.
			%  TAG = PF.GETPROPTAG(MeasurePF_GU, POINTER) returns tag of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				measurepf_gu_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'ST_AXIS'  'LISTENER_ST_AXIS'  'M'  'SETUP'  'H_AREA'  'ST_AREA'  'LISTENER_ST_AREA'  'H_LINE'  'ST_LINE'  'LISTENER_ST_LINE'  'H_TITLE'  'ST_TITLE'  'H_XLABEL'  'ST_XLABEL'  'H_YLABEL'  'ST_YLABEL' };
				tag = measurepf_gu_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(MeasurePF_GU, POINTER) returns category of POINTER of MeasurePF_GU.
			%  CATEGORY = PF.GETPROPCATEGORY(MeasurePF_GU, POINTER) returns category of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			measurepf_gu_category_list = { 1  1  3  4  2  2  9  7  6  6  9  8  7  6  6  6  6  8  7  7  7  8  7  2  6  7  8  7  7  8  7  7  8  7  8  7  8 };
			prop_category = measurepf_gu_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(MeasurePF_GU, POINTER) returns format of POINTER of MeasurePF_GU.
			%  FORMAT = PF.GETPROPFORMAT(MeasurePF_GU, POINTER) returns format of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			measurepf_gu_format_list = { 2  2  8  2  2  2  4  18  4  4  8  20  18  4  4  4  4  8  18  19  18  8  18  8  1  18  8  18  18  8  18  18  8  18  8  18  8 };
			prop_format = measurepf_gu_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MeasurePF_GU, POINTER) returns description of POINTER of MeasurePF_GU.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(MeasurePF_GU, POINTER) returns description of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			measurepf_gu_description_list = { 'NAME (constant, string) is the name of the panel figure global unilayer measure.'  'DESCRIPTION (constant, string) is the description of the panel figure global unilayer measure.'  'TEMPLATE (parameter, item) is the template of the panel figure global unilayer measure.'  'ID (data, string) is a few-letter code for the panel figure global unilayer measure.'  'LABEL (metadata, string) is an extended label of the panel figure global unilayer measure.'  'NOTES (metadata, string) are some specific notes about the panel figure global unilayer measure.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the figure measure.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel.'  'HIDE (query, logical) hides the figure containing the panel.'  'DELETE (query, logical) resets the handles when the panel figure graph is deleted.'  'CLOSE (query, logical) closes the figure containing the panel.'  'ST_POSITION (figure, item) determines the panel position.'  'H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.'  'H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.'  'H_AXES (evanescent, handle) is the handle for the axes.'  'ST_AXIS (figure, item) determines the axis settings.'  'LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.'  'M (metadata, item) is the measure.'  'SETUP (query, empty) calculates the measure value and stores it.'  'H_AREA (evanescent, handle) is the handle for the measure area.'  'ST_AREA (figure, item) determines the area settings.'  'LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.'  'H_LINE (evanescent, handle) is the handle for the measure line.'  'ST_LINE (figure, item) determines the line settings.'  'LISTENER_ST_LINE (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.'  'H_TITLE (evanescent, handle) is the axis title.'  'ST_TITLE (figure, item) determines the title settings.'  'H_XLABEL (evanescent, handle) is the axis x-label.'  'ST_XLABEL (figure, item) determines the x-label settings.'  'H_YLABEL (evanescent, handle) is the axis y-label.'  'ST_YLABEL (figure, item) determines the y-label settings.' };
			prop_description = measurepf_gu_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(MeasurePF_GU, POINTER) returns settings of POINTER of MeasurePF_GU.
			%  SETTINGS = PF.GETPROPSETTINGS(MeasurePF_GU, POINTER) returns settings of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 3 % MeasurePF_GU.TEMPLATE
					prop_settings = 'MeasurePF_GU';
				otherwise
					prop_settings = getPropSettings@MeasurePF(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MeasurePF_GU.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MeasurePF_GU.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(MeasurePF_GU, POINTER) returns the default value of POINTER of MeasurePF_GU.
			%  DEFAULT = PF.GETPROPDEFAULT(MeasurePF_GU, POINTER) returns the default value of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 1 % MeasurePF_GU.NAME
					prop_default = 'MeasurePF_GU';
				case 2 % MeasurePF_GU.DESCRIPTION
					prop_default = 'MeasurePF_GU manages the basic functionalities to plot of a global unilayer measure.';
				case 3 % MeasurePF_GU.TEMPLATE
					prop_default = Format.getFormatDefault(8, MeasurePF_GU.getPropSettings(prop));
				case 4 % MeasurePF_GU.ID
					prop_default = 'MeasurePF_GU ID';
				case 5 % MeasurePF_GU.LABEL
					prop_default = 'MeasurePF_GU label';
				case 6 % MeasurePF_GU.NOTES
					prop_default = 'MeasurePF_GU notes';
				otherwise
					prop_default = getPropDefault@MeasurePF(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MeasurePF_GU.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MeasurePF_GU.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MeasurePF_GU, POINTER) returns the conditioned default value of POINTER of MeasurePF_GU.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(MeasurePF_GU, POINTER) returns the conditioned default value of POINTER of MeasurePF_GU.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			prop_default = MeasurePF_GU.conditioning(prop, MeasurePF_GU.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MeasurePF_GU, PROP, VALUE) checks VALUE format for PROP of MeasurePF_GU.
			%  CHECK = PF.CHECKPROP(MeasurePF_GU, PROP, VALUE) checks VALUE format for PROP of MeasurePF_GU.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:MeasurePF_GU:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: BRAPH2:MeasurePF_GU:WrongInput
			%  Element.CHECKPROP(MeasurePF_GU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MeasurePF_GU.
			%   Error id: BRAPH2:MeasurePF_GU:WrongInput
			%  PF.CHECKPROP(MeasurePF_GU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MeasurePF_GU.
			%   Error id: BRAPH2:MeasurePF_GU:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('MeasurePF_GU')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MeasurePF_GU.getPropProp(pointer);
			
			switch prop
				case 3 % MeasurePF_GU.TEMPLATE
					check = Format.checkFormat(8, value, MeasurePF_GU.getPropSettings(prop));
				otherwise
					if prop <= 37
						check = checkProp@MeasurePF(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput'], ...
					['BRAPH2' ':MeasurePF_GU:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MeasurePF_GU.getPropTag(prop) ' (' MeasurePF_GU.getFormatTag(MeasurePF_GU.getPropFormat(prop)) ').'] ...
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
				case 25 % MeasurePF_GU.SETUP
					x = pf.get('M').get('G').get('ALAYERTICKS');
					
					y = cell2mat(pf.get('M').get('M'))';
					
					pf.memorize('ST_LINE').set('X', x, 'Y', y)
					
					if ~isempty(y)
					    if isempty(x) 
					        pf.memorize('ST_AREA').set('X', [1 1:1:length(y) length(y)], 'Y', [0 y 0])
					    else
					        pf.memorize('ST_AREA').set('X', [x(1) x x(end)], 'Y', [0 y 0])
					    end
					end
					
					xlim = pf.get('H_AXES').get('XLim');
					ylim = pf.get('H_AXES').get('YLim');
					pf.get('ST_TITLE').set( ...
					    'TXT', pf.get('M').get('LABEL'), ...
					    'X', .5 * (xlim(2) + xlim(1)), ...
					    'Y', ylim(2) + .07 * (ylim(2) - ylim(1)), ...
					    'Z', 0 ...
					    )
					pf.get('ST_XLABEL').set( ...
					    'TXT', 'Layer', ...
					    'X', .5 * (xlim(2) + xlim(1)), ...
					    'Y', ylim(1) - .07 * (ylim(2) - ylim(1)), ...
					    'Z', 0 ...
					    )
					pf.get('ST_YLABEL').set( ...
						'TXT', 'Measure Value', ...
					    'X', xlim(1) - .14 * (xlim(2) - xlim(1)), ...
					    'Y', .5 * (ylim(2) + ylim(1)), ...
					    'Z', 0 ...
					    )
					
					value = [];
					
				otherwise
					if prop <= 37
						value = calculateValue@MeasurePF(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
		end
	end
end