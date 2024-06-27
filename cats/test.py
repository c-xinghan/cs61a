def feline_fixes(start, goal, limit,  i_start=0, i_goal=0, cache=None):
    """A diff function that computes the edit distance from START to GOAL."""
    # assert False, 'Remove this line'
    if not cache:
        cache = {}

    if start == goal: # Fill in the condition
        # BEGIN
        "*** YOUR CODE HERE ***"
        return 0
        # END

    elif limit == 0: # Feel free to remove or add additional cases
        # BEGIN
        "*** YOUR CODE HERE ***"
        return 1
        # END

    elif min(len(start), len(goal)) == 0:
        # print("DEBUG:", "here")
        return max(len(start), len(goal))

    if (i_start, i_goal) not in cache:

        # print('creating')
        if start[0] == goal[0]:
            # return feline_fixes(start[1:], goal[1:], limit, cache)
            cache[(i_start, i_goal)] = feline_fixes(start[1:], goal[1:], limit, i_start+1, i_goal+1, cache)

        else:
            add_diff = 1 + feline_fixes(start, goal[1:], limit - 1, i_start, i_goal+1, cache) # Fill in these lines
            remove_diff = 1 + feline_fixes(start[1:], goal, limit - 1, i_start+1, i_goal, cache)
            substitute_diff = 1 + feline_fixes(start[1:], goal[1:], limit - 1, i_start+1, i_goal+1, cache)
            # BEGIN
            "*** YOUR CODE HERE ***"
            # return min(add_diff, remove_diff, substitute_diff)
            cache[(i_start, i_goal)] = min(add_diff, remove_diff, substitute_diff)
            # END
    else:
        print('accessing')
    return cache[(i_start, i_goal)]

print(feline_fixes('house', 'tannhauser', 999))