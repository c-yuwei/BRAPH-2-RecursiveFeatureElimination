%TEST_PPBRAINATLAS_BRDICT

%% Test 1.1: Instantiation - empty

pl = PPBrainAtlas_BRDict();

prop_number = PPBrainAtlas_BRDict.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	assert( ...
		isa(pl.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
		['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPBrainAtlas_BRDict.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pl.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
		['PPBrainAtlas_BRDict.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PPBrainAtlas_BRDict.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PPBrainAtlas_BRDict')
pl = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ID), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.PROP), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPBrainAtlas_BRDict')

for prop = 1:1:PPBrainAtlas_BRDict.getPropNumber()
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pl.getr(prop), PPBrainAtlas_BRDict.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PPBrainAtlas_BRDict.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPBrainAtlas_BRDict.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pl.getr(TAG), PPBrainAtlas_BRDict.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PPBrainAtlas_BRDict.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PPBrainAtlas_BRDict.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pl.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPBrainAtlas_BRDict.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pl.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['Being a result, PPBrainAtlas_BRDict.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PPBrainAtlas_BRDict.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PPBrainAtlas_BRDict')
pl_0 = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ID), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.PROP), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPBrainAtlas_BRDict')

pl_1 = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, Callback('EL', pl_0, 'PROP', 1), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, Callback('EL', pl_0, 'PROP', 4), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
	
prop_number = PPBrainAtlas_BRDict.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pl_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pl_1.get(prop), pl_0.get(prop)) && ~isa(pl_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pl_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pl_2 = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, Callback('EL', pl_1, 'PROP', 1), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, Callback('EL', pl_1, 'PROP', 4), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
	
prop_number = PPBrainAtlas_BRDict.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pl_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pl_2.get(prop), pl_0.get(prop)) && ~isa(pl_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pl_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pl_3 = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, Callback('EL', pl_2, 'PROP', 1), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, Callback('EL', pl_2, 'PROP', 4), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
	
prop_number = PPBrainAtlas_BRDict.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pl_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pl_3.get(prop), pl_0.get(prop)) && ~isa(pl_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pl_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PPBrainAtlas_BRDict')
pl = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ID), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.PROP), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPBrainAtlas_BRDict')

prop_number = PPBrainAtlas_BRDict.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pl.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pl.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pl.getPropSettings(prop))
				assert( ...
					pl.checkFormat(pl.getPropFormat(prop), pl.get(prop)), ...
					[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
					['PPBrainAtlas_BRDict.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pl.checkFormat(pl.getPropFormat(prop), pl.get(prop), pl.getPropSettings(prop)), ...
					[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
					['PPBrainAtlas_BRDict.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PPBrainAtlas_BRDict')
pl = PPBrainAtlas_BRDict( ...
	PPBrainAtlas_BRDict.ID, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ID), ...
	PPBrainAtlas_BRDict.BKGCOLOR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.BKGCOLOR), ...
	PPBrainAtlas_BRDict.EL, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.EL), ...
	PPBrainAtlas_BRDict.PROP, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.PROP), ...
	PPBrainAtlas_BRDict.TITLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.TITLE), ...
	PPBrainAtlas_BRDict.ENABLE, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.ENABLE), ...
	PPBrainAtlas_BRDict.WAITBAR, PPBrainAtlas_BRDict.getPropDefault(PPBrainAtlas_BRDict.WAITBAR) ...
	);
warning('on', 'BRAPH2:PPBrainAtlas_BRDict')

for prop = 1:1:PPBrainAtlas_BRDict.getPropNumber()
	TAG = upper(PPBrainAtlas_BRDict.getPropTag(prop));
	switch PPBrainAtlas_BRDict.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pl.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pl.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pl.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pl.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pl.checkFormat(pl.getPropFormat(prop), pl.getr(prop),pl.getPropSettings(prop)), ...
				[BRAPH2.STR ':PPBrainAtlas_BRDict:' BRAPH2.BUG_FUNC], ...
				['PPBrainAtlas_BRDict.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

