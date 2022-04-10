%TEST_PLOTCOMPARISONGROUPLINE

%% Test 1.1: Instantiation - empty

pr = PlotComparisonGroupLine();

prop_number = PlotComparisonGroupLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
		['PlotComparisonGroupLine.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotComparisonGroupLine.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
		['PlotComparisonGroupLine.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotComparisonGroupLine.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PlotComparisonGroupLine')
pr = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.ID), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.X), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTVALUE), ...
	PlotComparisonGroupLine.MEASURE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MEASURE), ...
	PlotComparisonGroupLine.COMPARISON, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COMPARISON), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
warning('on', 'BRAPH2:PlotComparisonGroupLine')

for prop = 1:1:PlotComparisonGroupLine.getPropNumber()
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PlotComparisonGroupLine.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PlotComparisonGroupLine.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotComparisonGroupLine.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PlotComparisonGroupLine.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PlotComparisonGroupLine.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotComparisonGroupLine.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotComparisonGroupLine.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotComparisonGroupLine.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotComparisonGroupLine.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotComparisonGroupLine.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PlotComparisonGroupLine')
pr_0 = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.ID), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.X), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTVALUE), ...
	PlotComparisonGroupLine.MEASURE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MEASURE), ...
	PlotComparisonGroupLine.COMPARISON, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COMPARISON), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
warning('on', 'BRAPH2:PlotComparisonGroupLine')

pr_1 = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, Callback('EL', pr_0, 'PROP', 4), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, Callback('EL', pr_0, 'PROP', 7), ...
	PlotComparisonGroupLine.MEASURE, Callback('EL', pr_0, 'PROP', 8), ...
	PlotComparisonGroupLine.COMPARISON, Callback('EL', pr_0, 'PROP', 9), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
	
prop_number = PlotComparisonGroupLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, Callback('EL', pr_1, 'PROP', 4), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, Callback('EL', pr_1, 'PROP', 7), ...
	PlotComparisonGroupLine.MEASURE, Callback('EL', pr_1, 'PROP', 8), ...
	PlotComparisonGroupLine.COMPARISON, Callback('EL', pr_1, 'PROP', 9), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
	
prop_number = PlotComparisonGroupLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, Callback('EL', pr_2, 'PROP', 4), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, Callback('EL', pr_2, 'PROP', 7), ...
	PlotComparisonGroupLine.MEASURE, Callback('EL', pr_2, 'PROP', 8), ...
	PlotComparisonGroupLine.COMPARISON, Callback('EL', pr_2, 'PROP', 9), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
	
prop_number = PlotComparisonGroupLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PlotComparisonGroupLine')
pr = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.ID), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.X), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTVALUE), ...
	PlotComparisonGroupLine.MEASURE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MEASURE), ...
	PlotComparisonGroupLine.COMPARISON, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COMPARISON), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
warning('on', 'BRAPH2:PlotComparisonGroupLine')

prop_number = PlotComparisonGroupLine.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
					['PlotComparisonGroupLine.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
					['PlotComparisonGroupLine.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PlotComparisonGroupLine')
pr = PlotComparisonGroupLine( ...
	PlotComparisonGroupLine.ID, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.ID), ...
	PlotComparisonGroupLine.BKGCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.BKGCOLOR), ...
	PlotComparisonGroupLine.PLOTTITLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTTITLE), ...
	PlotComparisonGroupLine.X, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.X), ...
	PlotComparisonGroupLine.XLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.XLABEL), ...
	PlotComparisonGroupLine.YLABEL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.YLABEL), ...
	PlotComparisonGroupLine.PLOTVALUE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.PLOTVALUE), ...
	PlotComparisonGroupLine.MEASURE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MEASURE), ...
	PlotComparisonGroupLine.COMPARISON, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COMPARISON), ...
	PlotComparisonGroupLine.CIL, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIL), ...
	PlotComparisonGroupLine.CIU, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CIU), ...
	PlotComparisonGroupLine.NODE1, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE1), ...
	PlotComparisonGroupLine.NODE2, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.NODE2), ...
	PlotComparisonGroupLine.COLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.COLOR), ...
	PlotComparisonGroupLine.LINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINESTYLE), ...
	PlotComparisonGroupLine.LINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.LINEWIDTH), ...
	PlotComparisonGroupLine.MARKER, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKER), ...
	PlotComparisonGroupLine.MARKERSIZE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERSIZE), ...
	PlotComparisonGroupLine.MARKEREDGECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKEREDGECOLOR), ...
	PlotComparisonGroupLine.MARKERFACECOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.MARKERFACECOLOR), ...
	PlotComparisonGroupLine.FILLCOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLCOLOR), ...
	PlotComparisonGroupLine.FILLALPHA, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.FILLALPHA), ...
	PlotComparisonGroupLine.CICOLOR, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CICOLOR), ...
	PlotComparisonGroupLine.CILINESTYLE, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINESTYLE), ...
	PlotComparisonGroupLine.CILINEWIDTH, PlotComparisonGroupLine.getPropDefault(PlotComparisonGroupLine.CILINEWIDTH) ...
	);
warning('on', 'BRAPH2:PlotComparisonGroupLine')

for prop = 1:1:PlotComparisonGroupLine.getPropNumber()
	TAG = upper(PlotComparisonGroupLine.getPropTag(prop));
	switch PlotComparisonGroupLine.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PlotComparisonGroupLine:' BRAPH2.BUG_FUNC], ...
				['PlotComparisonGroupLine.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

