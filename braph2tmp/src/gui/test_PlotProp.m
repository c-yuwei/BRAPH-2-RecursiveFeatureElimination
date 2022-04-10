%TEST_PLOTPROP

%% Test 1.1: Instantiation - empty

pr = PlotProp();

prop_number = PlotProp.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotProp.getPropTag(prop));
	assert( ...
		isa(pr.getr(prop), 'NoValue'), ...
		[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
		['PlotProp.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotProp.getr(' int2str(prop) ').'] ...
		)
	assert( ...
		isa(pr.getr(TAG), 'NoValue'), ...
		[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
		['PlotProp.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
		'Or there could be an error in PlotProp.getr(''' TAG ''').'] ...
		)
end

%% Test 1.2: Instantiation - defaults

warning('off', 'BRAPH2:PlotProp')
pr = PlotProp( ...
	PlotProp.ID, PlotProp.getPropDefault(PlotProp.ID), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, PlotProp.getPropDefault(PlotProp.PROP), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotProp')

for prop = 1:1:PlotProp.getPropNumber()
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isequal(pr.getr(prop), PlotProp.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be inizialized to its default value ' ...
				'given by PlotProp.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotProp.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isequal(pr.getr(TAG), PlotProp.getPropDefaultConditioned(prop)), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(''' TAG ''') must be inizialized to its default value ' ...
				'given by PlotProp.getPropDefaultConditioned(' int2str(prop) '). ' ...
				'Or there could be an error in PlotProp.getr(''' TAG ''').'] ...
				)
		case Category.RESULT
			assert( ...
				isa(pr.getr(prop), 'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotProp.getr(' int2str(prop) ') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotProp.getr(' int2str(prop) ').'] ...
				)
			assert( ...
				isa(pr.getr(TAG), 'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['Being a result, PlotProp.getr(''' TAG ''') must be inizialized to NoValue(). ' ...
				'Or there could be an error in PlotProp.getr(''' TAG ''').'] ...
				)
	end
end

%% Test 2: Callbacks

warning('off', 'BRAPH2:PlotProp')
pr_0 = PlotProp( ...
	PlotProp.ID, PlotProp.getPropDefault(PlotProp.ID), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, PlotProp.getPropDefault(PlotProp.PROP), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotProp')

pr_1 = PlotProp( ...
	PlotProp.ID, Callback('EL', pr_0, 'PROP', 1), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, Callback('EL', pr_0, 'PROP', 4), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
	
prop_number = PlotProp.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_1.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_1.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_1.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_2 = PlotProp( ...
	PlotProp.ID, Callback('EL', pr_1, 'PROP', 1), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, Callback('EL', pr_1, 'PROP', 4), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
	
prop_number = PlotProp.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_2.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_2.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_2.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end
pr_3 = PlotProp( ...
	PlotProp.ID, Callback('EL', pr_2, 'PROP', 1), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, Callback('EL', pr_2, 'PROP', 4), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
	
prop_number = PlotProp.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
			assert( ...
				isa(pr_3.getr(prop),  'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be a callback.'] ...
				)
			assert( ...
				isequal(pr_3.get(prop), pr_0.get(prop)) && ~isa(pr_1.get(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.get(' int2str(prop) ') must be the actual property and NOT a callback.'] ...
				)
		case {Category.METADATA, Category.RESULT}
			assert( ...
				~isa(pr_3.getr(prop), 'Callback'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must NOT be a callback.'] ...
				)
	end
end

%% Test 3: Result

warning('off', 'BRAPH2:PlotProp')
pr = PlotProp( ...
	PlotProp.ID, PlotProp.getPropDefault(PlotProp.ID), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, PlotProp.getPropDefault(PlotProp.PROP), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotProp')

prop_number = PlotProp.getPropNumber();
for prop = 1:1:prop_number
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be a NoValue, because it has not been memorized.'] ...
				)
			if isempty(pr.getPropSettings(prop))
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop)), ...
					[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
					['PlotProp.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			else
				assert( ...
					pr.checkFormat(pr.getPropFormat(prop), pr.get(prop), pr.getPropSettings(prop)), ...
					[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
					['PlotProp.get(' int2str(prop) ') returns a value with the wrong format.'] ...
					)
			end
	end
end

%% Test 4: Memorize

warning('off', 'BRAPH2:PlotProp')
pr = PlotProp( ...
	PlotProp.ID, PlotProp.getPropDefault(PlotProp.ID), ...
	PlotProp.BKGCOLOR, PlotProp.getPropDefault(PlotProp.BKGCOLOR), ...
	PlotProp.EL, PlotProp.getPropDefault(PlotProp.EL), ...
	PlotProp.PROP, PlotProp.getPropDefault(PlotProp.PROP), ...
	PlotProp.TITLE, PlotProp.getPropDefault(PlotProp.TITLE), ...
	PlotProp.ENABLE, PlotProp.getPropDefault(PlotProp.ENABLE), ...
	PlotProp.WAITBAR, PlotProp.getPropDefault(PlotProp.WAITBAR) ...
	);
warning('on', 'BRAPH2:PlotProp')

for prop = 1:1:PlotProp.getPropNumber()
	TAG = upper(PlotProp.getPropTag(prop));
	switch PlotProp.getPropCategory(prop)
		case {Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
		case Category.RESULT
			assert( ...
				~isa(pr.get(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.get(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must be a NoValue, because it should NOT have been memorized.'] ...
				)
			assert( ...
				~isa(pr.memorize(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.memorize(' int2str(prop) ') must NOT be a NoValue, because it should have been calculated.'] ...
				)
			assert( ...
				~isa(pr.getr(prop),  'NoValue'), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') must NOT be a NoValue, because it should have been memorized.'] ...
				)
			assert( ...
				pr.checkFormat(pr.getPropFormat(prop), pr.getr(prop),pr.getPropSettings(prop)), ...
				[BRAPH2.STR ':PlotProp:' BRAPH2.BUG_FUNC], ...
				['PlotProp.getr(' int2str(prop) ') returns a value with the wrong format.'] ...
				)
	end
end

%% Test 5: Example

% draws PlotProp's at once
figure('Color', 'w', 'Units', 'normalized', 'Position', [0 0 1 1])
et1 = ETA();
for category = 1:1:Element.getCategoryNumber() + 1
    for format = 1:1:Element.getFormatNumber()
        prop = (category - 1) * Element.getFormatNumber() + format;
        prs{category, format} = PlotProp('EL', et1, 'PROP', prop);
        prs{category, format}.draw( ...
            'Units', 'normalized', ...
            'Position', [ ...
                (category-1)/(Element.getCategoryNumber()+1) ...
                1-format/Element.getFormatNumber() ...
                .9/(Element.getCategoryNumber()+1) ...
                .9/Element.getFormatNumber() ...
                ], ...
            'BackgroundColor', [format/Element.getFormatNumber() category/(Element.getCategoryNumber()+1)] * [1 .5 0; 0 .5 1] ...
            )
        drawnow()
    end
end
close(gcf)

% draws PlotProp's with multiple calls to draw()
figure('Color', 'w', 'Units', 'normalized', 'Position', [0 0 1 1])
et2 = ETA();
for category = 1:1:Element.getCategoryNumber() + 1
    for format = 1:1:Element.getFormatNumber()
        prop = (category - 1) * Element.getFormatNumber() + format;
        prs{category, format} = PlotProp('EL', et2, 'PROP', prop);
        prs{category, format}.draw()
        prs{category, format}.draw('Units', 'normalized')
        prs{category, format}.draw('Position', [ ...
                (category-1)/(Element.getCategoryNumber()+1) ...
                1-format/Element.getFormatNumber() ...
                .9/(Element.getCategoryNumber()+1) ...
                .9/Element.getFormatNumber() ...
                ])
        prs{category, format}.draw('BackgroundColor', [format/Element.getFormatNumber() category/(Element.getCategoryNumber()+1)] * [1 .5 0; 0 .5 1])
        drawnow()
    end
end
close(gcf)

% calls redraw() to resize the property panel and reposition its text
figure('Color', 'w', 'Units', 'normalized', 'Position', [0 0 1 1])
drawnow() % to solve ensure the figure is stable under drawnow()
et3 = ETA();
for category = 1:1:Element.getCategoryNumber() + 1
    for format = 1:1:Element.getFormatNumber()
        prop = (category - 1) * Element.getFormatNumber() + format;
        prs{category, format} = PlotProp('EL', et3, 'PROP', prop);
        prs{category, format}.draw()
        prs{category, format}.draw('Units', 'normalized')
        prs{category, format}.draw('BackgroundColor', [format/Element.getFormatNumber() category/(Element.getCategoryNumber()+1)] * [1 .5 0; 0 .5 1])

        prs{category, format}.redraw( ...
            'X0', (category - 1) / (Element.getCategoryNumber() + 1) * Plot.w(gcf, 'characters'), ...
            'Y0', (1 - format / Element.getFormatNumber()) * Plot.h(gcf, 'characters'), ...
            'Width', .9 / (Element.getCategoryNumber() + 1) * Plot.w(gcf, 'characters'), ...
            'Height', .9 / Element.getFormatNumber() * Plot.h(gcf, 'characters') ...
            )
        drawnow()
    end
end
close(gcf)

% calls update() and redraw()
% note that it doesn't work because it needs to be used with PlotElement() and GUI()
figure('Color', 'w', 'Units', 'normalized', 'Position', [0 0 1 1])
drawnow() % to solve ensure the figure is stable under drawnow()
et3 = ETA();
for category = 1:1:Element.getCategoryNumber() + 1
    for format = 1:1:Element.getFormatNumber()
        prop = (category - 1) * Element.getFormatNumber() + format;
        prs{category, format} = PlotProp('EL', et3, 'PROP', prop);
        prs{category, format}.draw()
        prs{category, format}.draw('Units', 'normalized')
        prs{category, format}.draw('BackgroundColor', [format/Element.getFormatNumber() category/(Element.getCategoryNumber()+1)] * [1 .5 0; 0 .5 1])

        prs{category, format}.update()
        
        prs{category, format}.redraw( ...
            'X0', (category - 1) / (Element.getCategoryNumber() + 1) * Plot.w(gcf, 'characters'), ...
            'Y0', (1 - format / Element.getFormatNumber()) * Plot.h(gcf, 'characters'), ...
            'Width', .9 / (Element.getCategoryNumber() + 1) * Plot.w(gcf, 'characters'), ...
            'Height', .9 / Element.getFormatNumber() * Plot.h(gcf, 'characters') ...
            )
        drawnow()
    end
end
close(gcf)

