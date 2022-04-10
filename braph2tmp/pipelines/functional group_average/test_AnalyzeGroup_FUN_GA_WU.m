%TEST_ANALYZEGROUP_FUN_GA_WU

%% Test 1.1: Instantiation - empty

a = AnalyzeGroup_FUN_GA_WU();

prop_number = AnalyzeGroup_FUN_GA_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	assert( ...
		isa(a.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
		['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(a.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
		['AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')
a = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.ID), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.GR), ...
	AnalyzeGroup_FUN_GA_WU.G, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.G), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.REPETITION), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')

for prop = 1:1:AnalyzeGroup_FUN_GA_WU.getPropNumber()
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(a.getr(prop), AnalyzeGroup_FUN_GA_WU.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by AnalyzeGroup_FUN_GA_WU.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(a.getr(TAG), AnalyzeGroup_FUN_GA_WU.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by AnalyzeGroup_FUN_GA_WU.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(a.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['Being a result, AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(a.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['Being a result, AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in AnalyzeGroup_FUN_GA_WU.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')
a_0 = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.ID), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.GR), ...
	AnalyzeGroup_FUN_GA_WU.G, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.G), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.REPETITION), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')

a_1 = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, Callback('EL', a_0, 'PROP', 1), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, Callback('EL', a_0, 'PROP', 4), ...
	AnalyzeGroup_FUN_GA_WU.G, NoValue(), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, Callback('EL', a_0, 'PROP', 6), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, Callback('EL', a_0, 'PROP', 7), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, Callback('EL', a_0, 'PROP', 8), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, Callback('EL', a_0, 'PROP', 9), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_0, 'PROP', 10) ...
	);
	
prop_number = AnalyzeGroup_FUN_GA_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_1.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
a_2 = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, Callback('EL', a_1, 'PROP', 1), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, Callback('EL', a_1, 'PROP', 4), ...
	AnalyzeGroup_FUN_GA_WU.G, NoValue(), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, Callback('EL', a_1, 'PROP', 6), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, Callback('EL', a_1, 'PROP', 7), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, Callback('EL', a_1, 'PROP', 8), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, Callback('EL', a_1, 'PROP', 9), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_1, 'PROP', 10) ...
	);
	
prop_number = AnalyzeGroup_FUN_GA_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_2.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
a_3 = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, Callback('EL', a_2, 'PROP', 1), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, Callback('EL', a_2, 'PROP', 4), ...
	AnalyzeGroup_FUN_GA_WU.G, NoValue(), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, Callback('EL', a_2, 'PROP', 6), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, Callback('EL', a_2, 'PROP', 7), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, Callback('EL', a_2, 'PROP', 8), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, Callback('EL', a_2, 'PROP', 9), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, Callback('EL', a_2, 'PROP', 10) ...
	);
	
prop_number = AnalyzeGroup_FUN_GA_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(a_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(a_3.get(prop), a_0.get(prop)) && ~isa(a_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(a_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')
a = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.ID), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.GR), ...
	AnalyzeGroup_FUN_GA_WU.G, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.G), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.REPETITION), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')

prop_number = AnalyzeGroup_FUN_GA_WU.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(a.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(a.getPropSettings(prop))
				assert( ...
					a.checkFormat(a.getPropFormat(prop), a.get(prop)), ...
					[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
					['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					a.checkFormat(a.getPropFormat(prop), a.get(prop), a.getPropSettings(prop)), ...
					[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
					['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')
a = AnalyzeGroup_FUN_GA_WU( ...
	AnalyzeGroup_FUN_GA_WU.ID, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.ID), ...
	AnalyzeGroup_FUN_GA_WU.LABEL, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.LABEL), ...
	AnalyzeGroup_FUN_GA_WU.NOTES, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NOTES), ...
	AnalyzeGroup_FUN_GA_WU.GR, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.GR), ...
	AnalyzeGroup_FUN_GA_WU.G, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.G), ...
	AnalyzeGroup_FUN_GA_WU.REPETITION, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.REPETITION), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMIN), ...
	AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.FREQUENCYRULEMAX), ...
	AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.CORRELATION_RULE), ...
	AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE, AnalyzeGroup_FUN_GA_WU.getPropDefault(AnalyzeGroup_FUN_GA_WU.NEGATIVE_WEIGHT_RULE) ...
	);
warning('on', 'BRAPH2:AnalyzeGroup_FUN_GA_WU')

for prop = 1:1:AnalyzeGroup_FUN_GA_WU.getPropNumber()
	TAG = upper(AnalyzeGroup_FUN_GA_WU.getPropTag(prop));
	switch AnalyzeGroup_FUN_GA_WU.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(a.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(a.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(a.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				a.checkFormat(a.getPropFormat(prop), a.getr(prop),a.getPropSettings(prop)), ...
				[BRAPH2.STR ':AnalyzeGroup_FUN_GA_WU:' BRAPH2.BUG_FUNC], ...
				['AnalyzeGroup_FUN_GA_WU.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Example

example_FUN_GA_WU

