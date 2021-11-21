
compile=g++
remove=rm

BINDIR=./bin
SOURCEDIR=./src
RUNSH=${BINDIR}/run.sh
FILES=main

all: ${FILES} ${RUNSH}

${BINDIR}:
	mkdir ${BINDIR}

${FILES}: | ${BINDIR}
	$(compile) -fdiagnostics-color=always -g ${SOURCEDIR}/main.cpp -o ${BINDIR}/main

.PHONY: clean
clean:
	${remove} -rf ${BINDIR}

${RUNSH}:
	echo "cd ${BINDIR} && ./main > image.ppm" > $@
	chmod +x $@

.PHONY: run
run: | all
	${RUNSH}
