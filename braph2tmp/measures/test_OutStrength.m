%TEST_OUTSTRENGTH

%% Test 1.1: Instantiation - empty

m = OutStrength();

prop_number = OutStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(OutStrength.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
		['OutStrength.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in OutStrength.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
		['OutStrength.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in OutStrength.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:OutStrength')
m = OutStrength( ...
	OutStrength.ID, OutStrength.getPropDefault(OutStrength.ID), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, OutStrength.getPropDefault(OutStrength.G), ...
	OutStrength.M, OutStrength.getPropDefault(OutStrength.M) ...
	);
warning('on', 'BRAPH2:OutStrength')

for prop = 1:1:OutStrength.getPropNumber()
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), OutStrength.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by OutStrength.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in OutStrength.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), OutStrength.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by OutStrength.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in OutStrength.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['Being a result, OutStrength.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in OutStrength.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['Being a result, OutStrength.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in OutStrength.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:OutStrength')
m_0 = OutStrength( ...
	OutStrength.ID, OutStrength.getPropDefault(OutStrength.ID), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, OutStrength.getPropDefault(OutStrength.G), ...
	OutStrength.M, OutStrength.getPropDefault(OutStrength.M) ...
	);
warning('on', 'BRAPH2:OutStrength')

m_1 = OutStrength( ...
	OutStrength.ID, Callback('EL', m_0, 'PROP', 1), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, Callback('EL', m_0, 'PROP', 4), ...
	OutStrength.M, NoValue() ...
	);
	
prop_number = OutStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = OutStrength( ...
	OutStrength.ID, Callback('EL', m_1, 'PROP', 1), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, Callback('EL', m_1, 'PROP', 4), ...
	OutStrength.M, NoValue() ...
	);
	
prop_number = OutStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = OutStrength( ...
	OutStrength.ID, Callback('EL', m_2, 'PROP', 1), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, Callback('EL', m_2, 'PROP', 4), ...
	OutStrength.M, NoValue() ...
	);
	
prop_number = OutStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:OutStrength')
m = OutStrength( ...
	OutStrength.ID, OutStrength.getPropDefault(OutStrength.ID), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, OutStrength.getPropDefault(OutStrength.G), ...
	OutStrength.M, OutStrength.getPropDefault(OutStrength.M) ...
	);
warning('on', 'BRAPH2:OutStrength')

prop_number = OutStrength.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
					['OutStrength.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
					['OutStrength.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:OutStrength')
m = OutStrength( ...
	OutStrength.ID, OutStrength.getPropDefault(OutStrength.ID), ...
	OutStrength.LABEL, OutStrength.getPropDefault(OutStrength.LABEL), ...
	OutStrength.NOTES, OutStrength.getPropDefault(OutStrength.NOTES), ...
	OutStrength.G, OutStrength.getPropDefault(OutStrength.G), ...
	OutStrength.M, OutStrength.getPropDefault(OutStrength.M) ...
	);
warning('on', 'BRAPH2:OutStrength')

for prop = 1:1:OutStrength.getPropNumber()
	TAG = upper(OutStrength.getPropTag(prop));
	switch OutStrength.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':OutStrength:' BRAPH2.BUG_FUNC], ...
				['OutStrength.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: GraphWD

B = [
    0  .2 1
    0  0  .8
    1  0  0
    ];
known_out_strength = {[1.2 0.8 1]'};
g = GraphWD('B', B);
s_outside_g = OutStrength('G', g);

assert(isequal(s_outside_g.get('M'), known_out_strength), ...
    [BRAPH2.STR ':OutStrength:' BRAPH2.BUG_ERR], ...
    'OutStrength is not being calculated correctly for GraphWD.')

%% Test 6: MultiplexWD

B11 = [
    0   .2  1
    0   0   .8
    1   0   0
    ];
B22 = [
    0  1   .6
    1  0   .4
    0  .4  0
    ];
B = {B11 B22};

known_out_strength = {
                [1.2 .8  1]'
                [1.6 1.4 .4]'
                 };
                                
g = MultiplexWD('B', B);
out_strength = OutStrength('G', g);

assert(isequal(out_strength.get('M'), known_out_strength), ...
    [BRAPH2.STR ':OutStrength:' BRAPH2.BUG_ERR], ...
    'OutStrength is not being calculated correctly for MultiplexWD.')

