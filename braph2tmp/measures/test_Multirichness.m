%TEST_MULTIRICHNESS

%% Test 1.1: Instantiation - empty

m = Multirichness();

prop_number = Multirichness.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(Multirichness.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
		['Multirichness.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in Multirichness.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
		['Multirichness.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in Multirichness.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:Multirichness')
m = Multirichness( ...
	Multirichness.ID, Multirichness.getPropDefault(Multirichness.ID), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Multirichness.getPropDefault(Multirichness.G), ...
	Multirichness.M, Multirichness.getPropDefault(Multirichness.M), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Multirichness.getPropDefault(Multirichness.MULTIRICHNESS_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:Multirichness')

for prop = 1:1:Multirichness.getPropNumber()
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), Multirichness.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by Multirichness.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in Multirichness.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), Multirichness.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by Multirichness.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in Multirichness.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Being a result, Multirichness.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in Multirichness.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Being a result, Multirichness.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in Multirichness.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:Multirichness')
m_0 = Multirichness( ...
	Multirichness.ID, Multirichness.getPropDefault(Multirichness.ID), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Multirichness.getPropDefault(Multirichness.G), ...
	Multirichness.M, Multirichness.getPropDefault(Multirichness.M), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Multirichness.getPropDefault(Multirichness.MULTIRICHNESS_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:Multirichness')

m_1 = Multirichness( ...
	Multirichness.ID, Callback('EL', m_0, 'PROP', 1), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Callback('EL', m_0, 'PROP', 4), ...
	Multirichness.M, NoValue(), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Callback('EL', m_0, 'PROP', 6) ...
	);
	
prop_number = Multirichness.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = Multirichness( ...
	Multirichness.ID, Callback('EL', m_1, 'PROP', 1), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Callback('EL', m_1, 'PROP', 4), ...
	Multirichness.M, NoValue(), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Callback('EL', m_1, 'PROP', 6) ...
	);
	
prop_number = Multirichness.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = Multirichness( ...
	Multirichness.ID, Callback('EL', m_2, 'PROP', 1), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Callback('EL', m_2, 'PROP', 4), ...
	Multirichness.M, NoValue(), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Callback('EL', m_2, 'PROP', 6) ...
	);
	
prop_number = Multirichness.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:Multirichness')
m = Multirichness( ...
	Multirichness.ID, Multirichness.getPropDefault(Multirichness.ID), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Multirichness.getPropDefault(Multirichness.G), ...
	Multirichness.M, Multirichness.getPropDefault(Multirichness.M), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Multirichness.getPropDefault(Multirichness.MULTIRICHNESS_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:Multirichness')

prop_number = Multirichness.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
					['Multirichness.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
					['Multirichness.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:Multirichness')
m = Multirichness( ...
	Multirichness.ID, Multirichness.getPropDefault(Multirichness.ID), ...
	Multirichness.LABEL, Multirichness.getPropDefault(Multirichness.LABEL), ...
	Multirichness.NOTES, Multirichness.getPropDefault(Multirichness.NOTES), ...
	Multirichness.G, Multirichness.getPropDefault(Multirichness.G), ...
	Multirichness.M, Multirichness.getPropDefault(Multirichness.M), ...
	Multirichness.MULTIRICHNESS_COEFFICIENTS, Multirichness.getPropDefault(Multirichness.MULTIRICHNESS_COEFFICIENTS) ...
	);
warning('on', 'BRAPH2:Multirichness')

for prop = 1:1:Multirichness.getPropNumber()
	TAG = upper(Multirichness.getPropTag(prop));
	switch Multirichness.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':Multirichness:' BRAPH2.BUG_FUNC], ...
				['Multirichness.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
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

known_multirichness = {[1/2 0 3/2 3/2]'};      

g = MultiplexBU('B', B);
multirichness = Multirichness('G', g).get('M');

assert(isequal(multirichness, known_multirichness), ...
    [BRAPH2.STR ':Multirichness:' BRAPH2.BUG_ERR], ...
    'Multirichness is not being calculated correctly for MultiplexBU.')

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

known_multirichness = {
                        [1/2  0   3/2  3/2]'
                        [0    0   0    0]'
                        };      

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
multirichness = Multirichness('G', g).get('M');

assert(isequal(multirichness, known_multirichness), ...
    [BRAPH2.STR ':Multirichness:' BRAPH2.BUG_ERR], ...
    'Multirichness is not being calculated correctly for MultiplexBUT.')

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
             
known_multirichness = {[1 0 5/3 5/3]'};

g = MultiplexBD('B', B);
multirichness = Multirichness('G', g, 'MULTIRICHNESS_COEFFICIENTS', [2/3, 1/3]).get('M');

assert(isequal(round(cell2mat(multirichness), 5), round(cell2mat(known_multirichness), 5)), ...
    [BRAPH2.STR ':Multirichness:' BRAPH2.BUG_ERR], ...
    'Multirichness is not being calculated correctly for MultiplexBD.')

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

known_multirichness = {[3/40 0 5/4 21/20]'};  

g = MultiplexWU('B', B);
multirichness = Multirichness('G', g, 'MULTIRICHNESS_COEFFICIENTS', [3/4, 1/4]).get('M');

assert(isequal(round(cell2mat(multirichness), 5), round(cell2mat(known_multirichness), 5)), ...
    [BRAPH2.STR ':Multirichness:' BRAPH2.BUG_ERR], ...
    'Multirichness is not being calculated correctly for MultiplexWU.')

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

known_multirichness = {[3/5 0 3/2 7/8]'};

g = MultiplexWD('B', B);
multirichness = Multirichness('G', g, 'MULTIRICHNESS_COEFFICIENTS', [2/4, 2/4]).get('M');

assert(isequal(multirichness, known_multirichness), ...
    [BRAPH2.STR ':Multirichness:' BRAPH2.BUG_ERR], ...
    'Multirichness is not being calculated correctly for MultiplexWD.')

