%% ¡header!
MeasurePF_NB < MeasurePF (pf, panel figure nodal bilayer measure) is the base element to plot a nodal bilayer measure.

%%% ¡description!
MeasurePF_NB manages the basic functionalities to plot of a nodal bilayer measure.

%%% ¡seealso!
Measure

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_AREA
%%%% ¡title!
FILLED AREA

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_LINE
%%%% ¡title!
MEASURE LINE

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.ST_YLABEL
%%%% ¡title!
Y-LABEL

%%% ¡prop!
%%%% ¡id!
MeasurePF_NB.NODE
%%%% ¡title!
NODE SELECTION

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal bilayer measure.
%%%% ¡default!
'MeasurePF_NB'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal bilayer measure.
%%%% ¡default!
'MeasurePF_NB manages the basic functionalities to plot of a nodal bilayer measure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal bilayer measure.
%%%% ¡settings!
'MeasurePF_NB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal bilayer measure.
%%%% ¡default!
'MeasurePF_NB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal bilayer measure.
%%%% ¡default!
'MeasurePF_NB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal bilayer measure.
%%%% ¡default!
'MeasurePF_NB notes'

%%% ¡prop!
SETUP (query, empty) calculates the measure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODE (figure, scalar) is the node number of the nodal measure.
%%%% ¡_gui!
% % % bas = pf.get('M').get('G').get('BAS');
% % % ba = bas{1};
% % % 
% % % pr = PP_BrainRegion('EL', pf, 'PROP', PFMeasureNU.BR1_ID, ...
% % %     'BA', ba, ...
% % %     varargin{:});

%% ¡tests!

%%% ¡excluded_props!
[MeasurePF_NB.PARENT MeasurePF_NB.H MeasurePF_NB.ST_POSITION MeasurePF_NB.ST_AXIS MeasurePF_NB.ST_AREA MeasurePF_NB.ST_LINE MeasurePF_NB.ST_TITLE MeasurePF_NB.ST_XLABEL MeasurePF_NB.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasurePF_NB'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasurePF_NB'])
