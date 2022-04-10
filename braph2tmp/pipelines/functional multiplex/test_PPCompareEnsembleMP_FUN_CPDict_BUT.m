%TEST_PPCOMPAREENSEMBLEMP_FUN_CPDICT_BUT

%% Test 1.1: Instantiation - empty

pr = PPCompareEnsembleMP_FUN_CPDict_BUT();

prop_number = PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
		['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
		['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')
pr = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ID), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.PROP), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')

for prop = 1:1:PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber()
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPCompareEnsembleMP_FUN_CPDict_BUT.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')
pr_0 = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ID), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.PROP), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')

pr_1 = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, Callback('EL', pr_0, 'PROP', 4), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, Callback('EL', pr_1, 'PROP', 4), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, Callback('EL', pr_2, 'PROP', 4), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')
pr = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ID), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.PROP), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')

prop_number = PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
					['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
					['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')
pr = PPCompareEnsembleMP_FUN_CPDict_BUT( ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ID, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ID), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.BKGCOLOR), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.EL, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.EL), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.PROP, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.PROP), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.TITLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.ENABLE), ...
	PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR, PPCompareEnsembleMP_FUN_CPDict_BUT.getPropDefault(PPCompareEnsembleMP_FUN_CPDict_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareEnsembleMP_FUN_CPDict_BUT')

for prop = 1:1:PPCompareEnsembleMP_FUN_CPDict_BUT.getPropNumber()
	TAG = upper(PPCompareEnsembleMP_FUN_CPDict_BUT.getPropTag(prop));
	switch PPCompareEnsembleMP_FUN_CPDict_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PPCompareEnsembleMP_FUN_CPDict_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareEnsembleMP_FUN_CPDict_BUT.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

