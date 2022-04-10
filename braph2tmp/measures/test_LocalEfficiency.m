%TEST_LOCALEFFICIENCY

%% Test 1.1: Instantiation - empty

m = LocalEfficiency();

prop_number = LocalEfficiency.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(LocalEfficiency.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
		['LocalEfficiency.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in LocalEfficiency.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
		['LocalEfficiency.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in LocalEfficiency.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:LocalEfficiency')
m = LocalEfficiency( ...
	LocalEfficiency.ID, LocalEfficiency.getPropDefault(LocalEfficiency.ID), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, LocalEfficiency.getPropDefault(LocalEfficiency.G), ...
	LocalEfficiency.M, LocalEfficiency.getPropDefault(LocalEfficiency.M) ...
	);
warning('on', 'BRAPH2:LocalEfficiency')

for prop = 1:1:LocalEfficiency.getPropNumber()
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), LocalEfficiency.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by LocalEfficiency.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in LocalEfficiency.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), LocalEfficiency.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by LocalEfficiency.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in LocalEfficiency.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['Being a result, LocalEfficiency.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in LocalEfficiency.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['Being a result, LocalEfficiency.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in LocalEfficiency.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:LocalEfficiency')
m_0 = LocalEfficiency( ...
	LocalEfficiency.ID, LocalEfficiency.getPropDefault(LocalEfficiency.ID), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, LocalEfficiency.getPropDefault(LocalEfficiency.G), ...
	LocalEfficiency.M, LocalEfficiency.getPropDefault(LocalEfficiency.M) ...
	);
warning('on', 'BRAPH2:LocalEfficiency')

m_1 = LocalEfficiency( ...
	LocalEfficiency.ID, Callback('EL', m_0, 'PROP', 1), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, Callback('EL', m_0, 'PROP', 4), ...
	LocalEfficiency.M, NoValue() ...
	);
	
prop_number = LocalEfficiency.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = LocalEfficiency( ...
	LocalEfficiency.ID, Callback('EL', m_1, 'PROP', 1), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, Callback('EL', m_1, 'PROP', 4), ...
	LocalEfficiency.M, NoValue() ...
	);
	
prop_number = LocalEfficiency.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = LocalEfficiency( ...
	LocalEfficiency.ID, Callback('EL', m_2, 'PROP', 1), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, Callback('EL', m_2, 'PROP', 4), ...
	LocalEfficiency.M, NoValue() ...
	);
	
prop_number = LocalEfficiency.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:LocalEfficiency')
m = LocalEfficiency( ...
	LocalEfficiency.ID, LocalEfficiency.getPropDefault(LocalEfficiency.ID), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, LocalEfficiency.getPropDefault(LocalEfficiency.G), ...
	LocalEfficiency.M, LocalEfficiency.getPropDefault(LocalEfficiency.M) ...
	);
warning('on', 'BRAPH2:LocalEfficiency')

prop_number = LocalEfficiency.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
					['LocalEfficiency.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
					['LocalEfficiency.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:LocalEfficiency')
m = LocalEfficiency( ...
	LocalEfficiency.ID, LocalEfficiency.getPropDefault(LocalEfficiency.ID), ...
	LocalEfficiency.LABEL, LocalEfficiency.getPropDefault(LocalEfficiency.LABEL), ...
	LocalEfficiency.NOTES, LocalEfficiency.getPropDefault(LocalEfficiency.NOTES), ...
	LocalEfficiency.G, LocalEfficiency.getPropDefault(LocalEfficiency.G), ...
	LocalEfficiency.M, LocalEfficiency.getPropDefault(LocalEfficiency.M) ...
	);
warning('on', 'BRAPH2:LocalEfficiency')

for prop = 1:1:LocalEfficiency.getPropNumber()
	TAG = upper(LocalEfficiency.getPropTag(prop));
	switch LocalEfficiency.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_FUNC], ...
				['LocalEfficiency.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: GraphBU

B = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];

known_local_efficiency = {[5/6 1 5/6 1]'};

g = GraphBU('B', B);
local_efficiency = LocalEfficiency('G', g).get('M');

assert(isequal(local_efficiency, known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_ERR], ...
    'LocalEfficiency is not being calculated correctly for GraphBU.')

%% Test 6: GraphWU

B = [
    0   .2  .2  .1
    .2  0   .3  0
    .2  .3  0   .3
    .1  0   .3  0
    ];

known_local_efficiency = {[1/4 1/5 .1222 1/5]'};

g = GraphWU('B', B);
local_efficiency = LocalEfficiency('G', g).get('M');
assert(isequal(round(local_efficiency{1}, 4), known_local_efficiency{1}), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_ERR], ...
    'LocalEfficiency is not being calculated correctly for GraphWU.')

%% Test 7: MultiplexBU

B11 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];

B22 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];
B = {B11 B22};

known_local_efficiency = {
                         [5/6 1 5/6 1]'
                         [5/6 1 5/6 1]'
                         };

g = MultiplexBU('B', B);
local_efficiency = LocalEfficiency('G', g).get('M');

assert(isequal(local_efficiency, known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_ERR], ...
    'LocalEfficiency is not being calculated correctly for MultiplexBU.')

%% Test 8: MultiplexWU

B11 = [
      0   .2  .2  .1
      .2  0   .3  0
      .2  .3  0   .3
      .1  0   .3  0
      ];

B22 = [
      0   .2  .2  .1
      .2  0   .3  0
      .2  .3  0   .3
      .1  0   .3  0
      ];
B = {B11 B22};

known_local_efficiency = {
                         [1/4 1/5 .1222 1/5]'
                         [1/4 1/5 .1222 1/5]'
                         };

g = MultiplexWU('B', B);
local_efficiency = LocalEfficiency('G', g).get('M');
local_efficiency = cellfun(@(s) round(s, 4), local_efficiency, 'UniformOutput', false);

assert(isequal(local_efficiency, known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.BUG_ERR], ...
    'LocalEfficiency is not being calculated correctly for MultiplexWU.')

