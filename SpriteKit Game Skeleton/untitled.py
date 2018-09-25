
def package (gifts, season):

	weights = {}
	shapes = {}
	numWeights = 0
	numShapes = 0

	for gift in gifts:
		if gift[0] in weights:
			weights[gift[0]][0] += 1
			weights[gift[0]][1].append(gift)
		else:
			weights[gift[0]][0] = 1
			weights[gift[0]][1] = [gift]
			numWeights += 1

		if gift[1] in shapes:
			shapes[gift[1]][0] += 1
			shapes[gift[1]][1].append(gift)
		else:
			shapes[gift[1]][0] = 1
			shapes[gift[1]][1] = [gift]
			numShapes += 1

	rules = [0, 0, 0, 0, 0, 1]

	if numWeights >= 5:
		rules[1] = 1

	if numShapes >= 5:
		rules[2] = 1

	rules[0] = rules[1] and rules[2]

	shape3 = []
	shape2 = []
	for key in shapes.keys:
		if shapes[key][0] >= 3:
			shape3 = shapes[key][1]


		if shapes[key][0] >= 2:
			shape2 = shapes[key][1]

	if len(shape3) and len(shape2):

		weight = 0
		for gift in shape3:
			if 






	# 1. different weight, different shape
	# 2. different weight, same shape
	# 3. same weight, different shape

	# 4. 3 same weight & shape, 2 same weight & shape
	# 5. 3 same shape, 2 same shape, different weight

	# 6. rest









