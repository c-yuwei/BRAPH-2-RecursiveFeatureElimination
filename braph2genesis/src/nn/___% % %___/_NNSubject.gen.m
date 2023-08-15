%% ¡header!
NNSubject < Subject (sub, subject with connectivity matrix) is a subject for a neural network analysis.

%%% ¡description!
NNSubject contains the required informationto for neural network analysis.

%%% ¡seealso!
NNGroup

%% ¡props!

%%% ¡prop!
G (data, item) is a graph for the subject.
%%%% ¡settings!
'Graph'

%%% ¡prop!
INPUT_TYPE (data, string) is the input type for training or testing the NN.

%%% ¡prop!
INPUT (data, cell) is an individual input for the neural network.
%%%% ¡gui!
if ~braph2_testing
    ba = sub.get('BA');
    if string(sub.get('INPUT_TYPE')) == 'graph_measures'
        pr = PPNNSubjectInputMeasure('EL', sub, 'PROP', NNSubject.INPUT, 'BA', ba, 'INPUT_LABEL', sub.get('INPUT_LABEL'), varargin{:});
        pr.set('XSLIDERLABELS', 'el.measure_types()');
    elseif string(sub.get('INPUT_TYPE')) == 'structural_data'
        pr = PPNNSubjectInputStructuralData('EL', sub, 'PROP', NNSubject.INPUT, 'BA', ba, varargin{:});
    elseif string(sub.get('INPUT_TYPE')) == 'adjacency_matrices'
        pr = PPNNSubjectInputAdjacency('EL', sub, 'PROP', NNSubject.INPUT, 'BA', ba, varargin{:});
    else
        pr = PanelPropCell('EL', sub, 'PROP', NNSubject.INPUT, varargin{:});
    end
end

%%% ¡prop!
FEATURE_MASK (data, cell) is a feature score map generated by mutual information analysis.
%%%% ¡gui!
if ~braph2_testing
    ba = sub.get('BA');
    if string(sub.get('INPUT_TYPE')) == 'graph_measures'
        pr = PPNNSubjectInputMeasure('EL', sub, 'PROP', NNSubject.FEATURE_MASK, 'BA', ba, 'INPUT_LABEL', sub.get('INPUT_LABEL'), varargin{:});
        pr.set('XSLIDERLABELS', 'el.measure_types()');
    elseif string(sub.get('INPUT_TYPE')) == 'structural_data'
        pr = PPNNSubjectInputStructuralData('EL', sub, 'PROP', NNSubject.FEATURE_MASK, 'BA', ba, varargin{:});
    elseif string(sub.get('INPUT_TYPE')) == 'adjacency_matrices'
        pr = PPNNSubjectInputAdjacency('EL', sub, 'PROP', NNSubject.FEATURE_MASK, 'BA', ba, varargin{:});
    else
        pr = PanelPropCell('EL', sub, 'PROP', NNSubject.FEATURE_MASK, varargin{:});
    end
end

%%% ¡prop!
INPUT_LABEL (data, classlist) represents the the label of input, which can be either graph or measure.

%%% ¡prop!
MASKED_INPUT (result, cell) is a masked input with a feature mask.
%%%% ¡calculate!
feature_mask = sub.get('FEATURE_MASK');
if isempty(feature_mask)
    masked_input = {};
else
    input = sub.get('INPUT');
    for i = 1:1:length(feature_mask)
        input_per_cluster = input{i};
        mask_per_cluster = feature_mask{i};
        input_per_cluster(mask_per_cluster == 0) = 0;
        masked_input{i} = input_per_cluster;
    end
end

value = masked_input;

%%% ¡prop!
TARGET_NAME (data, string) is the name of the target for the neural network analysis.

%%% ¡prop!
TARGET (metadata, cell) is the encoded values of a target for the neural network analysis.

%%% ¡prop!
PREDICTION (data, cell) is the prediction of the subject from the neural network analysis.

%%% ¡prop!
BA (data, item) is a brain atlas.
%%%% ¡settings!
'BrainAtlas'
%%%% ¡default!
BrainAtlas()

%%% ¡prop!
AGE (data, scalar) is a scalar number containing the age of the subject.
%%%% ¡default!
0

%%% ¡prop!
SEX (data, option) is an option containing the sex of the subject (female/male).
%%%% ¡default!
'unassigned'
%%%% ¡settings!
{'Female', 'Male', 'unassigned'}

%% ¡staticmethods!
function lbls = measure_types()
    lbls = {'Global', 'Nodal', 'Binodal'};
end