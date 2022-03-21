%% ¡header!
NNRegressorData_FUN_WU < NNRegressorData (nnd, data of a neural network regressor with functional data) produces a dataset to train or test a neural netowrk regressor using functional data. 

%% ¡description!
This dataset produces NN groups with functional data.
The dataset produces NN groups for trianing or testing a neurla network
with functional data. 

%% ¡props!
%%% ¡prop!
REPETITION(parameter, scalar) is the number of repetitions
%%%% ¡default!
1

%%% ¡prop!
FREQUENCYRULEMIN(parameter, scalar)is the minimum frequency value
%%%% ¡default!
0
%%% ¡prop!
FREQUENCYRULEMAX(parameter, scalar)is the maximum frequency value
%%%% ¡default!
Inf

%%% ¡prop!
CORRELATION_RULE (parameter, option) is the correlation type.
%%%% ¡settings!
Correlation.CORRELATION_RULE_LIST
%%%% ¡default!
Correlation.CORRELATION_RULE_LIST{1}

%%% ¡prop!
NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights.
%%%% ¡settings!
Correlation.NEGATIVE_WEIGHT_RULE_LIST
%%%% ¡default!
Correlation.NEGATIVE_WEIGHT_RULE_LIST{1}

%% ¡props_update!

%%% ¡prop!
GR (data, item) is a group of subjects defined as SubjectFUN class.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectFUN')

%%% ¡prop!
GR_NN (result, group) is a group of NN subjects.
%%%% ¡settings!
'NNGroup'
%%%% ¡default!
NNGroup('SUB_CLASS', 'NNSubject', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'NNSubject'))
%%%% ¡calculate!
gr = nnd.get('GR');
T = nnd.get('REPETITION');
fmin = nnd.get('FREQUENCYRULEMIN');
fmax = nnd.get('FREQUENCYRULEMAX');
nn_gr = NNGroup( ...
    'SUB_CLASS', 'NNSubject', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'NNSubject') ...
    );

nn_gr.lock('SUB_CLASS');

nn_gr.set( ...
    'ID', gr.get('ID'), ...
    'LABEL', gr.get('LABEL'), ...
    'NOTES', gr.get('NOTES') ...
    );

atlas = BrainAtlas();
if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').length > 0 
    atlas = gr.get('SUB_DICT').getItem(1).get('BA');
end

nn_sub_dict = nn_gr.get('SUB_DICT');

for i = 1:1:gr.get('SUB_DICT').length()
	sub = gr.get('SUB_DICT').getItem(i);
    data = sub.getr('FUN');
    fs = 1 / T;
    
    if fmax > fmin && T > 0
        NFFT = 2 * ceil(size(data, 1) / 2);
        ft = fft(data, NFFT);  % Fourier transform
        f = fftshift(fs * abs(-NFFT / 2:NFFT / 2 - 1) / NFFT);  % absolute frequency
        ft(f < fmin | f > fmax, :) = 0;
        data = ifft(ft, NFFT);
    end
    
    A = Correlation.getAdjacencyMatrix(data, nnd.get('CORRELATION_RULE'), nnd.get('NEGATIVE_WEIGHT_RULE'));
    
    g = GraphWU( ...
        'ID', ['g ' sub.get('ID')], ...
        'B', A, ...
        'BRAINATLAS', atlas ...
        );
    
    if string(nnd.get('INPUT_TYPE')) == "adjacency_matrices"
        input = g.get('A'); 

    elseif string(nnd.get('INPUT_TYPE')) == "graph_measures"
        input_nodal = [];
        input_binodal = [];
        input_global = [];
        mlist = nnd.get('MEASURES');
        for j = 1:length(mlist)
            if Measure.is_nodal(mlist{j})
                input_nodal = [input_nodal; cell2mat(g.getMeasure(mlist{j}).get('M'))];
            elseif Measure.is_global(mlist{j})
                input_global = [input_global; cell2mat(g.getMeasure(mlist{j}).get('M'))];
            else
                input_binodal = [input_binodal; cell2mat(g.getMeasure(mlist{j}).get('M'))];
            end
        end
        input = {input_nodal input_global input_binodal};
    end

    nn_sub = NNSubject( ...
        'ID', [sub.get('ID') ' in ' gr.get('ID')], ...
        'BA', atlas, ...
        'age', sub.get('age'), ...
        'sex', sub.get('sex'), ...
        ...
        'G', g, ...
        'INPUT', input, ...
        'TARGET', sub.get(nnd.get('TARGET_NAME')) ...
        );
    nn_sub_dict.add(nn_sub);
end
nn_gr.set('sub_dict', nn_sub_dict);

value = nn_gr;

%% ¡tests!
%%% ¡test!
%%%% ¡name!
Example
%%%% ¡code!
example_NN_FUN_WU_Regression_AdjacencyMatrix