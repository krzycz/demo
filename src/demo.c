/*
 * Copyright (c) 2021 Krzysztof Czurylo
 */
#include <stdio.h>

int
main(int argc, const char *argv[])
{
	for (int i = 0; i < argc; i++) {
		printf("arg #%d: %s\n", i, argv[i]);
	}

	return 0;
}
