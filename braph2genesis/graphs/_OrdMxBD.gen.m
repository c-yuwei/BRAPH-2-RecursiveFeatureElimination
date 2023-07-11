%% ¡header!
OrdMxBD < Graph (g, ordinal multiplex binary directed graph) is a ordinal multiplex binary directed graph.

%%% ¡description!
In an ordinal multiplex binary directed (BD) graph, all layers have the same number 
 of nodes with within-layer directed edges either 0 (absence of connection) 
 or 1 (existence of connection).
There are connections between layers connecting the corresponding nodes.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OrdMxBD.ID
%%%% ¡title!
Graph ID

%%% ¡prop!
%%%% ¡id!
OrdMxBD.LABEL
%%%% ¡title!
Graph NAME

%%% ¡prop!
%%%% ¡id!
OrdMxBD.LAYERTICKS
%%%% ¡title!
LAYERS ticks

%%% ¡prop!
%%%% ¡id!
OrdMxBD.LAYERLABELS
%%%% ¡title!
LAYERS labels

%%% ¡prop!
%%%% ¡id!
OrdMxBD.NODELABELS
%%%% ¡title!
NODES labels

%%% ¡prop!
%%%% ¡id!
OrdMxBD.B
%%%% ¡title!
Input ADJACENCY MATRIX

%%% ¡prop!
%%%% ¡id!
OrdMxBD.SYMMETRIZE_RULE
%%%% ¡title!
SYMMETRIZATION RULE

%%% ¡prop!
%%%% ¡id!
OrdMxBD.SEMIPOSITIVIZE_RULE
%%%% ¡title!
NEGATIVE EDGE RULE

%%% ¡prop!
%%%% ¡id!
OrdMxBD.STANDARDIZE_RULE
%%%% ¡title!
NORMALIZATION RULE

%%% ¡prop!
%%%% ¡id!
OrdMxBD.A
%%%% ¡title!
Binary Directed ADJACENCY MATRICES

%%% ¡prop!
%%%% ¡id!
OrdMxBD.PFGA
%%%% ¡title!
Adjacency Matrix Plot

%%% ¡prop!
%%%% ¡id!
OrdMxBD.PFGH
%%%% ¡title!
Graph Histogram

%%% ¡prop!
%%%% ¡id!
OrdMxBD.M_DICT
%%%% ¡title!
Graph MEASURES

%%% ¡prop!
%%%% ¡id!
OrdMxBD.NOTES
%%%% ¡title!
Graph NOTES

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the ordinal multiplex binary directed graph.
%%%% ¡default!
'OrdMxBD'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the ordinal multiplex binary directed graph.
%%%% ¡default!
'In an ordinal multiplex binary directed (BD) graph, all layers have the same number of nodes with within-layer directed edges either 0 (absence of connection) or 1 (existence of connection). There are connections between layers connecting the corresponding nodes.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the ordinal multiplex binary directed graph.
%%%% ¡settings!
'OrdMxBD'

%%% ¡prop!
ID (data, string) is a few-letter code for the ordinal multiplex binary directed graph.
%%%% ¡default!
'OrdMxBD ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the ordinal multiplex binary directed graph.
%%%% ¡default!
'OrdMxBD label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the ordinal multiplex binary directed graph.
%%%% ¡default!
'OrdMxBD notes'

%%% ¡prop!
GRAPH_TYPE (constant, scalar) returns the graph type Graph.ORDERED_MULTIPLEX__.
%%%% ¡default!
Graph.ORDERED_MULTIPLEX

%%% ¡prop!
CONNECTIVITY_TYPE (query, smatrix) returns the connectivity type __Graph.BINARY__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.BINARY * ones(layernumber);

%%% ¡prop!
DIRECTIONALITY_TYPE (query, smatrix) returns the directionality type __Graph.DIRECTED__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.DIRECTED * ones(layernumber);

%%% ¡prop!
SELFCONNECTIVITY_TYPE (query, smatrix) returns the self-connectivity type __Graph.NONSELFCONNECTED__ on the diagonal and __Graph.SELFCONNECTED__ off diagonal.
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.SELFCONNECTED * ones(layernumber);
value(1:layernumber+1:end) = Graph.NONSELFCONNECTED;

%%% ¡prop!
NEGATIVITY_TYPE (query, smatrix) returns the negativity type __Graph.NONNEGATIVE__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.NONNEGATIVE * ones(layernumber);

%%% ¡prop!
A (result, cell) is the cell containing the multiplex binary adjacency matrices of the multiplex binary directed graph.
%%%% ¡calculate!
B = g.get('B'); %#ok<PROPLC>
L = length(B); %#ok<PROPLC> % number of layers
A = cell(L, L);

for i = 1:1:L
    M = dediagonalize(B{i}); %#ok<PROPLC> % removes self-connections by removing diagonal from adjacency matrix, equivalent to dediagonalize(B{i}, 'DediagonalizeRule', 0)
    M = semipositivize(M, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
    M = binarize(M, varargin{:}); % rescales adjacency matrix, equivalent to binarize(M, 'threshold', 0, 'bins', [-1:.001:1])
    A(i, i) = {M};
    if ~isempty(A{1, 1})
        for j = i+1:1:L
            if j == i+1
                A(i, j) = {eye(length(A{1, 1}))};
                A(j, i) = {eye(length(A{1, 1}))};
            else
                A(i, j) = {zeros(length(A{1, 1}))};
                A(j, i) = {zeros(length(A{1, 1}))};
            end
        end
    end
end

value = A;
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMxBD.A, ...
    'TABLE_HEIGHT', s(40), ...
    'XYSLIDERLOCK', true, ... 
    'XSLIDERSHOW', false, ...
    'YSLIDERSHOW', true, ...
    'YSLIDERLABELS', g.getCallback('ALAYERLABELS'), ...
    'YSLIDERWIDTH', s(5), ...
    'ROWNAME', g.getCallback('ANODELABELS'), ...
    'COLUMNNAME', g.getCallback('ANODELABELS'), ...
    varargin{:});

%%% ¡prop!
PARTITIONS (result, rvector) returns the number of layers in the partitions of the graph.
%%%% ¡calculate!
value = ones(1, g.get('LAYERNUMBER'));

%%% ¡prop!
ALAYERLABELS (query, stringlist) returns the layer labels to be used by the slider.
%%%% ¡calculate!
alayerlabels = g.get('LAYERLABELS');
if isempty(alayerlabels) && ~isa(g.getr('A'), 'NoValue') % ensures that it's not unecessarily calculated
    alayerlabels = cellfun(@num2str, num2cell([1:1:g.get('LAYERNUMBER')]), 'uniformoutput', false);
end
value = alayerlabels;

%%% ¡prop!
COMPATIBLE_MEASURES (constant, classlist) is the list of compatible measures.
%%%% ¡default!
getCompatibleMeasures('OrdMxBD')

%% ¡props!

%%% ¡prop!
B (data, cell) is the input cell containing the multiplex adjacency matrices.
%%%% ¡default!
{[] []}
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMxBD.B, ...
    'TABLE_HEIGHT', s(40), ...
    'XSLIDERSHOW', true, ...
    'XSLIDERLABELS', g.get('LAYERLABELS'), ...
    'XSLIDERHEIGHT', s(3.5), ...
    'YSLIDERSHOW', false, ...
    'ROWNAME', g.getCallback('ANODELABELS'), ...
    'COLUMNNAME', g.getCallback('ANODELABELS'), ...
    varargin{:});

%%% ¡prop!
SEMIPOSITIVIZE_RULE (parameter, option) determines how to remove the negative edges.
%%%% ¡settings!
{'zero', 'absolute'}

%% ¡tests!

%%% ¡excluded_props!
[OrdMxBD.PFGA OrdMxBD.PFGH]

%%% ¡test!
%%%% ¡name!
Constructor - Full
%%%% ¡probability!
.01
%%%% ¡code!
B1 = rand(randi(10));
B = {B1, B1, B1};
g = OrdMxBD('B', B);

g.get('A_CHECK')

A1 = binarize(semipositivize(dediagonalize(B1)));
A = {
    A1                  eye(length(B1))     zeros(length(B1)) 
    eye(length(B1))     A1                  eye(length(B1))
    zeros(length(B1))   eye(length(B1))     A1
    };
assert(isequal(g.get('A'), A), ...
    [BRAPH2.STR ':OrdMxBD:' BRAPH2.FAIL_TEST], ...
    'OrdMxBD is not constructing well.')

%%% ¡test!
%%%% ¡name!
Semipositivize Rules
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    -2 -1 0 1 2
    -1 0 1 2 -2
    0 1 2 -2 -1
    1 2 -2 -1 0
    2 -2 -1 0 1
    ];

g0 = OrdMxBD('B', {B, B, B});
A = [
    0 0 0 1 1
    0 0 1 1 0
    0 1 0 0 0
    1 1 0 0 0
    1 0 0 0 0
    ];
A0 = {
    A                   eye(length(B))  zeros(length(B))
    eye(length(B))      A               eye(length(B))
    zeros(length(B))    eye(length(B))  A
    };
assert(isequal(g0.get('A'), A0), ...
    [BRAPH2.STR ':OrdMxBD:' BRAPH2.FAIL_TEST], ...
    'OrdMxBD is not constructing well.')

g_zero = OrdMxBD('B', {B, B, B}, 'SEMIPOSITIVIZE_RULE', 'zero');
A = [
    0 0 0 1 1
    0 0 1 1 0
    0 1 0 0 0
    1 1 0 0 0
    1 0 0 0 0
    ];
A_zero = {
    A               eye(length(B))  zeros(length(B))
    eye(length(B))  A               eye(length(B))
    zeros(length(B))  eye(length(B))  A
    };
assert(isequal(g_zero.get('A'), A_zero), ...
    [BRAPH2.STR ':OrdMxBD:' BRAPH2.FAIL_TEST], ...
    'OrdMxBD is not constructing well.')

g_absolute = OrdMxBD('B', {B, B, B}, 'SEMIPOSITIVIZE_RULE', 'absolute');
A = [
    0 1 0 1 1
    1 0 1 1 1
    0 1 0 1 1
    1 1 1 0 0
    1 1 1 0 0
    ];
A_absolute = {
    A                   eye(length(B))  zeros(length(B))
    eye(length(B))      A               eye(length(B))
    zeros(length(B))    eye(length(B))  A
    };
assert(isequal(g_absolute.get('A'), A_absolute), ...
    [BRAPH2.STR ':OrdMxBD:' BRAPH2.FAIL_TEST], ...
    'OrdMxBD is not constructing well.')



%% ¡_props!

%%% ¡_prop!
ATTEMPTSPEREDGE (parameter, scalar) is the attempts to rewire each edge.
%%%% ¡_default!
5

%% ¡_methods!
function random_g = randomize(g)
    % RANDOMIZE returns a randomized graph
    %
    % RANDOMIZED_G = RANDOMIZE(G) returns the randomized
    % graph RANDOM_G obtained with a randomized correlation
    % matrix via the static function randomize_A while preserving
    % degree distributions. The randomization it is done layer by
    % layer and then integrated in the 2-D supra-adjacency matrix
    % cell array.
    %
    % RANDOMIZED_G = RANDOMIZE(G, 'AttemptsPerEdge', VALUE)
    % returns the randomized graph RANDOM_G obtained with a
    % randomized correlation matrix via the static function
    % randomize_A while preserving  degree distributions.
    % The multiplex is randomized layer by layer where randomized
    % adjacency matrix of each layer are then integrated in the
    % 2-D supra-adjacency matrix cell array.
    %
    % See also GraphBD

    % get rules
    attempts_per_edge = g.get('ATTEMPTSPEREDGE');

    if nargin<2
        attempts_per_edge = 5;
    end

    % get A
    A = g.get('A');
    L = g.layernumber();
    random_multi_A = cell(1, L);

    for li = 1:1:L
        Aii = A{li, li};
        random_A = GraphBD.randomize_A(Aii, attempts_per_edge);
        random_multi_A(li) = {random_A};
    end
    random_g = OrdMxBD('B', random_multi_A);
end