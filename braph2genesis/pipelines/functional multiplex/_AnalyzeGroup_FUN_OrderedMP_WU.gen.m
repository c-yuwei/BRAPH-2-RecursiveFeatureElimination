%% ¡header!
AnalyzeGroup_FUN_OrderedMP_WU < AnalyzeEnsemble (a, graph analysis with functional ordinal multiplex data) is a graph analysis using functional ordinal multiplex data.

%% ¡description!
This graph analysis uses functional ordinal multiplex data and analyzes them 
using weighted undirected graphs.

%%% ¡seealso!
Subject_FUN_MP, OrderedMultiplexWU, AnalyzeGroup_FUN_MP_WU.

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
GR (data, item) is the subject group, which also defines the subject class SubjectFUN_MP.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectFUN_MP')

%%% ¡prop!
G (result, idict) is the average graph (OrderedMultiplexWU) obtained from this analysis.
%%%% ¡settings!
'OrderedMultiplexWU'
%%%% ¡default!
OrderedMultiplexWU()
%%%% ¡calculate!
gr = a.get('GR');
atlas = BrainAtlas();
subjects_number = gr.get('SUB_DICT').length();

if ~isempty(gr) && ~isa(gr, 'NoValue') && subjects_number > 0
    atlas = gr.get('SUB_DICT').getItem(1).get('BA');
end
T = a.get('REPETITION');
fmin = a.get('FREQUENCYRULEMIN');
fmax = a.get('FREQUENCYRULEMAX');
A_fun = cell(1, 2);
for i = 1:1:subjects_number
	sub = gr.get('SUB_DICT').getItem(i);
    FUN_MP = sub.getr('FUN_MP');
    L = sub.get('L');
    
    for j = 1:1:L
        data = FUN_MP{j};
        fs = 1 / T;
        
        if fmax > fmin && T > 0
            NFFT = 2 * ceil(size(data, 1) / 2);
            ft = fft(data, NFFT);  % Fourier transform
            f = fftshift(fs * abs(-NFFT / 2:NFFT / 2 - 1) / NFFT);  % absolute frequency
            ft(f < fmin | f > fmax, :) = 0;
            data = ifft(ft, NFFT);
        end
        
        A = Correlation.getAdjacencyMatrix(data, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'));
        
        if i == 1
            A_fun(j) = {A};
        else
            A_fun(j) = {A_fun{j} + A};
        end
    end
end

g = OrderedMultiplexWU( ...
    'ID', ['g ' sub.get('ID')], ...
    'B', cellfun(@(a) a/subjects_number, A_fun, 'UniformOutput', false), ...
    'BRAINATLAS', atlas ...
    );
value = g;
%%%% ¡gui!
pl = PPAnalyzeEnsembleGraph('EL', a, 'PROP', AnalyzeGroup_FUN_OrderedMP_WU.G_DICT, varargin{:});

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡code!
example_FUN_OrderedMP_WU_Group