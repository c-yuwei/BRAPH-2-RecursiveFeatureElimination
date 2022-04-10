%TEST_PLOTPROPITEM

%% Test 1.1: Instantiation - empty

pr = PlotPropItem();

prop_number = PlotPropItem.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotPropItem.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
		['PlotPropItem.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotPropItem.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
		['PlotPropItem.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotPropItem.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PlotPropItem')
pr = PlotPropItem( ...
	PlotPropItem.ID, PlotPropItem.getPropDefault(PlotPropItem.ID), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, PlotPropItem.getPropDefault(PlotPropItem.PROP), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotPropItem')

for prop = 1:1:PlotPropItem.getPropNumber()
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PlotPropItem.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PlotPropItem.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotPropItem.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PlotPropItem.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PlotPropItem.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotPropItem.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotPropItem.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotPropItem.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotPropItem.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotPropItem.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PlotPropItem')
pr_0 = PlotPropItem( ...
	PlotPropItem.ID, PlotPropItem.getPropDefault(PlotPropItem.ID), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, PlotPropItem.getPropDefault(PlotPropItem.PROP), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotPropItem')

pr_1 = PlotPropItem( ...
	PlotPropItem.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, Callback('EL', pr_0, 'PROP', 4), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
	
prop_number = PlotPropItem.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PlotPropItem( ...
	PlotPropItem.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, Callback('EL', pr_1, 'PROP', 4), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
	
prop_number = PlotPropItem.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PlotPropItem( ...
	PlotPropItem.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, Callback('EL', pr_2, 'PROP', 4), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
	
prop_number = PlotPropItem.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PlotPropItem')
pr = PlotPropItem( ...
	PlotPropItem.ID, PlotPropItem.getPropDefault(PlotPropItem.ID), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, PlotPropItem.getPropDefault(PlotPropItem.PROP), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotPropItem')

prop_number = PlotPropItem.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
					['PlotPropItem.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
					['PlotPropItem.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PlotPropItem')
pr = PlotPropItem( ...
	PlotPropItem.ID, PlotPropItem.getPropDefault(PlotPropItem.ID), ...
	PlotPropItem.BKGCOLOR, PlotPropItem.getPropDefault(PlotPropItem.BKGCOLOR), ...
	PlotPropItem.EL, PlotPropItem.getPropDefault(PlotPropItem.EL), ...
	PlotPropItem.PROP, PlotPropItem.getPropDefault(PlotPropItem.PROP), ...
	PlotPropItem.TITLE, PlotPropItem.getPropDefault(PlotPropItem.TITLE), ...
	PlotPropItem.ENABLE, PlotPropItem.getPropDefault(PlotPropItem.ENABLE), ...
	PlotPropItem.WAITBAR, PlotPropItem.getPropDefault(PlotPropItem.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotPropItem')

for prop = 1:1:PlotPropItem.getPropNumber()
	TAG = upper(PlotPropItem.getPropTag(prop));
	switch PlotPropItem.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PlotPropItem:' BRAPH2.BUG_FUNC], ...
				['PlotPropItem.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Example

% draws PlotPropItem and calls update() and redraw()
% note that it doesn't work for category RESULT 
% because it needs to be used with PlotElement() and GUI()
figure()
et = ETA();
props = [et.PROP_ITEM_M et.PROP_ITEM_P et.PROP_ITEM_D et.PROP_ITEM_R et.PROP_ITEM_R_CALC];
for i = 1:1:length(props)
    pr{i} = PlotPropItem('EL', et, 'PROP', props(i));
    pr{i}.draw('BackgroundColor', [i/length(props) .5 (length(props)-i)/length(props)])
    pr{i}.update()
    pr{i}.redraw('Y0', (length(props) - i)/length(props) * Plot.h(gcf, 'characters'))
end
close(gcf)

% minimal working version for category RESULT
figure()
p = uipanel('Parent', gcf); % needed for the function refresh that is called when the result is calculated
set(gcf, 'SizeChangedFcn', 'pr_res.update()') % callback to update panel when figure is resized (in refresh)
et = ETA();
pr_res = PlotPropItem('EL', et, 'PROP', et.PROP_ITEM_R_CALC);
pr_res.draw('Parent', p, 'BackgroundColor', [.8 .5 .2])
pr_res.update()
pr_res.redraw()
close(gcf)

