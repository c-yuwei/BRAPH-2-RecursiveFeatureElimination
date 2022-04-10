classdef AnalyzeGroup_CON_FUN_MP_GA_WU < AnalyzeGroup
	% AnalyzeGroup_CON_FUN_MP_GA_WU is a graph analysis using connectivity and functional multiplex data.
	% It is a subclass of <a href="matlab:help AnalyzeGroup">AnalyzeGroup</a>.
	%
	% 
	%
	% The list of AnalyzeGroup_CON_FUN_MP_GA_WU properties is:
	%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the graph analysis.
	%  <strong>2</strong> <strong>label</strong> 	LABEL (metadata, string) is an extended label of the graph analysis.
	%  <strong>3</strong> <strong>notes</strong> 	NOTES (metadata, string) are some specific notes about the graph analysis.
	%  <strong>4</strong> <strong>gr</strong> 	GR (data, item) is the subject group, which also defines the subject class SubjectCON_FUN_MP.
	%  <strong>5</strong> <strong>g</strong> 	G (result, item) is the average multiplex graph obtained from this analysis.
	%  <strong>6</strong> <strong>repetition</strong> 	REPETITION(parameter, scalar) is the number of repetitions for functional data
	%  <strong>7</strong> <strong>frequencyrulemin</strong> 	FREQUENCYRULEMIN(parameter, scalar) is the minimum frequency value for functional data
	%  <strong>8</strong> <strong>frequencyrulemax</strong> 	FREQUENCYRULEMAX(parameter, scalar) is the maximum frequency value for functional data
	%  <strong>9</strong> <strong>correlation_rule</strong> 	CORRELATION_RULE (parameter, option) is the correlation type for functional data.
	%  <strong>10</strong> <strong>negative_weight_rule</strong> 	NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights of functional data.
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (constructor):
	% AnalyzeGroup_CON_FUN_MP_GA_WU - constructor
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (Static):
	%  checkProp - checks whether a value has the correct format/error.
	%  getPropDefaultConditioned - returns the conditioned default value of a property.
	%  getPropDefault - returns the default value of a property.
	%  getPropSettings - returns the settings of a property.
	%  getPropDescription - returns the description of a property.
	%  getPropFormat - returns the format of a property.
	%  getPropCategory - returns the category of a property.
	%  getPropTag - returns the tag of a property.
	%  getPropProp - returns the property number of a property.
	%  existsTag - checks whether tag exists in graph analysis with connectivity and functional multiplex data/error.
	%  existsProp - checks whether property exists in graph analysis with connectivity and functional multiplex data/error.
	%  getPropNumber - returns the property number of graph analysis with connectivity and functional multiplex data.
	%  getProps - returns the property list of graph analysis with connectivity and functional multiplex data.
	%  getDescription - returns the description of the graph analysis with connectivity and functional multiplex data.
	%  getName - returns the name of the graph analysis with connectivity and functional multiplex data.
	%  getClass - returns the class of the graph analysis with connectivity and functional multiplex data.
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods:
	%  getPPCompareGroup_CPDict - returns the comparison plot panel compatible with the analysis.
	%  getPlotProp - returns a prop plot.
	%  set - sets the value of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns and memorizes the value of a property
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (operators):
	%  isequal - determines whether two AnalyzeGroup_CON_FUN_MP_GA_WU are equal (values, locked)
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (display):
	%  tostring - string with information about the AnalyzeGroup_CON_FUN_MP_GA_WU
	%  disp - displays information about the AnalyzeGroup_CON_FUN_MP_GA_WU
	%  tree - displays the element of AnalyzeGroup_CON_FUN_MP_GA_WU
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU method (element list):
	%  getElementList - returns a list with all subelements of AnalyzeGroup_CON_FUN_MP_GA_WU
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the AnalyzeGroup_CON_FUN_MP_GA_WU
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU method (JSON decode, Static):
	%  decodeJSON - returns a JSON string encoding the AnalyzeGroup_CON_FUN_MP_GA_WU
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (copy):
	%  copy - copies the AnalyzeGroup_CON_FUN_MP_GA_WU
	%  deepclone - deep-clones the AnalyzeGroup_CON_FUN_MP_GA_WU
	%  clone - clones the AnalyzeGroup_CON_FUN_MP_GA_WU
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (inspection, Static):
	%  getClass - returns AnalyzeGroup_CON_FUN_MP_GA_WU
	%  getName - returns the name of AnalyzeGroup_CON_FUN_MP_GA_WU
	%  getDescription - returns the description of AnalyzeGroup_CON_FUN_MP_GA_WU
	%  getProps - returns the property list of AnalyzeGroup_CON_FUN_MP_GA_WU
	%  getPropNumber - returns the property number of AnalyzeGroup_CON_FUN_MP_GA_WU
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditione default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (GUI):
	%  getGUI - returns the element GUI
	%  getPlotElement - returns the element plot
	%  getPlotProp - returns a prop plot
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU methods (GUI, Static):
	%  getGUIMenuImport - returns an importer menu
	%  getGUIMenuExport - returns an exporter menu
	%
	% AnalyzeGroup_CON_FUN_MP_GA_WU properties (Constant).
	%  REPETITION - 6
	%  REPETITION_TAG - 'repetition'
	%  REPETITION_CATEGORY - 'p'
	%  REPETITION_FORMAT - 'nn'
	%  FREQUENCYRULEMIN - 7
	%  FREQUENCYRULEMIN_TAG - 'frequencyrulemin'
	%  FREQUENCYRULEMIN_CATEGORY - 'p'
	%  FREQUENCYRULEMIN_FORMAT - 'nn'
	%  FREQUENCYRULEMAX - 8
	%  FREQUENCYRULEMAX_TAG - 'frequencyrulemax'
	%  FREQUENCYRULEMAX_CATEGORY - 'p'
	%  FREQUENCYRULEMAX_FORMAT - 'nn'
	%  CORRELATION_RULE - 9
	%  CORRELATION_RULE_TAG - 'correlation_rule'
	%  CORRELATION_RULE_CATEGORY - 'p'
	%  CORRELATION_RULE_FORMAT - 'op'
	%  NEGATIVE_WEIGHT_RULE - 10
	%  NEGATIVE_WEIGHT_RULE_TAG - 'negative_weight_rule'
	%  NEGATIVE_WEIGHT_RULE_CATEGORY - 'p'
	%  NEGATIVE_WEIGHT_RULE_FORMAT - 'op'
	%  ID - 1
	%  ID_TAG - 'id'
	%  ID_CATEGORY - 'd'
	%  ID_FORMAT - 'st'
	%  LABEL - 2
	%  LABEL_TAG - 'label'
	%  LABEL_CATEGORY - 'm'
	%  LABEL_FORMAT - 'st'
	%  NOTES - 3
	%  NOTES_TAG - 'notes'
	%  NOTES_CATEGORY - 'm'
	%  NOTES_FORMAT - 'st'
	%  GR - 4
	%  GR_TAG - 'gr'
	%  GR_CATEGORY - 'd'
	%  GR_FORMAT - 'it'
	%  G - 5
	%  G_TAG - 'g'
	%  G_CATEGORY - 'r'
	%  G_FORMAT - 'it'
	%  METADATA - 'm'
	%  METADATA_NAME - 'metadata'
	%  METADATA_DESCRIPTION - 'Metadata NOT used in the calculation of the results (does not allow callbacks, not cloned).'
	%  PARAMETER - 'p'
	%  PARAMETER_NAME - 'parameter'
	%  PARAMETER_DESCRIPTION - 'Parameter used to calculate the results of the element (allows incoming and outgoing callbacks, cloned).'
	%  DATA - 'd'
	%  DATA_NAME - 'data'
	%  DATA_DESCRIPTION - 'Data used to calculate the results of the element (can be NoResult when not set, allows incoming and outgoing callbacks, not cloned).'
	%  RESULT - 'r'
	%  RESULT_NAME - 'result'
	%  RESULT_DESCRIPTION - 'Result calculated by the element using parameters and data (can be NoResult when not calculated, allows incoming callbacks).'
	%  FIGURE - 'f'
	%  FIGURE_NAME - 'figure'
	%  FIGURE_DESCRIPTION - 'Parameter used to plot the results in a figure (allows incoming and outgoing callbacks, not cloned).'
	%  GUI - 'g'
	%  GUI_NAME - 'gui'
	%  GUI_DESCRIPTION - 'Parameter used by the graphical user interface (allows incoming and outgoing callbacks, not cloned).'
	%  EMPTY - 'em'
	%  EMPTY_NAME - 'empty'
	%  EMPTY_DESCRIPTION - 'Empty has an empty value and is typically used as a result to execute some code.'
	%  STRING - 'st'
	%  STRING_NAME - 'string'
	%  STRING_DESCRIPTION - 'String is a char array.'
	%  LOGICAL - 'lo'
	%  LOGICAL_NAME - 'logical'
	%  LOGICAL_DESCRIPTION - 'Logical is a boolean value.'
	%  OPTION - 'op'
	%  OPTION_NAME - 'option'
	%  OPTION_DESCRIPTION - 'Option is a char array representing an option within a set defined in the element.'
	%  CLASS - 'ca'
	%  CLASS_NAME - 'class'
	%  CLASS_DESCRIPTION - 'Class is a char array corresponding to an element class.'
	%  CLASSLIST - 'cl'
	%  CLASSLIST_NAME - 'classlist'
	%  CLASSLIST_DESCRIPTION - 'ClassList is a cell array with char arrays corresponding to element classes.'
	%  ITEM - 'it'
	%  ITEM_NAME - 'item'
	%  ITEM_DESCRIPTION - 'Item is a pointer to an element of a class defined in the element.'
	%  ITEMLIST - 'il'
	%  ITEMLIST_NAME - 'itemlist'
	%  ITEMLIST_DESCRIPTION - 'ItemList is a cell array with pointers to elements of a class defined in the element.'
	%  IDICT - 'di'
	%  IDICT_NAME - 'idict'
	%  IDICT_DESCRIPTION - 'Idict is an indexed dictionary of elements of a class defined in the element.'
	%  SCALAR - 'nn'
	%  SCALAR_NAME - 'scalar'
	%  SCALAR_DESCRIPTION - 'Scalar is a scalar numerical value.'
	%  RVECTOR - 'nr'
	%  RVECTOR_NAME - 'rvector'
	%  RVECTOR_DESCRIPTION - 'Rvector is a numerical row vector.'
	%  CVECTOR - 'nc'
	%  CVECTOR_NAME - 'cvector'
	%  CVECTOR_DESCRIPTION - 'Cvector is a numerical column vector.'
	%  MATRIX - 'nm'
	%  MATRIX_NAME - 'matrix'
	%  MATRIX_DESCRIPTION - 'Matrix is a numerical matrix.'
	%  SMATRIX - 'ns'
	%  SMATRIX_NAME - 'smatrix'
	%  SMATRIX_DESCRIPTION - 'Smatrix is a numerical square matrix.'
	%  CELL - 'll'
	%  CELL_NAME - 'cell'
	%  CELL_DESCRIPTION - 'Cell is a 2D cell array of numeric data, typically used for adjaciency matrices and measures.'
	%  NET - 'ml'
	%  NET_NAME - 'net'
	%  NET_DESCRIPTION - 'Net is a MatLab neural network object.'
	
	properties (Constant) % properties
		REPETITION = AnalyzeGroup.getPropNumber() + 1;
		REPETITION_TAG = 'repetition';
		REPETITION_CATEGORY = Category.PARAMETER;
		REPETITION_FORMAT = Format.SCALAR;
		
		FREQUENCYRULEMIN = AnalyzeGroup.getPropNumber() + 2;
		FREQUENCYRULEMIN_TAG = 'frequencyrulemin';
		FREQUENCYRULEMIN_CATEGORY = Category.PARAMETER;
		FREQUENCYRULEMIN_FORMAT = Format.SCALAR;
		
		FREQUENCYRULEMAX = AnalyzeGroup.getPropNumber() + 3;
		FREQUENCYRULEMAX_TAG = 'frequencyrulemax';
		FREQUENCYRULEMAX_CATEGORY = Category.PARAMETER;
		FREQUENCYRULEMAX_FORMAT = Format.SCALAR;
		
		CORRELATION_RULE = AnalyzeGroup.getPropNumber() + 4;
		CORRELATION_RULE_TAG = 'correlation_rule';
		CORRELATION_RULE_CATEGORY = Category.PARAMETER;
		CORRELATION_RULE_FORMAT = Format.OPTION;
		
		NEGATIVE_WEIGHT_RULE = AnalyzeGroup.getPropNumber() + 5;
		NEGATIVE_WEIGHT_RULE_TAG = 'negative_weight_rule';
		NEGATIVE_WEIGHT_RULE_CATEGORY = Category.PARAMETER;
		NEGATIVE_WEIGHT_RULE_FORMAT = Format.OPTION;
	end
	methods (Static) % inspection methods
		function a_class = getClass()
			%GETCLASS returns the class of the graph analysis with connectivity and functional multiplex data.
			%
			% CLASS = AnalyzeGroup_CON_FUN_MP_GA_WU.GETCLASS() returns the class 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% Alternative forms to call this method are:
			%  CLASS = A.GETCLASS() returns the class of the graph analysis with connectivity and functional multiplex data A.
			%  CLASS = Element.GETCLASS(A) returns the class of 'A'.
			%  CLASS = Element.GETCLASS('AnalyzeGroup_CON_FUN_MP_GA_WU') returns 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% See also getName, getDescription.
			
			a_class = 'AnalyzeGroup_CON_FUN_MP_GA_WU';
		end
		function a_name = getName()
			%GETNAME returns the name of the graph analysis with connectivity and functional multiplex data.
			%
			% NAME = AnalyzeGroup_CON_FUN_MP_GA_WU.GETNAME() returns the name of the 'graph analysis with connectivity and functional multiplex data'.
			%  Graph Analysis With Connectivity And Functional Multiplex Data.
			%
			% Alternative forms to call this method are:
			%  NAME = A.GETNAME() returns the name of the graph analysis with connectivity and functional multiplex data A.
			%  NAME = Element.GETNAME(A) returns the name of 'A'.
			%  NAME = Element.GETNAME('AnalyzeGroup_CON_FUN_MP_GA_WU') returns the name of 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% See also getClass, getDescription.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			a_name = 'Graph Analysis With Connectivity And Functional Multiplex Data';
		end
		function a_description = getDescription()
			%GETDESCRIPTION returns the description of the graph analysis with connectivity and functional multiplex data.
			%
			% STR = AnalyzeGroup_CON_FUN_MP_GA_WU.GETDESCRIPTION() returns the description of the 'graph analysis with connectivity and functional multiplex data'.
			%  which is:
			%
			%  
			%
			% Alternative forms to call this method are:
			%  STR = A.GETDESCRIPTION() returns the description of the graph analysis with connectivity and functional multiplex data A.
			%  STR = Element.GETDESCRIPTION(A) returns the description of 'A'.
			%  STR = Element.GETDESCRIPTION('AnalyzeGroup_CON_FUN_MP_GA_WU') returns the description of 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% See also getClass, getName.
			
			a_description = [
				'' ...
				];
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of graph analysis with connectivity and functional multiplex data.
			%
			% PROPS = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPS() returns the property list of graph analysis with connectivity and functional multiplex data.
			%
			% PROPS = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = A.GETPROPS([CATEGORY]) returns the property list of the graph analysis with connectivity and functional multiplex data A.
			%  PROPS = Element.GETPROPS(A[, CATEGORY]) returns the property list of 'A'.
			%  PROPS = Element.GETPROPS('AnalyzeGroup_CON_FUN_MP_GA_WU'[, CATEGORY]) returns the property list of 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% See also getPropNumber.
			
			if nargin < 1
				category = 'all';
			end
			
			switch category
				case Category.METADATA
					prop_list = [
						AnalyzeGroup.getProps(Category.METADATA)
						];
				case Category.PARAMETER
					prop_list = [
						AnalyzeGroup.getProps(Category.PARAMETER)
						AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
						AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
						AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
						AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
						AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
						];
				case Category.DATA
					prop_list = [
						AnalyzeGroup.getProps(Category.DATA)
						];
				case Category.RESULT
					prop_list = [
						AnalyzeGroup.getProps(Category.RESULT)
						];
				case Category.FIGURE
					prop_list = [
						AnalyzeGroup.getProps(Category.FIGURE)
						];
				case Category.GUI
					prop_list = [
						AnalyzeGroup.getProps(Category.GUI)
						];
				otherwise
					prop_list = [
						AnalyzeGroup.getProps()
						AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
						AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
						AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
						AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
						AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
						];
			end
		end
		function prop_number = getPropNumber()
			%GETPROPNUMBER returns the property number of graph analysis with connectivity and functional multiplex data.
			%
			% N = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPNUMBER() returns the property number of graph analysis with connectivity and functional multiplex data.
			%
			% Alternative forms to call this method are:
			%  N = A.GETPROPNUMBER() returns the property number of the graph analysis with connectivity and functional multiplex data A.
			%  N = Element.GETPROPNUMBER(A) returns the property number of 'A'.
			%  N = Element.GETPROPNUMBER('AnalyzeGroup_CON_FUN_MP_GA_WU') returns the property number of 'AnalyzeGroup_CON_FUN_MP_GA_WU'.
			%
			% See also getProps.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			prop_number = 10;
		end
		function check = existsProp(prop)
			%EXISTSPROP checks whether property exists in graph analysis with connectivity and functional multiplex data/error.
			%
			% CHECK = AnalyzeGroup_CON_FUN_MP_GA_WU.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = A.EXISTSPROP(PROP) checks whether PROP exists for A.
			%  CHECK = Element.EXISTSPROP(A, PROP) checks whether PROP exists for A.
			%  CHECK = Element.EXISTSPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP) checks whether PROP exists for AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  A.EXISTSPROP(PROP) throws error if PROP does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  Element.EXISTSPROP(A, PROP) throws error if PROP does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  Element.EXISTSPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP) throws error if PROP does NOT exist for AnalyzeGroup_CON_FUN_MP_GA_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				check = any(prop == [ 1  2  3  4  5  6  7  8  9  10 ]);
			else
				assert( ...
					AnalyzeGroup_CON_FUN_MP_GA_WU.existsProp(prop), ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for AnalyzeGroup_CON_FUN_MP_GA_WU.'] ...
					)
			end
		end
		function check = existsTag(tag)
			%EXISTSTAG checks whether tag exists in graph analysis with connectivity and functional multiplex data/error.
			%
			% CHECK = AnalyzeGroup_CON_FUN_MP_GA_WU.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = A.EXISTSTAG(TAG) checks whether TAG exists for A.
			%  CHECK = Element.EXISTSTAG(A, TAG) checks whether TAG exists for A.
			%  CHECK = Element.EXISTSTAG(AnalyzeGroup_CON_FUN_MP_GA_WU, TAG) checks whether TAG exists for AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  A.EXISTSTAG(TAG) throws error if TAG does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  Element.EXISTSTAG(A, TAG) throws error if TAG does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  Element.EXISTSTAG(AnalyzeGroup_CON_FUN_MP_GA_WU, TAG) throws error if TAG does NOT exist for AnalyzeGroup_CON_FUN_MP_GA_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				analyzegroup_con_fun_mp_ga_wu_tag_list = { 'id'  'label'  'notes'  'gr'  'g'  'repetition'  'frequencyrulemin'  'frequencyrulemax'  'correlation_rule'  'negative_weight_rule' };
				
				check = any(strcmpi(tag, analyzegroup_con_fun_mp_ga_wu_tag_list));
			else
				assert( ...
					AnalyzeGroup_CON_FUN_MP_GA_WU.existsTag(tag), ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tag ' is not a valid tag for AnalyzeGroup_CON_FUN_MP_GA_WU'] ...
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
			%  PROPERTY = A.GETPROPPROP(POINTER) returns property number of POINTER of A.
			%  PROPERTY = Element.GETPROPPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns property number of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  PROPERTY = A.GETPROPPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns property number of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropFormat, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				% COMPUTATIONAL EFFICIENCY TRICK
				analyzegroup_con_fun_mp_ga_wu_tag_list = { 'id'  'label'  'notes'  'gr'  'g'  'repetition'  'frequencyrulemin'  'frequencyrulemax'  'correlation_rule'  'negative_weight_rule' };
				
				tag = pointer;
				AnalyzeGroup_CON_FUN_MP_GA_WU.existsTag(tag);
				
				prop = find(strcmpi(tag, analyzegroup_con_fun_mp_ga_wu_tag_list));
			else % numeric
				prop = pointer;
				AnalyzeGroup_CON_FUN_MP_GA_WU.existsProp(prop);
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
			%  TAG = A.GETPROPTAG(POINTER) returns tag of POINTER of A.
			%  TAG = Element.GETPROPTAG(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns tag of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  TAG = A.GETPROPTAG(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns tag of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropProp, getPropSettings, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				tag = pointer;
				AnalyzeGroup_CON_FUN_MP_GA_WU.existsTag(tag);
			else % numeric
				prop = pointer;
				AnalyzeGroup_CON_FUN_MP_GA_WU.existsProp(prop);
				
				switch prop
					case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
						tag = AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION_TAG;
					case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
						tag = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN_TAG;
					case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
						tag = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX_TAG;
					case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
						tag = AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE_TAG;
					case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
						tag = AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE_TAG;
					otherwise
						tag = getPropTag@AnalyzeGroup(prop);
				end
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the
			%  category of the property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the
			%  category of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = A.GETPROPCATEGORY(POINTER) returns category of POINTER of A.
			%  CATEGORY = Element.GETPROPCATEGORY(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns category of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  CATEGORY = A.GETPROPCATEGORY(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns category of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					prop_category = AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION_CATEGORY;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					prop_category = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN_CATEGORY;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					prop_category = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX_CATEGORY;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					prop_category = AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE_CATEGORY;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					prop_category = AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE_CATEGORY;
				otherwise
					prop_category = getPropCategory@AnalyzeGroup(prop);
			end
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
			%  FORMAT = A.GETPROPFORMAT(POINTER) returns format of POINTER of A.
			%  FORMAT = Element.GETPROPFORMAT(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns format of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  FORMAT = A.GETPROPFORMAT(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns format of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					prop_format = AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION_FORMAT;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					prop_format = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN_FORMAT;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					prop_format = AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX_FORMAT;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					prop_format = AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE_FORMAT;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					prop_format = AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE_FORMAT;
				otherwise
					prop_format = getPropFormat@AnalyzeGroup(prop);
			end
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
			%  DESCRIPTION = A.GETPROPDESCRIPTION(POINTER) returns description of POINTER of A.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns description of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  DESCRIPTION = A.GETPROPDESCRIPTION(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns description of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					prop_description = 'REPETITION(parameter, scalar) is the number of repetitions for functional data';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					prop_description = 'FREQUENCYRULEMIN(parameter, scalar) is the minimum frequency value for functional data';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					prop_description = 'FREQUENCYRULEMAX(parameter, scalar) is the maximum frequency value for functional data';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					prop_description = 'CORRELATION_RULE (parameter, option) is the correlation type for functional data.';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					prop_description = 'NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights of functional data.';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.GR
					prop_description = 'GR (data, item) is the subject group, which also defines the subject class SubjectCON_FUN_MP.';
				case AnalyzeGroup_CON_FUN_MP_GA_WU.G
					prop_description = 'G (result, item) is the average multiplex graph obtained from this analysis.';
				otherwise
					prop_description = getPropDescription@AnalyzeGroup(prop);
			end
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
			%  SETTINGS = A.GETPROPSETTINGS(POINTER) returns settings of POINTER of A.
			%  SETTINGS = Element.GETPROPSETTINGS(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns settings of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  SETTINGS = A.GETPROPSETTINGS(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns settings of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					prop_settings = Correlation.CORRELATION_RULE_LIST;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					prop_settings = Correlation.NEGATIVE_WEIGHT_RULE_LIST;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.G
					prop_settings = 'MultiplexWU';
				otherwise
					prop_settings = getPropSettings@AnalyzeGroup(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = A.GETPROPDEFAULT(POINTER) returns the default value of POINTER of A.
			%  DEFAULT = Element.GETPROPDEFAULT(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns the default value of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  DEFAULT = A.GETPROPDEFAULT(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns the default value of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					prop_default = 1;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					prop_default = 0;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					prop_default = Inf;
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					prop_default = Correlation.CORRELATION_RULE_LIST{1};
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					prop_default = Correlation.NEGATIVE_WEIGHT_RULE_LIST{1};
				case AnalyzeGroup_CON_FUN_MP_GA_WU.GR
					prop_default = Group('SUB_CLASS', 'SubjectCON_FUN_MP');
				case AnalyzeGroup_CON_FUN_MP_GA_WU.G
					prop_default = MultiplexWU();
				otherwise
					prop_default = getPropDefault@AnalyzeGroup(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = AnalyzeGroup_CON_FUN_MP_GA_WU.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = A.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of A.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns the conditioned default value of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  DEFAULT = A.GETPROPDEFAULTCONDITIONED(AnalyzeGroup_CON_FUN_MP_GA_WU, POINTER) returns the conditioned default value of POINTER of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%
			% See also getPropDefault, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			prop_default = AnalyzeGroup_CON_FUN_MP_GA_WU.conditioning(prop, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropDefault(prop));
		end
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = A.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = A.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of A.
			%  CHECK = Element.CHECKPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP, VALUE) checks VALUE format for PROP of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%  CHECK = A.CHECKPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP, VALUE) checks VALUE format for PROP of AnalyzeGroup_CON_FUN_MP_GA_WU.
			% 
			% A.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  A.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of A.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  Element.CHECKPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			%  A.CHECKPROP(AnalyzeGroup_CON_FUN_MP_GA_WU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AnalyzeGroup_CON_FUN_MP_GA_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_CON_FUN_MP_GA_WU:WrongInput]
			% 
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription,
			% getPropDefault.
			
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.REPETITION
					check = Format.checkFormat(Format.SCALAR, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMIN
					check = Format.checkFormat(Format.SCALAR, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				case AnalyzeGroup_CON_FUN_MP_GA_WU.FREQUENCYRULEMAX
					check = Format.checkFormat(Format.SCALAR, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				case AnalyzeGroup_CON_FUN_MP_GA_WU.CORRELATION_RULE
					check = Format.checkFormat(Format.OPTION, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				case AnalyzeGroup_CON_FUN_MP_GA_WU.NEGATIVE_WEIGHT_RULE
					check = Format.checkFormat(Format.OPTION, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				case AnalyzeGroup_CON_FUN_MP_GA_WU.G
					check = Format.checkFormat(Format.ITEM, value, AnalyzeGroup_CON_FUN_MP_GA_WU.getPropSettings(prop));
				otherwise
					check = checkProp@AnalyzeGroup(prop, value);
			end
			
			if nargout == 1
				prop_check = check;
			else
				assert( ...
					check, ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_CON_FUN_MP_GA_WU:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' AnalyzeGroup_CON_FUN_MP_GA_WU.getPropTag(prop) ' (' AnalyzeGroup_CON_FUN_MP_GA_WU.getPropFormat(prop) ').'] ...
					)
			end
		end
	end
	methods % constructor
		function a = AnalyzeGroup_CON_FUN_MP_GA_WU(varargin)
			% AnalyzeGroup_CON_FUN_MP_GA_WU() creates a graph analysis with connectivity and functional multiplex data.
			%
			% AnalyzeGroup_CON_FUN_MP_GA_WU(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% AnalyzeGroup_CON_FUN_MP_GA_WU(TAG, VALUE, ...) with property with tag TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of AnalyzeGroup_CON_FUN_MP_GA_WU properties is:
			%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the graph analysis.
			%  <strong>2</strong> <strong>label</strong> 	LABEL (metadata, string) is an extended label of the graph analysis.
			%  <strong>3</strong> <strong>notes</strong> 	NOTES (metadata, string) are some specific notes about the graph analysis.
			%  <strong>4</strong> <strong>gr</strong> 	GR (data, item) is the subject group, which also defines the subject class SubjectCON_FUN_MP.
			%  <strong>5</strong> <strong>g</strong> 	G (result, item) is the average multiplex graph obtained from this analysis.
			%  <strong>6</strong> <strong>repetition</strong> 	REPETITION(parameter, scalar) is the number of repetitions for functional data
			%  <strong>7</strong> <strong>frequencyrulemin</strong> 	FREQUENCYRULEMIN(parameter, scalar) is the minimum frequency value for functional data
			%  <strong>8</strong> <strong>frequencyrulemax</strong> 	FREQUENCYRULEMAX(parameter, scalar) is the maximum frequency value for functional data
			%  <strong>9</strong> <strong>correlation_rule</strong> 	CORRELATION_RULE (parameter, option) is the correlation type for functional data.
			%  <strong>10</strong> <strong>negative_weight_rule</strong> 	NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights of functional data.
			%
			% See also Category, Format, set, check.
			
			a = a@AnalyzeGroup(varargin{:});
		end
	end
	methods (Static, Access=protected) % conditioning
		function value = conditioning(pointer, value)
			prop = AnalyzeGroup_CON_FUN_MP_GA_WU.getPropProp(pointer);
			
			switch prop
				otherwise
					if prop <= AnalyzeGroup.getPropNumber()
						value = conditioning@AnalyzeGroup(pointer, value);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(a, prop)
		
			switch prop
				case AnalyzeGroup_CON_FUN_MP_GA_WU.G
					gr = a.get('GR');
					T = a.get('REPETITION');
					fmin = a.get('FREQUENCYRULEMIN');
					fmax = a.get('FREQUENCYRULEMAX');
					A = cell(1, 2);
					data = cell(1, 2);
					
					for i = 1:1:gr.get('SUB_DICT').length()
					    sub = gr.get('SUB_DICT').getItem(i);
					    CON_FUN_MP = sub.getr('CON_FUN_MP');
					    
					    % FUN data
					    data_fun = CON_FUN_MP{2};
					    fs = 1 / T;
					    
					    if fmax > fmin && T > 0
					        NFFT = 2 * ceil(size(data_fun, 1) / 2);
					        ft = fft(data_fun, NFFT);  % Fourier transform
					        f = fftshift(fs * abs(-NFFT / 2:NFFT / 2 - 1) / NFFT);  % absolute frequency
					        ft(f < fmin | f > fmax, :) = 0;
					        data_fun = ifft(ft, NFFT);
					    end
					    
					    A_fun = Correlation.getAdjacencyMatrix(data_fun, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'));
					    
					    % CON data
					    if i == 1
					        data(1) = CON_FUN_MP(1);
					        data(2) = {A_fun};
					    else
					        data(1) = {data{1} + CON_FUN_MP{1}};
					        data(2) = {data{2} + A_fun};
					    end
					    
					end
					
					A(1) = {data{1}/gr.get('SUB_DICT').length()};
					A(2) = {data{2}/gr.get('SUB_DICT').length()};
										
					g = MultiplexWU( ...
					    'ID', ['g ' gr.get('ID')], ...
					    'B', A ...
					    );
					
					value = g;
					
				otherwise
					value = calculateValue@AnalyzeGroup(a, prop);
					
			end
		end
	end
	methods % methods
		function pr = getPPCompareGroup_CPDict(a, varargin) 
		    %GEPPPCOMPAREGROUP_CPDICT returns the comparison plot panel compatible with the analysis.
		    %
		    % PR = GEPPPCOMPAREGROUP_CPDICT(A) returns the comparison plot panel
		    %  that is compatible with the analyze group. Utilizes ST_MP PP.
		    %
		    % See also CompareGroup.
		    
		    pr = PPCompareGroup_CPDict_ST_MP_WU(varargin{:});
		end
	end
end
