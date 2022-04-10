%TEST_IMPORTERGROUPSUBJECTST_MP_XLS

%% Test 1.1: Instantiation - empty

im = ImporterGroupSubjectST_MP_XLS();

prop_number = ImporterGroupSubjectST_MP_XLS.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	assert( ...
		isa(im.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
		['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(im.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
		['ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')
im = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.ID), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.DIRECTORY), ...
	ImporterGroupSubjectST_MP_XLS.BA, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.BA), ...
	ImporterGroupSubjectST_MP_XLS.GR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.GR) ...
	);
warning('on', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')

for prop = 1:1:ImporterGroupSubjectST_MP_XLS.getPropNumber()
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(im.getr(prop), ImporterGroupSubjectST_MP_XLS.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by ImporterGroupSubjectST_MP_XLS.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(im.getr(TAG), ImporterGroupSubjectST_MP_XLS.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by ImporterGroupSubjectST_MP_XLS.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(im.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['Being a result, ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(im.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['Being a result, ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in ImporterGroupSubjectST_MP_XLS.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')
im_0 = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.ID), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.DIRECTORY), ...
	ImporterGroupSubjectST_MP_XLS.BA, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.BA), ...
	ImporterGroupSubjectST_MP_XLS.GR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.GR) ...
	);
warning('on', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')

im_1 = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, Callback('EL', im_0, 'PROP', 1), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, Callback('EL', im_0, 'PROP', 5), ...
	ImporterGroupSubjectST_MP_XLS.BA, Callback('EL', im_0, 'PROP', 6), ...
	ImporterGroupSubjectST_MP_XLS.GR, NoValue() ...
	);
	
prop_number = ImporterGroupSubjectST_MP_XLS.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(im_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(im_1.get(prop), im_0.get(prop)) && ~isa(im_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(im_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
im_2 = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, Callback('EL', im_1, 'PROP', 1), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, Callback('EL', im_1, 'PROP', 5), ...
	ImporterGroupSubjectST_MP_XLS.BA, Callback('EL', im_1, 'PROP', 6), ...
	ImporterGroupSubjectST_MP_XLS.GR, NoValue() ...
	);
	
prop_number = ImporterGroupSubjectST_MP_XLS.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(im_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(im_2.get(prop), im_0.get(prop)) && ~isa(im_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(im_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
im_3 = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, Callback('EL', im_2, 'PROP', 1), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, Callback('EL', im_2, 'PROP', 5), ...
	ImporterGroupSubjectST_MP_XLS.BA, Callback('EL', im_2, 'PROP', 6), ...
	ImporterGroupSubjectST_MP_XLS.GR, NoValue() ...
	);
	
prop_number = ImporterGroupSubjectST_MP_XLS.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(im_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(im_3.get(prop), im_0.get(prop)) && ~isa(im_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(im_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')
im = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.ID), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.DIRECTORY), ...
	ImporterGroupSubjectST_MP_XLS.BA, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.BA), ...
	ImporterGroupSubjectST_MP_XLS.GR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.GR) ...
	);
warning('on', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')

prop_number = ImporterGroupSubjectST_MP_XLS.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(im.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(im.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(im.getPropSettings(prop))
				assert( ...
					im.checkFormat(im.getPropFormat(prop), im.get(prop)), ...
					[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
					['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					im.checkFormat(im.getPropFormat(prop), im.get(prop), im.getPropSettings(prop)), ...
					[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
					['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')
im = ImporterGroupSubjectST_MP_XLS( ...
	ImporterGroupSubjectST_MP_XLS.ID, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.ID), ...
	ImporterGroupSubjectST_MP_XLS.LABEL, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.LABEL), ...
	ImporterGroupSubjectST_MP_XLS.NOTES, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.NOTES), ...
	ImporterGroupSubjectST_MP_XLS.WAITBAR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.WAITBAR), ...
	ImporterGroupSubjectST_MP_XLS.DIRECTORY, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.DIRECTORY), ...
	ImporterGroupSubjectST_MP_XLS.BA, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.BA), ...
	ImporterGroupSubjectST_MP_XLS.GR, ImporterGroupSubjectST_MP_XLS.getPropDefault(ImporterGroupSubjectST_MP_XLS.GR) ...
	);
warning('on', 'BRAPH2:ImporterGroupSubjectST_MP_XLS')

for prop = 1:1:ImporterGroupSubjectST_MP_XLS.getPropNumber()
	TAG = upper(ImporterGroupSubjectST_MP_XLS.getPropTag(prop));
	switch ImporterGroupSubjectST_MP_XLS.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(im.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(im.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(im.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(im.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				im.checkFormat(im.getPropFormat(prop), im.getr(prop),im.getPropSettings(prop)), ...
				[BRAPH2.STR ':ImporterGroupSubjectST_MP_XLS:' BRAPH2.BUG_FUNC], ...
				['ImporterGroupSubjectST_MP_XLS.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

