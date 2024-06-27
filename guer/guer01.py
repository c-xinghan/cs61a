def merge(s1, s2):
	if not s1 or not s2:
		return s1 + s2

	if s1[0] == s2[0]:
		remaining = merge(s1[1:], s2[1:])

	elif s2[0] < s1[0]:
		remaining = merge(s1, s2[1:])

	else:
		remaining = merge(s1[1:], s2)

	return [min(s1[0], s2[0])] + remaining

def mario_number(level):
	"""Return the number of ways that Mario can perform a sequence of steps
	or jumps to reach the end of the level without ever landing in a Piranha
	plant. Assume that every level begins and ends with a dash.
	>>> mario_number('-P-P-') # jump, jump
	1
	>>> mario_number('-P-P--') # jump, jump, step
	1
	>>> mario_number('--P-P-') # step, jump, jump
	1
	>>> mario_number('---P-P-') # step, step, jump, jump or jump, jump, jump
	2
	>>> mario_number('-P-PP-') # Mario cannot jump two plants
	0
	>>> mario_number('----') # step, jump ; jump, step ; step, step, step
	3
	>>> mario_number('----P----')
	9
	>>> mario_number('---P----P-P---P--P-P----P-----P-')
	180
	"""
	if len(level) <= 0 or  level[0] == 'P':
		return 0

	if len(level) == 1:
		return 1

	return mario_number(level[1:]) + mario_number(level[2:])
