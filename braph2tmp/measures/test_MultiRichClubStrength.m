%TEST_MULTIRICHCLUBSTRENGTH

%% Test 1.1: Instantiation - empty

m = MultiRichClubStrength();

prop_number = MultiRichClubStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
		['MultiRichClubStrength.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiRichClubStrength.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
		['MultiRichClubStrength.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiRichClubStrength.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:MultiRichClubStrength')
m = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.ID), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.G), ...
	MultiRichClubStrength.M, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.M), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.PARAMETRIC_VALUE), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubStrength')

for prop = 1:1:MultiRichClubStrength.getPropNumber()
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), MultiRichClubStrength.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by MultiRichClubStrength.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiRichClubStrength.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), MultiRichClubStrength.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by MultiRichClubStrength.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiRichClubStrength.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiRichClubStrength.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiRichClubStrength.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiRichClubStrength.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiRichClubStrength.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:MultiRichClubStrength')
m_0 = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.ID), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.G), ...
	MultiRichClubStrength.M, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.M), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.PARAMETRIC_VALUE), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubStrength')

m_1 = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, Callback('EL', m_0, 'PROP', 1), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, Callback('EL', m_0, 'PROP', 4), ...
	MultiRichClubStrength.M, NoValue(), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, Callback('EL', m_0, 'PROP', 6), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_0, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, Callback('EL', m_1, 'PROP', 1), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, Callback('EL', m_1, 'PROP', 4), ...
	MultiRichClubStrength.M, NoValue(), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, Callback('EL', m_1, 'PROP', 6), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_1, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, Callback('EL', m_2, 'PROP', 1), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, Callback('EL', m_2, 'PROP', 4), ...
	MultiRichClubStrength.M, NoValue(), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, Callback('EL', m_2, 'PROP', 6), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_2, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:MultiRichClubStrength')
m = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.ID), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.G), ...
	MultiRichClubStrength.M, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.M), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.PARAMETRIC_VALUE), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubStrength')

prop_number = MultiRichClubStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
					['MultiRichClubStrength.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
					['MultiRichClubStrength.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:MultiRichClubStrength')
m = MultiRichClubStrength( ...
	MultiRichClubStrength.ID, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.ID), ...
	MultiRichClubStrength.LABEL, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.LABEL), ...
	MultiRichClubStrength.NOTES, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.NOTES), ...
	MultiRichClubStrength.G, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.G), ...
	MultiRichClubStrength.M, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.M), ...
	MultiRichClubStrength.PARAMETRIC_VALUE, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.PARAMETRIC_VALUE), ...
	MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS, MultiRichClubStrength.getPropDefault(MultiRichClubStrength.WEIGHTED_MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubStrength')

for prop = 1:1:MultiRichClubStrength.getPropNumber()
	TAG = upper(MultiRichClubStrength.getPropTag(prop));
	switch MultiRichClubStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubStrength.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: MultiplexWU

B11 = [
    0   .1  1  0; 
    .1  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];
B22 = [
    0   .1  1  1; 
    .1  0   1  .8; 
    1   1   0  0;
    1   .8  0  0
    ];
B = {B11 B22};

known_multi_rich_club_strength = {[5.4/4 5.2/4 2 1.8/4]'};      

g = MultiplexWU('B', B);
multi_rich_club_strength = MultiRichClubStrength('G', g, 'PARAMETRIC_VALUE', 1, 'WEIGHTED_MULTIRICHCLUB_COEFFICIENTS', [3/4, 1/4]).get('M');

assert(isequal(multi_rich_club_strength, known_multi_rich_club_strength), ...
    [BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_ERR], ...
    'MultiRichClubStrength is not being calculated correctly for MultiplexWU.')

%% Test 6: MultiplexWD

B11 = [
    0   1   1  .1; 
    .2  0   1  1; 
    1   1   0  0;
    0   .3  0  0
    ];
B22 = [
    0   1   1   .1; 
    .2  0   1   1; 
    1   1   0   0;
    0   .3  .7  0
    ];
B = {B11 B22};


wmultirich(:, 1, 1) = [1.6 1.6 2 0]';
wmultirich(:, 1, 2) = [0 .5 .5 0]';
known_multi_rich_club_strength = {wmultirich};

g = MultiplexWD('B', B);
multi_rich_club_strength = MultiRichClubStrength('G', g, 'PARAMETRIC_VALUE', [1.5, 2]).get('M');

assert(isequal(multi_rich_club_strength, known_multi_rich_club_strength), ...
    [BRAPH2.STR ':MultiRichClubStrength:' BRAPH2.BUG_ERR], ...
    'MultiRichClubStrength is not being calculated correctly for MultiplexWD.')

