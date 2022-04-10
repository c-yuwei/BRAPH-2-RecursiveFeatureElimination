%TEST_NNREGRESSOREVALUATOR

%% Test 1.1: Instantiation - empty

nne = NNRegressorEvaluator();

prop_number = NNRegressorEvaluator.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	assert( ...
		isa(nne.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
		['NNRegressorEvaluator.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in NNRegressorEvaluator.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(nne.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
		['NNRegressorEvaluator.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in NNRegressorEvaluator.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:NNRegressorEvaluator')
nne = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.ID), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NN), ...
	NNRegressorEvaluator.GR, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR), ...
	NNRegressorEvaluator.GR_PREDICTION, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR_PREDICTION), ...
	NNRegressorEvaluator.FEATURE_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.FEATURE_MAP), ...
	NNRegressorEvaluator.PLOT_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.PLOT_MAP), ...
	NNRegressorEvaluator.RMSE, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.RMSE), ...
	NNRegressorEvaluator.SCATTER_PLOT, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.SCATTER_PLOT) ...
	);
warning('on', 'BRAPH2:NNRegressorEvaluator')

for prop = 1:1:NNRegressorEvaluator.getPropNumber()
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(nne.getr(prop), NNRegressorEvaluator.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by NNRegressorEvaluator.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in NNRegressorEvaluator.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(nne.getr(TAG), NNRegressorEvaluator.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by NNRegressorEvaluator.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in NNRegressorEvaluator.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(nne.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['Being a result, NNRegressorEvaluator.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in NNRegressorEvaluator.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(nne.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['Being a result, NNRegressorEvaluator.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in NNRegressorEvaluator.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:NNRegressorEvaluator')
nne_0 = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.ID), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NN), ...
	NNRegressorEvaluator.GR, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR), ...
	NNRegressorEvaluator.GR_PREDICTION, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR_PREDICTION), ...
	NNRegressorEvaluator.FEATURE_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.FEATURE_MAP), ...
	NNRegressorEvaluator.PLOT_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.PLOT_MAP), ...
	NNRegressorEvaluator.RMSE, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.RMSE), ...
	NNRegressorEvaluator.SCATTER_PLOT, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.SCATTER_PLOT) ...
	);
warning('on', 'BRAPH2:NNRegressorEvaluator')

nne_1 = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, Callback('EL', nne_0, 'PROP', 1), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, Callback('EL', nne_0, 'PROP', 4), ...
	NNRegressorEvaluator.GR, Callback('EL', nne_0, 'PROP', 5), ...
	NNRegressorEvaluator.GR_PREDICTION, NoValue(), ...
	NNRegressorEvaluator.FEATURE_MAP, NoValue(), ...
	NNRegressorEvaluator.PLOT_MAP, Callback('EL', nne_0, 'PROP', 8), ...
	NNRegressorEvaluator.RMSE, NoValue(), ...
	NNRegressorEvaluator.SCATTER_PLOT, NoValue() ...
	);
	
prop_number = NNRegressorEvaluator.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(nne_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(nne_1.get(prop), nne_0.get(prop)) && ~isa(nne_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(nne_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
nne_2 = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, Callback('EL', nne_1, 'PROP', 1), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, Callback('EL', nne_1, 'PROP', 4), ...
	NNRegressorEvaluator.GR, Callback('EL', nne_1, 'PROP', 5), ...
	NNRegressorEvaluator.GR_PREDICTION, NoValue(), ...
	NNRegressorEvaluator.FEATURE_MAP, NoValue(), ...
	NNRegressorEvaluator.PLOT_MAP, Callback('EL', nne_1, 'PROP', 8), ...
	NNRegressorEvaluator.RMSE, NoValue(), ...
	NNRegressorEvaluator.SCATTER_PLOT, NoValue() ...
	);
	
prop_number = NNRegressorEvaluator.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(nne_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(nne_2.get(prop), nne_0.get(prop)) && ~isa(nne_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(nne_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
nne_3 = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, Callback('EL', nne_2, 'PROP', 1), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, Callback('EL', nne_2, 'PROP', 4), ...
	NNRegressorEvaluator.GR, Callback('EL', nne_2, 'PROP', 5), ...
	NNRegressorEvaluator.GR_PREDICTION, NoValue(), ...
	NNRegressorEvaluator.FEATURE_MAP, NoValue(), ...
	NNRegressorEvaluator.PLOT_MAP, Callback('EL', nne_2, 'PROP', 8), ...
	NNRegressorEvaluator.RMSE, NoValue(), ...
	NNRegressorEvaluator.SCATTER_PLOT, NoValue() ...
	);
	
prop_number = NNRegressorEvaluator.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(nne_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(nne_3.get(prop), nne_0.get(prop)) && ~isa(nne_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(nne_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:NNRegressorEvaluator')
nne = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.ID), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NN), ...
	NNRegressorEvaluator.GR, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR), ...
	NNRegressorEvaluator.GR_PREDICTION, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR_PREDICTION), ...
	NNRegressorEvaluator.FEATURE_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.FEATURE_MAP), ...
	NNRegressorEvaluator.PLOT_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.PLOT_MAP), ...
	NNRegressorEvaluator.RMSE, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.RMSE), ...
	NNRegressorEvaluator.SCATTER_PLOT, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.SCATTER_PLOT) ...
	);
warning('on', 'BRAPH2:NNRegressorEvaluator')

prop_number = NNRegressorEvaluator.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(nne.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(nne.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(nne.getPropSettings(prop))
				assert( ...
					nne.checkFormat(nne.getPropFormat(prop), nne.get(prop)), ...
					[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
					['NNRegressorEvaluator.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					nne.checkFormat(nne.getPropFormat(prop), nne.get(prop), nne.getPropSettings(prop)), ...
					[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
					['NNRegressorEvaluator.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:NNRegressorEvaluator')
nne = NNRegressorEvaluator( ...
	NNRegressorEvaluator.ID, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.ID), ...
	NNRegressorEvaluator.LABEL, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.LABEL), ...
	NNRegressorEvaluator.NOTES, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NOTES), ...
	NNRegressorEvaluator.NN, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.NN), ...
	NNRegressorEvaluator.GR, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR), ...
	NNRegressorEvaluator.GR_PREDICTION, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.GR_PREDICTION), ...
	NNRegressorEvaluator.FEATURE_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.FEATURE_MAP), ...
	NNRegressorEvaluator.PLOT_MAP, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.PLOT_MAP), ...
	NNRegressorEvaluator.RMSE, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.RMSE), ...
	NNRegressorEvaluator.SCATTER_PLOT, NNRegressorEvaluator.getPropDefault(NNRegressorEvaluator.SCATTER_PLOT) ...
	);
warning('on', 'BRAPH2:NNRegressorEvaluator')

for prop = 1:1:NNRegressorEvaluator.getPropNumber()
	TAG = upper(NNRegressorEvaluator.getPropTag(prop));
	switch NNRegressorEvaluator.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(nne.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(nne.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(nne.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(nne.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				nne.checkFormat(nne.getPropFormat(prop), nne.getr(prop),nne.getPropSettings(prop)), ...
				[BRAPH2.STR ':NNRegressorEvaluator:' BRAPH2.BUG_FUNC], ...
				['NNRegressorEvaluator.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

