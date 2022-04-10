%TEST_PLOTENSEMBLEMPLINE

%% Test 1.1: Instantiation - empty

pr = PlotEnsembleMPLine();

prop_number = PlotEnsembleMPLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
		['PlotEnsembleMPLine.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotEnsembleMPLine.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
		['PlotEnsembleMPLine.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotEnsembleMPLine.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PlotEnsembleMPLine')
pr = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.ID), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.A), ...
	PlotEnsembleMPLine.X, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.X), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTVALUE), ...
	PlotEnsembleMPLine.MEASURE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MEASURE), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
warning('on', 'BRAPH2:PlotEnsembleMPLine')

for prop = 1:1:PlotEnsembleMPLine.getPropNumber()
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PlotEnsembleMPLine.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PlotEnsembleMPLine.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotEnsembleMPLine.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PlotEnsembleMPLine.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PlotEnsembleMPLine.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotEnsembleMPLine.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotEnsembleMPLine.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotEnsembleMPLine.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotEnsembleMPLine.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotEnsembleMPLine.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PlotEnsembleMPLine')
pr_0 = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.ID), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.A), ...
	PlotEnsembleMPLine.X, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.X), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTVALUE), ...
	PlotEnsembleMPLine.MEASURE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MEASURE), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
warning('on', 'BRAPH2:PlotEnsembleMPLine')

pr_1 = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, Callback('EL', pr_0, 'PROP', 4), ...
	PlotEnsembleMPLine.X, Callback('EL', pr_0, 'PROP', 5), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, Callback('EL', pr_0, 'PROP', 8), ...
	PlotEnsembleMPLine.MEASURE, Callback('EL', pr_0, 'PROP', 9), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
	
prop_number = PlotEnsembleMPLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, Callback('EL', pr_1, 'PROP', 4), ...
	PlotEnsembleMPLine.X, Callback('EL', pr_1, 'PROP', 5), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, Callback('EL', pr_1, 'PROP', 8), ...
	PlotEnsembleMPLine.MEASURE, Callback('EL', pr_1, 'PROP', 9), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
	
prop_number = PlotEnsembleMPLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, Callback('EL', pr_2, 'PROP', 4), ...
	PlotEnsembleMPLine.X, Callback('EL', pr_2, 'PROP', 5), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, Callback('EL', pr_2, 'PROP', 8), ...
	PlotEnsembleMPLine.MEASURE, Callback('EL', pr_2, 'PROP', 9), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
	
prop_number = PlotEnsembleMPLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PlotEnsembleMPLine')
pr = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.ID), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.A), ...
	PlotEnsembleMPLine.X, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.X), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTVALUE), ...
	PlotEnsembleMPLine.MEASURE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MEASURE), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
warning('on', 'BRAPH2:PlotEnsembleMPLine')

prop_number = PlotEnsembleMPLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
					['PlotEnsembleMPLine.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
					['PlotEnsembleMPLine.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PlotEnsembleMPLine')
pr = PlotEnsembleMPLine( ...
	PlotEnsembleMPLine.ID, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.ID), ...
	PlotEnsembleMPLine.BKGCOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.BKGCOLOR), ...
	PlotEnsembleMPLine.PLOTTITLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTTITLE), ...
	PlotEnsembleMPLine.A, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.A), ...
	PlotEnsembleMPLine.X, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.X), ...
	PlotEnsembleMPLine.XLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.XLABEL), ...
	PlotEnsembleMPLine.YLABEL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.YLABEL), ...
	PlotEnsembleMPLine.PLOTVALUE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.PLOTVALUE), ...
	PlotEnsembleMPLine.MEASURE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MEASURE), ...
	PlotEnsembleMPLine.LAYER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LAYER), ...
	PlotEnsembleMPLine.CIL, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIL), ...
	PlotEnsembleMPLine.CIU, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.CIU), ...
	PlotEnsembleMPLine.NODE1, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE1), ...
	PlotEnsembleMPLine.NODE2, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.NODE2), ...
	PlotEnsembleMPLine.COLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.COLOR), ...
	PlotEnsembleMPLine.LINESTYLE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINESTYLE), ...
	PlotEnsembleMPLine.LINEWIDTH, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.LINEWIDTH), ...
	PlotEnsembleMPLine.MARKER, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKER), ...
	PlotEnsembleMPLine.MARKERSIZE, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERSIZE), ...
	PlotEnsembleMPLine.MARKEREDGECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKEREDGECOLOR), ...
	PlotEnsembleMPLine.MARKERFACECOLOR, PlotEnsembleMPLine.getPropDefault(PlotEnsembleMPLine.MARKERFACECOLOR) ...
	);
warning('on', 'BRAPH2:PlotEnsembleMPLine')

for prop = 1:1:PlotEnsembleMPLine.getPropNumber()
	TAG = upper(PlotEnsembleMPLine.getPropTag(prop));
	switch PlotEnsembleMPLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PlotEnsembleMPLine:' BRAPH2.BUG_FUNC], ...
				['PlotEnsembleMPLine.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

