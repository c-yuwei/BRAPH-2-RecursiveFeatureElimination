%TEST_PPNNEVALUATOR_FEATURE_MAP

%% Test 1.1: Instantiation - empty

pr = PPNNEvaluator_Feature_Map();

prop_number = PPNNEvaluator_Feature_Map.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
		['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPNNEvaluator_Feature_Map.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
		['PPNNEvaluator_Feature_Map.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPNNEvaluator_Feature_Map.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PPNNEvaluator_Feature_Map')
pr = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ID), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.PROP), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPNNEvaluator_Feature_Map')

for prop = 1:1:PPNNEvaluator_Feature_Map.getPropNumber()
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PPNNEvaluator_Feature_Map.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PPNNEvaluator_Feature_Map.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPNNEvaluator_Feature_Map.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PPNNEvaluator_Feature_Map.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PPNNEvaluator_Feature_Map.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPNNEvaluator_Feature_Map.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPNNEvaluator_Feature_Map.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPNNEvaluator_Feature_Map.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPNNEvaluator_Feature_Map.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PPNNEvaluator_Feature_Map')
pr_0 = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ID), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.PROP), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPNNEvaluator_Feature_Map')

pr_1 = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, Callback('EL', pr_0, 'PROP', 4), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
	
prop_number = PPNNEvaluator_Feature_Map.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, Callback('EL', pr_1, 'PROP', 4), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
	
prop_number = PPNNEvaluator_Feature_Map.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, Callback('EL', pr_2, 'PROP', 4), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
	
prop_number = PPNNEvaluator_Feature_Map.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PPNNEvaluator_Feature_Map')
pr = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ID), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.PROP), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPNNEvaluator_Feature_Map')

prop_number = PPNNEvaluator_Feature_Map.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
					['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
					['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PPNNEvaluator_Feature_Map')
pr = PPNNEvaluator_Feature_Map( ...
	PPNNEvaluator_Feature_Map.ID, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ID), ...
	PPNNEvaluator_Feature_Map.BKGCOLOR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.BKGCOLOR), ...
	PPNNEvaluator_Feature_Map.EL, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.EL), ...
	PPNNEvaluator_Feature_Map.PROP, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.PROP), ...
	PPNNEvaluator_Feature_Map.TITLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.TITLE), ...
	PPNNEvaluator_Feature_Map.ENABLE, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.ENABLE), ...
	PPNNEvaluator_Feature_Map.WAITBAR, PPNNEvaluator_Feature_Map.getPropDefault(PPNNEvaluator_Feature_Map.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPNNEvaluator_Feature_Map')

for prop = 1:1:PPNNEvaluator_Feature_Map.getPropNumber()
	TAG = upper(PPNNEvaluator_Feature_Map.getPropTag(prop));
	switch PPNNEvaluator_Feature_Map.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PPNNEvaluator_Feature_Map:' BRAPH2.BUG_FUNC], ...
				['PPNNEvaluator_Feature_Map.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

