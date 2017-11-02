#include <sys/types.h>
#include <sys/stat.h>

#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <string.h>

/* 
 * XXX: This is not your grand-mother linked list 
 *
 * To use this list, the _container_ (or nodes) of the list
 * contain the list_head member. These members point to each
 * others to form the linked list. Also, it is a circular linked
 * list starting at the _head_ so that is memory it looks like this:
 *
 *       _____      _____      _____      _____  
 *  *-> |HEAD | -> |NODE1| -> |NODE2| -> |NODE3| -* 
 *  |   |_____|    |_____|    |_____|    |_____|  |
 *  |                                             |
 *  *---------------------------------------------*
 *
 *  After initialization, both the previous and next pointers point to head
 *  If you don't check if a node is the last entry, you will loop around
 *  Don't lose the head of you list
 *  
 *  Tasks:
 *  	- Implement list_add_tail
 *  	- Implement list_next_entry
 *  	- Implement list_search 
 *
 *  Look at the test code to see how the list is used
 */

struct __attribute__((__packed__)) list_head {
	struct list_head *prev, *next;
};

struct __attribute__((__packed__)) struct_list {
	struct list_head list;
	uint64_t foo;
	uint32_t bar;
};

/* Initialize your new list head */
void __attribute__((__weak__)) init_list_head(struct list_head *list)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	list->next = list;
	list->prev = list;
}

/* Internal function of list_add and list_add_tail */
void __attribute__((__weak__))
__list_add(struct list_head *new, struct list_head *prev,
	   struct list_head *next)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	next->prev = new;
	new->next = next;
	new->prev = prev;
	prev->next = new;
}

/* list_add insert the new element in the first position ! */
void __attribute__((__weak__))
list_add(struct list_head *new, struct list_head *head)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	__list_add(new, head, head->next);
}

/* list_add_tail appends the new element at the end of the list */
void __attribute__((__weak__))
list_add_tail(struct list_head *new, struct list_head *head)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	__list_add(new, head->prev, head);
}

/* Get the next entry in the list, given any entry in the list */
void __attribute__((__weak__)) * list_next_entry(struct list_head *list)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	return list->next;
}

/* Get the previous entry in the list, given any entry in the list */
void __attribute__((__weak__)) * list_prev_entry(struct list_head *list)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	return list->prev;
}

void __attribute__((__weak__))
__list_del(struct list_head *prev, struct list_head *next)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	next->prev = prev;
	prev->next = next;
}

/* Delete an entry from the list */
void __attribute__((__weak__)) list_del(struct list_head *entry)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	__list_del(entry->prev, entry->next);
}

/* Check if the current entry is the last of the list */
int __attribute__((__weak__))
list_is_last(const struct list_head *list, const struct list_head *head)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	return list->next == head;
}

typedef int (*comparator_cb)(struct list_head *s1, struct list_head *s2);
/*
 * list_search()
 * @head: The head of the list
 * @elem: The element we have to compare to
 * @cb: The callback comparing the two elements
 *
 * Return a pointer to the list_head of the element found when found, NULL
 * otherwise
 */
struct list_head *__attribute__((__weak__))
list_search(struct list_head *head, struct list_head *elem, comparator_cb cb)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	struct list_head *pos;
	int rc;
	for (pos = head->next; pos != head; pos = pos->next) {
		if ((rc = cb(pos, elem))) 
			return pos;
	}
	return NULL;
}

/* Test cases ! */
void test_add_remove()
{
	struct list_head *head;
	struct struct_list *node1, *node2;

	head = malloc(sizeof(*head));
	if (!head)
		exit(-1);

	node1 = malloc(sizeof(*node1));
	if (!node1)
		exit(-1);
	memset(node1, 0, sizeof(*node1));
	node1->foo = 0x1111;
	node1->bar = 0x1111;

	node2 = malloc(sizeof(*node2));
	if (!node2)
		exit(-1);
	memset(node2, 0, sizeof(*node2));
	node2->foo = 0x2222;
	node2->bar = 0x2222;

	init_list_head(head);
	list_add_tail(&node1->list, head);
	list_add_tail(&node2->list, head);

	/* Reset pointers */
	node1 = NULL;
	node2 = NULL;

	/* head next entry*/
	node1 = list_next_entry(head);
	if (node1->foo != 0x1111 || node1->bar != 0x1111)
		exit(-1);

	/* node1 to node2 */
	node2 = list_next_entry(&node1->list);
	if (node2->foo != 0x2222 || node2->bar != 0x2222)
		exit(-1);

	/* node2 to node1 */
	node1 = list_prev_entry(&node2->list);
	if (node1->foo != 0x1111 || node1->bar != 0x1111)
		exit(-1);

	/* head prev entry */
	node2 = list_prev_entry(head);
	if (node2->foo != 0x2222 || node2->bar != 0x2222)
		exit(-1);

	/* Delete node1 */
	list_del(&node1->list);
	memset(node1, 0xF, sizeof(*node1));
	free(node1);

	/* Reset pointers */
	node1 = NULL;
	node2 = NULL;

	/* Node1 should not exist anymore ! */
	node2 = list_next_entry(head);
	if (node2->foo != 0x2222 || node2->bar != 0x2222)
		exit(-1);

	/* Node1 should not exist anymore ! */
	node2 = list_prev_entry(head);
	if (node2->foo != 0x2222 || node2->bar != 0x2222)
		exit(-1);

	/* Last element in the list! */
	if (!list_is_last(&node2->list, head))
		exit(-1);
}

/* Search test cases */
#define ARRAY_SIZE(x) (sizeof(x) / sizeof(*x))
int __attribute__((__weak__))
foobar_compare(struct list_head *s1, struct list_head *s2)
{
	printf("%s:%s(%d)\n", __FILE__, __func__, __LINE__);
	struct struct_list *node1 = (struct struct_list *)s1;
	struct struct_list *node2 = (struct struct_list *)s2;
	return node1->foo == node2->foo && node1->bar == node2->bar;
}
void test_search(void)
{
	struct list_head head;
	struct struct_list nodes[10];
	struct struct_list *node;
	int i;

	init_list_head(&head);

	for (i = 0; i < ARRAY_SIZE(nodes); ++i) {
		nodes[i].foo = i;
		nodes[i].bar = i;
		list_add_tail(&nodes[i].list, &head);
	}

	/* Reusing i for simplicity */
	i = 9;
	node = (struct struct_list *)list_search(
		&head, &(struct struct_list){.foo = i, .bar = i}.list,
		&foobar_compare);
	if (!node || node->foo != i || node->bar != i)
		exit(-1);

	i = 0;
	node = (struct struct_list *)list_search(
		&head, &(struct struct_list){.foo = i, .bar = i}.list,
		&foobar_compare);
	if (!node || node->foo != i || node->bar != i)
		exit(-1);

	i = 5;
	node = (struct struct_list *)list_search(
		&head, &(struct struct_list){.foo = i, .bar = i}.list,
		&foobar_compare);
	if (!node || node->foo != i || node->bar != i)
		exit(-1);
}

int main(const int argc, char const *argv[])
{
	test_add_remove();
	test_search();
	return 0;
}
