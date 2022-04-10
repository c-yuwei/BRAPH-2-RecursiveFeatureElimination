%TEST_SUBJECTST_MP

%% Test 1.1: Instantiation - empty

sub = SubjectST_MP();

prop_number = SubjectST_MP.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(SubjectST_MP.getPropTag(prop));
	assert( ...
		isa(sub.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
		['SubjectST_MP.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in SubjectST_MP.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(sub.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
		['SubjectST_MP.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in SubjectST_MP.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:SubjectST_MP')
sub = SubjectST_MP( ...
	SubjectST_MP.ID, SubjectST_MP.getPropDefault(SubjectST_MP.ID), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, SubjectST_MP.getPropDefault(SubjectST_MP.BA), ...
	SubjectST_MP.L, SubjectST_MP.getPropDefault(SubjectST_MP.L), ...
	SubjectST_MP.ST_MP, SubjectST_MP.getPropDefault(SubjectST_MP.ST_MP), ...
	SubjectST_MP.AGE, SubjectST_MP.getPropDefault(SubjectST_MP.AGE), ...
	SubjectST_MP.SEX, SubjectST_MP.getPropDefault(SubjectST_MP.SEX) ...
	);
warning('on', 'BRAPH2:SubjectST_MP')

for prop = 1:1:SubjectST_MP.getPropNumber()
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(sub.getr(prop), SubjectST_MP.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by SubjectST_MP.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in SubjectST_MP.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(sub.getr(TAG), SubjectST_MP.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by SubjectST_MP.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in SubjectST_MP.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(sub.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['Being a result, SubjectST_MP.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in SubjectST_MP.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(sub.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['Being a result, SubjectST_MP.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in SubjectST_MP.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:SubjectST_MP')
sub_0 = SubjectST_MP( ...
	SubjectST_MP.ID, SubjectST_MP.getPropDefault(SubjectST_MP.ID), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, SubjectST_MP.getPropDefault(SubjectST_MP.BA), ...
	SubjectST_MP.L, SubjectST_MP.getPropDefault(SubjectST_MP.L), ...
	SubjectST_MP.ST_MP, SubjectST_MP.getPropDefault(SubjectST_MP.ST_MP), ...
	SubjectST_MP.AGE, SubjectST_MP.getPropDefault(SubjectST_MP.AGE), ...
	SubjectST_MP.SEX, SubjectST_MP.getPropDefault(SubjectST_MP.SEX) ...
	);
warning('on', 'BRAPH2:SubjectST_MP')

sub_1 = SubjectST_MP( ...
	SubjectST_MP.ID, Callback('EL', sub_0, 'PROP', 1), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, Callback('EL', sub_0, 'PROP', 4), ...
	SubjectST_MP.L, Callback('EL', sub_0, 'PROP', 5), ...
	SubjectST_MP.ST_MP, Callback('EL', sub_0, 'PROP', 6), ...
	SubjectST_MP.AGE, Callback('EL', sub_0, 'PROP', 7), ...
	SubjectST_MP.SEX, Callback('EL', sub_0, 'PROP', 8) ...
	);
	
prop_number = SubjectST_MP.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(sub_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(sub_1.get(prop), sub_0.get(prop)) && ~isa(sub_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(sub_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
sub_2 = SubjectST_MP( ...
	SubjectST_MP.ID, Callback('EL', sub_1, 'PROP', 1), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, Callback('EL', sub_1, 'PROP', 4), ...
	SubjectST_MP.L, Callback('EL', sub_1, 'PROP', 5), ...
	SubjectST_MP.ST_MP, Callback('EL', sub_1, 'PROP', 6), ...
	SubjectST_MP.AGE, Callback('EL', sub_1, 'PROP', 7), ...
	SubjectST_MP.SEX, Callback('EL', sub_1, 'PROP', 8) ...
	);
	
prop_number = SubjectST_MP.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(sub_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(sub_2.get(prop), sub_0.get(prop)) && ~isa(sub_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(sub_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
sub_3 = SubjectST_MP( ...
	SubjectST_MP.ID, Callback('EL', sub_2, 'PROP', 1), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, Callback('EL', sub_2, 'PROP', 4), ...
	SubjectST_MP.L, Callback('EL', sub_2, 'PROP', 5), ...
	SubjectST_MP.ST_MP, Callback('EL', sub_2, 'PROP', 6), ...
	SubjectST_MP.AGE, Callback('EL', sub_2, 'PROP', 7), ...
	SubjectST_MP.SEX, Callback('EL', sub_2, 'PROP', 8) ...
	);
	
prop_number = SubjectST_MP.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(sub_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(sub_3.get(prop), sub_0.get(prop)) && ~isa(sub_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(sub_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:SubjectST_MP')
sub = SubjectST_MP( ...
	SubjectST_MP.ID, SubjectST_MP.getPropDefault(SubjectST_MP.ID), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, SubjectST_MP.getPropDefault(SubjectST_MP.BA), ...
	SubjectST_MP.L, SubjectST_MP.getPropDefault(SubjectST_MP.L), ...
	SubjectST_MP.ST_MP, SubjectST_MP.getPropDefault(SubjectST_MP.ST_MP), ...
	SubjectST_MP.AGE, SubjectST_MP.getPropDefault(SubjectST_MP.AGE), ...
	SubjectST_MP.SEX, SubjectST_MP.getPropDefault(SubjectST_MP.SEX) ...
	);
warning('on', 'BRAPH2:SubjectST_MP')

prop_number = SubjectST_MP.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(sub.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(sub.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(sub.getPropSettings(prop))
				assert( ...
					sub.checkFormat(sub.getPropFormat(prop), sub.get(prop)), ...
					[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
					['SubjectST_MP.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					sub.checkFormat(sub.getPropFormat(prop), sub.get(prop), sub.getPropSettings(prop)), ...
					[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
					['SubjectST_MP.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:SubjectST_MP')
sub = SubjectST_MP( ...
	SubjectST_MP.ID, SubjectST_MP.getPropDefault(SubjectST_MP.ID), ...
	SubjectST_MP.LABEL, SubjectST_MP.getPropDefault(SubjectST_MP.LABEL), ...
	SubjectST_MP.NOTES, SubjectST_MP.getPropDefault(SubjectST_MP.NOTES), ...
	SubjectST_MP.BA, SubjectST_MP.getPropDefault(SubjectST_MP.BA), ...
	SubjectST_MP.L, SubjectST_MP.getPropDefault(SubjectST_MP.L), ...
	SubjectST_MP.ST_MP, SubjectST_MP.getPropDefault(SubjectST_MP.ST_MP), ...
	SubjectST_MP.AGE, SubjectST_MP.getPropDefault(SubjectST_MP.AGE), ...
	SubjectST_MP.SEX, SubjectST_MP.getPropDefault(SubjectST_MP.SEX) ...
	);
warning('on', 'BRAPH2:SubjectST_MP')

for prop = 1:1:SubjectST_MP.getPropNumber()
	TAG = upper(SubjectST_MP.getPropTag(prop));
	switch SubjectST_MP.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(sub.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(sub.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(sub.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(sub.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				sub.checkFormat(sub.getPropFormat(prop), sub.getr(prop),sub.getPropSettings(prop)), ...
				[BRAPH2.STR ':SubjectST_MP:' BRAPH2.BUG_FUNC], ...
				['SubjectST_MP.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

