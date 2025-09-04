CC = gcc
# CFLAGS = -std=gnu11 -Wall -Wextra -I..
CFLAGS = -std=gnu11 -I.. -g -DDEBUG
LDFLAGS = -lpthread
TEST_SRC_DIR = ./testsrc
TEST_BIN_DIR = .
MALLOC_FILES = ../myMalloc.c ../testing.c ../printing.c
MALLOC_HEADERS = ../myMalloc.h ../testing.h ../printing.h

.PHONY: all
all: realloc

.PHONY: realloc
realloc: test_realloc0 test_realloc1 test_realloc2 test_realloc3 test_realloc4

test_realloc0: ${TEST_SRC_DIR}/test_realloc0.c ${MALLOC_FILES} ${MALLOC_HEADERS}
	${CC} ${CFLAGS} ${LDFLAGS} -DARENA_SIZE=1024 -o ${TEST_BIN_DIR}/$@ ${TEST_SRC_DIR}/$@.c ${MALLOC_FILES}

test_realloc1: ${TEST_SRC_DIR}/test_realloc1.c ${MALLOC_FILES} ${MALLOC_HEADERS}
	${CC} ${CFLAGS} ${LDFLAGS} -DARENA_SIZE=1024 -o ${TEST_BIN_DIR}/$@ ${TEST_SRC_DIR}/$@.c ${MALLOC_FILES}

test_realloc2: ${TEST_SRC_DIR}/test_realloc2.c ${MALLOC_FILES} ${MALLOC_HEADERS}
	${CC} ${CFLAGS} ${LDFLAGS} -DARENA_SIZE=1024 -o ${TEST_BIN_DIR}/$@ ${TEST_SRC_DIR}/$@.c ${MALLOC_FILES}

test_realloc3: ${TEST_SRC_DIR}/test_realloc3.c ${MALLOC_FILES} ${MALLOC_HEADERS}
	${CC} ${CFLAGS} ${LDFLAGS} -DARENA_SIZE=1024 -o ${TEST_BIN_DIR}/$@ ${TEST_SRC_DIR}/$@.c ${MALLOC_FILES}

test_realloc4: ${TEST_SRC_DIR}/test_realloc4.c ${MALLOC_FILES} ${MALLOC_HEADERS}
	${CC} ${CFLAGS} ${LDFLAGS} -DARENA_SIZE=1024 -o ${TEST_BIN_DIR}/$@ ${TEST_SRC_DIR}/$@.c ${MALLOC_FILES}

.PHONY: clean
clean:
	rm -f test_*

