%TEST_BRAINATLAS

%% Test 1.1: Instantiation - empty

ba = BrainAtlas();

prop_number = BrainAtlas.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(BrainAtlas.getPropTag(prop));
	assert( ...
		isa(ba.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
		['BrainAtlas.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in BrainAtlas.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(ba.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
		['BrainAtlas.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in BrainAtlas.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:BrainAtlas')
ba = BrainAtlas( ...
	BrainAtlas.ID, BrainAtlas.getPropDefault(BrainAtlas.ID), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, BrainAtlas.getPropDefault(BrainAtlas.BR_DICT), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
warning('on', 'BRAPH2:BrainAtlas')

for prop = 1:1:BrainAtlas.getPropNumber()
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(ba.getr(prop), BrainAtlas.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by BrainAtlas.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in BrainAtlas.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(ba.getr(TAG), BrainAtlas.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by BrainAtlas.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in BrainAtlas.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(ba.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['Being a result, BrainAtlas.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in BrainAtlas.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(ba.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['Being a result, BrainAtlas.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in BrainAtlas.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:BrainAtlas')
ba_0 = BrainAtlas( ...
	BrainAtlas.ID, BrainAtlas.getPropDefault(BrainAtlas.ID), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, BrainAtlas.getPropDefault(BrainAtlas.BR_DICT), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
warning('on', 'BRAPH2:BrainAtlas')

ba_1 = BrainAtlas( ...
	BrainAtlas.ID, Callback('EL', ba_0, 'PROP', 1), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, Callback('EL', ba_0, 'PROP', 4), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
	
prop_number = BrainAtlas.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(ba_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(ba_1.get(prop), ba_0.get(prop)) && ~isa(ba_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(ba_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
ba_2 = BrainAtlas( ...
	BrainAtlas.ID, Callback('EL', ba_1, 'PROP', 1), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, Callback('EL', ba_1, 'PROP', 4), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
	
prop_number = BrainAtlas.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(ba_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(ba_2.get(prop), ba_0.get(prop)) && ~isa(ba_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(ba_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
ba_3 = BrainAtlas( ...
	BrainAtlas.ID, Callback('EL', ba_2, 'PROP', 1), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, Callback('EL', ba_2, 'PROP', 4), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
	
prop_number = BrainAtlas.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(ba_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(ba_3.get(prop), ba_0.get(prop)) && ~isa(ba_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(ba_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:BrainAtlas')
ba = BrainAtlas( ...
	BrainAtlas.ID, BrainAtlas.getPropDefault(BrainAtlas.ID), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, BrainAtlas.getPropDefault(BrainAtlas.BR_DICT), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
warning('on', 'BRAPH2:BrainAtlas')

prop_number = BrainAtlas.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(ba.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(ba.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(ba.getPropSettings(prop))
				assert( ...
					ba.checkFormat(ba.getPropFormat(prop), ba.get(prop)), ...
					[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
					['BrainAtlas.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					ba.checkFormat(ba.getPropFormat(prop), ba.get(prop), ba.getPropSettings(prop)), ...
					[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
					['BrainAtlas.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:BrainAtlas')
ba = BrainAtlas( ...
	BrainAtlas.ID, BrainAtlas.getPropDefault(BrainAtlas.ID), ...
	BrainAtlas.LABEL, BrainAtlas.getPropDefault(BrainAtlas.LABEL), ...
	BrainAtlas.NOTES, BrainAtlas.getPropDefault(BrainAtlas.NOTES), ...
	BrainAtlas.BR_DICT, BrainAtlas.getPropDefault(BrainAtlas.BR_DICT), ...
	BrainAtlas.SURF, BrainAtlas.getPropDefault(BrainAtlas.SURF) ...
	);
warning('on', 'BRAPH2:BrainAtlas')

for prop = 1:1:BrainAtlas.getPropNumber()
	TAG = upper(BrainAtlas.getPropTag(prop));
	switch BrainAtlas.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(ba.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(ba.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(ba.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(ba.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				ba.checkFormat(ba.getPropFormat(prop), ba.getr(prop),ba.getPropSettings(prop)), ...
				[BRAPH2.STR ':BrainAtlas:' BRAPH2.BUG_FUNC], ...
				['BrainAtlas.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Basic functions

br1 = BrainRegion('ID', 'id1', 'LABEL', 'label1', 'NOTES', 'notes1', 'X', 1, 'Y', 1, 'Z', 1);
br2 = BrainRegion('ID', 'id2', 'LABEL', 'label2', 'NOTES', 'notes2', 'X', 2, 'Y', 2, 'Z', 2);
br3 = BrainRegion('ID', 'id3', 'LABEL', 'label3', 'NOTES', 'notes3', 'X', 3, 'Y', 3, 'Z', 3);
br4 = BrainRegion('ID', 'id4', 'LABEL', 'label4', 'NOTES', 'notes4', 'X', 4, 'Y', 4, 'Z', 4);
br5 = BrainRegion('ID', 'id5', 'LABEL', 'label5', 'NOTES', 'notes5', 'X', 5, 'Y', 5, 'Z', 5);
br6 = BrainRegion('ID', 'id6', 'LABEL', 'label6', 'NOTES', 'notes6', 'X', 6, 'Y', 6, 'Z', 6);

items = {br1, br2, br3, br4, br5, br6};

idict_1 = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'BrainRegion', ...
    'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'it_list', items ...
    );
ba = BrainAtlas('ID', 'BA1', 'LABEL', 'brain atlas', 'Notes', 'Notes on brain atlas.', 'br_dict', idict_1);
assert(ischar(ba.tostring()), ...
    [BRAPH2.STR ':BrainAtlas:' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.tostring() must return a string.')

%% Test 6: Get methods

br1 = BrainRegion('ID', 'id1', 'LABEL', 'label1', 'NOTES', 'notes1', 'X', 1, 'Y', 1, 'Z', 1);
br2 = BrainRegion('ID', 'id2', 'LABEL', 'label2', 'NOTES', 'notes2', 'X', 2, 'Y', 2, 'Z', 2);
br3 = BrainRegion('ID', 'id3', 'LABEL', 'label3', 'NOTES', 'notes3', 'X', 3, 'Y', 3, 'Z', 3);
br4 = BrainRegion('ID', 'id4', 'LABEL', 'label4', 'NOTES', 'notes4', 'X', 4, 'Y', 4, 'Z', 4);
br5 = BrainRegion('ID', 'id5', 'LABEL', 'label5', 'NOTES', 'notes5', 'X', 5, 'Y', 5, 'Z', 5);
br6 = BrainRegion('ID', 'id6', 'LABEL', 'label6', 'NOTES', 'notes6', 'X', 6, 'Y', 6, 'Z', 6);

items = {br1, br2, br3, br4, br5, br6};

idict_1 = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'BrainRegion', ...
    'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'it_list', items ...
    );
ba = BrainAtlas('ID', 'BA1', 'LABEL', 'brain atlas', 'Notes', 'Notes on brain atlas.', 'br_dict', idict_1);

assert(isequal(ba.get('ID'), 'BA1'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.get() does not work.')
assert(isequal(ba.get('LABEL'), 'brain atlas'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.get() does not work.')
assert(isequal(ba.get('NOTES'), 'Notes on brain atlas.'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.get() does not work.')
assert(isequal(ba.get('BR_DICT'), idict_1), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.get() does not work.')

%% Test 7: Set methods

br1 = BrainRegion('ID', 'id1', 'LABEL', 'label1', 'NOTES', 'notes1', 'X', 1, 'Y', 1, 'Z', 1);
br2 = BrainRegion('ID', 'id2', 'LABEL', 'label2', 'NOTES', 'notes2', 'X', 2, 'Y', 2, 'Z', 2);
br3 = BrainRegion('ID', 'id3', 'LABEL', 'label3', 'NOTES', 'notes3', 'X', 3, 'Y', 3, 'Z', 3);
br4 = BrainRegion('ID', 'id4', 'LABEL', 'label4', 'NOTES', 'notes4', 'X', 4, 'Y', 4, 'Z', 4);
br5 = BrainRegion('ID', 'id5', 'LABEL', 'label5', 'NOTES', 'notes5', 'X', 5, 'Y', 5, 'Z', 5);
br6 = BrainRegion('ID', 'id6', 'LABEL', 'label6', 'NOTES', 'notes6', 'X', 6, 'Y', 6, 'Z', 6);

items = {br1, br2, br3, br4, br5, br6};

idict_1 = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'BrainRegion', ...
    'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'it_list', items ...
    );
ba = BrainAtlas();
ba.set('ID', 'BA1');
ba.set('LABEL', 'brain atlas');
ba.set('NOTES', 'Notes on brain atlas.');
ba.set('br_dict', idict_1);

assert(isequal(ba.get('ID'), 'BA1'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.set() does not work.')
assert(isequal(ba.get('LABEL'), 'brain atlas'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.set() does not work.')
assert(isequal(ba.get('NOTES'), 'Notes on brain atlas.'), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.set() does not work.')
assert(isequal(ba.get('BR_DICT'), idict_1), ...
    [BRAPH2.STR ':' class(ba) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainAtlas.set() does not work.')

%% Test 8: Plot Brain Atlas GUI

br1 = BrainRegion('ID', 'id1', 'LABEL', 'label1', 'NOTES', 'notes1', 'X', 1, 'Y', 1, 'Z', 1);
br2 = BrainRegion('ID', 'id2', 'LABEL', 'label2', 'NOTES', 'notes2', 'X', 2, 'Y', 2, 'Z', 2);
br3 = BrainRegion('ID', 'id3', 'LABEL', 'label3', 'NOTES', 'notes3', 'X', 3, 'Y', 3, 'Z', 3);
br4 = BrainRegion('ID', 'id4', 'LABEL', 'label4', 'NOTES', 'notes4', 'X', 4, 'Y', 4, 'Z', 4);
br5 = BrainRegion('ID', 'id5', 'LABEL', 'label5', 'NOTES', 'notes5', 'X', 5, 'Y', 5, 'Z', 5);
br6 = BrainRegion('ID', 'id6', 'LABEL', 'label6', 'NOTES', 'notes6', 'X', 6, 'Y', 6, 'Z', 6);

items = {br1, br2, br3, br4, br5, br6};

idict_1 = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'BrainRegion', ...
    'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'it_list', items ...
    );
ba = BrainAtlas('ID', 'BA1', 'LABEL', 'brain atlas', 'Notes', 'Notes on brain atlas.', 'br_dict', idict_1);
GUI('PE', ba, 'CLOSEREQ', false).draw()

close(gcf)

