%% EXAMPLE_NN_CON_WU_REGRESSION_ADJACENCYMATRIX
% Script example pipeline for NN regression with the input of adjacency matrix 

clear variables %#ok<*NASGU>

%% Load brain atlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON NN' filesep 'regression' filesep 'desikan_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load group of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON NN' filesep 'regression' filesep 'xls' filesep 'GroupName'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

%% Construct the dataset
nnd = NNData_CON_WU( ...
    'GR', gr, ...
    'INPUT_TYPE', 'adjacency_matrices', ...
    'TARGET_NAME', 'age', ...
    'WAITBAR', true ...
    );

gr_nn = nnd.get('GR_NN');

%% Split the dataset
nnds = NNRegressorDataSplit( ...
    'GR', gr_nn, ...
    'SPLIT', 0.2, ...
    'WAITBAR', true ...
    );

gr_train = nnds.get('GR_TRAIN_FS');
gr_val = nnds.get('GR_VAL_FS');

%% Train the neural network regressor with the training set
regressor = NNRegressorDNN( ...
    'GR', gr_train, ...
    'VERBOSE', false, ...
    'PLOT_TRAINING', false, ...
    'EPOCHS', 100, ...
    'SHUFFLE', 'every-epoch' ...
    );

regressor.memorize('MODEL');

%% Evaluate the regressor for the training set
nne_train = NNRegressorEvaluator( ...
    'GR', gr_train, ...
    'NN', regressor ...
    );

rmse_train = nne_train.get('RMSE');

%% Evaluate the regressor for the validation set
nne_val = NNRegressorEvaluator( ...
    'GR', gr_val, ...
    'NN', regressor ...
    );

rmse_val = nne_val.get('RMSE');
feature_importance = nne_val.get('FEATURE_PERMUTATION_IMPORTANCE');

close all