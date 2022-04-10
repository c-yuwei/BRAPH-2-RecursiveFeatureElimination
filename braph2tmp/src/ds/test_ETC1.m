%TEST_ETC1

%% Test 1.1: Instantiation - empty

et = ETC1();

prop_number = ETC1.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ETC1.getPropTag(prop));
	assert( ...
		isa(et.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
		['ETC1.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in ETC1.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(et.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
		['ETC1.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in ETC1.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:ETC1')
et = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, ETC1.getPropDefault(ETC1.NP), ...
	ETC1.ND, ETC1.getPropDefault(ETC1.ND), ...
	ETC1.NG, ETC1.getPropDefault(ETC1.NG), ...
	ETC1.NF, ETC1.getPropDefault(ETC1.NF), ...
	ETC1.NR, ETC1.getPropDefault(ETC1.NR), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, ETC1.getPropDefault(ETC1.SP), ...
	ETC1.SD, ETC1.getPropDefault(ETC1.SD), ...
	ETC1.SG, ETC1.getPropDefault(ETC1.SG), ...
	ETC1.SF, ETC1.getPropDefault(ETC1.SF), ...
	ETC1.SR, ETC1.getPropDefault(ETC1.SR), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, ETC1.getPropDefault(ETC1.CP), ...
	ETC1.CD, ETC1.getPropDefault(ETC1.CD), ...
	ETC1.CG, ETC1.getPropDefault(ETC1.CG), ...
	ETC1.CF, ETC1.getPropDefault(ETC1.CF), ...
	ETC1.CR, ETC1.getPropDefault(ETC1.CR) ...
	);
warning('on', 'BRAPH2:ETC1')

for prop = 1:1:ETC1.getPropNumber()
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(et.getr(prop), ETC1.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by ETC1.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in ETC1.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(et.getr(TAG), ETC1.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by ETC1.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in ETC1.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(et.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['Being a result, ETC1.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in ETC1.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(et.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['Being a result, ETC1.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in ETC1.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:ETC1')
et_0 = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, ETC1.getPropDefault(ETC1.NP), ...
	ETC1.ND, ETC1.getPropDefault(ETC1.ND), ...
	ETC1.NG, ETC1.getPropDefault(ETC1.NG), ...
	ETC1.NF, ETC1.getPropDefault(ETC1.NF), ...
	ETC1.NR, ETC1.getPropDefault(ETC1.NR), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, ETC1.getPropDefault(ETC1.SP), ...
	ETC1.SD, ETC1.getPropDefault(ETC1.SD), ...
	ETC1.SG, ETC1.getPropDefault(ETC1.SG), ...
	ETC1.SF, ETC1.getPropDefault(ETC1.SF), ...
	ETC1.SR, ETC1.getPropDefault(ETC1.SR), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, ETC1.getPropDefault(ETC1.CP), ...
	ETC1.CD, ETC1.getPropDefault(ETC1.CD), ...
	ETC1.CG, ETC1.getPropDefault(ETC1.CG), ...
	ETC1.CF, ETC1.getPropDefault(ETC1.CF), ...
	ETC1.CR, ETC1.getPropDefault(ETC1.CR) ...
	);
warning('on', 'BRAPH2:ETC1')

et_1 = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, Callback('EL', et_0, 'PROP', 2), ...
	ETC1.ND, Callback('EL', et_0, 'PROP', 3), ...
	ETC1.NG, Callback('EL', et_0, 'PROP', 4), ...
	ETC1.NF, Callback('EL', et_0, 'PROP', 5), ...
	ETC1.NR, NoValue(), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, Callback('EL', et_0, 'PROP', 8), ...
	ETC1.SD, Callback('EL', et_0, 'PROP', 9), ...
	ETC1.SG, Callback('EL', et_0, 'PROP', 10), ...
	ETC1.SF, Callback('EL', et_0, 'PROP', 11), ...
	ETC1.SR, NoValue(), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, Callback('EL', et_0, 'PROP', 14), ...
	ETC1.CD, Callback('EL', et_0, 'PROP', 15), ...
	ETC1.CG, Callback('EL', et_0, 'PROP', 16), ...
	ETC1.CF, Callback('EL', et_0, 'PROP', 17), ...
	ETC1.CR, NoValue() ...
	);
	
prop_number = ETC1.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(et_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(et_1.get(prop), et_0.get(prop)) && ~isa(et_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(et_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
et_2 = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, Callback('EL', et_1, 'PROP', 2), ...
	ETC1.ND, Callback('EL', et_1, 'PROP', 3), ...
	ETC1.NG, Callback('EL', et_1, 'PROP', 4), ...
	ETC1.NF, Callback('EL', et_1, 'PROP', 5), ...
	ETC1.NR, NoValue(), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, Callback('EL', et_1, 'PROP', 8), ...
	ETC1.SD, Callback('EL', et_1, 'PROP', 9), ...
	ETC1.SG, Callback('EL', et_1, 'PROP', 10), ...
	ETC1.SF, Callback('EL', et_1, 'PROP', 11), ...
	ETC1.SR, NoValue(), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, Callback('EL', et_1, 'PROP', 14), ...
	ETC1.CD, Callback('EL', et_1, 'PROP', 15), ...
	ETC1.CG, Callback('EL', et_1, 'PROP', 16), ...
	ETC1.CF, Callback('EL', et_1, 'PROP', 17), ...
	ETC1.CR, NoValue() ...
	);
	
prop_number = ETC1.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(et_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(et_2.get(prop), et_0.get(prop)) && ~isa(et_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(et_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
et_3 = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, Callback('EL', et_2, 'PROP', 2), ...
	ETC1.ND, Callback('EL', et_2, 'PROP', 3), ...
	ETC1.NG, Callback('EL', et_2, 'PROP', 4), ...
	ETC1.NF, Callback('EL', et_2, 'PROP', 5), ...
	ETC1.NR, NoValue(), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, Callback('EL', et_2, 'PROP', 8), ...
	ETC1.SD, Callback('EL', et_2, 'PROP', 9), ...
	ETC1.SG, Callback('EL', et_2, 'PROP', 10), ...
	ETC1.SF, Callback('EL', et_2, 'PROP', 11), ...
	ETC1.SR, NoValue(), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, Callback('EL', et_2, 'PROP', 14), ...
	ETC1.CD, Callback('EL', et_2, 'PROP', 15), ...
	ETC1.CG, Callback('EL', et_2, 'PROP', 16), ...
	ETC1.CF, Callback('EL', et_2, 'PROP', 17), ...
	ETC1.CR, NoValue() ...
	);
	
prop_number = ETC1.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(et_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(et_3.get(prop), et_0.get(prop)) && ~isa(et_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(et_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:ETC1')
et = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, ETC1.getPropDefault(ETC1.NP), ...
	ETC1.ND, ETC1.getPropDefault(ETC1.ND), ...
	ETC1.NG, ETC1.getPropDefault(ETC1.NG), ...
	ETC1.NF, ETC1.getPropDefault(ETC1.NF), ...
	ETC1.NR, ETC1.getPropDefault(ETC1.NR), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, ETC1.getPropDefault(ETC1.SP), ...
	ETC1.SD, ETC1.getPropDefault(ETC1.SD), ...
	ETC1.SG, ETC1.getPropDefault(ETC1.SG), ...
	ETC1.SF, ETC1.getPropDefault(ETC1.SF), ...
	ETC1.SR, ETC1.getPropDefault(ETC1.SR), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, ETC1.getPropDefault(ETC1.CP), ...
	ETC1.CD, ETC1.getPropDefault(ETC1.CD), ...
	ETC1.CG, ETC1.getPropDefault(ETC1.CG), ...
	ETC1.CF, ETC1.getPropDefault(ETC1.CF), ...
	ETC1.CR, ETC1.getPropDefault(ETC1.CR) ...
	);
warning('on', 'BRAPH2:ETC1')

prop_number = ETC1.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(et.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(et.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(et.getPropSettings(prop))
				assert( ...
					et.checkFormat(et.getPropFormat(prop), et.get(prop)), ...
					[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
					['ETC1.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					et.checkFormat(et.getPropFormat(prop), et.get(prop), et.getPropSettings(prop)), ...
					[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
					['ETC1.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:ETC1')
et = ETC1( ...
	ETC1.NM, ETC1.getPropDefault(ETC1.NM), ...
	ETC1.NP, ETC1.getPropDefault(ETC1.NP), ...
	ETC1.ND, ETC1.getPropDefault(ETC1.ND), ...
	ETC1.NG, ETC1.getPropDefault(ETC1.NG), ...
	ETC1.NF, ETC1.getPropDefault(ETC1.NF), ...
	ETC1.NR, ETC1.getPropDefault(ETC1.NR), ...
	ETC1.SM, ETC1.getPropDefault(ETC1.SM), ...
	ETC1.SP, ETC1.getPropDefault(ETC1.SP), ...
	ETC1.SD, ETC1.getPropDefault(ETC1.SD), ...
	ETC1.SG, ETC1.getPropDefault(ETC1.SG), ...
	ETC1.SF, ETC1.getPropDefault(ETC1.SF), ...
	ETC1.SR, ETC1.getPropDefault(ETC1.SR), ...
	ETC1.CM, ETC1.getPropDefault(ETC1.CM), ...
	ETC1.CP, ETC1.getPropDefault(ETC1.CP), ...
	ETC1.CD, ETC1.getPropDefault(ETC1.CD), ...
	ETC1.CG, ETC1.getPropDefault(ETC1.CG), ...
	ETC1.CF, ETC1.getPropDefault(ETC1.CF), ...
	ETC1.CR, ETC1.getPropDefault(ETC1.CR) ...
	);
warning('on', 'BRAPH2:ETC1')

for prop = 1:1:ETC1.getPropNumber()
	TAG = upper(ETC1.getPropTag(prop));
	switch ETC1.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(et.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(et.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(et.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(et.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				et.checkFormat(et.getPropFormat(prop), et.getr(prop),et.getPropSettings(prop)), ...
				[BRAPH2.STR ':ETC1:' BRAPH2.BUG_FUNC], ...
				['ETC1.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Conditioning

et = ETC1();

assert(et.get(ETC1.NM) == 1)
assert(et.get(ETC1.NP) == 2)
assert(et.get(ETC1.ND) == 3)
assert(et.get(ETC1.NG) == 4)
assert(et.get(ETC1.NF) == 5)
assert(et.get(ETC1.NR) == 6)

assert(strcmp(et.get(ETC1.SM), 'SM1'))
assert(strcmp(et.get(ETC1.SP), 'SP1'))
assert(strcmp(et.get(ETC1.SD), 'SD1'))
assert(strcmp(et.get(ETC1.SG), 'SG1'))
assert(strcmp(et.get(ETC1.SF), 'SF1'))
assert(strcmp(et.get(ETC1.SR), 'SR1'))

assert(isequal(et.get(ETC1.CM), [0:1:10]'))
assert(isequal(et.get(ETC1.CP), [0:1:20]'))
assert(isequal(et.get(ETC1.CD), [0:1:30]'))
assert(isequal(et.get(ETC1.CG), [0:1:40]'))
assert(isequal(et.get(ETC1.CF), [0:1:50]'))
assert(isequal(et.get(ETC1.CR), [0:1:60]'))

