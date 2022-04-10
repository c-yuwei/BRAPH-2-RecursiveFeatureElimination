%TEST_INDEXEDDICTIONARY

%% Test 1.1: Instantiation - empty

idict = IndexedDictionary();

prop_number = IndexedDictionary.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(IndexedDictionary.getPropTag(prop));
	assert( ...
		isa(idict.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
		['IndexedDictionary.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in IndexedDictionary.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(idict.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
		['IndexedDictionary.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in IndexedDictionary.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:IndexedDictionary')
idict = IndexedDictionary( ...
	IndexedDictionary.ID, IndexedDictionary.getPropDefault(IndexedDictionary.ID), ...
	IndexedDictionary.IT_CLASS, IndexedDictionary.getPropDefault(IndexedDictionary.IT_CLASS), ...
	IndexedDictionary.IT_KEY, IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
	IndexedDictionary.IT_LIST, IndexedDictionary.getPropDefault(IndexedDictionary.IT_LIST) ...
	);
warning('on', 'BRAPH2:IndexedDictionary')

for prop = 1:1:IndexedDictionary.getPropNumber()
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(idict.getr(prop), IndexedDictionary.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by IndexedDictionary.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in IndexedDictionary.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(idict.getr(TAG), IndexedDictionary.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by IndexedDictionary.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in IndexedDictionary.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(idict.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['Being a result, IndexedDictionary.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in IndexedDictionary.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(idict.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['Being a result, IndexedDictionary.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in IndexedDictionary.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:IndexedDictionary')
idict_0 = IndexedDictionary( ...
	IndexedDictionary.ID, IndexedDictionary.getPropDefault(IndexedDictionary.ID), ...
	IndexedDictionary.IT_CLASS, IndexedDictionary.getPropDefault(IndexedDictionary.IT_CLASS), ...
	IndexedDictionary.IT_KEY, IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
	IndexedDictionary.IT_LIST, IndexedDictionary.getPropDefault(IndexedDictionary.IT_LIST) ...
	);
warning('on', 'BRAPH2:IndexedDictionary')

idict_1 = IndexedDictionary( ...
	IndexedDictionary.ID, Callback('EL', idict_0, 'PROP', 1), ...
	IndexedDictionary.IT_CLASS, Callback('EL', idict_0, 'PROP', 2), ...
	IndexedDictionary.IT_KEY, Callback('EL', idict_0, 'PROP', 3), ...
	IndexedDictionary.IT_LIST, Callback('EL', idict_0, 'PROP', 4) ...
	);
	
prop_number = IndexedDictionary.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(idict_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(idict_1.get(prop), idict_0.get(prop)) && ~isa(idict_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(idict_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
idict_2 = IndexedDictionary( ...
	IndexedDictionary.ID, Callback('EL', idict_1, 'PROP', 1), ...
	IndexedDictionary.IT_CLASS, Callback('EL', idict_1, 'PROP', 2), ...
	IndexedDictionary.IT_KEY, Callback('EL', idict_1, 'PROP', 3), ...
	IndexedDictionary.IT_LIST, Callback('EL', idict_1, 'PROP', 4) ...
	);
	
prop_number = IndexedDictionary.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(idict_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(idict_2.get(prop), idict_0.get(prop)) && ~isa(idict_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(idict_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
idict_3 = IndexedDictionary( ...
	IndexedDictionary.ID, Callback('EL', idict_2, 'PROP', 1), ...
	IndexedDictionary.IT_CLASS, Callback('EL', idict_2, 'PROP', 2), ...
	IndexedDictionary.IT_KEY, Callback('EL', idict_2, 'PROP', 3), ...
	IndexedDictionary.IT_LIST, Callback('EL', idict_2, 'PROP', 4) ...
	);
	
prop_number = IndexedDictionary.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(idict_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(idict_3.get(prop), idict_0.get(prop)) && ~isa(idict_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(idict_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:IndexedDictionary')
idict = IndexedDictionary( ...
	IndexedDictionary.ID, IndexedDictionary.getPropDefault(IndexedDictionary.ID), ...
	IndexedDictionary.IT_CLASS, IndexedDictionary.getPropDefault(IndexedDictionary.IT_CLASS), ...
	IndexedDictionary.IT_KEY, IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
	IndexedDictionary.IT_LIST, IndexedDictionary.getPropDefault(IndexedDictionary.IT_LIST) ...
	);
warning('on', 'BRAPH2:IndexedDictionary')

prop_number = IndexedDictionary.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(idict.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(idict.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(idict.getPropSettings(prop))
				assert( ...
					idict.checkFormat(idict.getPropFormat(prop), idict.get(prop)), ...
					[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
					['IndexedDictionary.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					idict.checkFormat(idict.getPropFormat(prop), idict.get(prop), idict.getPropSettings(prop)), ...
					[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
					['IndexedDictionary.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:IndexedDictionary')
idict = IndexedDictionary( ...
	IndexedDictionary.ID, IndexedDictionary.getPropDefault(IndexedDictionary.ID), ...
	IndexedDictionary.IT_CLASS, IndexedDictionary.getPropDefault(IndexedDictionary.IT_CLASS), ...
	IndexedDictionary.IT_KEY, IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
	IndexedDictionary.IT_LIST, IndexedDictionary.getPropDefault(IndexedDictionary.IT_LIST) ...
	);
warning('on', 'BRAPH2:IndexedDictionary')

for prop = 1:1:IndexedDictionary.getPropNumber()
	TAG = upper(IndexedDictionary.getPropTag(prop));
	switch IndexedDictionary.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(idict.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(idict.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(idict.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(idict.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				idict.checkFormat(idict.getPropFormat(prop), idict.getr(prop),idict.getPropSettings(prop)), ...
				[BRAPH2.STR ':IndexedDictionary:' BRAPH2.BUG_FUNC], ...
				['IndexedDictionary.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Instantiation with items

it1 = ETA('PROP_STRING_P', 'item_1');
it2 = ETA('PROP_STRING_P', 'item_2');
it3 = ETA('PROP_STRING_P', 'item_3');
it4 = ETA('PROP_STRING_P', 'item_4');
it5 = ETA('PROP_STRING_P', 'item_5');
it6 = ETA('PROP_STRING_P', 'item_6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

assert_with_error( ...
    ['idict = IndexedDictionary(' ...
    '''id'', ''idict'', ' ...
    '''it_class'', ''ETA'', '...
    '''it_key'', 2, '...
    '''it_list'', {varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, NoValue()}' ...
    ');'], ...
    [BRAPH2.STR ':IndexedDictionary:' BRAPH2.WRONG_INPUT], ...
    it1, it2, it3, it4, it5 ...
    )

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

%% Test 6: Inspection

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.length() does not work.')

assert(isequal(idict.containsIndex(2), true), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.containsIndex() does not work.')
assert(isequal(idict.contains(2), true), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.contains() does not work.')
assert(isequal(idict.containsKey('Key 3'), true), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.containsKey() does not work.')
assert(isequal(idict.contains('Key 3'), 1), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.contains() does not work.')
assert(isequal(idict.containsItem(it4), true), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.containsItem() does not work.')
assert(isequal(idict.contains(it4), 1), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.contains() does not work.')

assert(isequal(idict.getIndexFromKey('Key 1'), 1), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getIndexFromKey() does not work.')
assert(isequal(idict.getIndex('Key 1'), 1), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getIndex() does not work.')
assert(isequal(idict.getIndexFromItem(it4), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getIndexFromItem() does not work.')
assert(isequal(idict.getIndex(it4), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getIndex() does not work.')

assert(isequal(idict.getKeys(), keys), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getKeys() does not work.')
assert(isequal(idict.getKeyFromIndex(2), 'Key 2'), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getKeyFromIndex() does not work.')
assert(isequal(idict.getKey(2), 'Key 2'), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getKey() does not work.')
assert(isequal(idict.getKeyFromItem(it2), 'Key 2'), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getKeyFromItem() does not work.')
assert(isequal(idict.getKey(it2), 'Key 2'), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getKey() does not work.')

assert(isequal(idict.getItems(), items), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getItems() does not work.')
assert(isequal(idict.getItemFromIndex(3), it3), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getItemFromIndex() does not work.')
assert(isequal(idict.getItem(3), it3), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getItemFromIndex() does not work.')
assert(isequal(idict.getItemFromKey('Key 3'), it3), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getItemFromKey() does not work.')
assert(isequal(idict.getItem('Key 3'), it3), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.WRONG_OUTPUT], ...
    'IndexedDictionary.getItem() does not work.')

%% Test 7: Add

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

idict.add(it6)
assert(isequal(idict.length(), 5), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.add() does not work.')
assert(isequal(idict.getItem(5), it6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.add() does not work.')

idict.add(it5, 5)
assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.add() does not work.')
assert(isequal(idict.getItem(5), it5) && isequal(idict.getItem(6), it6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.add() does not work.')

%% Test 8: Remove

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

idict.remove(4)
assert(isequal(idict.length(), 5), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove() does not work.')
assert(isequal(idict.getItem(idict.length()), it6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove() does not work.')

idict.remove(5)
idict.remove(1)
assert(isequal(idict.getItems(), {it2, it3, it5}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove() does not work.')

%% Test 9: Replace

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

idict.replace(it5, 4)

idict.replace(it5, 4)
assert(isequal(idict.length(), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replace() does not work.')
assert(isequal(idict.getKey(4), 'Key 5') && isequal(idict.getItem(4), it5), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replace() does not work.')

idict.replaceKey('Key 5', 'Key 4')
assert(isequal(idict.length(), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replaceKey() does not work.')
assert(isequal(idict.getKey(4), 'Key 4') && isequal(idict.getItem(4), it5), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replaceKey() does not work.')

idict.replaceItem(it5, it4)
assert(isequal(idict.length(), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replaceItem() does not work.')
assert(isequal(idict.getKey(4), 'Key 4') && isequal(idict.getItem(4), it4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.replaceItem() does not work.')

%% Test 10: Invert

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

idict.invert(1, 4)
idict.invert(3, 2)
assert(isequal(idict.length(), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.invert() does not work.')
assert(isequal(idict.getKeys(), {'Key 4', 'Key 3', 'Key 2', 'Key 1'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.invert() does not work.')

%% Test 11: Move_to

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

idict.move_to(1, 4);
idict.move_to(1, 3);
idict.move_to(1, 2);
assert(isequal(idict.length(), 4), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to() does not work.')
assert(isequal(idict.getKeys(), {'Key 4', 'Key 3', 'Key 2', 'Key 1'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to() does not work.')

%% Test 12: Remove all

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

selected = idict.remove_all([1 3 6]);
assert(isequal(idict.length(), 3), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove_all() does not work.')
assert(isequal(idict.getKeys(), {'Key 2', 'Key 4', 'Key 5'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove_all() does not work.')
assert(isequal(selected, []), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.remove_all() does not work.')

%% Test 13: Move up

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

selected = idict.move_up([1 2 4 6]);
assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_up() does not work.')
assert(isequal(idict.getKeys(), {'Key 1', 'Key 2', 'Key 4', 'Key 3', 'Key 6', 'Key 5'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_up() does not work.')
assert(isequal(selected, [1 2 3 5]), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_up() does not work.')

%% Test 14: Move down

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

selected = idict.move_down([1 3 5 6]);
assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_down() does not work.')
assert(isequal(idict.getKeys(), {'Key 2', 'Key 1', 'Key 4', 'Key 3', 'Key 5', 'Key 6'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_down() does not work.')
assert(isequal(selected, [2 4 5 6]), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_down() does not work.')

%% Test 15: Move to top

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

selected = idict.move_to_top([1 3 5 6]);
assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')
assert(isequal(idict.getKeys(), {'Key 1', 'Key 3', 'Key 5', 'Key 6', 'Key 2', 'Key 4'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')
assert(isequal(selected, [1 2 3 4]), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')

%% Test 16: Move to bottom

it1 = ETA('PROP_STRING_P', 'Key 1');
it2 = ETA('PROP_STRING_P', 'Key 2');
it3 = ETA('PROP_STRING_P', 'Key 3');
it4 = ETA('PROP_STRING_P', 'Key 4');
it5 = ETA('PROP_STRING_P', 'Key 5');
it6 = ETA('PROP_STRING_P', 'Key 6');

items = {it1, it2, it3, it4, it5, it6};
keys = cellfun(@(x) x.get('PROP_STRING_P'), items, 'UniformOutput', false);

idict = IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'ETA', ...
    'it_key', 18, ...
    'it_list', items ...
    );

selected = idict.move_to_bottom([1 3 5 6]);
assert(isequal(idict.length(), 6), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')
assert(isequal(idict.getKeys(), {'Key 2', 'Key 4', 'Key 1', 'Key 3', 'Key 5', 'Key 6'}), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')
assert(isequal(selected, [3 4 5 6]), ...
	[BRAPH2.STR ':' class(idict) ':' BRAPH2.BUG_FUNC], ...
    'IndexedDictionary.move_to_top() does not work.')

