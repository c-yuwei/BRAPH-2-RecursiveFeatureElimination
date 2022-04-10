classdef PlotBrainGraphEnsemble < PlotBrainAtlas
	% PlotBrainGraphEnsemble is a plot of a brain graph of a measure ensemble.
	% It is a subclass of <a href="matlab:help PlotBrainAtlas">PlotBrainAtlas</a>.
	%
	% PlotBrainGraphEnsemble manages the plot of the graph edges, arrows and cylinders.
	% PlotBrainGraphEnsemble utilizes the surface created from PlotBrainAtlas to
	% integrate the regions to a brain surface.
	% 
	% CALLBACKS - These are callback functions:
	% 
	%     pr.<strong>cb_bring_to_front</strong>() - brings to the front the measure figure and its settings figure
	%     pr.<strong>cb_hide</strong>() - hides the measure figure and its settings figure
	%     pr.<strong>cb_close</strong>() - closes the measure figure and its settings figure
	%
	% The list of PlotBrainGraphEnsemble properties is:
	%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the plot.
	%  <strong>2</strong> <strong>bkgcolor</strong> 	BKGCOLOR (metadata, rvector) is background color.
	%  <strong>3</strong> <strong>surf</strong> 	SURF (metadata, item) is the brain surface to be plotted.
	%  <strong>4</strong> <strong>axescolor</strong> 	AXESCOLOR (metadata, rvector) is axes background color.
	%  <strong>5</strong> <strong>view</strong> 	VIEW (metadata, rvector) sets the desired view.
	%  <strong>6</strong> <strong>hold</strong> 	HOLD (metadata, logical) determines whether hold is on or offf.
	%  <strong>7</strong> <strong>grid</strong> 	GRID (metadata, logical) determines whether the grid is shown.
	%  <strong>8</strong> <strong>axis</strong> 	AXIS (metadata, logical) determines whether the axis is shown.
	%  <strong>9</strong> <strong>equal</strong> 	EQUAL (metadata, logical) determines whether the axis are equal.
	%  <strong>10</strong> <strong>tight</strong> 	TIGHT (metadata, logical) determines whether the axis are tight.
	%  <strong>11</strong> <strong>brain</strong> 	BRAIN (metadata, logical) determines whether the brain surface is shown.
	%  <strong>12</strong> <strong>edgecolor</strong> 	EDGECOLOR (metadata, rvector) is the RGB edge color.
	%  <strong>13</strong> <strong>edgealpha</strong> 	EDGEALPHA (metadata, scalar) is the edge transparency.
	%  <strong>14</strong> <strong>facecolor</strong> 	FACECOLOR (metadata, rvector) is the RGB face color.
	%  <strong>15</strong> <strong>facealpha</strong> 	FACEALPHA (metadata, scalar) is the face transparency.
	%  <strong>16</strong> <strong>lighting</strong> 	LIGHTING (metadata, option) is the lighting value.
	%  <strong>17</strong> <strong>material</strong> 	MATERIAL (metadata, option) is the material value.
	%  <strong>18</strong> <strong>camlight</strong> 	CAMLIGHT (metadata, option) is the camlight value.
	%  <strong>19</strong> <strong>shading</strong> 	SHADING (metadata, option) is the shading value.
	%  <strong>20</strong> <strong>colormap</strong> 	COLORMAP (metadata, matrix) is the colormap.
	%  <strong>21</strong> <strong>colormapstring</strong> 	COLORMAPSTRING (metadata, string) is the colormap string value.
	%  <strong>22</strong> <strong>atlas</strong> 	ATLAS (metadata, item) is the brain atlas with the brain regions.
	%  <strong>23</strong> <strong>parent</strong> 	Parent (data, item) is the plot parent figure
	%  <strong>24</strong> <strong>syms</strong> 	SYMS (metadata, cvector) is symbol visibility.
	%  <strong>25</strong> <strong>syms_size</strong> 	SYMS_SIZE (metadata, cvector) is the symbol size.
	%  <strong>26</strong> <strong>syms_marker</strong> 	SYMS_MARKER (metadata, cvector) is the symbol option.
	%  <strong>27</strong> <strong>syms_face_color</strong> 	SYMS_FACE_COLOR (metadata, matrix) is the symbol face color.
	%  <strong>28</strong> <strong>syms_edge_color</strong> 	SYMS_EDGE_COLOR (metadata, matrix) is the symbol edge color.
	%  <strong>29</strong> <strong>sphs</strong> 	SPHS (metadata, cvector) is sphere visibility.
	%  <strong>30</strong> <strong>sphs_size</strong> 	SPHS_SIZE (metadata, cvector) is the sphere size.
	%  <strong>31</strong> <strong>sphs_edge_color</strong> 	SPHS_EDGE_COLOR (metadata, matrix) is the sphere edge color.
	%  <strong>32</strong> <strong>sphs_face_color</strong> 	SPHS_FACE_COLOR (metadata, matrix) is the sphere face color.
	%  <strong>33</strong> <strong>sphs_edge_alpha</strong> 	SPHS_EDGE_ALPHA (metadata, cvector) is the sphere alpha.
	%  <strong>34</strong> <strong>sphs_face_alpha</strong> 	SPHS_FACE_ALPHA (metadata, cvector) is the sphere alpha.
	%  <strong>35</strong> <strong>ids</strong> 	IDS (metadata, cvector) is the ids visibility.
	%  <strong>36</strong> <strong>ids_size</strong> 	IDS_SIZE (metadata, cvector) is the ids size.
	%  <strong>37</strong> <strong>ids_font_color</strong> 	IDS_FONT_COLOR (metadata, matrix) is the ids font color.
	%  <strong>38</strong> <strong>ids_font_name</strong> 	IDS_FONT_NAME (metadata, string) is the ids font name.
	%  <strong>39</strong> <strong>ids_font_interpreter</strong> 	IDS_FONT_INTERPRETER (metadata, cvector) is the ids font interpreter.
	%  <strong>40</strong> <strong>labs</strong> 	LABS (metadata, cvector) is the labs visibility.
	%  <strong>41</strong> <strong>labs_size</strong> 	LABS_SIZE (metadata, cvector) is the labs size.
	%  <strong>42</strong> <strong>labs_font_color</strong> 	LABS_FONT_COLOR (metadata, matrix) is the labs font color.
	%  <strong>43</strong> <strong>labs_font_name</strong> 	LABS_FONT_NAME (metadata, string) is the labs font name.
	%  <strong>44</strong> <strong>labs_font_interpreter</strong> 	LABS_FONT_INTERPRETER (metadata, cvector) is the labs font interpreter.
	%  <strong>45</strong> <strong>me</strong> 	ME (metadata, item) is the measure.
	%  <strong>46</strong> <strong>type</strong> 	TYPE (metadata, string) is the type of measure.
	%
	% PlotBrainGraphEnsemble methods (constructor):
	% PlotBrainGraphEnsemble - constructor
	%
	% PlotBrainGraphEnsemble methods (Static):
	%  checkProp - checks whether a value has the correct format/error.
	%  getPropDefaultConditioned - returns the conditioned default value of a property.
	%  getPropDefault - returns the default value of a property.
	%  getPropSettings - returns the settings of a property.
	%  getPropDescription - returns the description of a property.
	%  getPropFormat - returns the format of a property.
	%  getPropCategory - returns the category of a property.
	%  getPropTag - returns the tag of a property.
	%  getPropProp - returns the property number of a property.
	%  existsTag - checks whether tag exists in plot brain graph/error.
	%  existsProp - checks whether property exists in plot brain graph/error.
	%  getPropNumber - returns the property number of plot brain graph.
	%  getProps - returns the property list of plot brain graph.
	%  getDescription - returns the description of the plot brain graph.
	%  getName - returns the name of the plot brain graph.
	%  getClass - returns the class of the plot brain graph.
	%  h - returns the height of a graphical element.
	%  w - returns the width of a graphical element.
	%  y0 - returns the position of the bottom edge of a graphical element.
	%  x0 - returns the position of the left edge of a graphical element.
	%
	% PlotBrainGraphEnsemble methods:
	%  getMCRPanel - ion of figure
	%  getBrainGraphPanel - L creates a braingraph panel
	%  get_axes - S returns the panel axes
	%  tex_edge_is_off - ff checks if the edge text is not visible
	%  text_edge_is_on - N checks if the edge text is visible
	%  text_edge_off - F hides a edge text
	%  text_edge_on - N shows a edge text
	%  text_edge - E plots the edge value as a text
	%  cylinder_edge_is_on - N checks if cylinder link is visible
	%  cylinder_edges_settings - S sets edges' properties
	%  cylinder_edges_off - F hides multiple edge links
	%  cylinder_edges_on - N shows multiple edge link
	%  cylinder_edges - S plots multiple edge links as lines
	%  cylinder_edge_off - F hides a edge link
	%  cylinder_edge_on - N shows a edge link
	%  cylinder_edge - E plots edge link as an cylinder
	%  arrow_edge_is_on - N checks if line link is visible
	%  arrow_edges_settings - S sets edges' properties
	%  arrow_edges_off - F hides multiple edge links
	%  arrow_edges_on - N shows multiple edge link
	%  arrow_edges - S plots multiple edge links as lines
	%  arrow_edge_off - F hides a edge link
	%  arrow_edge_on - N shows a edge link
	%  arrow_edge - E plots edge link as an arrow
	%  link_edge_is_on - N checks if line link is visible
	%  link_edges_settings - S sets edges' properties
	%  link_edges_off - F hides multiple edge links
	%  link_edges_on - N shows multiple edge link
	%  link_edges - S plots multiple edge links as lines
	%  link_edge_off - F hides a edge link
	%  link_edge_on - N shows a edge link
	%  link_edge - E plots edge link as line
	%  cb_hide - hides the brain view figure and its settings figure.
	%  cb_bring_to_front - brings to front the brain view figure and its settings figure.
	%  settings - opens the brain surface property editor GUI.
	%  draw - draws the brain atlas graph graphical panel.
	%  labs_settings - S panel to set labels properties
	%  ids_settings - S panel to set ids properties
	%  sphs_settings - S panel to set spheres properties
	%  syms_settings - S panel to set symbols properties
	%  set_settings - hEnsemble/set_settings is a function.
	%  cb_close - closes the figure containing the panel and the settings figure.
	%  cb_close_fs - phEnsemble/cb_close_fs is a function.
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
	% PlotBrainGraphEnsemble methods (operators):
	%  isequal - determines whether two PlotBrainGraphEnsemble are equal (values, locked)
	%
	% PlotBrainGraphEnsemble methods (display):
	%  tostring - string with information about the PlotBrainGraphEnsemble
	%  disp - displays information about the PlotBrainGraphEnsemble
	%  tree - displays the element of PlotBrainGraphEnsemble
	%
	% PlotBrainGraphEnsemble method (element list):
	%  getElementList - returns a list with all subelements of PlotBrainGraphEnsemble
	%
	% PlotBrainGraphEnsemble method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the PlotBrainGraphEnsemble
	%
	% PlotBrainGraphEnsemble method (JSON decode, Static):
	%  decodeJSON - returns a JSON string encoding the PlotBrainGraphEnsemble
	%
	% PlotBrainGraphEnsemble methods (copy):
	%  copy - copies the PlotBrainGraphEnsemble
	%  deepclone - deep-clones the PlotBrainGraphEnsemble
	%  clone - clones the PlotBrainGraphEnsemble
	%
	% PlotBrainGraphEnsemble methods (inspection, Static):
	%  getClass - returns PlotBrainGraphEnsemble
	%  getName - returns the name of PlotBrainGraphEnsemble
	%  getDescription - returns the description of PlotBrainGraphEnsemble
	%  getProps - returns the property list of PlotBrainGraphEnsemble
	%  getPropNumber - returns the property number of PlotBrainGraphEnsemble
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
	% PlotBrainGraphEnsemble methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% PlotBrainGraphEnsemble methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% PlotBrainGraphEnsemble methods (GUI):
	%  getGUI - returns the element GUI
	%  getPlotElement - returns the element plot
	%  getPlotProp - returns a prop plot
	%
	% PlotBrainGraphEnsemble methods (GUI, Static):
	%  getGUIMenuImport - returns an importer menu
	%  getGUIMenuExport - returns an exporter menu
	%
	% PlotBrainGraphEnsemble properties (Constant).
	%  PLOT_LINESTYLE_TAG - cell[1 5] { '-' ':' '-.' '--' 'none' }
	%  PLOT_LINESTYLE_NAME - cell[1 5] { 'solid' 'dotted' 'dashdot' 'dashed' 'none' }
	%  INIT_SYM_MARKER - 'o'
	%  INIT_SYM_SIZE - 1
	%  INIT_SYM_EDGE_COLOR - 'b'
	%  INIT_SYM_FACE_COLOR - 'b'
	%  INIT_SPH_EDGE_COLOR - 'none'
	%  INIT_SPH_EDGE_ALPHA - 0.5
	%  INIT_SPH_FACE_COLOR - num[1 3] [ 0.9         0.4         0.1 ]
	%  INIT_SPH_FACE_ALPHA - 0.5
	%  INIT_SPH_R - 1
	%  INIT_ID_FONT_SIZE - 1
	%  INIT_ID_FONT_NAME - 'helvetica'
	%  INIT_ID_FONT_COLOR - num[1 3] [ 0  0  0 ]
	%  INIT_ID_FONT_INTERPRETER - 'none'
	%  INIT_LAB_FONT_SIZE - 1
	%  INIT_LAB_FONT_NAME - 'helvetica'
	%  INIT_LAB_FONT_COLOR - num[1 3] [ 0  0  0 ]
	%  INIT_LAB_FONT_INTERPRETER - 'none'
	%  ME - 45
	%  ME_TAG - 'me'
	%  ME_CATEGORY - 'm'
	%  ME_FORMAT - 'it'
	%  TYPE - 46
	%  TYPE_TAG - 'type'
	%  TYPE_CATEGORY - 'm'
	%  TYPE_FORMAT - 'st'
	%  PLOT_SYMBOL_NAME - cell[1 14] { 'point' 'circle' 'x-mark' 'plus' 'star' 'square' 'diamond' 'triangle (down)' 'triangle (up)' 'triangle (left)' 'triangle (right)' 'pentagram' 'hexagram' 'none' }
	%  PLOT_SYMBOL_TAG - cell[1 14] { '.' 'o' 'x' '+' '*' 's' 'd' 'v' '^' '>' '<' 'p' 'h' 'none' }
	%  PLOT_ID_FONT_INTREPETER - cell[1 3] { 'none' 'tex' 'latex' }
	%  ATLAS - 22
	%  ATLAS_TAG - 'atlas'
	%  ATLAS_CATEGORY - 'm'
	%  ATLAS_FORMAT - 'it'
	%  PARENT - 23
	%  PARENT_TAG - 'parent'
	%  PARENT_CATEGORY - 'd'
	%  PARENT_FORMAT - 'it'
	%  SYMS - 24
	%  SYMS_TAG - 'syms'
	%  SYMS_CATEGORY - 'm'
	%  SYMS_FORMAT - 'nc'
	%  SYMS_SIZE - 25
	%  SYMS_SIZE_TAG - 'syms_size'
	%  SYMS_SIZE_CATEGORY - 'm'
	%  SYMS_SIZE_FORMAT - 'nc'
	%  SYMS_MARKER - 26
	%  SYMS_MARKER_TAG - 'syms_marker'
	%  SYMS_MARKER_CATEGORY - 'm'
	%  SYMS_MARKER_FORMAT - 'nc'
	%  SYMS_FACE_COLOR - 27
	%  SYMS_FACE_COLOR_TAG - 'syms_face_color'
	%  SYMS_FACE_COLOR_CATEGORY - 'm'
	%  SYMS_FACE_COLOR_FORMAT - 'nm'
	%  SYMS_EDGE_COLOR - 28
	%  SYMS_EDGE_COLOR_TAG - 'syms_edge_color'
	%  SYMS_EDGE_COLOR_CATEGORY - 'm'
	%  SYMS_EDGE_COLOR_FORMAT - 'nm'
	%  SPHS - 29
	%  SPHS_TAG - 'sphs'
	%  SPHS_CATEGORY - 'm'
	%  SPHS_FORMAT - 'nc'
	%  SPHS_SIZE - 30
	%  SPHS_SIZE_TAG - 'sphs_size'
	%  SPHS_SIZE_CATEGORY - 'm'
	%  SPHS_SIZE_FORMAT - 'nc'
	%  SPHS_EDGE_COLOR - 31
	%  SPHS_EDGE_COLOR_TAG - 'sphs_edge_color'
	%  SPHS_EDGE_COLOR_CATEGORY - 'm'
	%  SPHS_EDGE_COLOR_FORMAT - 'nm'
	%  SPHS_FACE_COLOR - 32
	%  SPHS_FACE_COLOR_TAG - 'sphs_face_color'
	%  SPHS_FACE_COLOR_CATEGORY - 'm'
	%  SPHS_FACE_COLOR_FORMAT - 'nm'
	%  SPHS_EDGE_ALPHA - 33
	%  SPHS_EDGE_ALPHA_TAG - 'sphs_edge_alpha'
	%  SPHS_EDGE_ALPHA_CATEGORY - 'm'
	%  SPHS_EDGE_ALPHA_FORMAT - 'nc'
	%  SPHS_FACE_ALPHA - 34
	%  SPHS_FACE_ALPHA_TAG - 'sphs_face_alpha'
	%  SPHS_FACE_ALPHA_CATEGORY - 'm'
	%  SPHS_FACE_ALPHA_FORMAT - 'nc'
	%  IDS - 35
	%  IDS_TAG - 'ids'
	%  IDS_CATEGORY - 'm'
	%  IDS_FORMAT - 'nc'
	%  IDS_SIZE - 36
	%  IDS_SIZE_TAG - 'ids_size'
	%  IDS_SIZE_CATEGORY - 'm'
	%  IDS_SIZE_FORMAT - 'nc'
	%  IDS_FONT_COLOR - 37
	%  IDS_FONT_COLOR_TAG - 'ids_font_color'
	%  IDS_FONT_COLOR_CATEGORY - 'm'
	%  IDS_FONT_COLOR_FORMAT - 'nm'
	%  IDS_FONT_NAME - 38
	%  IDS_FONT_NAME_TAG - 'ids_font_name'
	%  IDS_FONT_NAME_CATEGORY - 'm'
	%  IDS_FONT_NAME_FORMAT - 'st'
	%  IDS_FONT_INTERPRETER - 39
	%  IDS_FONT_INTERPRETER_TAG - 'ids_font_interpreter'
	%  IDS_FONT_INTERPRETER_CATEGORY - 'm'
	%  IDS_FONT_INTERPRETER_FORMAT - 'nc'
	%  LABS - 40
	%  LABS_TAG - 'labs'
	%  LABS_CATEGORY - 'm'
	%  LABS_FORMAT - 'nc'
	%  LABS_SIZE - 41
	%  LABS_SIZE_TAG - 'labs_size'
	%  LABS_SIZE_CATEGORY - 'm'
	%  LABS_SIZE_FORMAT - 'nc'
	%  LABS_FONT_COLOR - 42
	%  LABS_FONT_COLOR_TAG - 'labs_font_color'
	%  LABS_FONT_COLOR_CATEGORY - 'm'
	%  LABS_FONT_COLOR_FORMAT - 'nm'
	%  LABS_FONT_NAME - 43
	%  LABS_FONT_NAME_TAG - 'labs_font_name'
	%  LABS_FONT_NAME_CATEGORY - 'm'
	%  LABS_FONT_NAME_FORMAT - 'st'
	%  LABS_FONT_INTERPRETER - 44
	%  LABS_FONT_INTERPRETER_TAG - 'labs_font_interpreter'
	%  LABS_FONT_INTERPRETER_CATEGORY - 'm'
	%  LABS_FONT_INTERPRETER_FORMAT - 'nc'
	%  VIEW_3D - 1
	%  VIEW_3D_CMD - '3D'
	%  VIEW_3D_AZEL - num[1 2] [ -37.5           30 ]
	%  VIEW_SL - 2
	%  VIEW_SL_CMD - 'Sagittal left'
	%  VIEW_SL_AZEL - num[1 2] [ -90   0 ]
	%  VIEW_SR - 3
	%  VIEW_SR_CMD - 'Sagittal right'
	%  VIEW_SR_AZEL - num[1 2] [ 90   0 ]
	%  VIEW_AD - 4
	%  VIEW_AD_CMD - 'Axial dorsal'
	%  VIEW_AD_AZEL - num[1 2] [ 0  90 ]
	%  VIEW_AV - 5
	%  VIEW_AV_CMD - 'Axial ventral'
	%  VIEW_AV_AZEL - num[1 2] [ 0 -90 ]
	%  VIEW_CA - 6
	%  VIEW_CA_CMD - 'Coronal anterior'
	%  VIEW_CA_AZEL - num[1 2] [ 180    0 ]
	%  VIEW_CP - 7
	%  VIEW_CP_CMD - 'Coronal posterior'
	%  VIEW_CP_AZEL - num[1 2] [ 0  0 ]
	%  VIEW_CMD - cell[1 7] { '3D' 'Sagittal left' 'Sagittal right' 'Axial dorsal' 'Axial ventral' 'Coronal anterior' 'Coronal posterior' }
	%  VIEW_AZEL - cell[1 7] { num[1 2] [ -37.5           30 ] num[1 2] [ -90   0 ] num[1 2] [ 90   0 ] num[1 2] [ 0  90 ] num[1 2] [ 0 -90 ] num[1 2] [ 180    0 ] num[1 2] [ 0  0 ] }
	%  SURF - 3
	%  SURF_TAG - 'surf'
	%  SURF_CATEGORY - 'm'
	%  SURF_FORMAT - 'it'
	%  AXESCOLOR - 4
	%  AXESCOLOR_TAG - 'axescolor'
	%  AXESCOLOR_CATEGORY - 'm'
	%  AXESCOLOR_FORMAT - 'nr'
	%  VIEW - 5
	%  VIEW_TAG - 'view'
	%  VIEW_CATEGORY - 'm'
	%  VIEW_FORMAT - 'nr'
	%  HOLD - 6
	%  HOLD_TAG - 'hold'
	%  HOLD_CATEGORY - 'm'
	%  HOLD_FORMAT - 'lo'
	%  GRID - 7
	%  GRID_TAG - 'grid'
	%  GRID_CATEGORY - 'm'
	%  GRID_FORMAT - 'lo'
	%  AXIS - 8
	%  AXIS_TAG - 'axis'
	%  AXIS_CATEGORY - 'm'
	%  AXIS_FORMAT - 'lo'
	%  EQUAL - 9
	%  EQUAL_TAG - 'equal'
	%  EQUAL_CATEGORY - 'm'
	%  EQUAL_FORMAT - 'lo'
	%  TIGHT - 10
	%  TIGHT_TAG - 'tight'
	%  TIGHT_CATEGORY - 'm'
	%  TIGHT_FORMAT - 'lo'
	%  BRAIN - 11
	%  BRAIN_TAG - 'brain'
	%  BRAIN_CATEGORY - 'm'
	%  BRAIN_FORMAT - 'lo'
	%  EDGECOLOR - 12
	%  EDGECOLOR_TAG - 'edgecolor'
	%  EDGECOLOR_CATEGORY - 'm'
	%  EDGECOLOR_FORMAT - 'nr'
	%  EDGEALPHA - 13
	%  EDGEALPHA_TAG - 'edgealpha'
	%  EDGEALPHA_CATEGORY - 'm'
	%  EDGEALPHA_FORMAT - 'nn'
	%  FACECOLOR - 14
	%  FACECOLOR_TAG - 'facecolor'
	%  FACECOLOR_CATEGORY - 'm'
	%  FACECOLOR_FORMAT - 'nr'
	%  FACEALPHA - 15
	%  FACEALPHA_TAG - 'facealpha'
	%  FACEALPHA_CATEGORY - 'm'
	%  FACEALPHA_FORMAT - 'nn'
	%  LIGHTING - 16
	%  LIGHTING_TAG - 'lighting'
	%  LIGHTING_CATEGORY - 'm'
	%  LIGHTING_FORMAT - 'op'
	%  MATERIAL - 17
	%  MATERIAL_TAG - 'material'
	%  MATERIAL_CATEGORY - 'm'
	%  MATERIAL_FORMAT - 'op'
	%  CAMLIGHT - 18
	%  CAMLIGHT_TAG - 'camlight'
	%  CAMLIGHT_CATEGORY - 'm'
	%  CAMLIGHT_FORMAT - 'op'
	%  SHADING - 19
	%  SHADING_TAG - 'shading'
	%  SHADING_CATEGORY - 'm'
	%  SHADING_FORMAT - 'op'
	%  COLORMAP - 20
	%  COLORMAP_TAG - 'colormap'
	%  COLORMAP_CATEGORY - 'm'
	%  COLORMAP_FORMAT - 'nm'
	%  COLORMAPSTRING - 21
	%  COLORMAPSTRING_TAG - 'colormapstring'
	%  COLORMAPSTRING_CATEGORY - 'm'
	%  COLORMAPSTRING_FORMAT - 'st'
	%  ID - 1
	%  ID_TAG - 'id'
	%  ID_CATEGORY - 'd'
	%  ID_FORMAT - 'st'
	%  BKGCOLOR - 2
	%  BKGCOLOR_TAG - 'bkgcolor'
	%  BKGCOLOR_CATEGORY - 'm'
	%  BKGCOLOR_FORMAT - 'nr'
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
	%
	% See also Plot, BrainAtlas, PlotBrainSurface, PlotBrainAtlas, MeasureEnsemble..
	
	properties (Constant) % constants
		PLOT_LINESTYLE_TAG = { ...
		    '-' ...
		    ':' ...
		    '-.' ...
		    '--' ...
		    'none' ...
		    }
		
		PLOT_LINESTYLE_NAME = { ...
		    'solid' ...
		    'dotted' ...
		    'dashdot' ...
		    'dashed' ...
		    'none' ...
		    }
		
		% Symbols
		INIT_SYM_MARKER = 'o'
		INIT_SYM_SIZE = 1
		INIT_SYM_EDGE_COLOR = 'b'
		INIT_SYM_FACE_COLOR = 'b'
		
		% Spheres
		INIT_SPH_EDGE_COLOR = 'none'
		INIT_SPH_EDGE_ALPHA = .5
		INIT_SPH_FACE_COLOR = [.9 .4 .1]
		INIT_SPH_FACE_ALPHA = .5
		INIT_SPH_R = 1
		
		% IDs
		INIT_ID_FONT_SIZE = 1
		INIT_ID_FONT_NAME = 'helvetica'
		INIT_ID_FONT_COLOR = [0 0 0]
		INIT_ID_FONT_INTERPRETER = 'none'
		
		% Labels
		INIT_LAB_FONT_SIZE = 1
		INIT_LAB_FONT_NAME = 'helvetica'
		INIT_LAB_FONT_COLOR = [0 0 0]
		INIT_LAB_FONT_INTERPRETER = 'none'
	end
	properties (Access = private) % element properties
		edges  % structure of 2D cell arrays containing edge properties
		f_edges_settings  % edge settings figure handle
		f_arrs_settings  % arrow settings figure handle
		f_cyls_settings  % cylinder settings figure handle
		
		% edge line
		INIT_LIN_COLOR = [0 0 0];
		
		% Arrows
		INIT_ARR_COLOR = [0 0 0];
		INIT_ARR_SWIDTH = .1;
		INIT_ARR_HLENGTH = 1;
		INIT_ARR_HWIDTH = 1;
		INIT_ARR_HNODE = .5;
		INIT_ARR_N = 32;
		
		% Cylinders
		INIT_CYL_COLOR = [0 0 0];
		INIT_CYL_R = .1;
		INIT_CYL_N = 32;
		
		h_axes
		pp
		TABBKGCOLOR = [.98 .95 .95];
		f_settings
		f_graph_settings
		f_measures_settings
	end
	properties (Constant) % properties
		ME = PlotBrainAtlas.getPropNumber() + 1;
		ME_TAG = 'me';
		ME_CATEGORY = Category.METADATA;
		ME_FORMAT = Format.ITEM;
		
		TYPE = PlotBrainAtlas.getPropNumber() + 2;
		TYPE_TAG = 'type';
		TYPE_CATEGORY = Category.METADATA;
		TYPE_FORMAT = Format.STRING;
	end
	methods (Static) % inspection methods
		function pl_class = getClass()
			%GETCLASS returns the class of the plot brain graph.
			%
			% CLASS = PlotBrainGraphEnsemble.GETCLASS() returns the class 'PlotBrainGraphEnsemble'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PL.GETCLASS() returns the class of the plot brain graph PL.
			%  CLASS = Element.GETCLASS(PL) returns the class of 'PL'.
			%  CLASS = Element.GETCLASS('PlotBrainGraphEnsemble') returns 'PlotBrainGraphEnsemble'.
			%
			% See also getName, getDescription.
			
			pl_class = 'PlotBrainGraphEnsemble';
		end
		function pl_name = getName()
			%GETNAME returns the name of the plot brain graph.
			%
			% NAME = PlotBrainGraphEnsemble.GETNAME() returns the name of the 'plot brain graph'.
			%  Plot Brain Graph.
			%
			% Alternative forms to call this method are:
			%  NAME = PL.GETNAME() returns the name of the plot brain graph PL.
			%  NAME = Element.GETNAME(PL) returns the name of 'PL'.
			%  NAME = Element.GETNAME('PlotBrainGraphEnsemble') returns the name of 'PlotBrainGraphEnsemble'.
			%
			% See also getClass, getDescription.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			pl_name = 'Plot Brain Graph';
		end
		function pl_description = getDescription()
			%GETDESCRIPTION returns the description of the plot brain graph.
			%
			% STR = PlotBrainGraphEnsemble.GETDESCRIPTION() returns the description of the 'plot brain graph'.
			%  which is:
			%
			%  PlotBrainGraphEnsemble manages the plot of the graph edges, arrows and cylinders.
			%  PlotBrainGraphEnsemble utilizes the surface created from PlotBrainAtlas to
			%  integrate the regions to a brain surface.
			%  
			%  CALLBACKS - These are callback functions:
			%  
			%      pr.<strong>cb_bring_to_front</strong>() - brings to the front the measure figure and its settings figure
			%      pr.<strong>cb_hide</strong>() - hides the measure figure and its settings figure
			%      pr.<strong>cb_close</strong>() - closes the measure figure and its settings figure
			%
			% Alternative forms to call this method are:
			%  STR = PL.GETDESCRIPTION() returns the description of the plot brain graph PL.
			%  STR = Element.GETDESCRIPTION(PL) returns the description of 'PL'.
			%  STR = Element.GETDESCRIPTION('PlotBrainGraphEnsemble') returns the description of 'PlotBrainGraphEnsemble'.
			%
			% See also getClass, getName.
			
			pl_description = [
				'PlotBrainGraphEnsemble manages the plot of the graph edges, arrows and cylinders.' ...
				'PlotBrainGraphEnsemble utilizes the surface created from PlotBrainAtlas to' ...
				'integrate the regions to a brain surface.' ...
				'' ...
				'CALLBACKS - These are callback functions:' ...
				'' ...
				'    pr.<strong>cb_bring_to_front</strong>() - brings to the front the measure figure and its settings figure' ...
				'    pr.<strong>cb_hide</strong>() - hides the measure figure and its settings figure' ...
				'    pr.<strong>cb_close</strong>() - closes the measure figure and its settings figure' ...
				];
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of plot brain graph.
			%
			% PROPS = PlotBrainGraphEnsemble.GETPROPS() returns the property list of plot brain graph.
			%
			% PROPS = PlotBrainGraphEnsemble.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PL.GETPROPS([CATEGORY]) returns the property list of the plot brain graph PL.
			%  PROPS = Element.GETPROPS(PL[, CATEGORY]) returns the property list of 'PL'.
			%  PROPS = Element.GETPROPS('PlotBrainGraphEnsemble'[, CATEGORY]) returns the property list of 'PlotBrainGraphEnsemble'.
			%
			% See also getPropNumber.
			
			if nargin < 1
				category = 'all';
			end
			
			switch category
				case Category.METADATA
					prop_list = [
						PlotBrainAtlas.getProps(Category.METADATA)
						PlotBrainGraphEnsemble.ME
						PlotBrainGraphEnsemble.TYPE
						];
				case Category.PARAMETER
					prop_list = [
						PlotBrainAtlas.getProps(Category.PARAMETER)
						];
				case Category.DATA
					prop_list = [
						PlotBrainAtlas.getProps(Category.DATA)
						];
				case Category.RESULT
					prop_list = [
						PlotBrainAtlas.getProps(Category.RESULT)
						];
				case Category.FIGURE
					prop_list = [
						PlotBrainAtlas.getProps(Category.FIGURE)
						];
				case Category.GUI
					prop_list = [
						PlotBrainAtlas.getProps(Category.GUI)
						];
				otherwise
					prop_list = [
						PlotBrainAtlas.getProps()
						PlotBrainGraphEnsemble.ME
						PlotBrainGraphEnsemble.TYPE
						];
			end
		end
		function prop_number = getPropNumber()
			%GETPROPNUMBER returns the property number of plot brain graph.
			%
			% N = PlotBrainGraphEnsemble.GETPROPNUMBER() returns the property number of plot brain graph.
			%
			% Alternative forms to call this method are:
			%  N = PL.GETPROPNUMBER() returns the property number of the plot brain graph PL.
			%  N = Element.GETPROPNUMBER(PL) returns the property number of 'PL'.
			%  N = Element.GETPROPNUMBER('PlotBrainGraphEnsemble') returns the property number of 'PlotBrainGraphEnsemble'.
			%
			% See also getProps.
			
			% COMPUTATIONAL EFFICIENCY TRICK
			prop_number = 46;
		end
		function check = existsProp(prop)
			%EXISTSPROP checks whether property exists in plot brain graph/error.
			%
			% CHECK = PlotBrainGraphEnsemble.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PL.EXISTSPROP(PROP) checks whether PROP exists for PL.
			%  CHECK = Element.EXISTSPROP(PL, PROP) checks whether PROP exists for PL.
			%  CHECK = Element.EXISTSPROP(PlotBrainGraphEnsemble, PROP) checks whether PROP exists for PlotBrainGraphEnsemble.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PL.EXISTSPROP(PROP) throws error if PROP does NOT exist for PL.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  Element.EXISTSPROP(PL, PROP) throws error if PROP does NOT exist for PL.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  Element.EXISTSPROP(PlotBrainGraphEnsemble, PROP) throws error if PROP does NOT exist for PlotBrainGraphEnsemble.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				check = any(prop == [ 1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46 ]);
			else
				assert( ...
					PlotBrainGraphEnsemble.existsProp(prop), ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for PlotBrainGraphEnsemble.'] ...
					)
			end
		end
		function check = existsTag(tag)
			%EXISTSTAG checks whether tag exists in plot brain graph/error.
			%
			% CHECK = PlotBrainGraphEnsemble.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PL.EXISTSTAG(TAG) checks whether TAG exists for PL.
			%  CHECK = Element.EXISTSTAG(PL, TAG) checks whether TAG exists for PL.
			%  CHECK = Element.EXISTSTAG(PlotBrainGraphEnsemble, TAG) checks whether TAG exists for PlotBrainGraphEnsemble.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PL.EXISTSTAG(TAG) throws error if TAG does NOT exist for PL.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  Element.EXISTSTAG(PL, TAG) throws error if TAG does NOT exist for PL.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  Element.EXISTSTAG(PlotBrainGraphEnsemble, TAG) throws error if TAG does NOT exist for PlotBrainGraphEnsemble.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%
			% See also getProps, existsTag.
			
			if nargout == 1
				% COMPUTATIONAL EFFICIENCY TRICK
				plotbraingraphensemble_tag_list = { 'id'  'bkgcolor'  'surf'  'axescolor'  'view'  'hold'  'grid'  'axis'  'equal'  'tight'  'brain'  'edgecolor'  'edgealpha'  'facecolor'  'facealpha'  'lighting'  'material'  'camlight'  'shading'  'colormap'  'colormapstring'  'atlas'  'parent'  'syms'  'syms_size'  'syms_marker'  'syms_face_color'  'syms_edge_color'  'sphs'  'sphs_size'  'sphs_edge_color'  'sphs_face_color'  'sphs_edge_alpha'  'sphs_face_alpha'  'ids'  'ids_size'  'ids_font_color'  'ids_font_name'  'ids_font_interpreter'  'labs'  'labs_size'  'labs_font_color'  'labs_font_name'  'labs_font_interpreter'  'me'  'type' };
				
				check = any(strcmpi(tag, plotbraingraphensemble_tag_list));
			else
				assert( ...
					PlotBrainGraphEnsemble.existsTag(tag), ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tag ' is not a valid tag for PlotBrainGraphEnsemble'] ...
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
			%  PROPERTY = PL.GETPROPPROP(POINTER) returns property number of POINTER of PL.
			%  PROPERTY = Element.GETPROPPROP(PlotBrainGraphEnsemble, POINTER) returns property number of POINTER of PlotBrainGraphEnsemble.
			%  PROPERTY = PL.GETPROPPROP(PlotBrainGraphEnsemble, POINTER) returns property number of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropFormat, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				% COMPUTATIONAL EFFICIENCY TRICK
				plotbraingraphensemble_tag_list = { 'id'  'bkgcolor'  'surf'  'axescolor'  'view'  'hold'  'grid'  'axis'  'equal'  'tight'  'brain'  'edgecolor'  'edgealpha'  'facecolor'  'facealpha'  'lighting'  'material'  'camlight'  'shading'  'colormap'  'colormapstring'  'atlas'  'parent'  'syms'  'syms_size'  'syms_marker'  'syms_face_color'  'syms_edge_color'  'sphs'  'sphs_size'  'sphs_edge_color'  'sphs_face_color'  'sphs_edge_alpha'  'sphs_face_alpha'  'ids'  'ids_size'  'ids_font_color'  'ids_font_name'  'ids_font_interpreter'  'labs'  'labs_size'  'labs_font_color'  'labs_font_name'  'labs_font_interpreter'  'me'  'type' };
				
				tag = pointer;
				PlotBrainGraphEnsemble.existsTag(tag);
				
				prop = find(strcmpi(tag, plotbraingraphensemble_tag_list));
			else % numeric
				prop = pointer;
				PlotBrainGraphEnsemble.existsProp(prop);
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
			%  TAG = PL.GETPROPTAG(POINTER) returns tag of POINTER of PL.
			%  TAG = Element.GETPROPTAG(PlotBrainGraphEnsemble, POINTER) returns tag of POINTER of PlotBrainGraphEnsemble.
			%  TAG = PL.GETPROPTAG(PlotBrainGraphEnsemble, POINTER) returns tag of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropProp, getPropSettings, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			if ischar(pointer)
				tag = pointer;
				PlotBrainGraphEnsemble.existsTag(tag);
			else % numeric
				prop = pointer;
				PlotBrainGraphEnsemble.existsProp(prop);
				
				switch prop
					case PlotBrainGraphEnsemble.ME
						tag = PlotBrainGraphEnsemble.ME_TAG;
					case PlotBrainGraphEnsemble.TYPE
						tag = PlotBrainGraphEnsemble.TYPE_TAG;
					otherwise
						tag = getPropTag@PlotBrainAtlas(prop);
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
			%  CATEGORY = PL.GETPROPCATEGORY(POINTER) returns category of POINTER of PL.
			%  CATEGORY = Element.GETPROPCATEGORY(PlotBrainGraphEnsemble, POINTER) returns category of POINTER of PlotBrainGraphEnsemble.
			%  CATEGORY = PL.GETPROPCATEGORY(PlotBrainGraphEnsemble, POINTER) returns category of POINTER of PlotBrainGraphEnsemble.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					prop_category = PlotBrainGraphEnsemble.ME_CATEGORY;
				case PlotBrainGraphEnsemble.TYPE
					prop_category = PlotBrainGraphEnsemble.TYPE_CATEGORY;
				otherwise
					prop_category = getPropCategory@PlotBrainAtlas(prop);
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
			%  FORMAT = PL.GETPROPFORMAT(POINTER) returns format of POINTER of PL.
			%  FORMAT = Element.GETPROPFORMAT(PlotBrainGraphEnsemble, POINTER) returns format of POINTER of PlotBrainGraphEnsemble.
			%  FORMAT = PL.GETPROPFORMAT(PlotBrainGraphEnsemble, POINTER) returns format of POINTER of PlotBrainGraphEnsemble.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			% getPropDescription, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					prop_format = PlotBrainGraphEnsemble.ME_FORMAT;
				case PlotBrainGraphEnsemble.TYPE
					prop_format = PlotBrainGraphEnsemble.TYPE_FORMAT;
				otherwise
					prop_format = getPropFormat@PlotBrainAtlas(prop);
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
			%  DESCRIPTION = PL.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PL.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(PlotBrainGraphEnsemble, POINTER) returns description of POINTER of PlotBrainGraphEnsemble.
			%  DESCRIPTION = PL.GETPROPDESCRIPTION(PlotBrainGraphEnsemble, POINTER) returns description of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropSettings, getPropDefault,
			% checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					prop_description = 'ME (metadata, item) is the measure.';
				case PlotBrainGraphEnsemble.TYPE
					prop_description = 'TYPE (metadata, string) is the type of measure.';
				otherwise
					prop_description = getPropDescription@PlotBrainAtlas(prop);
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
			%  SETTINGS = PL.GETPROPSETTINGS(POINTER) returns settings of POINTER of PL.
			%  SETTINGS = Element.GETPROPSETTINGS(PlotBrainGraphEnsemble, POINTER) returns settings of POINTER of PlotBrainGraphEnsemble.
			%  SETTINGS = PL.GETPROPSETTINGS(PlotBrainGraphEnsemble, POINTER) returns settings of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			% getPropFormat, getPropDescription, getPropDefault,
			% checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					prop_settings = Format.getFormatSettings(Format.ITEM);
				case PlotBrainGraphEnsemble.TYPE
					prop_settings = Format.getFormatSettings(Format.STRING);
				otherwise
					prop_settings = getPropSettings@PlotBrainAtlas(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = PlotBrainGraphEnsemble.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = PlotBrainGraphEnsemble.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PL.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PL.
			%  DEFAULT = Element.GETPROPDEFAULT(PlotBrainGraphEnsemble, POINTER) returns the default value of POINTER of PlotBrainGraphEnsemble.
			%  DEFAULT = PL.GETPROPDEFAULT(PlotBrainGraphEnsemble, POINTER) returns the default value of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					prop_default = Format.getFormatDefault(Format.ITEM, PlotBrainGraphEnsemble.getPropSettings(prop));
				case PlotBrainGraphEnsemble.TYPE
					prop_default = Format.getFormatDefault(Format.STRING, PlotBrainGraphEnsemble.getPropSettings(prop));
				otherwise
					prop_default = getPropDefault@PlotBrainAtlas(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = PlotBrainGraphEnsemble.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = PlotBrainGraphEnsemble.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PL.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PL.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(PlotBrainGraphEnsemble, POINTER) returns the conditioned default value of POINTER of PlotBrainGraphEnsemble.
			%  DEFAULT = PL.GETPROPDEFAULTCONDITIONED(PlotBrainGraphEnsemble, POINTER) returns the conditioned default value of POINTER of PlotBrainGraphEnsemble.
			%
			% See also getPropDefault, getPropProp, getPropTag, getPropSettings, 
			% getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			prop_default = PlotBrainGraphEnsemble.conditioning(prop, PlotBrainGraphEnsemble.getPropDefault(prop));
		end
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PL.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PL.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PL.
			%  CHECK = Element.CHECKPROP(PlotBrainGraphEnsemble, PROP, VALUE) checks VALUE format for PROP of PlotBrainGraphEnsemble.
			%  CHECK = PL.CHECKPROP(PlotBrainGraphEnsemble, PROP, VALUE) checks VALUE format for PROP of PlotBrainGraphEnsemble.
			% 
			% PL.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PL.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PL.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  Element.CHECKPROP(PlotBrainGraphEnsemble, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PlotBrainGraphEnsemble.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			%  PL.CHECKPROP(PlotBrainGraphEnsemble, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PlotBrainGraphEnsemble.
			%   Error id: [BRAPH2:PlotBrainGraphEnsemble:WrongInput]
			% 
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription,
			% getPropDefault.
			
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				case PlotBrainGraphEnsemble.ME
					check = Format.checkFormat(Format.ITEM, value, PlotBrainGraphEnsemble.getPropSettings(prop));
				case PlotBrainGraphEnsemble.TYPE
					check = Format.checkFormat(Format.STRING, value, PlotBrainGraphEnsemble.getPropSettings(prop));
				otherwise
					check = checkProp@PlotBrainAtlas(prop, value);
			end
			
			if nargout == 1
				prop_check = check;
			else
				assert( ...
					check, ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':PlotBrainGraphEnsemble:' BRAPH2.WRONG_INPUT ' ' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' PlotBrainGraphEnsemble.getPropTag(prop) ' (' PlotBrainGraphEnsemble.getPropFormat(prop) ').'] ...
					)
			end
		end
	end
	methods % constructor
		function pl = PlotBrainGraphEnsemble(varargin)
			% PlotBrainGraphEnsemble() creates a plot brain graph.
			%
			% PlotBrainGraphEnsemble(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% PlotBrainGraphEnsemble(TAG, VALUE, ...) with property with tag TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of PlotBrainGraphEnsemble properties is:
			%  <strong>1</strong> <strong>id</strong> 	ID (data, string) is a few-letter code for the plot.
			%  <strong>2</strong> <strong>bkgcolor</strong> 	BKGCOLOR (metadata, rvector) is background color.
			%  <strong>3</strong> <strong>surf</strong> 	SURF (metadata, item) is the brain surface to be plotted.
			%  <strong>4</strong> <strong>axescolor</strong> 	AXESCOLOR (metadata, rvector) is axes background color.
			%  <strong>5</strong> <strong>view</strong> 	VIEW (metadata, rvector) sets the desired view.
			%  <strong>6</strong> <strong>hold</strong> 	HOLD (metadata, logical) determines whether hold is on or offf.
			%  <strong>7</strong> <strong>grid</strong> 	GRID (metadata, logical) determines whether the grid is shown.
			%  <strong>8</strong> <strong>axis</strong> 	AXIS (metadata, logical) determines whether the axis is shown.
			%  <strong>9</strong> <strong>equal</strong> 	EQUAL (metadata, logical) determines whether the axis are equal.
			%  <strong>10</strong> <strong>tight</strong> 	TIGHT (metadata, logical) determines whether the axis are tight.
			%  <strong>11</strong> <strong>brain</strong> 	BRAIN (metadata, logical) determines whether the brain surface is shown.
			%  <strong>12</strong> <strong>edgecolor</strong> 	EDGECOLOR (metadata, rvector) is the RGB edge color.
			%  <strong>13</strong> <strong>edgealpha</strong> 	EDGEALPHA (metadata, scalar) is the edge transparency.
			%  <strong>14</strong> <strong>facecolor</strong> 	FACECOLOR (metadata, rvector) is the RGB face color.
			%  <strong>15</strong> <strong>facealpha</strong> 	FACEALPHA (metadata, scalar) is the face transparency.
			%  <strong>16</strong> <strong>lighting</strong> 	LIGHTING (metadata, option) is the lighting value.
			%  <strong>17</strong> <strong>material</strong> 	MATERIAL (metadata, option) is the material value.
			%  <strong>18</strong> <strong>camlight</strong> 	CAMLIGHT (metadata, option) is the camlight value.
			%  <strong>19</strong> <strong>shading</strong> 	SHADING (metadata, option) is the shading value.
			%  <strong>20</strong> <strong>colormap</strong> 	COLORMAP (metadata, matrix) is the colormap.
			%  <strong>21</strong> <strong>colormapstring</strong> 	COLORMAPSTRING (metadata, string) is the colormap string value.
			%  <strong>22</strong> <strong>atlas</strong> 	ATLAS (metadata, item) is the brain atlas with the brain regions.
			%  <strong>23</strong> <strong>parent</strong> 	Parent (data, item) is the plot parent figure
			%  <strong>24</strong> <strong>syms</strong> 	SYMS (metadata, cvector) is symbol visibility.
			%  <strong>25</strong> <strong>syms_size</strong> 	SYMS_SIZE (metadata, cvector) is the symbol size.
			%  <strong>26</strong> <strong>syms_marker</strong> 	SYMS_MARKER (metadata, cvector) is the symbol option.
			%  <strong>27</strong> <strong>syms_face_color</strong> 	SYMS_FACE_COLOR (metadata, matrix) is the symbol face color.
			%  <strong>28</strong> <strong>syms_edge_color</strong> 	SYMS_EDGE_COLOR (metadata, matrix) is the symbol edge color.
			%  <strong>29</strong> <strong>sphs</strong> 	SPHS (metadata, cvector) is sphere visibility.
			%  <strong>30</strong> <strong>sphs_size</strong> 	SPHS_SIZE (metadata, cvector) is the sphere size.
			%  <strong>31</strong> <strong>sphs_edge_color</strong> 	SPHS_EDGE_COLOR (metadata, matrix) is the sphere edge color.
			%  <strong>32</strong> <strong>sphs_face_color</strong> 	SPHS_FACE_COLOR (metadata, matrix) is the sphere face color.
			%  <strong>33</strong> <strong>sphs_edge_alpha</strong> 	SPHS_EDGE_ALPHA (metadata, cvector) is the sphere alpha.
			%  <strong>34</strong> <strong>sphs_face_alpha</strong> 	SPHS_FACE_ALPHA (metadata, cvector) is the sphere alpha.
			%  <strong>35</strong> <strong>ids</strong> 	IDS (metadata, cvector) is the ids visibility.
			%  <strong>36</strong> <strong>ids_size</strong> 	IDS_SIZE (metadata, cvector) is the ids size.
			%  <strong>37</strong> <strong>ids_font_color</strong> 	IDS_FONT_COLOR (metadata, matrix) is the ids font color.
			%  <strong>38</strong> <strong>ids_font_name</strong> 	IDS_FONT_NAME (metadata, string) is the ids font name.
			%  <strong>39</strong> <strong>ids_font_interpreter</strong> 	IDS_FONT_INTERPRETER (metadata, cvector) is the ids font interpreter.
			%  <strong>40</strong> <strong>labs</strong> 	LABS (metadata, cvector) is the labs visibility.
			%  <strong>41</strong> <strong>labs_size</strong> 	LABS_SIZE (metadata, cvector) is the labs size.
			%  <strong>42</strong> <strong>labs_font_color</strong> 	LABS_FONT_COLOR (metadata, matrix) is the labs font color.
			%  <strong>43</strong> <strong>labs_font_name</strong> 	LABS_FONT_NAME (metadata, string) is the labs font name.
			%  <strong>44</strong> <strong>labs_font_interpreter</strong> 	LABS_FONT_INTERPRETER (metadata, cvector) is the labs font interpreter.
			%  <strong>45</strong> <strong>me</strong> 	ME (metadata, item) is the measure.
			%  <strong>46</strong> <strong>type</strong> 	TYPE (metadata, string) is the type of measure.
			%
			% See also Category, Format, set, check.
			
			pl = pl@PlotBrainAtlas(varargin{:});
		end
	end
	methods (Static, Access=protected) % conditioning
		function value = conditioning(pointer, value)
			prop = PlotBrainGraphEnsemble.getPropProp(pointer);
			
			switch prop
				otherwise
					if prop <= PlotBrainAtlas.getPropNumber()
						value = conditioning@PlotBrainAtlas(pointer, value);
					end
			end
		end
	end
	methods % methods
		function h_panel = draw(pl, varargin)
		    %DRAW draws the brain atlas graph graphical panel.
		    %
		    % DRAW(PL) draws the brain atlas graph graphical panel.
		    %
		    % H = DRAW(PL) returns a handle to the brain atlas graph graphical panel.
		    %
		    % DRAW(PL, 'Property', VALUE, ...) sets the properties of the graphical
		    %  panel with custom property-value couples.
		    %  All standard plot properties of uipanel can be used.
		    %
		    % It is possible to access the properties of the various graphical
		    %  objects from the handle to the brain atlas graph graphical panel H.
		    %
		    % see also settings, uipanel, isgraphics.
		
		    pl.pp = draw@PlotBrainAtlas(pl, varargin{:});
		
		    if isempty(pl.h_axes) || ~isgraphics(pl.h_axes, 'axes')
		        pl.h_axes =  get(pl.pp, 'Children');
		    end
		
		    % close function
		    set(pl.pp, 'DeleteFcn', {@close_f_settings}, ...
		        varargin{:})
		
		        function close_f_settings(~, ~)
		            if ~isempty(pl.f_settings) && isgraphics(pl.f_settings, 'figure')
		                close(pl.f_settings)
		            end
		        end
		
		    brain_regions_length = pl.get('ATLAS').get('BR_DICT').length();
		    pl.edges.h = NaN(brain_regions_length);
		    pl.edges.arr = NaN(brain_regions_length);
		    pl.edges.cyl = NaN(brain_regions_length);
		    pl.edges.texts = NaN(brain_regions_length);
		    pl.edges.X1 = zeros(brain_regions_length, 1);
		    pl.edges.Y1 = zeros(brain_regions_length, 1);
		    pl.edges.Z1 = zeros(brain_regions_length, 1);
		    pl.edges.X2 = zeros(brain_regions_length, 1);
		    pl.edges.Y2 = zeros(brain_regions_length, 1);
		    pl.edges.Z2 = zeros(brain_regions_length, 1);
		
		    % output
		    if nargout > 0
		        h_panel = pl.pp;
		    end
		end
		function f_settings  = settings(pl, varargin)
		    %SETTINGS opens the brain surface property editor GUI.
		    %
		    % SETTINGS(PL) allows the user to specify the properties of the brain
		    %  atlas plot by opening a GUI property editor.
		    %
		    % F = SETTINGS(PL) returns a handle to the brain atlas property editor GUI.
		    %
		    % SETTINGS(PL, 'Property', VALUE, ...) sets the properties of the brain
		    %  atlas property editor GUI with custom property-value couples.
		    %  All standard plot properties of figure can be used.
		    %
		    % See also draw, figure, isgraphics.
		    
		    f_settings = settings@PlotBrainAtlas(pl, varargin{:});
		    pl.f_settings = f_settings;
		    
		    ui_toolbar = findall(f_settings, 'Tag', 'FigureToolBar');
		    ui_toolbar_separator = uipushtool(ui_toolbar, 'Separator', 'on', 'Visible', 'off');
		    
		    ui_toolbar_mcr = uipushtool(ui_toolbar, ...
		        'Separator', 'on', ...
		        'TooltipString', 'Brain Regions', ...
		        'CData', imread('icon_measure_panel.png'), ...
		        'ClickedCallback', {@cb_panel_mcr});   
		    
		    ui_toolbar_graph = uipushtool(ui_toolbar, ...
		        'Separator', 'on', ...
		        'TooltipString', 'Brain Connections', ...
		        'CData', imread('icon_graph_panel.png'), ...
		        'ClickedCallback', {@cb_panel_graph});
		    
		    ui_toolbar_surface = uipushtool(ui_toolbar, ...
		        'Separator', 'on', ...
		        'TooltipString', 'Brain Surface', ...
		        'CData', imread('icon_surface_panel.png'), ...
		        'ClickedCallback', {@cb_panel_surface});
		    
		    % declare two more panels and get the initial one
		    surface_panel = getSurfacePanel();
		    ui_panel_graph = uipanel(f_settings, ...
		        'Units', 'normalized', ...
		        'BackgroundColor', [1 .9725 .929], ...
		        'Visible', 'off', ...
		        'Enable', 'off', ...
		        'Position', [0 0 1 1]);
		    
		    ui_panel_mcr = uipanel(f_settings, ...
		        'Units', 'normalized', ...
		        'BackgroundColor', [1 .9725 .929], ...
		        'Visible', 'off', ...
		        'Enable', 'off', ...
		        'Position', [0 0 1 1]);
		    
		    function cb_panel_surface(~, ~)
		        set(surface_panel, 'Visible', 'on', 'Enable', 'on')
		        set(ui_panel_graph, 'Visible', 'off', 'Enable', 'off')
		        set(ui_panel_mcr, 'Visible', 'off', 'Enable', 'off')
		    end
		    function cb_panel_graph(~, ~)
		        set(surface_panel, 'Visible', 'off', 'Enable', 'off')
		        set(ui_panel_graph, 'Visible', 'on', 'Enable', 'on')
		        set(ui_panel_mcr, 'Visible', 'off', 'Enable', 'off')
		        if  isempty(pl.f_graph_settings)
		            pl.getBrainGraphPanel(ui_panel_graph);
		        end
		    end
		    function cb_panel_mcr(~, ~)
		        set(surface_panel, 'Visible', 'off', 'Enable', 'off')
		        set(ui_panel_graph, 'Visible', 'off', 'Enable', 'off')
		        set(ui_panel_mcr, 'Visible', 'on', 'Enable', 'on')
		        if isempty(pl.f_measures_settings)
		            pl.getMCRPanel(ui_panel_mcr);
		        end
		    end
		    function h_panel = getSurfacePanel()
		        h_panel = get(f_settings, 'Child');
		        ui_title = uicontrol(h_panel, ...
		            'Style', 'text', ...
		            'String', 'Surface Panel', ...
		            'Units', 'normalized', ...
		            'BackgroundColor', [1 .9725 .929], ...
		            'HorizontalAlignment', 'left', ...
		            'FontWeight', 'bold', ...
		            'Position', [0.01 .91 0.3 0.08]);
		    end
		
		    cb_panel_mcr()
		
		    if nargout > 0
		        f_settings = pl.f_settings;
		    end
		end
		function cb_bring_to_front(pl)
		    %CB_BRING_TO_FRONT brings to front the brain view figure and its settings figure.
		    %
		    % CB_BRING_TO_FRONT(PR) brings to front the brain view figure and its
		    %  settings figure.
		    %
		    % See also cb_hide.
		    
		    pl.cb_bring_to_front@PlotBrainAtlas();    
		    if check_graphics(pl.f_graph_settings, 'figure')
		        set(pl.f_graph_settings, 'Visible' , 'on', 'WindowState', 'normal');
		    end
		    if check_graphics(pl.f_measures_settings, 'figure')
		        set(pl.f_measures_settings, 'Visible' , 'on', 'WindowState', 'normal');
		    end    
		end
		function cb_hide(pl)
		    %CB_HIDE hides the brain view figure and its settings figure.
		    %
		    % CB_HIDE(PR) hides the brain view figure and its settings figure.
		    %
		    % See also cb_bring_to_front.
		    
		    pl.cb_hide@PlotBrainAtlas();  
		    
		    if check_graphics(pl.f_graph_settings, 'figure')
		        set(pl.f_graph_settings, 'Visible' , 'off');
		    end
		    if check_graphics(pl.f_measures_settings, 'figure')
		        set(pl.f_measures_settings, 'Visible' , 'off');
		    end   
		end
		
		function h = link_edge(pl, i, j, varargin)
		    % LINK_EDGE plots edge link as line
		    %
		    % LINK_EDGE(BG, I, J) plots the edge link from the brain regions
		    % I to J as a line, if not plotted.
		    %
		    % H = LINK_EDGE(BG, I, J) returns the handle to the edge link
		    % from the brain region I to J.
		    %
		    % LINK_EDGE(BG, I, J, PROPERTY, VALUE, ...) sets the property
		    % of the edge link line PROPERTY to VALUE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edges, text_edge.
		
		    if i == j  % removes diagonal
		        return;
		    end
		    % get brain regions
		
		    br_1 = pl.get('ATLAS').get('BR_DICT').getItem(i);
		    br_2 = pl.get('ATLAS').get('BR_DICT').getItem(j);
		    % get coordinates
		    X1 = br_1.get('X');
		    Y1 = br_1.get('Y');
		    Z1 = br_1.get('Z');
		
		    X2 = br_2.get('X');
		    Y2 = br_2.get('Y');
		    Z2 = br_2.get('Z');
		
		    if ~ishandle(pl.edges.h(j, i))
		        if ~ishandle(pl.edges.h(i, j))
		
		            pl.edges.h(i, j) = plot3( ...
		                pl.get_axes(), ...
		                [X1 X2], ...
		                [Y1 Y2], ...
		                [Z1 Z2], ...
		                'Color', pl.INIT_LIN_COLOR, ...
		                'LineStyle', '-', 'LineWidth', 1);
		        else
		            x1 = pl.edges.X1(i, j);
		            y1 = pl.edges.Y1(i, j);
		            z1 = pl.edges.Z1(i, j);
		
		            x2 = pl.edges.X2(i, j);
		            y2 = pl.edges.Y2(i, j);
		            z2 = pl.edges.Z2(i, j);
		
		            if x1 ~= X1 || y1 ~= Y1 || z1 ~= Z1 ...
		                    || x2 ~= X2 || y2 ~= Y2 || z2 ~= Z2
		
		                set(pl.edges.h(i, j), 'XData', [X1 X2]);
		                set(pl.edges.h(i, j), 'YData', [Y1 Y2]);
		                set(pl.edges.h(i, j), 'ZData', [Z1 Z2]);
		            end
		        end
		    else
		        pl.edges.h(i, j) = pl.edges.h(j, i);
		    end
		    pl.edges.X1(i, j) = X1;
		    pl.edges.Y1(i, j) = Y1;
		    pl.edges.Z1(i, j) = Z1;
		
		    pl.edges.X2(i, j) = X2;
		    pl.edges.Y2(i, j) = Y2;
		    pl.edges.Z2(i, j) = Z2;
		
		    % sets properties
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'linestyle'
		                set(pl.edges.h(i, j),'LineStyle', varargin{n + 1});
		            case 'linewidth'
		                set(pl.edges.h(i, j),'LineWidth', varargin{n + 1});
		            case 'color'
		                set(pl.edges.h(i, j),'Color', varargin{n + 1});
		            otherwise
		                set(pl.edges.h(i, j),varargin{n}, varargin{n + 1});
		        end
		    end
		
		    if nargout>0
		        h = pl.edges.h(i, j);
		    end
		end
		function link_edge_on(pl, i, j)
		    % LINK_EDGE_ON shows a edge link
		    %
		    % LINK_EDGE_ON(BG, I, J) shows the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_off.
		
		    if ishandle(pl.edges.h(i, j))
		        set(pl.edges.h(i, j), 'Visible', 'on')
		    end
		end
		function link_edge_off(pl, i, j)
		    % LINK_EDGE_OFF hides a edge link
		    %
		    % LINK_EDGE_OFF(BG, I, J) hides the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if ishandle(pl.edges.h(i, j))
		        set(pl.edges.h(i, j), 'Visible', 'off')
		    end
		end
		function link_edges(pl, i_vec, j_vec, varargin)
		    % LINK_EDGES plots multiple edge links as lines
		    %
		    % LINK_EDGES(BG, I_VEC, J_VEC) plots the edge links from the
		    % brain regions specified in I_VEC to the ones specified in
		    % J_VEC, if not plotted. I_VEC and J_VEC need not be the same
		    % size.
		    %
		    % LINK_EDGES(BG, [], []) plots the edge links between all
		    % possible brain region combinations.
		    %
		    % LINK_EDGES(BG, I_VEC, J_VEC, PROPERTY, RULE) sets the property
		    % of the multiple edge links' PROPERTY to RULE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edge.
		
		    if nargin < 2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.link_edge(i, j, varargin{:})
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.link_edge(i_vec(m), j_vec(m), varargin{:})
		        end
		    end
		end
		function link_edges_on(pl, i_vec, j_vec)
		    % LINK_EDGES_ON shows multiple edge link
		    %
		    % LINK_EDGES_ON(BG, I, J) shows multiple edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edges, link_edges_off.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.link_edge_on(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.link_edge_on(i_vec(m), j_vec(m))
		        end
		    end
		end
		function link_edges_off(pl, i_vec, j_vec)
		    % LINK_EDGES_OFF hides multiple edge links
		    %
		    % LINK_EDGES_OFF(BG, I, J) hides multiple edge links from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.link_edge_off(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.link_edge_off(i_vec(m), j_vec(m))
		        end
		    end
		end
		function link_edges_settings(pl, i_vec, j_vec, varargin)
		    % LINK_EDGES_SETTINGS sets edges' properties
		    %
		    % LINK_EDGES_SETTINGS(BG) allows the user to interractively
		    % change the edges settings via a graphical user interface.
		    %
		    % LINK_LINS_SETTINGS(BG, PROPERTY, VALUE, ...) sets the property
		    % of the GUI's PROPERTY to VALUES.
		    %   Admissible properties are:
		    %       FigPosition  -   position of the GUI on the screen
		    %       FigColor     -   background color of the GUI
		    %       FigName      -   name of the GUI
		    %
		    % See also PlotBrainGraph.
		
		    atlas_length = pl.get('ATLAS').get('BR_DICT').length();
		    data = cell(atlas_length, atlas_length);
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        i_vec = 1:1:atlas_length;
		        j_vec = 1:1:atlas_length;
		    end
		    if length(i_vec) == 1
		        i_vec = i_vec * ones(size(j_vec));
		    end
		    if length(j_vec) == 1
		        j_vec = j_vec * ones(size(i_vec));
		    end
		    for p = 1:1:length(i_vec)
		        if i_vec(p) ~= j_vec(p)
		            data{i_vec(p), j_vec(p)} = true;
		        else
		            data{i_vec(p), j_vec(p)} = false;
		        end
		    end
		
		    set_color = pl.INIT_LIN_COLOR;
		
		    % sets position of figure
		    FigPosition = [.50 .30 .30 .30];
		    FigColor = pl.TABBKGCOLOR;
		    FigName = 'Brain Graph Edges Settings';
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'figposition'
		                FigPosition = varargin{n + 1};
		            case 'figcolor'
		                FigColor = varargin{n + 1};
		            case 'figname'
		                FigName = varargin{n + 1};
		        end
		    end
		
		    % create a figure
		    if isempty(pl.f_edges_settings) || ~ishandle(pl.f_edges_settings)
		        pl.f_edges_settings = figure('Visible', 'off');
		    end
		    f = pl.f_edges_settings;
		    set(f, 'units', 'normalized')
		    set(f, 'Position', FigPosition)
		    set(f, 'Color', FigColor)
		    set(f, 'Name', FigName)
		    set(f, 'MenuBar', 'none')
		    set(f, 'Toolbar', 'none')
		    set(f, 'NumberTitle', 'off')
		    set(f, 'DockControls', 'off')
		
		    ui_table = uitable(f, 'Units', 'normalized');
		    set(ui_table, 'BackgroundColor', pl.TABBKGCOLOR)
		    set(ui_table, 'Position', [.03 .215 .54 .71])
		    set(ui_table, 'ColumnWidth', {40})
		    [string{1:atlas_length}] = deal('logical');
		    set(ui_table, 'ColumnFormat', string)
		    set(ui_table, 'ColumnEditable', true)
		    set(ui_table, 'Data', data)
		    set(ui_table, 'CellEditCallback', {@cb_table_edit});
		
		    ui_button_show = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_show, 'Position', [.60 .825 .18 .10])
		    set(ui_button_show, 'String', 'Show lines')
		    set(ui_button_show, 'TooltipString', 'Show selected lines')
		    set(ui_button_show, 'Callback', {@cb_show})
		
		    ui_button_hide = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized' );
		    set(ui_button_hide, 'Position', [.80 .825 .18 .10])
		    set(ui_button_hide, 'String', 'Hide lines')
		    set(ui_button_hide, 'TooltipString', 'Hide selected lines')
		    set(ui_button_hide, 'Callback', {@cb_hide})
		
		    ui_popup_style = uicontrol(f, 'Units', 'normalized', 'Style',  'popup', 'String', {''});
		    set(ui_popup_style, 'Position', [.62 .575 .35 .10])
		    set(ui_popup_style, 'String', PlotBrainGraph.PLOT_LINESTYLE_NAME)
		    set(ui_popup_style, 'Value', 1)
		    set(ui_popup_style, 'TooltipString', 'Select line style');
		    set(ui_popup_style, 'Callback', {@cb_style})
		
		    ui_text_width = uicontrol(f, 'Style', 'text', 'Units', 'normalized');
		    set(ui_text_width, 'Position', [.62 .330 .10 .10])
		    set(ui_text_width, 'String', 'Link width ')
		    set(ui_text_width, 'HorizontalAlignment', 'left')
		    set(ui_text_width, 'FontWeight', 'bold')
		
		    ui_edit_width = uicontrol(f, 'Style', 'edit', 'Units', 'normalized');
		    set(ui_edit_width, 'Position', [.72 .325 .25 .10])
		    set(ui_edit_width, 'HorizontalAlignment', 'center')
		    set(ui_edit_width, 'FontWeight', 'bold')
		    set(ui_edit_width, 'String', '1')
		    set(ui_edit_width, 'Callback', {@cb_width})
		
		    ui_button_linecolor = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_linecolor, 'ForegroundColor', set_color)
		    set(ui_button_linecolor, 'Position', [.62 .075 .35 .10])
		    set(ui_button_linecolor, 'String', 'Link Color')
		    set(ui_button_linecolor, 'TooltipString', 'Select line color')
		    set(ui_button_linecolor, 'Callback', {@cb_linecolor})
		
		    ui_button_clearselection = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_clearselection, 'Position', [.03 .075 .54 .10])
		    set(ui_button_clearselection, 'String', 'Clear Selection')
		    set(ui_button_clearselection, 'TooltipString', 'Clear selected links')
		    set(ui_button_clearselection, 'Callback', {@cb_clearselection})
		
		        function cb_table_edit(~, event)  % (src, event)
		            i = event.Indices(1);
		            j = event.Indices(2);
		
		            if i~=j
		                if data{i, j} == true
		                    data{i, j} = false;
		                else
		                    data{i, j} = true;
		                end
		                set(ui_table, 'Data', data)
		            end
		        end
		        function update_link_edges()
		            style = pl.PLOT_LINESTYLE_TAG{get(ui_popup_style, 'Value')};
		            width = real(str2double(get(ui_edit_width, 'String')));
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)} == 1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.link_edges(i, j, 'LineStyle', style, 'LineWidth', width, ...
		                        'Color', set_color);
		                end
		            end
		        end
		        function cb_show(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)}==1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    update_link_edges()
		                    pl.link_edges_on(i, j)
		                end
		            end
		        end
		        function cb_hide(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)}==1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.link_edges_off(i, j)
		                end
		            end
		        end
		        function cb_style(~, ~)  % (src, event)
		            update_link_edges()
		        end
		        function cb_width(~, ~)  % (src, event)
		            width = real(str2double(get(ui_edit_width, 'String')));
		
		            if isempty(width) || width < 1
		                set(ui_edit_width, 'String', '1')
		            end
		            update_link_edges()
		        end
		        function cb_linecolor(~, ~)  % (src, event)
		            set_color_prev = get(ui_button_linecolor, 'ForegroundColor');
		            set_color = uisetcolor();
		            if length(set_color )== 3
		                set(ui_button_linecolor, 'ForegroundColor', set_color)
		                update_link_edges()
		            else
		                set_color = set_color_prev;
		            end
		        end
		        function cb_clearselection(~, ~)  % (src, event)
		            [data{:}] = deal(zeros(1));
		            set(ui_table, 'Data', data)
		        end
		    set(f, 'Visible', 'on')
		end
		function bool = link_edge_is_on(pl, i, j)
		    % LINK_EDGE_IS_ON checks if line link is visible
		    %
		    % BOOL = LINK_EDGE_IS_ON(BG, I, J) returns true if the line link
		    % from the brain regions I to J is visible and false otherwise.
		    %
		    % See also PlotBrainGraph.
		
		    bool = ishandle(pl.edges.h(i, j)) && strcmpi(get(pl.edges.h(i, j), 'Visible'), 'on');
		end
		
		function h = arrow_edge(pl, i, j, varargin)
		    % ARROW_EDGE plots edge link as an arrow
		    %
		    % ARROW_EDGE(BG, I, J) plots the edge link from the brain regions
		    % I to J as a line, if not plotted.
		    %
		    % H = ARROW_EDGE(BG, I, J) returns the handle to the edge link
		    % from the brain region I to J.
		    %
		    % ARROW_EDGE(BG, I, J, PROPERTY, VALUE, ...) sets the property
		    % of the edge link line PROPERTY to VALUE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edges.
		
		    if i == j  % removes diagonal
		        return;
		    end
		    
		    % get brain regions
		    br_1 = pl.get('ATLAS').get('BR_DICT').getItem(i);
		    br_2 = pl.get('ATLAS').get('BR_DICT').getItem(j);
		    % get coordinates
		    X1 = br_1.get('X');
		    Y1 = br_1.get('Y');
		    Z1 = br_1.get('Z');
		
		    X2 = br_2.get('X');
		    Y2 = br_2.get('Y');
		    Z2 = br_2.get('Z');
		
		    % arrow properties
		    color = pl.INIT_ARR_COLOR;
		    SWIDTH = pl.INIT_ARR_SWIDTH;
		    HLENGTH = pl.INIT_ARR_HLENGTH;
		    HWIDTH = pl.INIT_ARR_HWIDTH;
		    HNODE = pl.INIT_ARR_HNODE;
		    N = pl.INIT_ARR_N;
		
		    if ~ishandle(pl.edges.arr(i, j))
		
		        [X, Y, Z] = arrow3d(X1, Y1, Z1, X2, Y2, Z2,...
		            'StemWidth', SWIDTH, ...
		            'HeadLength', HLENGTH, ...
		            'HeadWidth', HWIDTH, ...
		            'HeadNode', HNODE, ...
		            'N', N);
		
		        pl.edges.arr(i, j) = surf(X, Y, Z,...
		            'EdgeColor', color,...
		            'FaceColor', color,...
		            'Parent', pl.get_axes());
		    else
		        x1 = pl.edges.X1(i, j);
		        y1 = pl.edges.Y1(i, j);
		        z1 = pl.edges.Z1(i, j);
		
		        x2 = pl.edges.X2(i, j);
		        y2 = pl.edges.Y2(i, j);
		        z2 = pl.edges.Z2(i, j);
		
		        if x1 ~= X1 || y1 ~= Y1 || z1 ~= Z1 ...
		                || x2 ~= X2 || y2 ~= Y2 || z2 ~= Z2
		
		            [X, Y, Z] = arrow3d(X1, Y1, Z1, X2, Y2, Z2,...
		                'StemWidth', SWIDTH, ...
		                'HeadLength', HLENGTH, ...
		                'HeadWidth', HWIDTH, ...
		                'HeadNode', HNODE, ...
		                'N', N);
		
		            set(pl.edges.arr(i, j), 'XData', X);
		            set(pl.edges.arr(i, j), 'YData', Y);
		            set(pl.edges.arr(i, j), 'ZData', Z);
		
		        end
		    end
		    pl.edges.X1(i, j) = X1;
		    pl.edges.Y1(i, j) = Y1;
		    pl.edges.Z1(i, j) = Z1;
		
		    pl.edges.X2(i, j) = X2;
		    pl.edges.Y2(i, j) = Y2;
		    pl.edges.Z2(i, j) = Z2;
		
		    % sets properties
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'color'
		                set(pl.edges.arr(i, j), 'FaceColor', varargin{n + 1});
		                set(pl.edges.arr(i, j), 'EdgeColor', varargin{n + 1});
		
		            otherwise
		                set(pl.edges.arr(i, j), varargin{n}, varargin{n + 1});
		        end
		    end
		
		    if nargout>0
		        h = pl.edges.arr(i, j);
		    end
		end
		function arrow_edge_on(pl, i, j)
		    % ARROW_EDGE_ON shows a edge link
		    %
		    % ARROW_EDGE_ON(BG, I, J) shows the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_off.
		
		    if ishandle(pl.edges.arr(i, j))
		        set(pl.edges.arr(i, j), 'Visible', 'on')
		    end
		end
		function arrow_edge_off(pl, i, j)
		    % ARROW_EDGE_OFF hides a edge link
		    %
		    % ARROW_EDGE_OFF(BG, I, J) hides the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if ishandle(pl.edges.arr(i, j))
		        set(pl.edges.arr(i, j), 'Visible', 'off')
		    end
		end
		function arrow_edges(pl, i_vec, j_vec, varargin)
		    % ARROW_EDGES plots multiple edge links as lines
		    %
		    % ARROW_EDGES(BG, I_VEC, J_VEC) plots the edge links from the
		    % brain regions specified in I_VEC to the ones specified in
		    % J_VEC, if not plotted. I_VEC and J_VEC need not be the same
		    % size.
		    %
		    % ARROW_EDGES(BG, [], []) plots the edge links between all
		    % possible brain region combinations.
		    %
		    % ARROW_LINS(BG, I_VEC, J_VEC, PROPERTY, RULE) sets the property
		    % of the multiple edge links' PROPERTY to RULE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edge.
		
		    if nargin < 2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.arrow_edge(i, j, varargin{:})
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.arrow_edge(i_vec(m), j_vec(m), varargin{:})
		        end
		    end
		end
		function arrow_edges_on(pl, i_vec, j_vec)
		    % ARROW_EDGES_ON shows multiple edge link
		    %
		    % ARROW_EDGES_ON(BG, I, J) shows multiple edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edges, link_edges_off.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.arrow_edge_on(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.arrow_edge_on(i_vec(m), j_vec(m))
		        end
		    end
		end
		function arrow_edges_off(pl, i_vec, j_vec)
		    % ARROW_EDGES_OFF hides multiple edge links
		    %
		    % ARROW_EDGES_OFF(BG, I, J) hides multiple edge links from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.arrow_edge_off(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.arrow_edge_off(i_vec(m), j_vec(m))
		        end
		    end
		end
		function arrow_edges_settings(pl, i_vec, j_vec, varargin)
		    % ARROW_EDGES_SETTINGS sets edges' properties
		    %
		    % ARROW_EDGES_SETTINGS(BG) allows the user to interractively
		    % change the edges settings via a graphical user interface.
		    %
		    % ARROW_LINS_SETTINGS(BG, PROPERTY, VALUE, ...) sets the property
		    % of the GUI's PROPERTY to VALUES.
		    %   Admissible properties are:
		    %       FigPosition  -   position of the GUI on the screen
		    %       FigColor     -   background color of the GUI
		    %       FigName      -   name of the GUI
		    %
		    % See also PlotBrainGraph.
		
		    atlas_length = pl.get('ATLAS').get('BR_DICT').length();
		    data = cell(atlas_length, atlas_length);
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        i_vec = 1:1:atlas_length;
		        j_vec = 1:1:atlas_length;
		    end
		    if length(i_vec) == 1
		        i_vec = i_vec * ones(size(j_vec));
		    end
		    if length(j_vec) == 1
		        j_vec = j_vec * ones(size(i_vec));
		    end
		    for p = 1:1:length(i_vec)
		        if i_vec(p) ~= j_vec(p)
		            data{i_vec(p), j_vec(p)} = true;
		        else
		            data{i_vec(p), j_vec(p)} = false;
		        end
		    end
		
		    set_color = pl.INIT_LIN_COLOR;
		
		    % sets position of figure
		    FigPosition = [.50 .30 .30 .30];
		    FigColor = pl.BKGCOLOR;
		    FigName = 'Brain Graph Arrows Settings';
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'figposition'
		                FigPosition = varargin{n + 1};
		            case 'figcolor'
		                FigColor = varargin{n + 1};
		            case 'figname'
		                FigName = varargin{n + 1};
		        end
		    end
		
		    % create a figure
		    if isempty(pl.f_arrs_settings) || ~ishandle(pl.f_arrs_settings)
		        pl.f_arrs_settings = figure('Visible', 'off');
		    end
		    f = pl.f_arrs_settings;
		    set(f, 'units', 'normalized')
		    set(f, 'Position', FigPosition)
		    set(f, 'Color', FigColor)
		    set(f, 'Name', FigName)
		    set(f, 'MenuBar', 'none')
		    set(f, 'Toolbar', 'none')
		    set(f, 'NumberTitle', 'off')
		    set(f, 'DockControls', 'off')
		
		    ui_table = uitable(f);
		    set(ui_table, 'Units', 'normalized')
		    set(ui_table, 'BackgroundColor', pl.TABBKGCOLOR)
		    set(ui_table, 'Position', [.03 .215 .54 .71])
		    set(ui_table, 'ColumnWidth', {40})
		    [string{1:atlas_length}] = deal('logical');
		    set(ui_table, 'ColumnFormat', string)
		    set(ui_table, 'ColumnEditable', true)
		    set(ui_table, 'Data', data)
		    set(ui_table, 'CellEditCallback', {@cb_table_edit});
		
		    ui_button_show = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_show, 'Position', [.60 .825 .18 .10])
		    set(ui_button_show, 'String', 'Show lines')
		    set(ui_button_show, 'TooltipString', 'Show selected arrows')
		    set(ui_button_show, 'Callback', {@cb_show})
		
		    ui_button_hide = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_hide, 'Position', [.80 .825 .18 .10])
		    set(ui_button_hide, 'String', 'Hide lines')
		    set(ui_button_hide, 'TooltipString', 'Hide selected arrows')
		    set(ui_button_hide, 'Callback', {@cb_hide})
		
		    ui_button_arrowcolor = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_arrowcolor, 'ForegroundColor', set_color)
		    set(ui_button_arrowcolor, 'Position', [.62 .075 .35 .10])
		    set(ui_button_arrowcolor, 'String', 'Link Color')
		    set(ui_button_arrowcolor, 'TooltipString', 'Select arrow color')
		    set(ui_button_arrowcolor, 'Callback', {@cb_arrowcolor})
		
		    ui_button_clearselection = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_clearselection, 'Position', [.03 .075 .54 .10])
		    set(ui_button_clearselection, 'String', 'Clear Selection')
		    set(ui_button_clearselection, 'TooltipString', 'Clear selected links')
		    set(ui_button_clearselection, 'Callback', {@cb_clearselection})
		
		        function cb_table_edit(~, event)  % (src, event)
		            i = event.Indices(1);
		            j = event.Indices(2);
		
		            if i~=j
		                if data{i, j} == true
		                    data{i, j} = false;
		                else
		                    data{i, j} = true;
		                end
		                set(ui_table, 'Data', data)
		            end
		        end
		        function update_link_arrs()
		            stemwidth = real(str2double(get(ui_edit_stemwidth, 'String')));
		            headwidth = real(str2double(get(ui_edit_headwidth, 'String')));
		            headlength = real(str2double(get(ui_edit_headlength, 'String')));
		            headnode = real(str2double(get(ui_edit_headnode, 'String')));
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)} == 1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.arrow_edges(i, j, 'StemWidth', stemwidth, ...
		                        'HeadWidth', headwidth, ...
		                        'HeadLength', headlength, ...
		                        'HeadNode', headnode, ...
		                        'Color', set_color);
		                end
		            end
		        end
		        function cb_arrowcolor(~, ~)  % (src, event)
		            set_color_prev = get(ui_button_arrowcolor, 'ForegroundColor');
		            set_color = uisetcolor();
		            if length(set_color) == 3
		                set(ui_button_arrowcolor, 'ForegroundColor', set_color)
		                update_link_arrs()
		            else
		                set_color = set_color_prev;
		            end
		        end
		        function cb_show(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)} == 1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    update_link_arrs()
		                    pl.arrow_edges_on(i, j)
		                end
		            end
		        end
		        function cb_hide(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)}==1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.arrow_edges_off(i, j)
		                end
		            end
		        end
		        function cb_clearselection(~, ~)  % (src, event)
		            [data{:}] = deal(zeros(1));
		            set(ui_table, 'Data', data)
		        end
		    set(f, 'Visible', 'on')
		end
		function bool = arrow_edge_is_on(pl, i, j)
		    % ARROW_EDGE_IS_ON checks if line link is visible
		    %
		    % BOOL = ARROW_EDGE_IS_ON(BG, I, J) returns true if the line arrow link
		    % from the brain regions I to J is visible and false otherwise.
		    %
		    % See also PlotBrainGraph.
		
		    bool = ishandle(pl.edges.arr(i, j)) && strcmpi(get(pl.edges.arr(i, j), 'Visible'), 'on');
		end
		
		function h = cylinder_edge(pl, i, j, varargin)
		    % CYLINDER_EDGE plots edge link as an cylinder
		    %
		    % CYLINDER_EDGE(BG, I, J) plots the edge link from the brain regions
		    % I to J as a line, if not plotted.
		    %
		    % H = CYLINDER_EDGE(BG, I, J) returns the handle to the edge link
		    % from the brain region I to J.
		    %
		    % CYLINDER_EDGE(BG, I, J, PROPERTY, VALUE, ...) sets the property
		    % of the edge link line PROPERTY to VALUE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edges.
		
		    if i == j  % removes diagonal
		        return;
		    end
		    
		    % get brain regions
		    br_1 = pl.get('ATLAS').get('BR_DICT').getItem(i);
		    br_2 = pl.get('ATLAS').get('BR_DICT').getItem(j);
		    % get coordinates
		    X1 = br_1.get('X');
		    Y1 = br_1.get('Y');
		    Z1 = br_1.get('Z');
		
		    X2 = br_2.get('X');
		    Y2 = br_2.get('Y');
		    Z2 = br_2.get('Z');
		
		    % cylinder properties
		    color = pl.INIT_CYL_COLOR;
		    R = pl.INIT_CYL_R;
		    N = pl.INIT_CYL_N;
		
		    if ~ishandle(pl.edges.cyl(i, j))
		
		        [X, Y, Z] = cylinder3d(X1, Y1, Z1, X2, Y2, Z2,...
		            'R', R, ...
		            'N', N);
		
		        pl.edges.cyl(i, j) = surf(X, Y, Z,...
		            'EdgeColor', color, ...
		            'FaceColor', color, ...
		            'Parent', pl.get_axes());
		    else
		        x1 = pl.edges.X1(i, j);
		        y1 = pl.edges.Y1(i, j);
		        z1 = pl.edges.Z1(i, j);
		
		        x2 = pl.edges.X2(i, j);
		        y2 = pl.edges.Y2(i, j);
		        z2 = pl.edges.Z2(i, j);
		
		        if x1 ~= X1 || y1 ~= Y1 || z1 ~= Z1 ...
		                || x2 ~= X2 || y2 ~= Y2 || z2 ~= Z2
		
		            [X, Y, Z] = cylinder3d(X1, Y1, Z1, X2, Y2, Z2,...
		                'Color', color,...
		                'LineStyle', '-');
		
		            set(pl.edges.cyl(i, j), 'XData', X);
		            set(pl.edges.cyl(i, j), 'YData', Y);
		            set(pl.edges.cyl(i, j), 'ZData', Z);
		
		        end
		    end
		    pl.edges.X1(i, j) = X1;
		    pl.edges.Y1(i, j) = Y1;
		    pl.edges.Z1(i, j) = Z1;
		
		    pl.edges.X2(i, j) = X2;
		    pl.edges.Y2(i, j) = Y2;
		    pl.edges.Z2(i, j) = Z2;
		
		    % sets properties
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'color'
		                set(pl.edges.cyl(i, j), 'FaceColor', varargin{n + 1});
		                set(pl.edges.cyl(i, j), 'EdgeColor', varargin{n + 1});
		
		            otherwise
		                set(pl.edges.cyl(i, j), varargin{n}, varargin{n + 1});
		        end
		    end
		
		    if nargout>0
		        h = pl.edges.cyl(i, j);
		    end
		end
		function cylinder_edge_on(pl, i, j)
		    % CYLINDER_EDGE_ON shows a edge link
		    %
		    % CYLINDER_EDGE_ON(BG, I, J) shows the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_off.
		
		    if ishandle(pl.edges.cyl(i, j))
		        set(pl.edges.cyl(i, j), 'Visible', 'on')
		    end
		end
		function cylinder_edge_off(pl, i, j)
		    % CYLINDER_EDGE_OFF hides a edge link
		    %
		    % CYLINDER_EDGE_OFF(BG, I, J) hides the edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if ishandle(pl.edges.cyl(i, j))
		        set(pl.edges.cyl(i, j), 'Visible', 'off')
		    end
		end
		function cylinder_edges(pl, i_vec, j_vec, varargin)
		    % CYLINDER_EDGES plots multiple edge links as lines
		    %
		    % CYLINDER_EDGES(BG, I_VEC, J_VEC) plots the edge links from the
		    % brain regions specified in I_VEC to the ones specified in
		    % J_VEC, if not plotted. I_VEC and J_VEC need not be the same
		    % size.
		    %
		    % CYLINDER_EDGES(BG, [], []) plots the edge links between all
		    % possible brain region combinations.
		    %
		    % CYLINDER_LINS(BG, I_VEC, J_VEC, PROPERTY, RULE) sets the property
		    % of the multiple edge links' PROPERTY to RULE.
		    % All standard plot properties of plot3 can be used.
		    % The line properties can also be changed when hidden.
		    %
		    % See also PlotBrainGraph, plot3, link_edge.
		
		    if nargin < 2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.cylinder_edge(i, j, varargin{:})
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.cylinder_edge(i_vec(m), j_vec(m), varargin{:})
		        end
		    end
		end
		function cylinder_edges_on(pl, i_vec, j_vec)
		    % CYLINDER_EDGES_ON shows multiple edge link
		    %
		    % CYLINDER_EDGES_ON(BG, I, J) shows multiple edge link from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edges, link_edges_off.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.cylinder_edge_on(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.cylinder_edge_on(i_vec(m), j_vec(m))
		        end
		    end
		end
		function cylinder_edges_off(pl, i_vec, j_vec)
		    % CYLINDER_EDGES_OFF hides multiple edge links
		    %
		    % CYLINDER_EDGES_OFF(BG, I, J) hides multiple edge links from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, link_edge, link_edge_on.
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        for i = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		            for j = 1:1:pl.get('ATLAS').get('BR_DICT').length()
		                pl.cylinder_edge_off(i, j)
		            end
		        end
		    else
		        if length(i_vec) == 1
		            i_vec = i_vec * ones(size(j_vec));
		        end
		        if length(j_vec) == 1
		            j_vec = j_vec * ones(size(i_vec));
		        end
		
		        for m = 1:1:length(i_vec)
		            pl.cylinder_edge_off(i_vec(m), j_vec(m))
		        end
		    end
		end
		function cylinder_edges_settings(pl, i_vec, j_vec, varargin)
		    % CYLINDER_EDGES_SETTINGS sets edges' properties
		    %
		    % CYLINDER_EDGES_SETTINGS(BG) allows the user to interractively
		    % change the edges settings via a graphical user interface.
		    %
		    % CYLINDER_LINS_SETTINGS(BG, PROPERTY, VALUE, ...) sets the property
		    % of the GUI's PROPERTY to VALUES.
		    %   Admissible properties are:
		    %       FigPosition  -   position of the GUI on the screen
		    %       FigColor     -   background color of the GUI
		    %       FigName      -   name of the GUI
		    %
		    % See also PlotBrainGraph.
		
		    atlas_length = pl.get('ATLAS').get('BR_DICT').length();
		    data = cell(atlas_length, atlas_length);
		
		    if nargin<2 || isempty(i_vec) || isempty(j_vec)
		        i_vec = 1:1:atlas_length;
		        j_vec = 1:1:atlas_length;
		    end
		    if length(i_vec) == 1
		        i_vec = i_vec * ones(size(j_vec));
		    end
		    if length(j_vec) == 1
		        j_vec = j_vec * ones(size(i_vec));
		    end
		    for p = 1:1:length(i_vec)
		        if i_vec(p) ~= j_vec(p)
		            data{i_vec(p), j_vec(p)} = true;
		        else
		            data{i_vec(p), j_vec(p)} = false;
		        end
		    end
		
		    set_color = pl.INIT_LIN_COLOR;
		
		    % sets position of figure
		    FigPosition = [.50 .30 .30 .30];
		    FigColor = pl.TABBKGCOLOR;
		    FigName = 'Brain Graph Arrows Settings';
		    for n = 1:2:length(varargin)
		        switch lower(varargin{n})
		            case 'figposition'
		                FigPosition = varargin{n + 1};
		            case 'figcolor'
		                FigColor = varargin{n + 1};
		            case 'figname'
		                FigName = varargin{n + 1};
		        end
		    end
		
		    % create a figure
		    if isempty(pl.f_cyls_settings) || ~ishandle(pl.f_cyls_settings)
		        pl.f_cyls_settings = figure('Visible', 'off');
		    end
		    f = pl.f_cyls_settings;
		    set(f, 'units', 'normalized')
		    set(f, 'Position', FigPosition)
		    set(f, 'Color', FigColor)
		    set(f, 'Name', FigName)
		    set(f, 'MenuBar', 'none')
		    set(f, 'Toolbar', 'none')
		    set(f, 'NumberTitle', 'off')
		    set(f, 'DockControls', 'off')
		
		    ui_table = uitable(f);
		    set(ui_table, 'Units', 'normalized')
		    set(ui_table, 'BackgroundColor', pl.TABBKGCOLOR)
		    set(ui_table, 'Position', [.03 .215 .54 .71])
		    set(ui_table, 'ColumnWidth', {40})
		    [string{1:atlas_length}] = deal('logical');
		    set(ui_table, 'ColumnFormat', string)
		    set(ui_table, 'ColumnEditable', true)
		    set(ui_table, 'Data', data)
		    set(ui_table, 'CellEditCallback', {@cb_table_edit});
		
		    ui_button_show = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_show, 'Position', [.60 .825 .18 .10])
		    set(ui_button_show, 'String', 'Show lines')
		    set(ui_button_show, 'TooltipString', 'Show selected cylinders')
		    set(ui_button_show, 'Callback', {@cb_show})
		
		    ui_button_hide = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_hide, 'Position', [.80 .825 .18 .10])
		    set(ui_button_hide, 'String', 'Hide lines')
		    set(ui_button_hide, 'TooltipString', 'Hide selected cylinders')
		    set(ui_button_hide, 'Callback', {@cb_hide})
		
		    ui_button_cylindercolor = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_cylindercolor, 'ForegroundColor', set_color)
		    set(ui_button_cylindercolor, 'Position', [.62 .075 .35 .10])
		    set(ui_button_cylindercolor, 'String', 'Link Color')
		    set(ui_button_cylindercolor, 'TooltipString', 'Select cylinder color')
		    set(ui_button_cylindercolor, 'Callback', {@cb_cylindercolor})
		
		    ui_button_clearselection = uicontrol(f, 'Style',  'pushbutton', 'Units', 'normalized');
		    set(ui_button_clearselection, 'Position', [.03 .075 .54 .10])
		    set(ui_button_clearselection, 'String', 'Clear Selection')
		    set(ui_button_clearselection, 'TooltipString', 'Clear selected links')
		    set(ui_button_clearselection, 'Callback', {@cb_clearselection})
		
		        function cb_table_edit(~, event)  % (src, event)
		            i = event.Indices(1);
		            j = event.Indices(2);
		
		            if i~=j
		                if data{i, j} == true
		                    data{i, j} = false;
		                else
		                    data{i, j} = true;
		                end
		                set(ui_table, 'Data', data)
		            end
		        end
		        function update_link_cyls()
		            stemwidth = real(str2double(get(ui_edit_stemwidth, 'String')));
		            headwidth = real(str2double(get(ui_edit_headwidth, 'String')));
		            headlength = real(str2double(get(ui_edit_headlength, 'String')));
		            headnode = real(str2double(get(ui_edit_headnode, 'String')));
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)} == 1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.cylinder_edges(i, j, 'StemWidth', stemwidth, ...
		                        'HeadWidth', headwidth, ...
		                        'HeadLength', headlength, ...
		                        'HeadNode', headnode, ...
		                        'Color', set_color);
		                end
		            end
		        end
		        function cb_cylindercolor(~, ~)  % (src, event)
		            set_color_prev = get(ui_button_cylindercolor, 'ForegroundColor');
		            set_color = uisetcolor();
		            if length(set_color) == 3
		                set(ui_button_cylindercolor, 'ForegroundColor', set_color)
		                update_link_cyls()
		            else
		                set_color = set_color_prev;
		            end
		        end
		        function cb_show(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)} == 1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    update_link_cyls()
		                    pl.cylinder_edges_on(i, j)
		                end
		            end
		        end
		        function cb_hide(~, ~)  % (src, event)
		            indices = find(~cellfun(@isempty, data));
		
		            for m = 1:1:length(indices)
		                if data{indices(m)}==1
		                    [i, j] = ind2sub(size(data), indices(m));
		                    pl.cylinder_edges_off(i, j)
		                end
		            end
		        end
		        function cb_clearselection(~, ~)  % (src, event)
		            [data{:}] = deal(zeros(1));
		            set(ui_table, 'Data', data)
		        end
		    set(f, 'Visible', 'on')
		end
		function bool = cylinder_edge_is_on(pl, i, j)
		    % CYLINDER_EDGE_IS_ON checks if cylinder link is visible
		    %
		    % BOOL = CYLINDER_EDGE_IS_ON(BG, I, J) returns true if the cylinder link
		    % from the brain regions I to J is visible and false otherwise.
		    %
		    % See also PlotBrainGraph.
		
		    bool = ishandle(pl.edges.cyl(i, j)) && strcmpi(get(pl.edges.cyl(i, j), 'Visible'), 'on');
		end
		
		function h = text_edge(pl, graph_axes, i, j , text_value, varargin)
		    % TEXT_EDGE plots the edge value as a text
		    %
		    % TEXT_EDGE(BG, I, J) plots the edge value as a text.
		    %
		    % H = TEXT_EDGE(BG, I, J) returns the handle to the edge value
		    % from the brain region I to J.
		    %
		    % See also link_edge, arrow_edge, cylinder_edge.
		
		    if i == j  % removes diagonal
		        return;
		    end
		
		    
		    br_1 = pl.get('ATLAS').get('BR_DICT').getItem(i);
		    br_2 = pl.get('ATLAS').get('BR_DICT').getItem(j);
		    % get coordinates
		    X1 = br_1.get('X');
		    Y1 = br_1.get('Y');
		    Z1 = br_1.get('Z');
		
		    X2 = br_2.get('X');
		    Y2 = br_2.get('Y');
		    Z2 = br_2.get('Z');
		
		    % equidistant point
		    X3 = (X1 + X2) / 2;
		    Y3 = (Y1 + Y2) / 2;
		    Z3 = (Z1 + Z2) / 2;
		    pl.edges.texts(i, j) =  text(graph_axes, X3, Y3, Z3, text_value);
		
		    if nargout > 0
		        h = pl.edges.texts(i, j);
		    end
		end
		function text_edge_on(pl, i, j)
		    % TEXT_EDGE_ON shows a edge text
		    %
		    % TEXT_EDGE_ON(BG, I, J) shows the edge text from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, text_edge, text_edge_off.
		
		    if ishandle(pl.edges.texts(i, j))
		        set(pl.edges.texts(i, j), 'Visible', 'on')
		    end
		end
		function text_edge_off(pl, i, j)
		    % TEXT_EDGE_OFF hides a edge text
		    %
		    % TEXT_EDGE_OFF(BG, I, J) hides the edge text from the brain
		    % region I to J.
		    %
		    % See also PlotBrainGraph, text_edge, text_edge_on.
		
		    if ishandle(pl.edges.texts(i, j))
		        set(pl.edges.texts(i, j), 'Visible', 'off')
		    end
		end
		function bool = text_edge_is_on(pl, i, j)
		    % TEXT_EDGE_IS_ON checks if the edge text is visible
		    %
		    % BOOL = TEXT_EDGE_IS_ON(BG, I, J) returns true if the edge text
		    % from the brain regions I to J is visible and false otherwise.
		    %
		    % See also PlotBrainGraph, text_edge, tex_edge_is_off.
		
		    bool = ishandle(pl.edges.texts(i, j)) && strcmpi(get(pl.edges.texts(i, j), 'Visible'), 'on');
		end
		function bool = tex_edge_is_off(pl, i, j)
		    % TEXT_EDGE_IS_Off checks if the edge text is not visible
		    %
		    % BOOL = TEXT_EDGE_IS_Off(BG, I, J) returns true if the edge text
		    % from the brain regions I to J is not visible and false otherwise.
		    %
		    % See also PlotBrainGraph, text_edge, tex_edge_is_off.
		
		    bool = ishandle(pl.edges.texts(i, j)) && strcmpi(get(pl.edges.texts(i, j), 'Visible'), 'off');
		end
		
		function h = get_axes(pl)
		    % GET_AXES returns the panel axes
		    %
		    % H = GET_AXES(PL) returns the panel axes
		    %
		    % See also PlotBrainGraph.
		    
		    h = pl.h_axes;
		end
		
		function brain_graph_panel = getBrainGraphPanel(pl, ui_panel_graph)
		    % GETBRAINGRAPHPANEL creates a braingraph panel
		    %
		    % BRAIN_GRAPH_PANEL = GETBRAINGRAPHPANEL(ANAlYSIS, AXES, PLOTBRAINGRAPH)
		    % creates a brain graph panel to manage the type of
		    % PLOTBRAINGRAPH that the GUIAnalysis plots in the AXES.
		    %
		    % See also getBrainView.
		
		    % variables
		    atlas = pl.get('ATLAS');
		    br_axes = pl.h_axes; %#ok<NASGU>
		    BKGCOLOR = [1 .9725 .929];
		    pl.f_graph_settings = ui_panel_graph;
		    fig_graph = pl.f_graph_settings;
		    color = [1 1 1];
		    
		    ui_title = uicontrol(fig_graph, ...
		        'Style', 'text', ...
		        'String', 'Graph Panel', ...
		        'Units', 'normalized', ...
		        'BackgroundColor', BKGCOLOR, ...
		        'HorizontalAlignment', 'left', ...
		        'FontWeight', 'bold', ...
		        'Position', [0.01 .91 0.3 0.08]);
		
		    ui_checkbox_graph_lineweight = uicontrol(fig_graph, 'Style',  'checkbox', 'BackgroundColor', BKGCOLOR);
		    ui_edit_graph_lineweight = uicontrol(fig_graph, 'Style', 'edit');
		    ui_button_graph_show = uicontrol(fig_graph, 'Style', 'pushbutton');
		    ui_button_graph_hide = uicontrol(fig_graph, 'Style', 'pushbutton');
		    ui_button_graph_color = uicontrol(fig_graph, 'Style', 'pushbutton');
		    ui_button_graph_edge_settings = uicontrol(fig_graph, 'Style', 'pushbutton');
		    ui_link_type = uicontrol(fig_graph, 'Style', 'popup', 'String', {'line', 'arrow', 'cylinder'});
		
		    init_graph()
		
		    %% Make the GUI visible.
		    set(fig_graph, 'Visible', 'on');
		
		        function init_graph()
		            
		            set(ui_checkbox_graph_lineweight, 'Units', 'normalized')
		            set(ui_checkbox_graph_lineweight, 'BackgroundColor',BKGCOLOR)
		            set(ui_checkbox_graph_lineweight, 'Position', [.10 .61 .28 .10])
		            set(ui_checkbox_graph_lineweight, 'String', ' Thickness ')
		            set(ui_checkbox_graph_lineweight, 'Value', true)
		            set(ui_checkbox_graph_lineweight, 'FontWeight', 'bold')
		            set(ui_checkbox_graph_lineweight, 'TooltipString', 'Shows brain regions by label')
		            set(ui_checkbox_graph_lineweight, 'Callback', {@cb_checkbox_lineweight})
		
		            set(ui_edit_graph_lineweight, 'Units', 'normalized')
		            set(ui_edit_graph_lineweight, 'Position', [.3 .62 .3 .08])
		            set(ui_edit_graph_lineweight, 'String', '1');
		            set(ui_edit_graph_lineweight, 'TooltipString', 'Set line weight.');
		            set(ui_edit_graph_lineweight, 'FontWeight', 'bold')
		            set(ui_edit_graph_lineweight, 'Callback', {@cb_edit_lineweight});
		            
		            set(ui_link_type, 'Units', 'normalized')
		            set(ui_link_type, 'Position', [.62 .62 .3 .08])
		            set(ui_link_type, 'Callback', {@cb_link_type});
		            
		            set(ui_button_graph_show, 'Units', 'normalized')
		            set(ui_button_graph_show, 'Position', [.1 .45 .4 .08])
		            set(ui_button_graph_show, 'String', ' Show ')
		            set(ui_button_graph_show, 'HorizontalAlignment', 'center')
		            set(ui_button_graph_show, 'FontWeight', 'bold')
		            set(ui_button_graph_show, 'FontSize', 10)
		            set(ui_button_graph_show, 'Callback', {@cb_graph_show})
		
		            set(ui_button_graph_hide, 'Units', 'normalized')
		            set(ui_button_graph_hide, 'Position', [.1 .3 .4 .08])
		            set(ui_button_graph_hide, 'String', ' Hide ')
		            set(ui_button_graph_hide, 'HorizontalAlignment', 'center')
		            set(ui_button_graph_hide, 'FontWeight', 'bold')
		            set(ui_button_graph_hide, 'FontSize', 10)
		            set(ui_button_graph_hide, 'Callback', {@cb_graph_hide})
		
		            set(ui_button_graph_color, 'Units', 'normalized')
		            set(ui_button_graph_color, 'Position', [.52 .45 .4 .08])
		            set(ui_button_graph_color, 'String', ' Color ')
		            set(ui_button_graph_color, 'HorizontalAlignment', 'center')
		            set(ui_button_graph_color, 'FontWeight', 'bold')
		            set(ui_button_graph_color, 'FontSize', 10)
		            set(ui_button_graph_color, 'Callback', {@cb_graph_color})
		
		            set(ui_button_graph_edge_settings, 'Units', 'normalized')
		            set(ui_button_graph_edge_settings, 'Position', [.52 .3 .4 .08])
		            set(ui_button_graph_edge_settings, 'String', 'Edge Settings')
		            set(ui_button_graph_edge_settings, 'HorizontalAlignment', 'center')
		            set(ui_button_graph_edge_settings, 'FontWeight', 'bold')
		            set(ui_button_graph_edge_settings, 'FontSize', 10)
		            set(ui_button_graph_edge_settings, 'Callback', {@cb_graph_links_settings})
		
		           
		        end        
		        function cb_checkbox_lineweight(~, ~)  % (src, event)
		            if get(ui_checkbox_graph_lineweight, 'Value')
		                set(ui_edit_graph_lineweight, 'Enable', 'on')
		                update_graph()
		            else
		                set(ui_edit_graph_lineweight, 'Enable', 'off')
		
		                weight = str2double(get(ui_edit_graph_lineweight, 'String'));
		                n = atlas.get('BR_DICT').length();
		                for i = 1:1:n
		                    for j = 1:1:n
		                        if i == j
		                            continue;
		                        end
		                        pl.link_edges(i, j, 'LineWidth', weight)
		                    end
		                end
		            end
		        end
		        function cb_edit_lineweight(~, ~)  % (src, event)
		            weigth = real(str2double(get(ui_edit_graph_lineweight, 'String')));
		            if isnan(weigth) || weigth <= 0
		                set(ui_edit_graph_lineweight, 'String', '5');
		            end
		            update_graph()
		        end
		        function cb_graph_show(~, ~)  % (src, event)
		            set(ui_edit_graph_lineweight, 'Enable', 'on')
		
		            update_graph()
		        end
		        function cb_graph_hide(~, ~)  % (src, event)
		            link_style = get(ui_link_type, 'Value');
		            if  link_style == 1
		                pl.link_edges_off([], [])
		            elseif link_style == 2
		                pl.arrow_edges_off([],[])
		            else
		                pl.cylinder_edges_off([],[])
		            end
		        end
		        function cb_graph_color(~, ~)  % (src, event)
		            color = uisetcolor();
		
		            if length(color)==3
		                n = atlas.get('BR_DICT').length();
		                for i = 1:1:n
		                    for j = 1:1:n
		                        if i == j
		                            continue;
		                        end
		                        pl.link_edge(i, j, 'Color', color)
		                    end
		                end
		            end
		        end
		        function cb_link_type(~, ~)
		            update_graph()
		        end
		        function update_graph()
		            link_style = get(ui_link_type, 'Value');
		
		            pl.link_edges_off([], [])
		            pl.arrow_edges_off([],[])
		            pl.cylinder_edges_off([],[])
		
		            if get(ui_checkbox_graph_lineweight, 'Value')
		                % get measure value
		                n = atlas.get('BR_DICT').length();
		                weight = str2double(get(ui_edit_graph_lineweight, 'String'));
		                for i = 1:1:n
		                    for j = 1:1:n
		                        if i == j
		                            continue;
		                        end
		                        if  link_style == 1
		                            pl.link_edges(i, j, 'LineWidth', weight);
		                            pl.link_edge_on(i, j);
		                        elseif link_style == 2
		                            pl.arrow_edges(i, j, 'LineWidth', weight);
		                            pl.arrow_edge_on(i, j)
		                        else
		                            pl.cylinder_edges(i, j, 'LineWidth', weight);
		                            pl.cylinder_edge_on(i, j)
		                        end
		                    end
		                end
		            end
		
		        end
		        function cb_graph_links_settings(~, ~)  % (src, event)
		            link_style = get(ui_link_type, 'Value');
		            if link_style == 1
		                pl.link_edges_settings([], []);
		            elseif link_style == 2
		                pl.arrow_edges_settings([], []);
		            else
		                pl.cylinder_edges_settings([], []);
		            end
		        end
		
		    if nargout > 0
		        brain_graph_panel = fig_graph;
		    end
		end
		function h = getMCRPanel(pl, ui_panel_mcr)
		    % sets position of figure
		
		    % variables
		    atlas = pl.get('ATLAS');
		    br_axes = pl.h_axes; %#ok<NASGU>
		    FigColor = [.95 .94 .94];
		    pl.f_measures_settings = ui_panel_mcr;
		    f = pl.f_measures_settings;
		    BKGCOLOR = [1 .9725 .929];
		
		    measure_data = pl.get('ME').get('M');
		    %layer dim
		    layer_element_item = pl.get('me').get('a').get('g_dict').getItem(1);
		    layer_element = layer_element_item.get('b');
		    layer_check = 0;
		    d_t_check = 0;
		    layer_dim = 1;
		    if size(measure_data, 1) > 1 % density or threshold
		        d_t_check = 1;
		        d_or_t = pl.get('type');
		    end
		    if iscell(layer_element) && size(layer_element, 2) > 1 % mp
		        layer_check = 1;
		        layer_dim =  size(layer_element, 2);
		    end
		    
		
		    % initialization %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		    % measure container panel
		    ui_measure_container_panel = uipanel(f, 'Units', 'normalized', 'BackgroundColor', BKGCOLOR);
		
		    ui_title = uicontrol(f, ...
		        'Style', 'text', ...
		        'String', 'Measure Panel', ...
		        'Units', 'normalized', ...
		        'BackgroundColor', BKGCOLOR, ...
		        'HorizontalAlignment', 'left', ...
		        'FontWeight', 'bold', ...
		        'Position', [0.01 .91 0.3 0.08]);
		
		    % nodal measure figure options
		    if d_t_check
		        d_t_text = uicontrol(ui_measure_container_panel, 'Style', 'text', 'BackgroundColor', BKGCOLOR);
		        d_t_selector = uicontrol(ui_measure_container_panel, 'Style', 'popup', 'String', {''});
		    end
		    if layer_check
		        ui_layer_text = uicontrol(ui_measure_container_panel, 'Style', 'text', 'BackgroundColor', BKGCOLOR);
		        ui_layer_selector = uicontrol(ui_measure_container_panel, 'Style', 'popup', 'String', {''});
		    end
		    ui_checkbox_meas_symbolsize = uicontrol(ui_measure_container_panel, 'Style',  'checkbox', 'BackgroundColor', BKGCOLOR);
		    ui_edit_meas_symbolsize = uicontrol(ui_measure_container_panel, 'Style', 'edit');
		    ui_checkbox_meas_sphereradius = uicontrol(ui_measure_container_panel, 'Style',  'checkbox', 'BackgroundColor', BKGCOLOR);
		    ui_edit_meas_sphereradius = uicontrol(ui_measure_container_panel, 'Style', 'edit');
		    ui_checkbox_meas_spheretransparency = uicontrol(ui_measure_container_panel, 'Style',  'checkbox', 'BackgroundColor', BKGCOLOR);
		    ui_slider_meas_spheretransparency = uicontrol(ui_measure_container_panel, 'Style', 'slider');
		    ui_checkbox_meas_labelsize = uicontrol(ui_measure_container_panel, 'Style',  'checkbox', 'BackgroundColor', BKGCOLOR);
		    ui_edit_meas_labelsize = uicontrol(ui_measure_container_panel, 'Style', 'edit');
		
		    %% Callback functions
		        function init_measures_panel()
		
		            % measure figure *******************************
		            set(ui_measure_container_panel, 'Position', [.0 .01 1 .99])
		
		            if d_t_check
		                set(d_t_text, ...
		                    'Units', 'normalized', ...
		                    'Position', [.26 .91 .15 .08], ...
		                    'FontWeight', 'bold', ...
		                    'TooltipString', 'Select the layer of the Measure to be ploted.', ...
		                    'String', d_or_t ...
		                    )
		
		                set(d_t_selector, ...
		                    'Units', 'normalized', ...
		                    'Position', [.41 .91 .2 .08], ...
		                    'String', cellfun(@(x) num2str(x),  num2cell([1:size(measure_data, 1)/layer_dim]) , 'UniformOutput', false), ...
		                    'Callback', {@cb_d_t_selector} ...
		                    )
		            end
		            if layer_check
		                set(ui_layer_text, ...
		                    'Units', 'normalized', ...
		                    'Position', [.61 .91 .15 .08], ...
		                    'FontWeight', 'bold', ...
		                    'TooltipString', 'Select the layer of the Measure to be ploted.', ...
		                    'String', 'Layer' ...
		                    )
		
		                set(ui_layer_selector, ...
		                    'Units', 'normalized', ...
		                    'Position', [.76 .91 .2 .08], ...
		                    'String', cellfun(@(x) num2str(x),  num2cell([1:layer_dim]) , 'UniformOutput', false), ...
		                    'Callback', {@cb_layer_selector} ...
		                    )
		            end
		
		            set(ui_checkbox_meas_symbolsize, 'Units', 'normalized')
		            set(ui_checkbox_meas_symbolsize, 'Position', [.01 .7 .30 .08])
		            set(ui_checkbox_meas_symbolsize, 'String', ' Symbol Size ')
		            set(ui_checkbox_meas_symbolsize, 'Value', false)
		            set(ui_checkbox_meas_symbolsize, 'FontWeight', 'bold')
		            set(ui_checkbox_meas_symbolsize, 'TooltipString', 'Shows brain regions by points')
		            set(ui_checkbox_meas_symbolsize, 'Callback', {@cb_checkbox_meas_symbolsize})
		
		            set(ui_edit_meas_symbolsize, 'Units', 'normalized')
		            set(ui_edit_meas_symbolsize, 'String', PlotBrainGraph.INIT_SYM_SIZE)
		            set(ui_edit_meas_symbolsize, 'Enable', 'off')
		            set(ui_edit_meas_symbolsize, 'Position', [.31 .7 .6 .08])
		            set(ui_edit_meas_symbolsize, 'HorizontalAlignment', 'center')
		            set(ui_edit_meas_symbolsize, 'FontWeight', 'bold')
		            set(ui_edit_meas_symbolsize, 'Callback', {@cb_edit_meas_symbolsize})
		
		            set(ui_checkbox_meas_sphereradius, 'Units', 'normalized')
		            set(ui_checkbox_meas_sphereradius, 'Position', [.01 0.54 .3 .08])
		            set(ui_checkbox_meas_sphereradius, 'String', ' Sphere Radius ')
		            set(ui_checkbox_meas_sphereradius, 'Value', false)
		            set(ui_checkbox_meas_sphereradius, 'FontWeight', 'bold')
		            set(ui_checkbox_meas_sphereradius, 'TooltipString', 'Shows brain regions by spheres')
		            set(ui_checkbox_meas_sphereradius, 'Callback', {@cb_checkbox_meas_sphereradius})
		
		            set(ui_edit_meas_sphereradius, 'Units', 'normalized')
		            set(ui_edit_meas_sphereradius, 'String', PlotBrainGraph.INIT_SPH_R)
		            set(ui_edit_meas_sphereradius, 'Enable', 'off')
		            set(ui_edit_meas_sphereradius, 'Position', [.31 0.54 .6 .08])
		            set(ui_edit_meas_sphereradius, 'HorizontalAlignment', 'center')
		            set(ui_edit_meas_sphereradius, 'FontWeight', 'bold')
		            set(ui_edit_meas_sphereradius, 'Callback', {@cb_edit_meas_sphereradius})
		
		            set(ui_checkbox_meas_spheretransparency, 'Units', 'normalized')
		            set(ui_checkbox_meas_spheretransparency, 'Position', [.01 0.4 .3 .08])
		            set(ui_checkbox_meas_spheretransparency, 'String', ' Sphere Transparency ')
		            set(ui_checkbox_meas_spheretransparency, 'Value', false)
		            set(ui_checkbox_meas_spheretransparency, 'FontWeight', 'bold')
		            set(ui_checkbox_meas_spheretransparency, 'TooltipString', 'Adjust the transparency of spheres')
		            set(ui_checkbox_meas_spheretransparency, 'Callback', {@cb_checkbox_meas_spheretransparency})
		
		            set(ui_slider_meas_spheretransparency, 'Units', 'normalized')
		            set(ui_slider_meas_spheretransparency, 'Min', 0, 'Max', 1, 'Value', PlotBrainGraph.INIT_SPH_FACE_ALPHA);
		            set(ui_slider_meas_spheretransparency, 'Enable', 'off')
		            set(ui_slider_meas_spheretransparency, 'Position', [.31 0.4 .6 .08])
		            set(ui_slider_meas_spheretransparency, 'TooltipString', 'Brain region transparency (applied both to faces and edges)')
		            set(ui_slider_meas_spheretransparency, 'Callback', {@cb_slider_meas_spheretransparency})
		
		            set(ui_checkbox_meas_labelsize, 'Units', 'normalized')
		            set(ui_checkbox_meas_labelsize, 'Position', [.01 .26 .3 .08])
		            set(ui_checkbox_meas_labelsize, 'String', ' Value Size ')
		            set(ui_checkbox_meas_labelsize, 'Value', false)
		            set(ui_checkbox_meas_labelsize, 'FontWeight', 'bold')
		            set(ui_checkbox_meas_labelsize, 'TooltipString', 'Shows brain regions by label')
		            set(ui_checkbox_meas_labelsize, 'Callback', {@cb_checkbox_meas_labelsize})
		
		            set(ui_edit_meas_labelsize, 'Units', 'normalized')
		            set(ui_edit_meas_labelsize, 'String', PlotBrainGraph.INIT_LAB_FONT_SIZE)
		            set(ui_edit_meas_labelsize, 'Enable', 'off')
		            set(ui_edit_meas_labelsize, 'Position', [.31 .26 .6 .08])
		            set(ui_edit_meas_labelsize, 'HorizontalAlignment', 'center')
		            set(ui_edit_meas_labelsize, 'FontWeight', 'bold')
		            set(ui_edit_meas_labelsize, 'Callback', {@cb_edit_meas_labelsize})  
		
		        end
		        function cb_layer_selector(~, ~)
		            update_brain_meas_plot()
		        end
		        function cb_d_t_selector(~, ~)
		            update_brain_meas_plot()
		        end
		        function cb_checkbox_meas_symbolsize(~, ~)  %  (src, event)
		            if get(ui_checkbox_meas_symbolsize, 'Value')
		                set(ui_edit_meas_symbolsize, 'Enable', 'on')
		                update_brain_meas_plot()
		            else
		                size = str2double(get(ui_edit_meas_symbolsize, 'String'));
		                pl.set('SYMS_SIZE', size);
		                pl.set('SYMS', 0);
		                set(ui_edit_meas_symbolsize, 'Enable', 'off')
		                update_brain_meas_plot()
		            end
		        end
		        function cb_edit_meas_symbolsize(~, ~)  %  (src, event)
		            size = real(str2double(get(ui_edit_meas_symbolsize, 'String')));
		            if isempty(size) || size<=0
		                set(ui_edit_meas_symbolsize, 'String', '1')                
		            end
		            update_brain_meas_plot()
		        end
		        function cb_checkbox_meas_sphereradius(~, ~)  %  (src, event)
		            if get(ui_checkbox_meas_sphereradius, 'Value')
		                set(ui_edit_meas_sphereradius, 'Enable', 'on')
		                update_brain_meas_plot()
		            else
		                R = str2double(get(ui_edit_meas_sphereradius, 'String'));
		                pl.set('SPHS_SIZE', R);
		                pl.set('SPHS', 0);
		                set(ui_edit_meas_sphereradius, 'Enable', 'off')
		                update_brain_meas_plot()
		            end
		        end
		        function cb_edit_meas_sphereradius(~, ~)  %  (src, event)
		            R = real(str2double(get(ui_edit_meas_sphereradius, 'String')));
		            if isempty(R) || R<=0
		                set(ui_edit_meas_sphereradius, 'String', '1')                
		            end
		            update_brain_meas_plot()
		        end
		        function cb_checkbox_meas_spheretransparency(~, ~)  %  (src, event)
		            if get(ui_checkbox_meas_spheretransparency, 'Value')
		                set(ui_slider_meas_spheretransparency, 'Enable', 'on')
		
		                update_brain_meas_plot()
		            else
		                alpha = get(ui_slider_meas_spheretransparency, 'Value');
		                pl.set('SPHS_FACE_ALPHA', alpha);
		                pl.set('SPHS_EDGE_ALPHA', alpha);
		
		                set(ui_slider_meas_spheretransparency, 'Enable', 'off')
		                update_brain_meas_plot()
		            end
		        end
		        function cb_slider_meas_spheretransparency(~, ~)  %  (src, event)
		            update_brain_meas_plot();
		        end
		        function cb_checkbox_meas_labelsize(~, ~)  %  (src, event)
		            if get(ui_checkbox_meas_labelsize, 'Value')
		                set(ui_edit_meas_labelsize, 'Enable', 'on')
		                update_brain_meas_plot()
		            else
		                size = str2double(get(ui_edit_meas_labelsize, 'String'));
		                pl.set('LABS_SIZE', size);
		                pl.set('LABS', 0);
		                set(ui_edit_meas_labelsize, 'Enable', 'off')
		                update_brain_meas_plot()
		            end
		        end
		        function cb_edit_meas_labelsize(~, ~)  %  (src, event)
		            size = real(str2double(get(ui_edit_meas_labelsize, 'String')));
		            if isempty(size) || size<=0
		                set(ui_edit_meas_labelsize, 'String', '1')
		                size = 5;
		            end
		            update_brain_meas_plot()
		        end
		        function update_brain_meas_plot()
		            if ~isempty(measure_data)
		                if  Measure.is_nodal(pl.get('ME').get('MEASURE'))
		                    if d_t_check && ~layer_check %  d/t but not mp
		                        measure_data_inner = measure_data{get(d_t_selector, 'Value')};
		                    elseif layer_check && ~d_t_check % mp but no d/t
		                        if Measure.is_superglobal(pl.get('ME').get('Measure'))
		                            measure_data_inner = measure_data{1};
		                        else
		                            measure_data_inner = measure_data{get(ui_layer_selector, 'Value')};
		                        end
		                    elseif layer_check && d_t_check % mp and d/t
		                        if Measure.is_superglobal(pl.get('ME').get('Measure'))
		                            measure_data_inner = measure_data{get(ui_layer_selector, 'Value')};
		                        else
		                            tmp_diff = layer_dim-get(ui_layer_selector, 'Value');
		                            measure_data_inner = measure_data{get(d_t_selector, 'Value')*layer_dim-tmp_diff};
		                        end
		                    else
		                        measure_data_inner = measure_data{1};
		                    end
		                else
		                    measure_warn_f = warndlg('BRAPH 2 only visualize nodal measures.');
		                    set_braph2icon(measure_warn_f);                    
		                end
		                
		                if any(isnan(measure_data_inner)) || any(isinf(measure_data_inner))
		                    nan_warn_f = warndlg('A value is not a finite real number.');
		                    set_braph2icon(nan_warn_f);
		                    return
		                end
		
		                if get(ui_checkbox_meas_symbolsize, 'Value')
		
		                    size_ = str2double(get(ui_edit_meas_symbolsize, 'String'));
		                    size_(isnan(size_)) = 0.1;
		                    size_(size_ <= 0) = 0.1;
		                    pl.set('SYMS_SIZE', size_');
		                    pl.set('SYMS', 1);
		                else
		                    pl.set('SYMS', 0);
		                end
		
		
		                if get(ui_checkbox_meas_sphereradius, 'Value')
		
		                    R = str2double(get(ui_edit_meas_sphereradius, 'String'));
		                    R = measure_data_inner * R;
		                    R(isnan(R)) = 0.1;
		                    R(R <= 0) = 0.1;
		                    pl.set('SPHS_SIZE', R);
		                    pl.set('SPHS', 1);
		                else
		                    pl.set('SPHS', 0);
		                end
		
		                if get(ui_checkbox_meas_spheretransparency, 'Value')
		
		                    alpha = get(ui_slider_meas_spheretransparency, 'Value');
		
		                    alpha_vec = (measure_data_inner)*alpha;
		                    alpha_vec(isnan(alpha_vec)) = 0;
		                    alpha_vec(alpha_vec < 0) = 0;
		                    alpha_vec(alpha_vec > 1) = 1;
		                    pl.set('SPHS_EDGE_ALPHA', alpha_vec);
		                    pl.set('SPHS_FACE_ALPHA', alpha_vec);
		                    pl.set('SPHS', 1);
		                end
		
		                if get(ui_checkbox_meas_labelsize, 'Value')
		
		                    size_ = str2double(get(ui_edit_meas_labelsize, 'String'));
		                    size_(isnan(size_)) = 0.1;
		                    size_(size_ <= 0) = 0.1;
		                    pl.set( 'LABS_SIZE', size_);
		                    pl.set('LABS', 1);
		                else
		                    pl.set('LABS', 0);
		                end
		
		            end
		            if get(ui_checkbox_meas_labelsize, 'Value')
		                % set labels to values
		                new_labs = cellfun(@(x) num2str(x), num2cell(measure_data_inner), 'UniformOutput', false);
		                brs_dict = pl.get('ATLAS').get('BR_DICT').get('IT_LIST');
		                cellfun(@(x, y) x.set('LABEL', y), brs_dict, new_labs', 'UniformOutput', false)
		            end
		            % draw
		            pl.draw();
		        end
		
		    % draw
		    init_measures_panel()
		    update_brain_meas_plot()
		    set(f, 'Visible', 'on')
		    if nargout > 0
		        h = f;
		    end
		end
	end
end
