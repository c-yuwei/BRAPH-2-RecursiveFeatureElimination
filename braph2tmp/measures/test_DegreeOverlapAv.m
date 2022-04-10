%TEST_DEGREEOVERLAPAV

%% Test 1.1: Instantiation - empty

m = DegreeOverlapAv();

prop_number = DegreeOverlapAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
		['DegreeOverlapAv.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in DegreeOverlapAv.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
		['DegreeOverlapAv.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in DegreeOverlapAv.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:DegreeOverlapAv')
m = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.ID), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.G), ...
	DegreeOverlapAv.M, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.M) ...
	);
warning('on', 'BRAPH2:DegreeOverlapAv')

for prop = 1:1:DegreeOverlapAv.getPropNumber()
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), DegreeOverlapAv.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by DegreeOverlapAv.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in DegreeOverlapAv.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), DegreeOverlapAv.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by DegreeOverlapAv.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in DegreeOverlapAv.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['Being a result, DegreeOverlapAv.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in DegreeOverlapAv.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['Being a result, DegreeOverlapAv.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in DegreeOverlapAv.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:DegreeOverlapAv')
m_0 = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.ID), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.G), ...
	DegreeOverlapAv.M, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.M) ...
	);
warning('on', 'BRAPH2:DegreeOverlapAv')

m_1 = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, Callback('EL', m_0, 'PROP', 1), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, Callback('EL', m_0, 'PROP', 4), ...
	DegreeOverlapAv.M, NoValue() ...
	);
	
prop_number = DegreeOverlapAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, Callback('EL', m_1, 'PROP', 1), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, Callback('EL', m_1, 'PROP', 4), ...
	DegreeOverlapAv.M, NoValue() ...
	);
	
prop_number = DegreeOverlapAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, Callback('EL', m_2, 'PROP', 1), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, Callback('EL', m_2, 'PROP', 4), ...
	DegreeOverlapAv.M, NoValue() ...
	);
	
prop_number = DegreeOverlapAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:DegreeOverlapAv')
m = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.ID), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.G), ...
	DegreeOverlapAv.M, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.M) ...
	);
warning('on', 'BRAPH2:DegreeOverlapAv')

prop_number = DegreeOverlapAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
					['DegreeOverlapAv.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
					['DegreeOverlapAv.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:DegreeOverlapAv')
m = DegreeOverlapAv( ...
	DegreeOverlapAv.ID, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.ID), ...
	DegreeOverlapAv.LABEL, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.LABEL), ...
	DegreeOverlapAv.NOTES, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.NOTES), ...
	DegreeOverlapAv.G, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.G), ...
	DegreeOverlapAv.M, DegreeOverlapAv.getPropDefault(DegreeOverlapAv.M) ...
	);
warning('on', 'BRAPH2:DegreeOverlapAv')

for prop = 1:1:DegreeOverlapAv.getPropNumber()
	TAG = upper(DegreeOverlapAv.getPropTag(prop));
	switch DegreeOverlapAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_FUNC], ...
				['DegreeOverlapAv.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: MultiplexBU

B11 = [
    0   1   1
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   1   0
    ];
B = {B11 B22};

known_degree_overlap = {mean([1 1 0])};

g = MultiplexBU('B', B);
degree_overlap_av = DegreeOverlapAv('G', g);
                 
assert(isequal(degree_overlap_av.get('M'), known_degree_overlap), ...
    [BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_ERR], ...
    'DegreeOverlapAv is not being calculated correctly for MultiplexBU')

%% Test 6: MultiplexBUT

B11 = [
    0   1   1
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   1   0
    ];
B = {B11 B22};

known_degree_overlap = {
                        mean([1 1 0])
                        0};

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
degree_overlap_av = DegreeOverlapAv('G', g);
                 
assert(isequal(degree_overlap_av.get('M'), known_degree_overlap), ...
    [BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_ERR], ...
    'DegreeOverlapAv is not being calculated correctly for MultiplexBUT')

%% Test 7: MultiplexWU

B11 = [
    0   .2  1
    .2  0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   .3
    0   .3  0
    ];
B = {B11 B22};

known_degree_overlap = {mean([1 1 0])};

g = MultiplexWU('B', B);
degree_overlap_av = DegreeOverlapAv('G', g);

assert(isequal(degree_overlap_av.get('M'), known_degree_overlap), ...
    [BRAPH2.STR ':DegreeOverlapAv:' BRAPH2.BUG_ERR], ...
    'DegreeOverlapAv is not being calculated correctly for MultiplexWU')

