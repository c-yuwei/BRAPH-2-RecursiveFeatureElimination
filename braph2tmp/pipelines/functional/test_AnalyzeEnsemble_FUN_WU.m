%TEST_ANALYZEENSEMBLE_FUN_WU

%% Test 1.1: Instantiation - empty

a = AnalyzeEnsemble_FUN_WU();

prop_number = AnalyzeEnsemble_FUN_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	assert( ...
		isa(a.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
		['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(a.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
		['AnalyzeEnsemble_FUN_WU.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:AnalyzeEnsemble_FUN_WU')
a = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ID), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.GR), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.G_DICT), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ME_DICT), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.REPETITION), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.CORRELATION_RULE), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeEnsemble_FUN_WU')

for prop = 1:1:AnalyzeEnsemble_FUN_WU.getPropNumber()
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(a.getr(prop), AnalyzeEnsemble_FUN_WU.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by AnalyzeEnsemble_FUN_WU.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(a.getr(TAG), AnalyzeEnsemble_FUN_WU.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by AnalyzeEnsemble_FUN_WU.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(a.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['Being a result, AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(a.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['Being a result, AnalyzeEnsemble_FUN_WU.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in AnalyzeEnsemble_FUN_WU.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:AnalyzeEnsemble_FUN_WU')
a_0 = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ID), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.GR), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.G_DICT), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ME_DICT), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.REPETITION), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.CORRELATION_RULE), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeEnsemble_FUN_WU')

a_1 = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, Callback('EL', a_0, 'PROP', 1), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, Callback('EL', a_0, 'PROP', 4), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, Callback('EL', a_0, 'PROP', 7), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, Callback('EL', a_0, 'PROP', 8), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, Callback('EL', a_0, 'PROP', 9), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, Callback('EL', a_0, 'PROP', 10), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_0, 'PROP', 11) ...
	);
	
prop_number = AnalyzeEnsemble_FUN_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_1.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
a_2 = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, Callback('EL', a_1, 'PROP', 1), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, Callback('EL', a_1, 'PROP', 4), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, Callback('EL', a_1, 'PROP', 7), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, Callback('EL', a_1, 'PROP', 8), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, Callback('EL', a_1, 'PROP', 9), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, Callback('EL', a_1, 'PROP', 10), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_1, 'PROP', 11) ...
	);
	
prop_number = AnalyzeEnsemble_FUN_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_2.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
a_3 = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, Callback('EL', a_2, 'PROP', 1), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, Callback('EL', a_2, 'PROP', 4), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, NoValue(), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, Callback('EL', a_2, 'PROP', 7), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, Callback('EL', a_2, 'PROP', 8), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, Callback('EL', a_2, 'PROP', 9), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, Callback('EL', a_2, 'PROP', 10), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_2, 'PROP', 11) ...
	);
	
prop_number = AnalyzeEnsemble_FUN_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_3.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:AnalyzeEnsemble_FUN_WU')
a = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ID), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.GR), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.G_DICT), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ME_DICT), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.REPETITION), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.CORRELATION_RULE), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeEnsemble_FUN_WU')

prop_number = AnalyzeEnsemble_FUN_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(a.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(a.getPropSettings(prop))
				assert( ...
					a.checkFormat(a.getPropFormat(prop), a.get(prop)), ...
					[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
					['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					a.checkFormat(a.getPropFormat(prop), a.get(prop), a.getPropSettings(prop)), ...
					[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
					['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:AnalyzeEnsemble_FUN_WU')
a = AnalyzeEnsemble_FUN_WU( ...
	AnalyzeEnsemble_FUN_WU.ID, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ID), ...
	AnalyzeEnsemble_FUN_WU.LABEL, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.LABEL), ...
	AnalyzeEnsemble_FUN_WU.NOTES, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NOTES), ...
	AnalyzeEnsemble_FUN_WU.GR, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.GR), ...
	AnalyzeEnsemble_FUN_WU.G_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.G_DICT), ...
	AnalyzeEnsemble_FUN_WU.ME_DICT, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.ME_DICT), ...
	AnalyzeEnsemble_FUN_WU.REPETITION, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.REPETITION), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMIN), ...
	AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.FREQUENCYRULEMAX), ...
	AnalyzeEnsemble_FUN_WU.CORRELATION_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.CORRELATION_RULE), ...
	AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE, AnalyzeEnsemble_FUN_WU.getPropDefault(AnalyzeEnsemble_FUN_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeEnsemble_FUN_WU')

for prop = 1:1:AnalyzeEnsemble_FUN_WU.getPropNumber()
	TAG = upper(AnalyzeEnsemble_FUN_WU.getPropTag(prop));
	switch AnalyzeEnsemble_FUN_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(a.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(a.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				a.checkFormat(a.getPropFormat(prop), a.getr(prop),a.getPropSettings(prop)), ...
				[BRAPH2.STR ':AnalyzeEnsemble_FUN_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeEnsemble_FUN_WU.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Example

example_FUN_WU

