%TEST_MULTIPLEXCLUSTERING

%% Test 1.1: Instantiation - empty

m = MultiplexClustering();

prop_number = MultiplexClustering.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexClustering.getPropTag(prop));
	assert( ...
		isa(m.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
		['MultiplexClustering.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiplexClustering.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(m.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
		['MultiplexClustering.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in MultiplexClustering.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:MultiplexClustering')
m = MultiplexClustering( ...
	MultiplexClustering.ID, MultiplexClustering.getPropDefault(MultiplexClustering.ID), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, MultiplexClustering.getPropDefault(MultiplexClustering.G), ...
	MultiplexClustering.M, MultiplexClustering.getPropDefault(MultiplexClustering.M) ...
	);
warning('on', 'BRAPH2:MultiplexClustering')

for prop = 1:1:MultiplexClustering.getPropNumber()
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(m.getr(prop), MultiplexClustering.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by MultiplexClustering.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiplexClustering.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(m.getr(TAG), MultiplexClustering.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by MultiplexClustering.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in MultiplexClustering.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(m.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiplexClustering.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiplexClustering.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(m.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['Being a result, MultiplexClustering.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in MultiplexClustering.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:MultiplexClustering')
m_0 = MultiplexClustering( ...
	MultiplexClustering.ID, MultiplexClustering.getPropDefault(MultiplexClustering.ID), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, MultiplexClustering.getPropDefault(MultiplexClustering.G), ...
	MultiplexClustering.M, MultiplexClustering.getPropDefault(MultiplexClustering.M) ...
	);
warning('on', 'BRAPH2:MultiplexClustering')

m_1 = MultiplexClustering( ...
	MultiplexClustering.ID, Callback('EL', m_0, 'PROP', 1), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, Callback('EL', m_0, 'PROP', 4), ...
	MultiplexClustering.M, NoValue() ...
	);
	
prop_number = MultiplexClustering.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_1.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_2 = MultiplexClustering( ...
	MultiplexClustering.ID, Callback('EL', m_1, 'PROP', 1), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, Callback('EL', m_1, 'PROP', 4), ...
	MultiplexClustering.M, NoValue() ...
	);
	
prop_number = MultiplexClustering.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_2.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
m_3 = MultiplexClustering( ...
	MultiplexClustering.ID, Callback('EL', m_2, 'PROP', 1), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, Callback('EL', m_2, 'PROP', 4), ...
	MultiplexClustering.M, NoValue() ...
	);
	
prop_number = MultiplexClustering.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(m_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(m_3.get(prop), m_0.get(prop)) && ~isa(m_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(m_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:MultiplexClustering')
m = MultiplexClustering( ...
	MultiplexClustering.ID, MultiplexClustering.getPropDefault(MultiplexClustering.ID), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, MultiplexClustering.getPropDefault(MultiplexClustering.G), ...
	MultiplexClustering.M, MultiplexClustering.getPropDefault(MultiplexClustering.M) ...
	);
warning('on', 'BRAPH2:MultiplexClustering')

prop_number = MultiplexClustering.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(m.getPropSettings(prop))
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop)), ...
					[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
					['MultiplexClustering.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					m.checkFormat(m.getPropFormat(prop), m.get(prop), m.getPropSettings(prop)), ...
					[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
					['MultiplexClustering.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:MultiplexClustering')
m = MultiplexClustering( ...
	MultiplexClustering.ID, MultiplexClustering.getPropDefault(MultiplexClustering.ID), ...
	MultiplexClustering.LABEL, MultiplexClustering.getPropDefault(MultiplexClustering.LABEL), ...
	MultiplexClustering.NOTES, MultiplexClustering.getPropDefault(MultiplexClustering.NOTES), ...
	MultiplexClustering.G, MultiplexClustering.getPropDefault(MultiplexClustering.G), ...
	MultiplexClustering.M, MultiplexClustering.getPropDefault(MultiplexClustering.M) ...
	);
warning('on', 'BRAPH2:MultiplexClustering')

for prop = 1:1:MultiplexClustering.getPropNumber()
	TAG = upper(MultiplexClustering.getPropTag(prop));
	switch MultiplexClustering.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(m.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(m.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(m.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				m.checkFormat(m.getPropFormat(prop), m.getr(prop),m.getPropSettings(prop)), ...
				[BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_FUNC], ...
				['MultiplexClustering.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: MultiplexBU

B11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 0;
      1 0 0 0
      ];
B22 = [
      0 1 1 1;
      1 0 0 0;
      1 0 0 0;
      1 0 0 0
      ];
B = {B11 B22};

known_multiplex_clustering = [2 2 2 0]'./ [12, 2, 2, 0]';
known_multiplex_clustering(isnan(known_multiplex_clustering)) = 0;
known_multiplex_clustering = {
                 known_multiplex_clustering
                 };      

g = MultiplexBU('B', B);
multiplex_clustering = MultiplexClustering('G', g);

assert(isequal(multiplex_clustering.get('M'), known_multiplex_clustering), ...
    [BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_ERR], ...
    'MultiplexClustering is not being calculated correctly for MultiplexBU.')

%% Test 6: MultiplexBUT

B11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 0;
      1 0 0 0
      ];
B22 = [
      0 1 1 1;
      1 0 0 0;
      1 0 0 0;
      1 0 0 0
      ];
B = {B11 B22};

known_multiplex_clustering = [2 2 2 0]'./ [12, 2, 2, 0]';
known_multiplex_clustering(isnan(known_multiplex_clustering)) = 0;
known_multiplex_clustering = {
                 known_multiplex_clustering
                 [0 0 0 0]'
                 };      

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
multiplex_clustering = MultiplexClustering('G', g);

assert(isequal(multiplex_clustering.get('M'), known_multiplex_clustering), ...
    [BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_ERR], ...
    'MultiplexClustering is not being calculated correctly for MultiplexBUT.')

%% Test 7: MultiplexWU

B11 = [
      0   .2  1   1;
      .2  0   1  0;
      1   1  0   0;
      1   0   0   0
      ];
B22 = [
      0   .2  1  .7;
      .2  0   0  0;
      1   0   0  0;
      .7  0   0  0
      ];
B = {B11 B22};

known_multiplex_clustering = diag(B11.^(1/3)*B22.^(1/3)*B11.^(1/3) + B22.^(1/3)*B11.^(1/3)*B22.^(1/3)) ./ ([12, 2, 2, 0]');
known_multiplex_clustering(isnan(known_multiplex_clustering)) = 0;
known_multiplex_clustering = {
                 known_multiplex_clustering
                 };      

g = MultiplexWU('B', B);
multiplex_clustering = MultiplexClustering('G', g);

assert(isequal(multiplex_clustering.get('M'), known_multiplex_clustering), ...
    [BRAPH2.STR ':MultiplexClustering:' BRAPH2.BUG_ERR], ...
    'MultiplexClustering is not being calculated correctly for MultiplexWU.')

