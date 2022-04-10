%TEST_MULTIRICHCLUBDEGREE

%% Test 1.1: Instantiation - empty

m = MultiRichClubDegree();

prop_number = MultiRichClubDegree.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
		['MultiRichClubDegree.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiRichClubDegree.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
		['MultiRichClubDegree.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiRichClubDegree.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:MultiRichClubDegree')
m = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.ID), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.G), ...
	MultiRichClubDegree.M, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.M), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.PARAMETRIC_VALUE), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubDegree')

for prop = 1:1:MultiRichClubDegree.getPropNumber()
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), MultiRichClubDegree.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by MultiRichClubDegree.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiRichClubDegree.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), MultiRichClubDegree.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by MultiRichClubDegree.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiRichClubDegree.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiRichClubDegree.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiRichClubDegree.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiRichClubDegree.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiRichClubDegree.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:MultiRichClubDegree')
m_0 = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.ID), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.G), ...
	MultiRichClubDegree.M, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.M), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.PARAMETRIC_VALUE), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubDegree')

m_1 = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, Callback('EL', m_0, 'PROP', 1), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, Callback('EL', m_0, 'PROP', 4), ...
	MultiRichClubDegree.M, NoValue(), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, Callback('EL', m_0, 'PROP', 6), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_0, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubDegree.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, Callback('EL', m_1, 'PROP', 1), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, Callback('EL', m_1, 'PROP', 4), ...
	MultiRichClubDegree.M, NoValue(), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, Callback('EL', m_1, 'PROP', 6), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_1, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubDegree.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, Callback('EL', m_2, 'PROP', 1), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, Callback('EL', m_2, 'PROP', 4), ...
	MultiRichClubDegree.M, NoValue(), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, Callback('EL', m_2, 'PROP', 6), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, Callback('EL', m_2, 'PROP', 7) ...
	);
	
prop_number = MultiRichClubDegree.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:MultiRichClubDegree')
m = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.ID), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.G), ...
	MultiRichClubDegree.M, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.M), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.PARAMETRIC_VALUE), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubDegree')

prop_number = MultiRichClubDegree.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
					['MultiRichClubDegree.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
					['MultiRichClubDegree.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:MultiRichClubDegree')
m = MultiRichClubDegree( ...
	MultiRichClubDegree.ID, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.ID), ...
	MultiRichClubDegree.LABEL, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.LABEL), ...
	MultiRichClubDegree.NOTES, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.NOTES), ...
	MultiRichClubDegree.G, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.G), ...
	MultiRichClubDegree.M, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.M), ...
	MultiRichClubDegree.PARAMETRIC_VALUE, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.PARAMETRIC_VALUE), ...
	MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS, MultiRichClubDegree.getPropDefault(MultiRichClubDegree.MULTIRICHCLUB_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:MultiRichClubDegree')

for prop = 1:1:MultiRichClubDegree.getPropNumber()
	TAG = upper(MultiRichClubDegree.getPropTag(prop));
	switch MultiRichClubDegree.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_FUNC], ...
				['MultiRichClubDegree.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: MultiplexBU

B11 = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];
B22 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    1  1  0  0
    ];
B = {B11 B22};

known_multi_rich_club_degree = {[5/2 5/2 2 1]'};   

g = MultiplexBU('B', B);
multi_rich_club_degree = MultiRichClubDegree('G', g).get('M');

assert(isequal(multi_rich_club_degree, known_multi_rich_club_degree), ...
    [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_ERR], ...
    'MultiRichClubDegree is not being calculated correctly for MultiplexBU.')

%% Test 6: MultiplexBUT

B11 = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];
B22 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    1  1  0  0
    ];
B = {B11 B22};

known_multi_rich_club_degree = {
                                [5/2 5/2  2  1]'
                                [0   0    0  0]'};

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
multi_rich_club_degree = MultiRichClubDegree('G', g).get('M');

assert(isequal(multi_rich_club_degree, known_multi_rich_club_degree), ...
    [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_ERR], ...
    'MultiRichClubDegree is not being calculated correctly for MultiplexBUT.')

%% Test 7: MultiplexBD

B11 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];
B22 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    0  1  1  0
    ];
B = {B11 B22};

mrich(:, 1, 1) = [5/2 3 13/6 5/3]';
mrich(:, 1, 2) = [4/3 4/3 2/3 0]';
known_multi_rich_club_degree = {mrich};

g = MultiplexBD('B', B);
multi_rich_club_degree = MultiRichClubDegree('G', g, 'PARAMETRIC_VALUE', 2, 'MULTIRICHCLUB_COEFFICIENTS', [2/3, 1/3]).get('M');

assert(isequal(round(multi_rich_club_degree{1}, 10), round(known_multi_rich_club_degree{1}, 10)), ...
    [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_ERR], ...
    'MultiRichClubDegree is not being calculated correctly for MultiplexBD.')

%% Test 8: MultiplexWU

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

known_multi_rich_club_degree = {[9/4 9/4 2 1/2]'};   

g = MultiplexWU('B', B);
multi_rich_club_degree = MultiRichClubDegree('G', g, 'MULTIRICHCLUB_COEFFICIENTS', [3/4, 1/4]).get('M');

assert(isequal(multi_rich_club_degree, known_multi_rich_club_degree), ...
    [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_ERR], ...
    'MultiRichClubDegree is not being calculated correctly for MultiplexWU.')

%% Test 9: MultiplexWD

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

mrich(:, 1, 1) = [5/2 3 17/8 13/8]';
mrich(:, 1, 2) = [5/4 5/4 1/2 0]';
known_multi_rich_club_degree = {mrich};

g = MultiplexWD('B', B);
multi_rich_club_degree = MultiRichClubDegree('G', g, 'PARAMETRIC_VALUE', 2, 'MULTIRICHCLUB_COEFFICIENTS', [3/4, 1/4]).get('M');

assert(isequal(multi_rich_club_degree, known_multi_rich_club_degree), ...
    [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.BUG_ERR], ...
    'MultiRichClubDegree is not being calculated correctly for MultiplexWD.')

