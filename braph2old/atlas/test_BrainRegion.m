% test BrainRegion

%% Test 1: Basic functions
br = BrainRegion('BR', 'brain region', 'Notes on brain region.', -1, -2, -3);

assert(ischar(br.tostring()), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.tostring() must return a string.')

%% Test 2: Get methods
id = 'BR1';
label = 'brain region 1';
notes = 'Notes on brain region 1.';
x = 1;
y = 2;
z = 3;
br = BrainRegion(id, label, notes, x, y, z);

assert(isequal(br.getID(), id), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getID() does not work.')
assert(isequal(br.getLabel(), label), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getLabel() does not work.')
assert(isequal(br.getNotes(), notes), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getNotes() does not work.')
assert(isequal(br.getX(), x), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getX() does not work.')
assert(isequal(br.getY(), y), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getY() does not work.')
assert(isequal(br.getZ(), z), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getZ() does not work.')
assert(isequal(br.getPosition(), [x, y, z]), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.WRONG_OUTPUT], ...
    'BrainRegion.getPosition() does not work.')

%% Test 3: Set methods
br = BrainRegion('BR', 'brain region', 'Notes on brain region.', -1, -2, -3);

id = 'BR1';
br.setID(id)
assert(isequal(br.getID(), id), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setID() does not work.')

label = 'brain region 1';
br.setLabel(label)
assert(isequal(br.getLabel(), label), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setLabel() does not work.')


notes = 'Notes on brain region 1.';
br.setNotes(notes)
assert(isequal(br.getNotes(), notes), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setNotes() does not work.')

x = 1;
br.setX(x)
assert(isequal(br.getX(), x), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setX() does not work.')

y = 2;
br.setY(y)
assert(isequal(br.getY(), y), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setY() does not work.')

z = 3;
br.setZ(z)
assert(isequal(br.getZ(), z), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setZ() does not work.')

position = [10 20 30];
br.setPosition(position)
assert(isequal(br.getPosition(), position), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_FUNC], ...
    'BrainRegion.setPosition() does not work.')

%% Test 4: Deep copy
id = 'BR';
label = 'brain region';
notes = 'Notes on brain region.';
x = 1;
y = 2;
z = 3;
br = BrainRegion(id, label, notes, x, y, z);

br_copy = br.copy();
assert(isequal(br.getID(), br_copy.getID()) && ...
    isequal(br.getLabel(), br_copy.getLabel()) && ...
    isequal(br.getNotes(), br_copy.getNotes()) && ...
    isequal(br.getPosition(), br_copy.getPosition()), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_COPY], ...
    'BrainRegion.copy() does not work.')

id_copy = 'BR COPY';
br_copy.setID(id_copy)
assert(isequal(br.getID(), id) && isequal(br_copy.getID(), id_copy), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_COPY], ...
    'BrainRegion.copy() does not work.')

label_copy = 'brain region COPY';
br_copy.setLabel(label_copy)
assert(isequal(br.getLabel(), label) && isequal(br_copy.getLabel(), label_copy), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_COPY], ...
    'BrainRegion.copy() does not work.')

notes_copy = 'Notes on brain region COPY.';
br_copy.setNotes(notes_copy)
assert(isequal(br.getNotes(), notes) && isequal(br_copy.getNotes(), notes_copy), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_COPY], ...
    'BrainRegion.copy() does not work.')

position_copy = [100 200 300];
br_copy.setPosition(position_copy)
assert(isequal(br.getPosition(), [x y z]) && isequal(br_copy.getPosition(), position_copy), ...
	[BRAPH2.STR ':' class(br) ':' BRAPH2.BUG_COPY], ...
    'BrainRegion.copy() does not work.')