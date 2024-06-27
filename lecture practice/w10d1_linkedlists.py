# Linked Lists practice

from abc import ABC, abstractmethod

class Linkage(ABC):

    @abstractmethod
    def __init__(self):
        pass

    @abstractmethod
    def __repr__(self):
        pass

    @abstractmethod
    def __str__(self):
        pass

    @abstractmethod
    def is_ordered(self):
        pass

    @abstractmethod
    def is_ordered_by_key(self):
        pass

    @abstractmethod
    def bubble_sort(self):
        pass

    @abstractmethod
    def combine_links(self, other):
        pass

    @abstractmethod
    def combine_links_mutate(self, other):
        pass


class EmptyLink(Linkage):
    def __init__(self):
        self.first = 0
        self.rest = 0

    def __repr__(self):
        return "Link()"

    def __str__(self):
        return "[]"

    def is_ordered(self):
        return True

    def is_ordered_by_key(self):
        return True

    def bubble_sort(self):
        return

    def combine_links(self, other):
        return other

    def combine_links_mutate(self, other):
        return other


class Link(Linkage):
    empty = EmptyLink()
    
    def __init__(self, first, rest=empty):
        assert isinstance(rest, Link) or rest is Link.empty, "rest must be either empty or a Link object!"
        self.first = first
        self.rest = rest

    def __repr__(self):
        if self.rest is Link.empty:
            return f"Link({self.first})"
        return f"Link({self.first}, {repr(self.rest)})"

    def __str__(self):
        if self.rest is Link.empty:
            return f"[{self.first}]"
        return f"[{self.first}, {str(self.rest)}]"

    def is_ordered(self):
        '''Checks if the linked list is ordered from least to greatest
        >>> Link(1, Link(3, Link(4))).is_ordered()
        True
        >>> Link(1, Link(4, Link(3))).is_ordered()
        False
        '''
        if self.rest is Link.empty:
            return True
        return self.first < self.rest.first and self.rest.is_ordered()

    def is_ordered_by_key(self, key=abs):
        '''Checks if the linked list is ordered from least to greatest by absolute value (or a key function)
        >>> Link(1, Link(-3, Link(4))).is_ordered_by_key()
        True
        >>> Link(1, Link(4, Link(-3))).is_ordered_by_key()
        False
        '''
        if self.rest is Link.empty:
            return True
        return key(self.first) < key(self.rest.first) and self.rest.is_ordered_by_key()

    def bubble_sort(self):
        '''Uses bubble sort algorithm to sort a linked list in ascending order
        >>> Link(5, Link(4)).bubble_sort()
        Link(4, Link(5))
        >>> Link(3, Link(2, Link(1))).bubble_sort()
        Link(1, Link(2, Link(3)))
        '''
        if self.rest is Link.empty:
            return

        if self.rest.first < self.first:
            self.first, self.rest.first = self.rest.first, self.first

        self.rest.bubble_sort()

        if not self.is_ordered():
            self.bubble_sort()

        return self

    def combine_links(self, other):
        '''Creates a sorted Link containing all the elements of both sorted Links self & other
        >>> link_1 = Link(1, Link(4))
        >>> link_2 = Link(1, Link(5))
        >>> link_1.combine_links(link_2)
        Link(1, Link(1, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(4))
        >>> link_2 = Link(2, Link(5))
        >>> link_1.combine_links(link_2)
        Link(1, Link(2, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(2))
        >>> link_2 = Link(4, Link(5))
        >>> link_1.combine_links(link_2)
        Link(1, Link(2, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(5))
        >>> link_2 = Link(2, Link(4))
        >>> link_1.combine_links(link_2)
        Link(1, Link(2, Link(4, Link(5))))
        '''

        if self is Link.empty:
            return other

        if other is Link.empty:
            return self

        if self.first <= other.first:
            return Link(self.first, self.rest.combine_links(other))

        if other.first < self.first:
            return Link(other.first, self.combine_links(other.rest))

    def combine_links_mutate(self, other):
        '''Without calling Link, returns a sorted linked list containing all the elements of both sorted Links self & other
        >>> link_1 = Link(1, Link(4))
        >>> link_2 = Link(1, Link(5))
        >>> link_1.combine_links_mutate(link_2)
        Link(1, Link(1, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(4))
        >>> link_2 = Link(2, Link(5))
        >>> link_1.combine_links_mutate(link_2)
        Link(1, Link(2, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(2))
        >>> link_2 = Link(4, Link(5))
        >>> link_1.combine_links_mutate(link_2)
        Link(1, Link(2, Link(4, Link(5))))

        >>> link_1 = Link(1, Link(5))
        >>> link_2 = Link(2, Link(4))
        >>> link_1.combine_links_mutate(link_2)
        Link(1, Link(2, Link(4, Link(5))))
        '''

        # def append_other_to_self(self, other):
        #     if not other.is_ordered():
        #         other.bubble_sort()
        #     self.rest = other
        #     return

        # if other.first < self.first:
        #     self.first, other.first = other.first, self.first
        #     if self.rest is Link.empty:
        #         append_other_to_self(self, other)
        #         return
        #     else:
        #         other.first, other.rest = other.rest.first, other.rest.rest

        # elif self.rest is Link.empty:
        #     append_other_to_self(self, other)
        #     return

        # self.rest.combine_links_mutate(other)
        
        # return self

        #alternate solution
        if self is Link.empty:
            return other

        if other is Link.empty:
            return self

        if self.first <= other.first:
            self.rest = self.rest.combine_links_mutate(other)
            return self

        if other.first < self.first:
            other.rest = self.combine_links_mutate(other.rest)
            return other


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    # doctest.run_docstring_examples(Link.combine_links_mutate, globals())