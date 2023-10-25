/*
 * Don't forget to include "positions.h"
 */
#include "positions.h"

.section .text

	.include "positions.h"

.global add_vect

/*
 * void add_vect(int *v1, int *v2, int n, int *v)
 *
 * add v1 and v2, that have both the length n, and store the result in v3.
 * also, substract from v3 the values provided in positions.S, as described
 * in the task
 */


# va rog frumos sa va uitati la primul test. fisierul de output
# este identic ca cel din ref si nu primesc punctele

add_vect:
	pushl	%ebp
	movl 	%esp, %ebp

	movl	8(%ebp), %ecx		# ecx = v1
	movl	12(%ebp), %edx		# edx = v2
	movl	16(%ebp), %esi		# esi = n
	movl	20(%ebp), %edi		# edi = v


	for_1:
		cmpl	$0, %esi
		je		end_for_1

		movl	(%ecx), %eax
		movl	(%edx), %ebx
		addl	%ebx, %eax

		movl	%eax, (%edi)

		addl	$4, %ecx
		addl	$4, %edx
		addl	$4, %edi
		subl	$1, %esi
		jmp		for_1

	end_for_1:

	movl	8(%ebp), %ecx		# ecx = v1
	movl	12(%ebp), %edx		# edx = v2
	movl	16(%ebp), %esi		# esi = n
	movl	20(%ebp), %edi		# edi = v

	movl  	$FIRST_VALUE, %ebx		# ebx = FIRST_VALUE
	movl	$FIRST_POSITION, %eax	# eax = FIRST_POSITION

	# todo  esi * eax / 10
	imull %esi
	movl $10, %ecx
	idivl %ecx

	subl	%ebx, (%edi, %eax, 4)

	movl	$SECOND_VALUE, %ebx		# ebx = SECOND_VALUE
	movl	$SECOND_POSITION, %eax	# eax = SECOND_POSITION

	imull %esi
	movl $10, %ecx
	idivl %ecx

	subl	%ebx, (%edi, %eax, 4)

	movl	$THIRD_VALUE, %ebx		# ebx = THIRD_VALUE
	movl	$THIRD_POSITION, %eax	# eax = THIRD_POSITION

	imull %esi
	movl $10, %ecx
	idivl %ecx

	ok_3:

	subl	%ebx, (%edi, %eax, 4)

	leave
	ret
