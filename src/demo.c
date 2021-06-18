/*
 * Copyright (c) 2021 Krzysztof Czurylo
 */
#include <stdio.h>
#include "INCLUDE/test.h"

int
main(int argc, const char *argv[])
{
	for (int i = 0; i < argc; i++) {
		printf("arg #%d: %s\n", i, argv[i]);
	}

	for (int i = 0; i < 10; i++) {
		printf("i %d FOO %d\n", i, FOO(i));
		printf("i %d BAR %d\n", i, BAR(i));
	}

	return 0;
}
