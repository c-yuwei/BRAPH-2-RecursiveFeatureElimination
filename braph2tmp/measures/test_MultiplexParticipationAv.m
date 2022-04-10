%TEST_MULTIPLEXPARTICIPATIONAV

%% Test 1.1: Instantiation - empty

m = MultiplexParticipationAv();

prop_number = MultiplexParticipationAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
		['MultiplexParticipationAv.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiplexParticipationAv.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
		['MultiplexParticipationAv.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiplexParticipationAv.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:MultiplexParticipationAv')
m = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.ID), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.G), ...
	MultiplexParticipationAv.M, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.M) ...
	);
warning('on', 'BRAPH2:MultiplexParticipationAv')

for prop = 1:1:MultiplexParticipationAv.getPropNumber()
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), MultiplexParticipationAv.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by MultiplexParticipationAv.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiplexParticipationAv.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), MultiplexParticipationAv.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by MultiplexParticipationAv.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiplexParticipationAv.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiplexParticipationAv.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiplexParticipationAv.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiplexParticipationAv.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiplexParticipationAv.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:MultiplexParticipationAv')
m_0 = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.ID), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.G), ...
	MultiplexParticipationAv.M, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.M) ...
	);
warning('on', 'BRAPH2:MultiplexParticipationAv')

m_1 = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, Callback('EL', m_0, 'PROP', 1), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, Callback('EL', m_0, 'PROP', 4), ...
	MultiplexParticipationAv.M, NoValue() ...
	);
	
prop_number = MultiplexParticipationAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, Callback('EL', m_1, 'PROP', 1), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, Callback('EL', m_1, 'PROP', 4), ...
	MultiplexParticipationAv.M, NoValue() ...
	);
	
prop_number = MultiplexParticipationAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, Callback('EL', m_2, 'PROP', 1), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, Callback('EL', m_2, 'PROP', 4), ...
	MultiplexParticipationAv.M, NoValue() ...
	);
	
prop_number = MultiplexParticipationAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:MultiplexParticipationAv')
m = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.ID), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.G), ...
	MultiplexParticipationAv.M, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.M) ...
	);
warning('on', 'BRAPH2:MultiplexParticipationAv')

prop_number = MultiplexParticipationAv.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
					['MultiplexParticipationAv.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
					['MultiplexParticipationAv.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:MultiplexParticipationAv')
m = MultiplexParticipationAv( ...
	MultiplexParticipationAv.ID, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.ID), ...
	MultiplexParticipationAv.LABEL, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.LABEL), ...
	MultiplexParticipationAv.NOTES, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.NOTES), ...
	MultiplexParticipationAv.G, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.G), ...
	MultiplexParticipationAv.M, MultiplexParticipationAv.getPropDefault(MultiplexParticipationAv.M) ...
	);
warning('on', 'BRAPH2:MultiplexParticipationAv')

for prop = 1:1:MultiplexParticipationAv.getPropNumber()
	TAG = upper(MultiplexParticipationAv.getPropTag(prop));
	switch MultiplexParticipationAv.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_FUNC], ...
				['MultiplexParticipationAv.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
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
B = {B11  B22};

known_multiplex_participation_av = {mean([8/9 8/9 1])};

g = MultiplexBU('B', B);
multiplex_participation_av = MultiplexParticipationAv('G', g);

assert(isequal(multiplex_participation_av.get('M'), known_multiplex_participation_av), ...
    [BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_ERR], ...
    'MultiplexParticipationAv is not being calculated correctly for MultiplexBU.')

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
B = {B11  B22};

known_multiplex_participation_av = {...
                                mean([8/9 8/9 1])
                                0
                                };

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
multiplex_participation_partition_av = MultiplexParticipationAv('G', g);

assert(isequal(multiplex_participation_partition_av.get('M'), known_multiplex_participation_av), ...
    [BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_ERR], ...
    'MultiplexParticipationAv is not being calculated correctly for MultiplexBUT.')

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
B = {B11  B22};

known_multiplex_participation_av = {mean([8/9 8/9 1])};

g = MultiplexWU('B', B);
multiplex_participation_av = MultiplexParticipationAv('G', g);

assert(isequal(multiplex_participation_av.get('M'), known_multiplex_participation_av), ...
    [BRAPH2.STR ':MultiplexParticipationAv:' BRAPH2.BUG_ERR], ...
    'MultiplexParticipationAv is not being calculated correctly for MultiplexWU.')

