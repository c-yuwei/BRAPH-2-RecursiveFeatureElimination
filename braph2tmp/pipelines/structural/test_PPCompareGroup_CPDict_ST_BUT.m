%TEST_PPCOMPAREGROUP_CPDICT_ST_BUT

%% Test 1.1: Instantiation - empty

pr = PPCompareGroup_CPDict_ST_BUT();

prop_number = PPCompareGroup_CPDict_ST_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
		['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
		['PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')
pr = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ID), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.PROP), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')

for prop = 1:1:PPCompareGroup_CPDict_ST_BUT.getPropNumber()
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PPCompareGroup_CPDict_ST_BUT.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PPCompareGroup_CPDict_ST_BUT.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PPCompareGroup_CPDict_ST_BUT.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PPCompareGroup_CPDict_ST_BUT.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPCompareGroup_CPDict_ST_BUT.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')
pr_0 = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ID), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.PROP), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')

pr_1 = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, Callback('EL', pr_0, 'PROP', 4), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareGroup_CPDict_ST_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, Callback('EL', pr_1, 'PROP', 4), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareGroup_CPDict_ST_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, Callback('EL', pr_2, 'PROP', 4), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
	
prop_number = PPCompareGroup_CPDict_ST_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')
pr = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ID), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.PROP), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')

prop_number = PPCompareGroup_CPDict_ST_BUT.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
					['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
					['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')
pr = PPCompareGroup_CPDict_ST_BUT( ...
	PPCompareGroup_CPDict_ST_BUT.ID, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ID), ...
	PPCompareGroup_CPDict_ST_BUT.BKGCOLOR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.BKGCOLOR), ...
	PPCompareGroup_CPDict_ST_BUT.EL, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.EL), ...
	PPCompareGroup_CPDict_ST_BUT.PROP, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.PROP), ...
	PPCompareGroup_CPDict_ST_BUT.TITLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.TITLE), ...
	PPCompareGroup_CPDict_ST_BUT.ENABLE, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.ENABLE), ...
	PPCompareGroup_CPDict_ST_BUT.WAITBAR, PPCompareGroup_CPDict_ST_BUT.getPropDefault(PPCompareGroup_CPDict_ST_BUT.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPCompareGroup_CPDict_ST_BUT')

for prop = 1:1:PPCompareGroup_CPDict_ST_BUT.getPropNumber()
	TAG = upper(PPCompareGroup_CPDict_ST_BUT.getPropTag(prop));
	switch PPCompareGroup_CPDict_ST_BUT.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PPCompareGroup_CPDict_ST_BUT:' BRAPH2.BUG_FUNC], ...
				['PPCompareGroup_CPDict_ST_BUT.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

