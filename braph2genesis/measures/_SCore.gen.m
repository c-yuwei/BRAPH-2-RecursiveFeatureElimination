%% ¡header!
SCore < Measure (m, score) is the score.

%%% ¡description!
The s-core of a graph is the largest subnetwork comprising nodes of strength 
  s or higher. s is set by the user; the default value is equal to 1.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the score.
%%%% ¡default!
'SCore'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the score.
%%%% ¡default!
'The s-core of a graph is the largest subnetwork comprising nodes of strength s or higher. s is set by the user; the default value is equal to 1.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the score.
%%%% ¡settings!
'SCore'

%%% ¡prop!
ID (data, string) is a few-letter code of the score.
%%%% ¡default!
'SCore ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the score.
%%%% ¡default!
'SCore label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the score.
%%%% ¡default!
'SCore notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.BINODAL__.
%%%% ¡default!
Measure.BINODAL

%%% ¡prop!
SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.
%%%% ¡default!
Measure.UNILAYER

%%% ¡prop!
PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.
%%%% ¡default!
Measure.NONPARAMETRIC

%%% ¡prop!
COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
%%%% ¡default!
{'GraphWD' 'GraphWU' 'MultiplexWD' 'MultiplexWU'};

%%% ¡prop!
M (result, cell) is the score.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');

score_threshold = m.get('SCORETHRESHOLD');
assert(isnumeric(score_threshold) == 1, ...
    [BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT], ...
    ['SCore threshold must be a positive number ' ...
    'while it is ' tostring(score_threshold)])

s_core = cell(L, 1);
directionality_type = g.get('DIRECTIONALITY_TYPE', L);
parfor li = 1:1:L    
    
    Aii = A{li, li};
    directionality_layer = directionality_type(li, li);

    iter = 0;
    subAii = Aii;
    while 1
        % get strengths of matrix
        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
            st = sum(subAii, 1)';  % degree undirected graphs
        else
            st = (sum(subAii, 1)' + sum(subAii, 2));  % strength directed
        end
        
        % find nodes with degree < k
        low_s_nodes = find((st < score_threshold) & (st > 0));
        
        % if none found -> stop
        if (isempty(low_s_nodes)) break; end; %#ok<SEPEX>
        
        % peel away found nodes
        iter = iter + 1;
        subAii(low_s_nodes, :) = 0;
        subAii(:, low_s_nodes) = 0;
    end
    s_core(li) = {subAii};  % add s-core of layer li
end
value = s_core;

%% ¡props!

%%% ¡prop! 
SCORETHRESHOLD (parameter, scalar) is the strength threshold.
%%%% ¡default!
1

%% ¡tests!

%%% ¡excluded_props!
[SCore.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
A = [
    0   .5  1  0;
    .5  0   1  .8;
    1   1   0  0;
    0   .8  0  0
    ];

known_score = {[
    0   .5  1  0;
    .5  0   1  0;
    1   1   0  0;
    0   0   0  0
    ]};

g = GraphWU('B', A);

m_outside_g = SCore('G', g, 'SCORETHRESHOLD', 1.5);
assert(isequal(m_outside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SCore');
m_inside_g.set('SCORETHRESHOLD', 1.5);
assert(isequal(m_inside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡probability!
.01
%%%% ¡code!
A = [
    0   1   1  .1; 
    .2  0   1  1; 
    1   1   0  0;
    0   .3  0  0
    ];
known_score = {[
    0   1  1  0;
    .2  0  1  0;
    1   1  0  0;
    0   0  0  0
    ]};

g = GraphWD('B', A);

m_outside_g = SCore('G', g, 'SCORETHRESHOLD', 3);
assert(isequal(m_outside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SCore');
m_inside_g.set('SCORETHRESHOLD', 3);
assert(isequal(m_inside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
    0   .5  1  0; 
    .5  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];

A22 = [
    0   .5  1  0; 
    .5  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];
A = {A11 A22};

known_score(1) = {[
    0   .5  1  0;
    .5  0   1  0;
    1   1   0  0;
    0   0   0  0
    ]};
known_score(2, 1) = {[
    0   .5  1  0;
    .5  0   1  0;
    1   1   0  0;
    0   0   0  0
    ]};

g = MultiplexWU('B', A);

m_outside_g = SCore('G', g, 'SCORETHRESHOLD', 1.5);
assert(isequal(m_outside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SCore');
m_inside_g.set('SCORETHRESHOLD', 1.5);
assert(isequal(m_inside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
    0   .5  1  0;
    .5  0   1  .8;
    1   1   0  0;
    0   .8  0  0
    ];

A22 = [
    0   .5  1  0;
    .5  0   1  .8;
    1   1   0  0;
    0   .8  0  0
    ];
A = {A11 A22};

known_score(1) = {[
    0   .5  1  0;
    .5  0   1  0.8;
    1   1   0  0;
    0   0.8   0  0
    ]};
known_score(2, 1) = {[
    0   .5  1  0;
    .5  0   1  0.8;
    1   1   0  0;
    0   0.8   0  0
    ]};

g = MultiplexWD('B', A);
m_outside_g = SCore('G', g, 'SCORETHRESHOLD', 1.5);
assert(isequal(m_outside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SCore');
m_inside_g.set('SCORETHRESHOLD', 1.5);
assert(isequal(m_inside_g.get('M'), known_score), ...
    [BRAPH2.STR ':SCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])