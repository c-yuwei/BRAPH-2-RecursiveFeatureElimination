%% ¡header!
ClassifierNN < BaseNN (nn, classifier with nerual networks) is a classifier consists of neural network.

%% ¡description!
This classifier is composed of artificial neural network layers and classification output layer.

%% ¡props!
%%% ¡prop!
TRAINING_ACCURACY (result, scalar) is the model accuracy obtained from the training data.

%%% ¡prop!
TEST_ACCURACY (result, scalar) is the model accuracy obtained from test data.


%% ¡methods!
function layers = getLayers(nn, numFeatures, numClasses)
    layers = [
        featureInputLayer(numFeatures,'Normalization', 'zscore','Name','input')
        fullyConnectedLayer(floor(1.5*numFeatures),'Name','fc1')
        batchNormalizationLayer('Name','batchNormalization1')
        fullyConnectedLayer(floor(1.5*numFeatures),'Name','fc2')
        batchNormalizationLayer('Name','batchNormalization2')
        reluLayer('Name','relu1')
        fullyConnectedLayer(numClasses,'Name','fc3')
        softmaxLayer('Name','sfmax1')
        classificationLayer('Name','output')];
    lgraph = layerGraph(layers);
    plot(lgraph)
end