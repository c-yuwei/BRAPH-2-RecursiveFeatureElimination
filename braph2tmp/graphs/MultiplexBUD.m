classdef MultiplexBUD < MultiplexWU
	% MultiplexBUD is a binary undirected multiplex with fixed densities.
	% It is a subclass of <a href="matlab:help MultiplexWU">MultiplexWU</a>.
	%
	% In a binary undirected multiplex with fixed densities (BUD), 
	% all the layers consist of binary undirected (BU) multiplex graphs 
	% derived from the same weighted supra-connectivity matrices 
	% binarized at different densities.
	%
	% The list of MultiplexBUD properties is:
	%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the graph.
	%  <strong>2</strong> <strong>label</strong> 	LABEL (metadata, string) is an extended label of the graph.
	%  <strong>3</strong> <strong>notes</strong> 	NOTES (metadata, string) are some specific notes about the graph.
	%  <strong>4</strong> <strong>brainatlas</strong> 	BRAINATLAS (data, item) is a atlas associated with the graph.
	%  <strong>5</strong> <strong>a</strong> 	A (result, cell) is the cell array containing the multiplex binary adjacency matrices of the binary undirected multiplex. 
	%  <strong>6</strong> <strong>m_dict</strong> 	M_DICT (result, idict) contains the calculated measures of the graph.
	%  <strong>7</strong> <strong>b</strong> 	B (data, cell) is the input cell containing the multiplex adjacency matrices on the diagonal.
	%  <strong>8</strong> <strong>attemptsperedge</strong> 	ATTEMPTSPEREDGE (parameter, scalar) is the attempts to rewire each edge.
	%  <strong>9</strong> <strong>numberofweights</strong> 	NUMBEROFWEIGHTS (parameter, scalar) specifies the number of weights sorted at the same time.
	%  <strong>10</strong> <strong>densities</strong> 	DENSITIES (parameter, rvector) is the vector of densities.
	%  <strong>11</strong> <strong>nodelabels</strong> 	NODELABELS (metadata, STRING) is the node labels.
	%
	% MultiplexBUD methods (constructor):
	% MultiplexBUD - constructor
	%
	% MultiplexBUD methods (Static):
	%  checkProp - checks whether a value has the correct format/error.
	%  getPropDefaultConditioned - returns the conditioned default value of a property.
	%  getPropDefault - returns the default value of a property.
	%  getPropSettings - returns the settings of a property.
	%  getPropDescription - returns the description of a property.
	%  getPropFormat - returns the format of a property.
	%  getPropCategory - returns the category of a property.
	%  getPropTag - returns the tag of a property.
	%  getPropProp - returns the property number of a property.
	%  existsTag - checks whether tag exists in binary undirected multiplex with fixed densities/error.
	%  existsProp - checks whether property exists in binary undirected multiplex with fixed densities/error.
	%  getPropNumber - returns the property number of binary undirected multiplex with fixed densities.
	%  getProps - returns the property list of binary undirected multiplex with fixed densities.
	%  getDescription - returns the description of the binary undirected multiplex with fixed densities.
	%  getName - returns the name of the binary undirected multiplex with fixed densities.
	%  getClass - returns the class of the binary undirected multiplex with fixed densities.
	%  getNegativityType - returns the negativity type of the graph.
	%  getSelfConnectivityType - returns the self-connectivity type of the graph.
	%  getDirectionalityType - returns the directionality type of the graph.
	%  getConnectivityType - returns the connectivity type of the graph.
	%  getGraphType - returns the graph type.
	%  edgeattack - removes given edges from a graph
	%  nodeattack - removes given nodes from a graph
	%  subgraph - Extract a subgraph
	%  getCompatibleMeasureList - T returns the list of measures
	%  checkNegativity - checks if adjacency matrix A is correct for the negativity type.
	%  checkSelfConnectivity - checks if adjacency matrix A is correct for the self-connectivity type.
	%  checkDirectionality - checks if adjacency matrix A is correct for the directionality type.
	%  checkConnectivity - checks if adjacency matrix A is correct for the connectivity type.
	%  checkA - checks whether adjacency matrix A is correct for the type of graph.
	%  is_negative - checks whether graph allows negative values.
	%  is_nonnegative - checks whether graph allows non-negative values.
	%  is_not_selfconnected - checks if graph is not self-connected.
	%  is_selfconnected - checks if graph is self-connected.
	%  is_undirected - checks if graph is undirected.
	%  is_directed - checks if graph is directed
	%  is_binary - checks if graph is binary
	%  is_weighted - checks if graph is weighted.
	%  is_multilayer - checks if graph is multilayer
	%  is_ordered_multilayer - checks if graph is ordered multilayer.
	%  is_multiplex - checks if graph is multiplex.
	%  is_ordered_multiplex - checks if graph is ordered multiplex.
	%  is_multigraph - checks if graph is multigraph.
	%  is_graph - checks if graph is graph (single layer).
	%
	% MultiplexBUD methods:
	%  layernumber - returns the number of layers in the graph.
	%  getPlotProp - returns a prop plot.
	%  randomize - E returns a randomized graph
	%  getMeasure - returns measure.
	%  nodenumber - returns the number of nodes in the graph.
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
	% MultiplexBUD methods (operators):
	%  isequal - determines whether two MultiplexBUD are equal (values, locked)
	%
	% MultiplexBUD methods (display):
	%  tostring - string with information about the MultiplexBUD
	%  disp - displays information about the MultiplexBUD
	%  tree - displays the element of MultiplexBUD
	%
	% MultiplexBUD method (element list):
	%  getElementList - returns a list with all subelements of MultiplexBUD
	%
	% MultiplexBUD method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the MultiplexBUD
	%
	% MultiplexBUD method (JSON decode, Static):
	%  decodeJSON - returns a JSON string encoding the MultiplexBUD
	%
	% MultiplexBUD methods (copy):
	%  copy - copies the MultiplexBUD
	%  deepclone - deep-clones the MultiplexBUD
	%  clone - clones the MultiplexBUD
	%
	% MultiplexBUD methods (inspection, Static):
	%  getClass - returns MultiplexBUD
	%  getName - returns the name of MultiplexBUD
	%  getDescription - returns the description of MultiplexBUD
	%  getProps - returns the property list of MultiplexBUD
	%  getPropNumber - returns the property number of MultiplexBUD
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
	% MultiplexBUD methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexBUD methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% MultiplexBUD methods (GUI):
	%  getGUI - returns the element GUI
	%  getPlotElement - returns the element plot
	%  getPlotProp - returns a prop plot
	%
	% MultiplexBUD methods (GUI, Static):
	%  getGUIMenuImport - returns an importer menu
	%  getGUIMenuExport - returns an exporter menu
	%
	% MultiplexBUD properties (Constant).
	%  DENSITIES - 10
	%  DENSITIES_TAG - 'densities'
	%  DENSITIES_CATEGORY - 'p'
	%  DENSITIES_FORMAT - 'nr'
	%  NODELABELS - 11
	%  NODELABELS_TAG - 'nodelabels'
	%  NODELABELS_CATEGORY - 'm'
	%  NODELABELS_FORMAT - 'st'
	%  B - 7
	%  B_TAG - 'b'
	%  B_CATEGORY - 'd'
	%  B_FORMAT - 'll'
	%  ATTEMPTSPEREDGE - 8
	%  ATTEMPTSPEREDGE_TAG - 'attemptsperedge'
	%  ATTEMPTSPEREDGE_CATEGORY - 'p'
	%  ATTEMPTSPEREDGE_FORMAT - 'nn'
	%  NUMBEROFWEIGHTS - 9
	%  NUMBEROFWEIGHTS_TAG - 'numberofweights'
	%  NUMBEROFWEIGHTS_CATEGORY - 'p'
	%  NUMBEROFWEIGHTS_FORMAT - 'nn'
	%  GRAPH - 1
	%  GRAPH_NAME - 'Graph'
	%  GRAPH_DESCRIPTION - 'A graph consists of a single layer.'
	%  MULTIGRAPH - 2
	%  MULTIGRAPH_NAME - 'Multigraph'
	%  MULTIGRAPH_DESCRIPTION - 'A multigraph consists of multiple unconnected layers.'
	%  ORDERED_MULTIPLEX - 3
	%  ORDERED_MULTIPLEX_NAME - 'Ordered Multipex'
	%  ORDERED_MULTIPLEX_DESCRIPTION - 'An ordered multiplex consists of a sequence of layers with ordinal connectionsbetween corresponding nodes in subsequent layers.'
	%  MULTIPLEX - 4
	%  MULTIPLEX_NAME - 'Multiplex'
	%  MULTIPLEX_DESCRIPTION - 'A multiplex consists of multiple layers with categorical connections between corresponding nodes in different layers.'
	%  ORDERED_MULTILAYER - 5
	%  ORDERED_MULTILAYER_NAME - 'Ordered Multilayer'
	%  ORDERED_MULTILAYER_DESCRIPTION - 'An ordered multilayer consists of multiple layers with ordinal connections between any nodes.'
	%  MULTILAYER - 6
	%  MULTILAYER_NAME - 'Multilayer'
	%  MULTILAYER_DESCRIPTION - 'A multilayer consists of multiple layers with categorical between any nodes.'
	%  TYPE_NUMBER - 6
	%  TYPE_NAME - cell[6 1] { 'Graph' 'Multigraph' 'Ordered Multipex' 'Multiplex' 'Ordered Multilayer' 'Multilayer' }
	%  TYPE_DESCRIPTION - cell[6 1] { 'A graph consists of a single layer.' 'A multigraph consists of multiple unconnected layers.' 'An ordered multiplex consists of a sequence of layers with ordinal connectionsbetween corresponding nodes in subsequent layers.' 'A multiplex consists of multiple layers with categorical connections between corresponding nodes in different layers.' 'An ordered multilayer consists of multiple layers with ordinal connections between any nodes.' 'A multilayer consists of multiple layers with categorical between any nodes.' }
	%  WEIGHTED - 1
	%  WEIGHTED_NAME - 'Weighted'
	%  WEIGHTED_DESCRIPTION - 'Graph with weighted connections.'
	%  BINARY - 2
	%  BINARY_NAME - 'Binary'
	%  BINARY_DESCRIPTION - 'Graph with binary (0 or 1) connections.'
	%  CONNECTIVITY_TYPE_NUMBER - 2
	%  CONNECTIVITY_TYPE_NAME - cell[2 1] { 'Weighted' 'Binary' }
	%  CONNECTIVITY_TYPE_DESCRIPTION - cell[2 1] { 'Graph with weighted connections.' 'Graph with binary (0 or 1) connections.' }
	%  DIRECTED - 1
	%  DIRECTED_NAME - 'Directed'
	%  DIRECTED_DESCRIPTION - 'Graph with directed edges.'
	%  UNDIRECTED - 2
	%  UNDIRECTED_NAME - 'Undirected'
	%  UNDIRECTED_DESCRIPTION - 'Graph with undirected edges.'
	%  DIRECTIONALITY_TYPE_NUMBER - 2
	%  DIRECTIONALITY_TYPE_NAME - cell[2 1] { 'Directed' 'Undirected' }
	%  DIRECTIONALITY_TYPE_DESCRIPTION - cell[2 1] { 'Graph with directed edges.' 'Graph with undirected edges.' }
	%  NONSELFCONNECTED - 1
	%  NONSELFCONNECTED_NAME - 'Non-self-connected'
	%  NONSELFCONNECTED_DESCRIPTION - 'Graph without self-connections.'
	%  SELFCONNECTED - 2
	%  SELFCONNECTED_NAME - 'Self-connected'
	%  SELFCONNECTED_DESCRIPTION - 'Graph with self-connections.'
	%  SELFCONNECTIVITY_TYPE_NUMBER - 2
	%  SELFCONNECTIVITY_TYPE_NAME - cell[2 1] { 'Non-self-connected' 'Self-connected' }
	%  SELFCONNECTIVITY_TYPE_DESCRIPTION - cell[2 1] { 'Graph without self-connections.' 'Graph with self-connections.' }
	%  NONNEGATIVE - 1
	%  NONNEGATIVE_NAME - 'Non-negative'
	%  NONNEGATIVE_DESCRIPTION - 'Graph without negative edges.'
	%  NEGATIVE - 2
	%  NEGATIVE_NAME - 'Negative'
	%  NEGATIVE_DESCRIPTION - 'Graph allowing negative edges.'
	%  NEGATIVITY_TYPE_NUMBER - 2
	%  NEGATIVITY_TYPE_NAME - cell[2 1] { 'Non-negative' 'Negative' }
	%  NEGATIVITY_TYPE_DESCRIPTION - cell[2 1] { 'Graph without negative edges.' 'Graph allowing negative edges.' }
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
	%  BRAINATLAS - 4
	%  BRAINATLAS_TAG - 'brainatlas'
	%  BRAINATLAS_CATEGORY - 'd'
	%  BRAINATLAS_FORMAT - 'it'
	%  A - 5
	%  A_TAG - 'a'
	%  A_CATEGORY - 'r'
	%  A_FORMAT - 'll'
	%  M_DICT - 6
	%  M_DICT_TAG - 'm_dict'
	%  M_DICT_CATEGORY - 'r'
	%  M_DICT_FORMAT - 'di'
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
		DENSITIES = MultiplexWU.getPropNumber() + 1;
		DENSITIES_TAG = 'densities';
		DENSITIES_CATEGORY = Category.PARAMETER;
		DENSITIES_FORMAT = Format.RVECTOR;
		
		NODELABELS = MultiplexWU.getPropNumber() + 2;
		NODELABELS_TAG = 'nodelabels';
		NODELABELS_CATEGORY = Category.METADATA;
		NODELABELS_FORMAT = Format.STRING;
	end
	methods (Static) % inspection methods
		function g_class = getClass()
			%GETCLASS returns the class of the binary undirected multiplex with fixed densities.
			%
			% CLASS = MultiplexBUD.GETCLASS() returns the class 'MultiplexBUD'.
			%
			% Alternative forms to call this method are:
			%  CLASS = G.GETCLASS() returns the class of the binary undirected multiplex with fixed densities G.
			%  CLASS = Element.GETCLASS(G) returns the class of 'G'.
			%  CLASS = Element.GETCLASS('MultiplexBUD') returns 'MultiplexBUD'.
			%
			% See also getName, getDescription.
			
			g_class = 'MultiplexBUD';
		end
		function g_name = getName()
			%GETNAME returns the name of the binary undirected multiplex with fixed densities.
			%
			% NAME = MultiplexBUD.GETNAME() returns the name of the 'binary undirected multiplex with fixed densities'.
			%  Binary Undirected Multiplex With Fixed Densities.
			%
			% Alternative forms to call this method are:
			%  NAME = G.GETNAME() returns the name of the binary undirected multiplex with fixed densities G.
			%  NAME = Element.GETNAME(G) returns the name of 'G'.
			%  NAME = Element.GETNAME('MultiplexBUD') returns the name of 'MultiplexBUD'.
			%
			% See also getClass, getDescription.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			g_name = 'Binary Undirected Multiplex With Fixed Densities';
		end
		function g_description = getDescription()
			%GETDESCRIPTION returns the description of the binary undirected multiplex with fixed densities.
			%
			% STR = MultiplexBUD.GETDESCRIPTION() returns the description of the 'binary undirected multiplex with fixed densities'.
			%  which is:
			%
			%  In a binary undirected multiplex with fixed densities (BUD), 
			%  all the layers consist of binary undirected (BU) multiplex graphs 
			%  derived from the same weighted supra-connectivity matrices 
			%  binarized at different densities.
			%
			% Alternative forms to call this method are:
			%  STR = G.GETDESCRIPTION() returns the description of the binary undirected multiplex with fixed densities G.
			%  STR = Element.GETDESCRIPTION(G) returns the description of 'G'.
			%  STR = Element.GETDESCRIPTION('MultiplexBUD') returns the description of 'MultiplexBUD'.
			%
			% See also getClass, getName.
			
			g_description = [
				'In a binary undirected multiplex with fixed densities (BUD), ' ...
				'all the layers consist of binary undirected (BU) multiplex graphs ' ...
				'derived from the same weighted supra-connectivity matrices ' ...
				'binarized at different densities.' ...
				];
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of binary undirected multiplex with fixed densities.
			%
			% PROPS = MultiplexBUD.GETPROPS() returns the property list of binary undirected multiplex with fixed densities.
			%
			% PROPS = MultiplexBUD.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = G.GETPROPS([CATEGORY]) returns the property list of the binary undirected multiplex with fixed densities G.
			%  PROPS = Element.GETPROPS(G[, CATEGORY]) returns the property list of 'G'.
			%  PROPS = Element.GETPROPS('MultiplexBUD'[, CATEGORY]) returns the property list of 'MultiplexBUD'.
			%
			% See also getPropNumber.
			
			if nargin < 1
				category = 'all';
			end
			
			switch category
				case Category.METADATA
					prop_list = [
						MultiplexWU.getProps(Category.METADATA)
						MultiplexBUD.NODELABELS
						];
				case Category.PARAMETER
					prop_list = [
						MultiplexWU.getProps(Category.PARAMETER)
						MultiplexBUD.DENSITIES
						];
				case Category.DATA
					prop_list = [
						MultiplexWU.getProps(Category.DATA)
						];
				case Category.RESULT
					prop_list = [
						MultiplexWU.getProps(Category.RESULT)
						];
				case Category.FIGURE
					prop_list = [
						MultiplexWU.getProps(Category.FIGURE)
						];
				case Category.GUI
					prop_list = [
						MultiplexWU.getProps(Category.GUI)
						];
				otherwise
					prop_list = [
						MultiplexWU.getProps()
						MultiplexBUD.DENSITIES
						MultiplexBUD.NODELABELS
						];
			end
		end
		function prop_number = getPropNumber()
			%GETPROPNUMBER returns the property number of binary undirected multiplex with fixed densities.
			%
			% N = MultiplexBUD.GETPROPNUMBER() returns the property number of binary undirected multiplex with fixed densities.
			%
			% Alternative forms to call this method are:
			%  N = G.GETPROPNUMBER() returns the property number of the binary undirected multiplex with fixed densities G.
			%  N = Element.GETPROPNUMBER(G) returns the property number of 'G'.
			%  N = Element.GETPROPNUMBER('MultiplexBUD') returns the property number of 'MultiplexBUD'.
			%
			% See also getProps.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			prop_number = 11;
		end
		function check = existsProp(prop)
			%EXISTSPROP checks whether property exists in binary undirected multiplex with fixed densities/error.
			%
			% CHECK = MultiplexBUD.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = G.EXISTSPROP(PROP) checks whether PROP exists for G.
			%  CHECK = Element.EXISTSPROP(G, PROP) checks whether PROP exists for G.
			%  CHECK = Element.EXISTSPROP(MultiplexBUD, PROP) checks whether PROP exists for MultiplexBUD.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%
			% Alternative forms to call this method are:
			%  G.EXISTSPROP(PROP) throws error if PROP does NOT exist for G.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  Element.EXISTSPROP(G, PROP) throws error if PROP does NOT exist for G.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  Element.EXISTSPROP(MultiplexBUD, PROP) throws error if PROP does NOT exist for MultiplexBUD.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				check = any(prop == [ 1  2  3  4  5  6  7  8  9  10  11 ]);
			else
				assert( ...
					MultiplexBUD.existsProp(prop), ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexBUD.'] ...
					)
			end
		end
		function check = existsTag(tag)
			%EXISTSTAG checks whether tag exists in binary undirected multiplex with fixed densities/error.
			%
			% CHECK = MultiplexBUD.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = G.EXISTSTAG(TAG) checks whether TAG exists for G.
			%  CHECK = Element.EXISTSTAG(G, TAG) checks whether TAG exists for G.
			%  CHECK = Element.EXISTSTAG(MultiplexBUD, TAG) checks whether TAG exists for MultiplexBUD.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%
			% Alternative forms to call this method are:
			%  G.EXISTSTAG(TAG) throws error if TAG does NOT exist for G.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  Element.EXISTSTAG(G, TAG) throws error if TAG does NOT exist for G.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  Element.EXISTSTAG(MultiplexBUD, TAG) throws error if TAG does NOT exist for MultiplexBUD.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				multiplexbud_tag_list = { 'id'  'label'  'notes'  'brainatlas'  'a'  'm_dict'  'b'  'attemptsperedge'  'numberofweights'  'densities'  'nodelabels' };
				
				check = any(strcmpi(tag, multiplexbud_tag_list));
			else
				assert( ...
					MultiplexBUD.existsTag(tag), ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tag ' is not a valid tag for MultiplexBUD'] ...
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
			%  PROPERTY = G.GETPROPPROP(POINTER) returns property number of POINTER of G.
			%  PROPERTY = Element.GETPROPPROP(MultiplexBUD, POINTER) returns property number of POINTER of MultiplexBUD.
			%  PROPERTY = G.GETPROPPROP(MultiplexBUD, POINTER) returns property number of POINTER of MultiplexBUD.
			%
			% See also getPropFormat, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				% COMPUTATIONAL EFFICIENCY TRICK
				multiplexbud_tag_list = { 'id'  'label'  'notes'  'brainatlas'  'a'  'm_dict'  'b'  'attemptsperedge'  'numberofweights'  'densities'  'nodelabels' };
				
				tag = pointer;
				MultiplexBUD.existsTag(tag);
				
				prop = find(strcmpi(tag, multiplexbud_tag_list));
			else % numeric
				prop = pointer;
				MultiplexBUD.existsProp(prop);
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
			%  TAG = G.GETPROPTAG(POINTER) returns tag of POINTER of G.
			%  TAG = Element.GETPROPTAG(MultiplexBUD, POINTER) returns tag of POINTER of MultiplexBUD.
			%  TAG = G.GETPROPTAG(MultiplexBUD, POINTER) returns tag of POINTER of MultiplexBUD.
			%
			% See also getPropProp, getPropSettings, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				tag = pointer;
				MultiplexBUD.existsTag(tag);
			else % numeric
				prop = pointer;
				MultiplexBUD.existsProp(prop);
				
				switch prop
					case MultiplexBUD.DENSITIES
						tag = MultiplexBUD.DENSITIES_TAG;
					case MultiplexBUD.NODELABELS
						tag = MultiplexBUD.NODELABELS_TAG;
					otherwise
						tag = getPropTag@MultiplexWU(prop);
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
			%  CATEGORY = G.GETPROPCATEGORY(POINTER) returns category of POINTER of G.
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexBUD, POINTER) returns category of POINTER of MultiplexBUD.
			%  CATEGORY = G.GETPROPCATEGORY(MultiplexBUD, POINTER) returns category of POINTER of MultiplexBUD.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					prop_category = MultiplexBUD.DENSITIES_CATEGORY;
				case MultiplexBUD.NODELABELS
					prop_category = MultiplexBUD.NODELABELS_CATEGORY;
				otherwise
					prop_category = getPropCategory@MultiplexWU(prop);
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
			%  FORMAT = G.GETPROPFORMAT(POINTER) returns format of POINTER of G.
			%  FORMAT = Element.GETPROPFORMAT(MultiplexBUD, POINTER) returns format of POINTER of MultiplexBUD.
			%  FORMAT = G.GETPROPFORMAT(MultiplexBUD, POINTER) returns format of POINTER of MultiplexBUD.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					prop_format = MultiplexBUD.DENSITIES_FORMAT;
				case MultiplexBUD.NODELABELS
					prop_format = MultiplexBUD.NODELABELS_FORMAT;
				otherwise
					prop_format = getPropFormat@MultiplexWU(prop);
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
			%  DESCRIPTION = G.GETPROPDESCRIPTION(POINTER) returns description of POINTER of G.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexBUD, POINTER) returns description of POINTER of MultiplexBUD.
			%  DESCRIPTION = G.GETPROPDESCRIPTION(MultiplexBUD, POINTER) returns description of POINTER of MultiplexBUD.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					prop_description = 'DENSITIES (parameter, rvector) is the vector of densities.';
				case MultiplexBUD.NODELABELS
					prop_description = 'NODELABELS (metadata, STRING) is the node labels.';
				case MultiplexBUD.A
					prop_description = 'A (result, cell) is the cell array containing the multiplex binary adjacency matrices of the binary undirected multiplex. ';
				otherwise
					prop_description = getPropDescription@MultiplexWU(prop);
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
			%  SETTINGS = G.GETPROPSETTINGS(POINTER) returns settings of POINTER of G.
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexBUD, POINTER) returns settings of POINTER of MultiplexBUD.
			%  SETTINGS = G.GETPROPSETTINGS(MultiplexBUD, POINTER) returns settings of POINTER of MultiplexBUD.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					prop_settings = Format.getFormatSettings(Format.RVECTOR);
				case MultiplexBUD.NODELABELS
					prop_settings = Format.getFormatSettings(Format.STRING);
				otherwise
					prop_settings = getPropSettings@MultiplexWU(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexBUD.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexBUD.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = G.GETPROPDEFAULT(POINTER) returns the default value of POINTER of G.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexBUD, POINTER) returns the default value of POINTER of MultiplexBUD.
			%  DEFAULT = G.GETPROPDEFAULT(MultiplexBUD, POINTER) returns the default value of POINTER of MultiplexBUD.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					prop_default = Format.getFormatDefault(Format.RVECTOR, MultiplexBUD.getPropSettings(prop));
				case MultiplexBUD.NODELABELS
					prop_default = Format.getFormatDefault(Format.STRING, MultiplexBUD.getPropSettings(prop));
				otherwise
					prop_default = getPropDefault@MultiplexWU(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexBUD.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexBUD.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = G.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of G.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexBUD, POINTER) returns the conditioned default value of POINTER of MultiplexBUD.
			%  DEFAULT = G.GETPROPDEFAULTCONDITIONED(MultiplexBUD, POINTER) returns the conditioned default value of POINTER of MultiplexBUD.
			%
			% See also getPropDefault, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			prop_default = MultiplexBUD.conditioning(prop, MultiplexBUD.getPropDefault(prop));
		end
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = G.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = G.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of G.
			%  CHECK = Element.CHECKPROP(MultiplexBUD, PROP, VALUE) checks VALUE format for PROP of MultiplexBUD.
			%  CHECK = G.CHECKPROP(MultiplexBUD, PROP, VALUE) checks VALUE format for PROP of MultiplexBUD.
			% 
			% G.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: [BRAPH2:MultiplexBUD:WrongInput]
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  G.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of G.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  Element.CHECKPROP(MultiplexBUD, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexBUD.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			%  G.CHECKPROP(MultiplexBUD, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexBUD.
			%   Error id: [BRAPH2:MultiplexBUD:WrongInput]
			% 
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription,
			% getPropDefault.
			
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				case MultiplexBUD.DENSITIES
					check = Format.checkFormat(Format.RVECTOR, value, MultiplexBUD.getPropSettings(prop));
				case MultiplexBUD.NODELABELS
					check = Format.checkFormat(Format.STRING, value, MultiplexBUD.getPropSettings(prop));
				otherwise
					check = checkProp@MultiplexWU(prop, value);
			end
			
			if nargout == 1
				prop_check = check;
			else
				assert( ...
					check, ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexBUD:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexBUD.getPropTag(prop) ' (' MultiplexBUD.getPropFormat(prop) ').'] ...
					)
			end
		end
	end
	methods (Static) %% graph methods
		function graph = getGraphType()
			%GETGRAPHTYPE returns 4 (Multiplex).
			%
			% 4 = MultiplexBUD.GETGRAPHTYPE() returns the type of graph (Multiplex).
			%
			% See also getConnectivityType, getDirectionalityType, getSelfConnectivityType, getNegativityType.
			
			graph = Graph.MULTIPLEX;
		end
		function connectivity = getConnectivityType(varargin)
			%GETCONNECTIVITYTYPE returns 2 (Binary).
			%
			% 2 = MultiplexBUD.GETCONNECTIVITYTYPE() returns the type of graph connectivity (Binary).
			%
			% 2 = MultiplexBUD.GETCONNECTIVITYTYPE(LAYERNUMBER) returns a matrix with the 
			%  connectivity type of each layer in a multiple layer graph.
			%
			% See also getGraphType, getDirectionalityType, getSelfConnectivityType, getNegativityType.
			
			
			if isempty(varargin)
				layernumber = 1;
			else
				layernumber = varargin{1};
			end
			
			connectivity = Graph.BINARY * ones(layernumber);
		end
		function directionality = getDirectionalityType(varargin)
			%GETDIRECTIONALITYTYPE returns 2 (Undirected).
			%
			% 2 = MultiplexBUD.GETDIRECTIONALITYTYPE() returns the type of graph directionality (Undirected).
			% the directionality type of each layer.
			%
			% 2 = MultiplexBUD.GETDIRECTIONALITYTYPE(LAYERNUMBER) returns a matrix with 
			%  the directionality type of each layer.
			%
			% See also getGraphType, getConnectivityType, getSelfConnectivityType, getNegativityType.
			
			
			if isempty(varargin)
				layernumber = 1;
			else
				layernumber = varargin{1};
			end
			
			directionality = Graph.UNDIRECTED * ones(layernumber);
		end
		function selfconnectivity = getSelfConnectivityType(varargin)
			%GETSELFCONNECTIVITYTYPE returns 2 (Self-connected).
			%
			% 2 = MultiplexBUD.GETSELFCONNECTIVITYTYPE() returns the type of graph self connnectivity (Self-connected).
			%
			% 2 = MultiplexBUD.GETSELFCONNECTIVITYTYPE(LAYERNUMBER) returns a matrix 
			%  with the self-connectivity type of each layer.
			%
			% See also getGraphType, getConnectivityType, getDirectionalityType, getNegativityType.
			
			
			if isempty(varargin)
				layernumber = 1;
			else
				layernumber = varargin{1};
			end
			
			selfconnectivity = Graph.SELFCONNECTED * ones(layernumber);
			selfconnectivity(1:layernumber+1:end) = Graph.NONSELFCONNECTED;
		end
		function negativity = getNegativityType(varargin)
			%GETNEGATIVITYTYPE returns 2 (Negative).
			%
			% 2 = MultiplexBUD.GETNEGATIVITYTYPE() returns the type of graph negativity (Negative).
			%
			% 2 = MultiplexBUD.GETNEGATIVITYTYPE(LAYERNUMBER) returns a matrix 
			%  with the negativity type of each layer.
			%
			% See also getGraphType, getConnectivityType, getDirectionalityType, getSelfConnectivityType.
			
			
			if isempty(varargin)
				layernumber = 1;
			else
				layernumber = varargin{1};
			end
			
			negativity = Graph.NONNEGATIVE * ones(layernumber);
		end
	end
	methods % constructor
		function g = MultiplexBUD(varargin)
			% MultiplexBUD() creates a binary undirected multiplex with fixed densities.
			%
			% MultiplexBUD(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexBUD(TAG, VALUE, ...) with property with tag TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of MultiplexBUD properties is:
			%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the graph.
			%  <strong>2</strong> <strong>label</strong> 	LABEL (metadata, string) is an extended label of the graph.
			%  <strong>3</strong> <strong>notes</strong> 	NOTES (metadata, string) are some specific notes about the graph.
			%  <strong>4</strong> <strong>brainatlas</strong> 	BRAINATLAS (data, item) is a atlas associated with the graph.
			%  <strong>5</strong> <strong>a</strong> 	A (result, cell) is the cell array containing the multiplex binary adjacency matrices of the binary undirected multiplex. 
			%  <strong>6</strong> <strong>m_dict</strong> 	M_DICT (result, idict) contains the calculated measures of the graph.
			%  <strong>7</strong> <strong>b</strong> 	B (data, cell) is the input cell containing the multiplex adjacency matrices on the diagonal.
			%  <strong>8</strong> <strong>attemptsperedge</strong> 	ATTEMPTSPEREDGE (parameter, scalar) is the attempts to rewire each edge.
			%  <strong>9</strong> <strong>numberofweights</strong> 	NUMBEROFWEIGHTS (parameter, scalar) specifies the number of weights sorted at the same time.
			%  <strong>10</strong> <strong>densities</strong> 	DENSITIES (parameter, rvector) is the vector of densities.
			%  <strong>11</strong> <strong>nodelabels</strong> 	NODELABELS (metadata, STRING) is the node labels.
			%
			% See also Category, Format, set, check.
			
			g = g@MultiplexWU(varargin{:});
		end
	end
	methods (Static, Access=protected) % conditioning
		function value = conditioning(pointer, value)
			prop = MultiplexBUD.getPropProp(pointer);
			
			switch prop
				otherwise
					if prop <= MultiplexWU.getPropNumber()
						value = conditioning@MultiplexWU(pointer, value);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(g, prop)
		
			switch prop
				case MultiplexBUD.A
					A_WU = calculateValue@MultiplexWU(g, prop);
					
					densities = g.get('DENSITIES');
					L = length(A_WU); % number of layersof MultiplexWU
					A = cell(length(densities)*L); % the new g.layernumber() will be equal to = L*length(densities)
					
					if L > 0
					    A(:, :) = {eye(length(A_WU{1, 1}))};
					    for i = 1:1:length(densities)
					        density = densities(i);
					        layer = 1;
					        for j = (i*2) - 1:1: (i*2) + L - 2     
					            A{j, j} = binarize(A_WU{layer, layer}, 'density', density);
					            layer = layer + 1;
					        end
					    end
					end
					
					value = A;
					
				otherwise
					value = calculateValue@MultiplexWU(g, prop);
					
			end
		end
	end
	methods % methods
		function [l, ls] = layernumber(g)
		    %LAYERNUMBER returns the number of layers in the graph.
		    %
		    % L = LAYERNUMBER(G) returns the number of layers in graph G. L is a scalar.
		    %
		    % [~, LS] = LAYERNUMBER(G) returns the number of layers in the partitions
		    %  of graph G. LS is a vector of integers.
		    %
		    % See also nodenumber.
		
		    l = length(g.get('A'));
		    densities = g.get('DENSITIES');
		    ls = ones(1, length(densities)) * l / length(densities);
		end
	end
	methods % GUI
		function pr = getPlotProp(g, prop, varargin)
			%GETPLOTPROP returns a prop plot.
			%
			% PR = GETPLOTPROP(EL, PROP) returns the plot of prop PROP.
			%
			% PR = GETPLOTPROP(EL, PROP, 'Name', Value, ...) sets the settings.
			%
			% See also PlotProp, PlotPropCell, PlotPropClass, PlotPropClassList,
			%  PlotPropIDict, PlotPropItem, PlotPropItemList, PlotPropLogical,
			%  PlotPropMatrix, PlotPropOption, PlotPropScalar, PlotPropString.
			
			switch prop
				case MultiplexBUD.DENSITIES
					pr = PlotPropSmartVector('EL', g, 'PROP', MultiplexBUD.DENSITIES, 'MAX', 100, 'MIN', 0, varargin{:});
					
				otherwise
					pr = getPlotProp@MultiplexWU(g, prop, varargin{:});
					
			end
		end
	end
end
