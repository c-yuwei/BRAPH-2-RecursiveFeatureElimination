%% EXAMPLE_NN_CON_WU_REGRESSION_ADJACENCYMATRIX
% Script example pipeline for NN regression with the input of adjacency matrix 

clear variables %#ok<*NASGU>

%% Load brain atlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'desikan_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load group of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

%% Construct the dataset
nnd = NNRegressorData_CON_WU( ...
    'GR', gr, ...
    'SPLIT', 0.2, ...
    'TARGET_NAME', 'age', ...
    'FEATURE_MASK', 0.05 ...
    );

gr_train = nnd.get('GR_TRAIN_FS');
gr_val = nnd.get('GR_VAL_FS');

%% Train the neural network regressor with the training set
regressor = NNRegressorDNN( ...
    'GR', gr_train, ...
    'VERBOSE', false, ...
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

%% Load another group of subjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr_unseen = im_gr.get('GR');

%% Evaluate the regressor for the testing set
nnd_test = NNRegressorData_CON_WU( ...
    'GR', gr_unseen, ...
    'SPLIT', 1.0, ...
    'TARGET_NAME', 'age', ...
    'FEATURE_MASK', nnd.get('FEATURE_SELECTION_ANALYSIS') ...
    );

gr_test = nnd_test.get('GR_VAL_FS');

nne_test = NNRegressorEvaluator( ...
    'GR', gr_test, ...
    'NN', regressor ...
    );

rmse_test = nne_test.get('RMSE');

close all